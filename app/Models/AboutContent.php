<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class AboutContent extends Model
{
    protected $table = "about_content";
    protected $guard = 'supervisor-web';
    protected $guard_name = 'supervisor-web';
    protected $fillable = [
        'title','description','paragraph_one_title',
        'paragraph_one_text','paragraph_two_title','paragraph_two_text',
    ];

}
