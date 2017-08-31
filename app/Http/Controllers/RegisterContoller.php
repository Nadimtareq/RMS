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
use App\User;
class RegisterContoller extends Controller
{
	public function index()
	{	
		$user = User::all();
		return view('user.index',compact('user'));
	}

    public function create()
    {
    	$examination = ExamModel::all();
    	$course = CourseModel::all();
    	return view('user.create',compact('examination','course'));
    }

    public function store(Request $request)
    {
    	$data = $request->all();
    	$this->validate($request, [
            'name' => 'required|max:255',
            'user_type' => 'required',
            'examination' => 'required',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6|confirmed',
        ]);

        $user = new User;
        $user->name        = $data['name'];
        $user->email       = $data['email'];
        $user->user_type   = $data['user_type'];
        $user->examination = $data['examination'];
        $user->password    = bcrypt($data['password']);
       

        if($user->save())
        {

            return redirect()
                ->route('user_register_create')
                ->with('alert.status', 'success')
                ->with('alert.message', 'User added successfully!');
            
        }
        else
        {
            return redirect()
                ->route('user_register_create')
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be saved.');
        }
    }


    public function edit($id)
    {
        $user = User::find($id);

        return view('user.edit',compact('user'));
    }

    public function update(Request $request)
    {

        $data = $request->all();
        $this->validate($request, [
            'name' => 'required|max:255',
            'user_type' => 'required',
            'password' => 'required|min:6|confirmed',
        ]);
        $id = $data['id'];
        $user = User::find($id);
        $user->name        = $data['name'];
        $user->user_type        = $data['user_type'];
        $user->password    = bcrypt($data['password']);
       

        if($user->update())
        {

            return redirect()
                ->route('user_edit',['id' => $id])
                ->with('alert.status', 'success')
                ->with('alert.message', 'User added successfully!');
            
        }
        else
        {
            return redirect()
                ->route('user_edit',['id' => $id])
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be saved.');
        }

    }

    public function AssignCourseCreate($id)
    {
        $examination = ExamModel::all();
        $course = CourseModel::all();
        $user = User::find($id);
        return view('user.assign_course',compact('examination','course','user'));
    }

    public function AssignCourseStore(Request $request)
    {

    }

    public function delete($id)
    {
        $user = User::find($id);

        if ($user->delete())
        {
            return redirect()
                ->route('user_register')
                ->with('alert.status', 'success')
                ->with('alert.message', 'User deleted successfully!');
        }
        else
        {
            return redirect()
                ->route('user_register')
                ->with('alert.status', 'danger')
                ->with('alert.message', 'Sorry, something went wrong! Data cannot be deleted.');
        }
    }
}
