<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CourseModel extends Model
{
    protected $table = 'course';

    public function semester()
    {
        return $this->belongsTo('App\SemesterModel','semester_code');
    }
}
