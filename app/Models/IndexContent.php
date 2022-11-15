<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class IndexContent extends Model
{
    protected $table = "index_content";
    protected $guard = 'supervisor-web';
    protected $guard_name = 'supervisor-web';
    protected $fillable = [
        'title','beneficiaries_text','volunteers_text','orders_text','jobs_text',
    ];

}
