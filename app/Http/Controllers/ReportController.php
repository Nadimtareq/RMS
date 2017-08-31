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
class ReportController extends Controller
{
    public function consolidate()
    {
        $user_type = Auth::user()->user_type;
        $examination = Auth::user()->examination;

        $examFirst = ExamModel::where('id',$examination)->first();

    	$exam = ExamModel::all();
        $semesetr = $examFirst->semester;
        $course = CourseModel::where('semester_code',$semesetr)->get();
        $exam_id = $examination;
        
    	return view('report.consolidate_entry',compact('course','exam','exam_id'));
    }

    public function consolidateEntry($id)
    {
    	$exam_data = ExamModel::find($id);
        $exam_id = $exam_data->id;
    	$exam = ExamModel::all();
    	$semester = $exam_data->semester;
    	$course = CourseModel::where('semester_code',$semester)->get();
    	return view('report.consolidate_entry',compact('course','exam','exam_id'));
    }

    public function consolidateReport($exam, $course)
    {
    	$course_id = $course;
        $exam_id =$exam;
        $course = CourseModel::find($course_id);
        
    	$examination = ExamModel::find($exam_id);
        $student =  StudentCourseMarkModel::where('course_id',$course_id)->get();
    	return view('report.consolidate_view',compact('student','examination','course','exam_id','course_id'));
    }

    public function tabulation()
    {
        $exam = ExamModel::all();
        return view('report.tabulation_report_entry',compact('exam'));
    }

    public function tabulationShow($exam)
    {
        $examination = ExamModel::find($exam);
        $semester = $examination->semester;

        $student = StudentModel::where('examination_id',$exam)->get();
        $course = CourseModel::where('semester_code',$semester)->get();
        $course_mark =  StudentCourseMarkModel::all();

        
        return view('report.tabulation',compact('student','course','course_mark','examination'));
    }

}
