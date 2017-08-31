<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class StudentModel extends Model
{
    protected $table = 'student';

    public function examination()
    {
        return $this->belongsTo('App\ExamModel','examination_id');
    }
}
