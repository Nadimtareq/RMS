<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\SemesterModel;
use App\CourseModel;
class CourseController extends Controller
{
    public function index()
    {
    	$course = CourseModel::all();
    	return view('course.index',compact('course'));
    }

    public function create()
    {
        $semester = SemesterModel::all();
    	return view('course.create',compact('semester'));
    }

    public function store(Request $request)
    {
    	$data = $request->all();
    	$this->validate($request, [
            'course_name' => 'required',
            'course_code'    => 'required',
            'credit'    => 'required|numeric',
            'semester_code'     => 'required',
            'course_type'       => 'required',
        ]);

    	if(isset($data['status'])){
    		$status = 1;
    	}
        else{
        	$status = 0;
        }

        $course = new CourseModel;
        $course->course_name    = $data['course_name'];
        $course->course_code    = $data['course_code'];
        $course->credit         = $data['credit'];
        $course->semester_code  = $data['semester_code'];
        $course->course_type    = $data['course_type'];
        $course->status         = $status;
        $course->created_by     = Auth::user()->id;
        $course->updated_by     = Auth::user()->id;
        if($course->save())
        {
            return redirect()
                ->route('course_create')
                ->with('alert.status', 'success')
                ->with('alert.message', 'Course added successfully!');
        }
        else
        {
            return redirect()
                ->route('course_create')
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be saved.');
        }
    }


    public function edit($id)
    {
    	$semester = SemesterModel::all();
    	$course = CourseModel::find($id);
    	return view('course.edit',compact('course','semester'));
    }

    public function update(Request $request,$id)
    {
    	$data = $request->all();
    	$this->validate($request, [
            'course_name' => 'required',
            'course_code'    => 'required',
            'credit'    => 'required|numeric',
            'semester_code'     => 'required',
            'course_type'       => 'required',
        ]);

    	if(isset($data['status'])){
    		$status = 1;
    	}
        else{
        	$status = 0;
        }

        $data = $request->all();
        $course = CourseModel::find($id);
        $course->course_name    = $data['course_name'];
        $course->course_code    = $data['course_code'];
        $course->credit         = $data['credit'];
        $course->semester_code  = $data['semester_code'];
        $course->course_type    = $data['course_type'];
        $course->status         = $status;
        $course->created_by     = Auth::user()->id;
        $course->updated_by     = Auth::user()->id;
        if($course->update())
        {
            return redirect()
                ->route('course_edit',['id' => $id])
                ->with('alert.status', 'success')
                ->with('alert.message', 'Course Update successfully!');
        }
        else
        {
            return redirect()
                ->route('course_edit',['id' => $id])
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be Update.');
        }
    }

    public function delete($id)
    {
    	$course = CourseModel::find($id);

        if ($course->delete())
        {
            return redirect()
                ->route('course')
                ->with('alert.status', 'success')
                ->with('alert.message', 'Course deleted successfully!');
        }
        else
        {
            return redirect()
                ->route('course')
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be deleted.');
        }
    }
}
