<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\SemesterModel;
use App\CourseModel;
use App\ExamModel;
use App\StudentModel;

use App\StudentCourseModel;
use App\StudentCourseMarkModel;
class StudentCourseMarkController extends Controller
{
    public function index()
    {
        $user_type = Auth::user()->user_type;
        $examination = Auth::user()->examination;

        $examFirst = ExamModel::where('id',$examination)->first();
        $exam = ExamModel::all();
        $semesetr = $examFirst->semester;
    	$course = CourseModel::where('semester_code',$semesetr)->get();
    	$exam_id = $examination;
    	return view('mark.index',compact('course','exam','exam_id'));
    }

    public function CourseMark($id)
    {
    	$exam_data = ExamModel::find($id);
        $exam_id = $exam_data->id;
    	$exam = ExamModel::all();
    	$semester = $exam_data->semester;
    	$course = CourseModel::where('semester_code',$semester)->get();
    	return view('mark.index',compact('course','exam','exam_id'));
    }

    public function create($exam, $course,$mark_type)
    {
        $course_id = $course;
        $exam_id =$exam;

       
        $course = CourseModel::find($course_id);

        $examination = ExamModel::find($exam_id);
        

        if (Auth::user()->user_type == 1) {
            $student =  StudentCourseMarkModel::select('id','course_id','student_id','contorll_internal as internal','contorll_external as external','contorll_third_exam as third_exam','contorll_mark as mark','contorll_class_present as class_present','contorll_class_test as class_test','contorll_viva as viva','contorll_lab_quiz as lab_quiz','contorll_updated_by as updated_by')->where('course_id',$course_id)->get();

        }elseif (Auth::user()->user_type == 2) {
            $student =  StudentCourseMarkModel::where('course_id',$course_id)->get();
        }

        if($course->course_type == 2)
        {
            if($mark_type == 2 )
            {
            	return view('mark.theory',compact('student','examination','course','exam_id','course_id'));
            }
            elseif($mark_type == 1)
            {
                return view('mark.theory_30',compact('student','examination','course','exam_id','course_id'));
            }
        }else
        {
            if($mark_type == 2){

                return view('mark.lab',compact('student','examination','course','exam_id','course_id'));
            }
            elseif($mark_type == 1)
            {
                return view('mark.lab_40',compact('student','examination','course','exam_id','course_id'));
            }
        }
    }

    public function store(Request $request)
    {
        $data = $request->all();
        for ($i=0; $i <count($data['course_mark_id']); $i++) { 
            $student_mark = StudentCourseMarkModel::find($data['course_mark_id'][$i]);

            if(Auth::user()->user_type == 1){

                if(isset($data['internal'][$i]) && isset($data['external'][$i]) && isset($data['third_exam'][$i]))
                {
                    $mark_type = 2;
                    
                    $inter_external_difference = abs($data['internal'][$i] - $data['external'][$i]);

                    if($inter_external_difference > 14)
                    {
                        
                        $internal_difference = abs($data['internal'][$i] - $data['third_exam'][$i]);
                        $external_difference = abs($data['external'][$i] - $data['third_exam'][$i]);

                        if($internal_difference < $external_difference)
                        {
                            $avg_mark = ($data['third_exam'][$i] + $data['internal'][$i])/2;
                        }else
                        {
                            $avg_mark = ($data['third_exam'][$i] + $data['external'][$i])/2;
                        }

                    }else{
                        $avg_mark = ($data['internal'][$i] + $data['external'][$i])/2;
                    
                    }

                    $student_mark->contorll_internal    = (int)$data['internal'][$i];
                    $student_mark->contorll_external    = (int)$data['external'][$i];
                    $student_mark->contorll_third_exam  = (int)$data['third_exam'][$i];
                    $student_mark->contorll_mark        = (int)$avg_mark;
                }
                if(isset($data['mark'][$i]))
                {
                    $mark_type = 2;
                    $student_mark->contorll_mark        = (int)$data['mark'][$i];
                }
                if(isset($data['class_present'][$i]) && isset($data['class_test'][$i]) )
                {
                    $mark_type = 1;
                    $student_mark->contorll_class_present      = (int)$data['class_present'][$i];
                    $student_mark->contorll_class_test         = (int)$data['class_test'][$i];
                }
                if(isset($data['class_present'][$i]) && isset($data['viva'][$i]) && isset($data['lab_quiz'][$i]) )
                {
                    $mark_type = 1;
                    $student_mark->contorll_class_present      = (int)$data['class_present'][$i];
                    $student_mark->contorll_viva               = (int)$data['viva'][$i];
                    $student_mark->contorll_lab_quiz           = (int)$data['lab_quiz'][$i];
                } 
                $student_mark->contorll_updated_by  = Auth::user()->id;

            }elseif (Auth::user()->user_type == 2) {

                if(isset($data['internal'][$i]) && isset($data['external'][$i]) && isset($data['third_exam'][$i]))
                {
                    $mark_type = 2;
                    
                    $inter_external_difference = abs($data['internal'][$i] - $data['external'][$i]);

                    if($inter_external_difference > 14)
                    {
                        
                        $internal_difference = abs($data['internal'][$i] - $data['third_exam'][$i]);
                        $external_difference = abs($data['external'][$i] - $data['third_exam'][$i]);

                        if($internal_difference < $external_difference)
                        {
                            $avg_mark = ($data['third_exam'][$i] + $data['internal'][$i])/2;
                        }else
                        {
                            $avg_mark = ($data['third_exam'][$i] + $data['external'][$i])/2;
                        }

                    }else{
                        $avg_mark = ($data['internal'][$i] + $data['external'][$i])/2;
                    
                    }

                    $student_mark->internal    = (int)$data['internal'][$i];
                    $student_mark->external    = (int)$data['external'][$i];
                    $student_mark->third_exam  = (int)$data['third_exam'][$i];
                    $student_mark->mark        = (int)$avg_mark;
                }
                if(isset($data['mark'][$i]))
                {
                    $mark_type = 2;
                    $student_mark->mark        = (int)$data['mark'][$i];
                }
                if(isset($data['class_present'][$i]) && isset($data['class_test'][$i]) )
                {
                    $mark_type = 1;
                    $student_mark->class_present      = (int)$data['class_present'][$i];
                    $student_mark->class_test        = (int)$data['class_test'][$i];
                }
                if(isset($data['class_present'][$i]) && isset($data['viva'][$i]) && isset($data['lab_quiz'][$i]) )
                {
                    $mark_type = 1;
                    $student_mark->class_present      = (int)$data['class_present'][$i];
                    $student_mark->viva               = (int)$data['viva'][$i];
                    $student_mark->lab_quiz           = (int)$data['lab_quiz'][$i];
                } 
                $student_mark->updated_by  = Auth::user()->id;
            }

            $student_mark->update();
       }

       return redirect()
        ->route('student_course_mark_create',['exam' => $data['exam_id'],'course'=>$data['course_id'],'mark_type'=>$mark_type])
        ->with('alert.status', 'success')
        ->with('alert.message', 'Mark Update successfully!');

    }
}
