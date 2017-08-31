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
use Excel;
use Illuminate\Support\Facades\Input;
use DB;
class StudentController extends Controller
{
    public function index($id)
    {
      $exam_id = (int)$id;
      if($exam_id == 0){
        $examination = ExamModel::find($exam_id);
        $student = StudentModel::where('examination_id',$exam_id)->get();
        $course = CourseModel::where('semester_code',$exam_id)->get();
      }else
      {
        $examination = ExamModel::find($exam_id);
        $semester = $examination->semester;

        $student = StudentModel::where('examination_id',$id)->get();
        $course = CourseModel::where('semester_code',$semester)->get();
      }
      $exam = ExamModel::all();
      $course_mark =  StudentCourseMarkModel::all();
    	return view('student.index',compact('student','course','exam','exam_id','course_mark'));
    }

    public function create()
    {
    	$exam = ExamModel::all();
        $error = [];
    	return view('student.create',compact('exam','error'));
    }

    public function store(Request $request)
    {

        $data = $request->all();

        $this->validate($request, [
            'exam'            => 'required',
            'student_info'    => 'required|mimes:xls,xlsx',
        ]);

        $path = $request->file('student_info')->getRealPath();
       
        $results = Excel::load($path,function($reader)
        {
            $reader->all();
        })->get();

        $exam_id = $data['exam'];
        $exam_insert_id = $exam_id;
        $exam = ExamModel::find($exam_id);
        $semester_id = $exam->semester;

        $course = CourseModel::where('semester_code',$semester_id)->get();
      

        $student = [];
        $error = [];
        for($j=0;$j<count($results);$j++)
        {
            $i = 0;
            if(isset($results[$j]->course_id_1) && $results[$j]->course_id_1 != '')
            {
                
              $i= $i+1;
              $course_1 = CourseModel::where('course_code',$results[$j]->course_id_1)->first();
              if(count($course_1)>0)
              {
                $course_id_1 = $course_1->id;
              }else
              {
                $i= $i+1;
                $course_id_1 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_1,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_1 = '';
            }
            if(isset($results[$j]->course_id_2) && $results[$j]->course_id_2 != '')
            {
              $i= $i+1;
              $course_2 = CourseModel::where('course_code',$results[$j]->course_id_2)->first();
              if(count($course_2)>0)
              {
                $course_id_2 = $course_2->id;
              }else
              {
                $i= $i+1;
                $course_id_2 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_2,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_2 = '';
            }

            if(isset($results[$j]->course_id_3) && $results[$j]->course_id_3 != '')
            {
              $i= $i+1;
              $course_3 = CourseModel::where('course_code',$results[$j]->course_id_3)->first();
              if(count($course_3)>0)
              {
                $course_id_3 = $course_3->id;
              }else
              {
                $i= $i+1;
                $course_id_3 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_3,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_3 = '';
            }

            if(isset($results[$j]->course_id_4) && $results[$j]->course_id_4 != '')
            {
              $i= $i+1;
              $course_4 = CourseModel::where('course_code',$results[$j]->course_id_4)->first();
              if(count($course_4)>0)
              {
                $course_id_4 = $course_4->id;
              }else
              {
                $i= $i+1;
                $course_id_4 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_4,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_4 = '';
            }
            if(isset($results[$j]->course_id_5) && $results[$j]->course_id_5 != '')
            {
              $i= $i+1;
              $course_5 = CourseModel::where('course_code',$results[$j]->course_id_5)->first();
              if(count($course_5)>0)
              {
                $course_id_5 = $course_5->id;
              }else
              {
                $i= $i+1;
                $course_id_5 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_5,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_5 = '';
            }

            if(isset($results[$j]->course_id_6) && $results[$j]->course_id_6 != '')
            {
              $i= $i+1;
              $course_6 = CourseModel::where('course_code',$results[$j]->course_id_6)->first();
              if(count($course_6)>0)
              {
                $course_id_6 = $course_6->id;
              }else
              {
                $i= $i+1;
                $course_id_6 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_6,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_6 = '';
            }
            
            if(isset($results[$j]->course_id_7) && $results[$j]->course_id_7 != '')
            {
              $i= $i+1;
              $course_7 = CourseModel::where('course_code',$results[$j]->course_id_7)->first();
              if(count($course_7)>0)
              {
                $course_id_7 = $course_7->id;
              }else
              {
                $i= $i+1;
                $course_id_7 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_7,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_7 = '';
            }

            
            if(isset($results[$j]->course_id_8) && $results[$j]->course_id_8 != '')
            {
              $i= $i+1;
              $course_8 = CourseModel::where('course_code',$results[$j]->course_id_8)->first();
              if(count($course_8)>0)
              {
                $course_id_8 = $course_8->id;
              }else
              {
                $i= $i+1;
                $course_id_8 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_8,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_8 = '';
            }

            if(isset($results[$j]->course_id_9) && $results[$j]->course_id_9 != '')
            {
              $i= $i+1;
              $course_9 = CourseModel::where('course_code',$results[$j]->course_id_9)->first();
              if(count($course_9)>0)
              {
                $course_id_9 = $course_9->id;
              }else
              {
                $i= $i+1;
                $course_id_9 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_9,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_9 = '';
            }

            if(isset($results[$j]->course_id_10) && $results[$j]->course_id_10 != '')
            {
              $i= $i+1;
              $course_10 = CourseModel::where('course_code',$results[$j]->course_id_10)->first();
              if(count($course_10)>0)
              {
                $course_id_10 = $course_10->id;
              }else
              {
                $i= $i+1;
                $course_id_10 = '';
                $error[$j][$i] = [
                    'student_id'=> $results[$j]->student_id,
                    'course_id'=> $results[$j]->course_id_10,
                ]; 
              }
            }else
            {
                $i= $i+1;
                $course_id_10 = '';
            }

            

            $student[] = [
                'session'           => $results[$j]->session,
                'student_id'        => $results[$j]->student_id,
                'student_name'      => $results[$j]->student_name,
                'hall'              => $results[$j]->hall,
                'remarks'           => $results[$j]->remarks,
                'examination_id'    => $exam_insert_id,
                'course_id_1'       => $course_id_1,
                'course_id_2'       => $course_id_2,
                'course_id_3'       => $course_id_3,
                'course_id_4'       => $course_id_4,
                'course_id_5'       => $course_id_5,
                'course_id_6'       => $course_id_6,
                'course_id_7'       => $course_id_7,
                'course_id_8'       => $course_id_8,
                'course_id_9'       => $course_id_9,
                'course_id_10'      => $course_id_10,
            ];

        }

        if(count($error)>0)
        {
            $error_data_string = '';
            
            foreach ($error as $error_data) {
                foreach ($error_data as $key => $value) {
                   $error_data_string = $error_data_string.'=>'.$value['student_id'].'='.$value['course_id'];
                }
            }
            return redirect()
                ->route('student_create')
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Course code does not match'.$error_data_string);
        }else
        {
        // return $student;
          $i=0;
          foreach ($student as $studentData) {
            //return $studentData;
            $insert = new StudentModel;
            $insert->session = $studentData['session'];
            $insert->student_id = $studentData['student_id'];
            $insert->student_name = $studentData['student_name'];
            $insert->hall = $studentData['hall'];
            $insert->remarks = $studentData['remarks'];
            $insert->examination_id = $studentData['examination_id'];
            // $insert->course_id_1  = $studentData['course_id_1'];
            // $insert->course_id_2  = $studentData['course_id_2'];
            // $insert->course_id_3  = $studentData['course_id_3'];
            // $insert->course_id_4  = $studentData['course_id_4'];
            // $insert->course_id_5  = $studentData['course_id_5'];
            // $insert->course_id_6  = $studentData['course_id_6'];
            // $insert->course_id_7  = $studentData['course_id_7'];
            // $insert->course_id_8  = $studentData['course_id_8'];
            // $insert->course_id_9  = $studentData['course_id_9'];
            // $insert->course_id_10 = $studentData['course_id_10'];
            $insert->updated_by = Auth::user()->id;
            $insert->created_by = Auth::user()->id;
            if ($insert->save()) {
                $last_student =  StudentModel::orderBy('id', 'desc')->first();
                
                if($studentData['course_id_1']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_1'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                
                if($studentData['course_id_2']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_2'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                if($studentData['course_id_3']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_3'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                if($studentData['course_id_4']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_4'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                if($studentData['course_id_5']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_5'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                if($studentData['course_id_6']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_6'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                if($studentData['course_id_7']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_7'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                if($studentData['course_id_8']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_8'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                if($studentData['course_id_9']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_9'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                if($studentData['course_id_10']>0)
                {
                  $student_course_mark = new StudentCourseMarkModel;
                  
                  $student_course_mark->student_id = $last_student->id;
                  $student_course_mark->course_id =  $studentData['course_id_10'];
                  $student_course_mark->updated_by =  Auth::user()->id;
                  $student_course_mark->created_by =  Auth::user()->id;
                  $student_course_mark->save();
                }
                

            }else
            {
              return redirect()
                ->route('student_create')
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be saved.');
            }
          }

          return redirect()
                ->route('student_create')
                ->with('alert.status', 'success')
                ->with('alert.message', 'Students added successfully!'); 
        }
    
    }
}
