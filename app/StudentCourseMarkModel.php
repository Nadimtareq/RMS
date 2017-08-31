<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentCourseMarkModel extends Model
{
    protected $table = 'student_course_mark';
    public function studentmark()
    {
        return $this->belongsTo('App\StudentModel','student_id');
    }
    public function coursemark()
    {
        return $this->belongsTo('App\CourseModel','course_id');
    }
}
