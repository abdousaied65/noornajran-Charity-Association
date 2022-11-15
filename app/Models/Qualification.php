<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Qualification extends Model
{
    protected $table = "qualifications";
    protected $guard = 'supervisor-web';
    protected $guard_name = 'supervisor-web';
    protected $fillable = [
        'qualification'
    ];
}
