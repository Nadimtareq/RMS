<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStudentCourseMarkTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_course_mark', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('course_id')->unsigned();
            $table->integer('student_id')->unsigned();
            $table->integer('internal');
            $table->integer('external');
            $table->integer('third_exam');
            $table->integer('mark');
            $table->integer('class_present');
            $table->integer('class_test');
            $table->integer('viva');
            $table->integer('lab_quiz');
            $table->integer('updated_by')->unsigned();

            $table->integer('contorll_internal');
            $table->integer('contorll_external');
            $table->integer('contorll_third_exam');
            $table->integer('contorll_mark');
            $table->integer('contorll_class_present');
            $table->integer('contorll_class_test');
            $table->integer('contorll_viva');
            $table->integer('contorll_lab_quiz');
            
            $table->integer('contorll_updated_by')->unsigned();

            $table->integer('created_by')->unsigned();
            $table->timestamps();
            
            $table->foreign('course_id')->references('id')->on('course')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('student_id')->references('id')->on('student')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('contorll_updated_by')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('created_by')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('updated_by')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('student_course_mark');
    }
}
