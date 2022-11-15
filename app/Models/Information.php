<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class Information extends Model
{
    protected $table = "informations";
    protected $guard = 'supervisor-web';
    protected $guard_name = 'supervisor-web';
    protected $fillable = [
        'address','email','phone_number','terms','policy','facebook','instagram','twitter','telegram','snapchat','website'
    ];

}
