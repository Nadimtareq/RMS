<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ExamModel extends Model
{
    protected $table = 'examination';


    public function Examsemester()
    {
        return $this->belongsTo('App\SemesterModel','semester');
    }
}
