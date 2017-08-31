<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\SemesterModel;
use App\CourseModel;
use App\ExamModel;
use App\SessionModel;
class ExamController extends Controller
{
    public function index()
    {
    	$exam = ExamModel::all();
    	
    	return view('exam.index',compact('exam'));
    }

    public function create()
    {
        $semester = SemesterModel::all();
    	$session = SessionModel::all();
    	return view('exam.create',compact('semester','session'));
    }

    public function store(Request $request)
    {
    	$data = $request->all();
    	$this->validate($request, [
            'examination_name' => 'required',
            'semester'    => 'required',
            'year'             => 'required',
            'date'             => 'required',
        ]);

    	$data = $request->all();
        $exam = new ExamModel;

        $exam->examination_name = $data['examination_name'];
        $exam->semester = $data['semester'];
        $exam->year = $data['year'];
        $exam->date = $data['date'];
        $exam->created_by     = Auth::user()->id;
        $exam->updated_by     = Auth::user()->id;

        if($exam->save())
        {
            return redirect()
                ->route('exam_create')
                ->with('alert.status', 'success')
                ->with('alert.message', 'Exam added successfully!');
        }
        else
        {
            return redirect()
                ->route('exam_create')
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be saved.');
        }
    }

    public function edit($id)
    {
    	$exam = ExamModel::find($id);
    	$semester = SemesterModel::all();
        $session = SessionModel::all();

    	return view('exam.edit',compact('exam','semester','session'));
    }

    public function update(Request $request,$id)
    {
    	$data = $request->all();
    	$this->validate($request, [
            'examination_name' => 'required',
            'semester'    => 'required',
            'year'             => 'required',
            'date'             => 'required',
        ]);

    	$data = $request->all();
        $exam = ExamModel::find($id);

        $exam->examination_name = $data['examination_name'];
        $exam->semester = $data['semester'];
        $exam->year = $data['year'];
        $exam->date = $data['date'];
        $exam->created_by     = Auth::user()->id;
        $exam->updated_by     = Auth::user()->id;

        if($exam->update())
        {
            return redirect()
                ->route('exam_edit',['id' => $id])
                ->with('alert.status', 'success')
                ->with('alert.message', 'Exam Update successfully!');
        }
        else
        {
            return redirect()
                ->route('exam_edit',['id' => $id])
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be saved.');
        }
    }

    public function view($id)
    {

    }

    public function delete($id)
    {
    	$exam = ExamModel::find($id);

        if ($exam->delete())
        {
            return redirect()
                ->route('exam')
                ->with('alert.status', 'success')
                ->with('alert.message', 'Exam deleted successfully!');
        }
        else
        {
            return redirect()
                ->route('exam')
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be deleted.');
        }
    }
}
