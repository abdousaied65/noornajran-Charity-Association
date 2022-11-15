<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
use App\Notifications\ResetPasswordNotification;
use App\Notifications\VerifyEmailNotification;

class Specialist extends Authenticatable
{
    use Notifiable,HasRoles;
    protected $table = 'specialists';
    protected $guard = 'specialist-web';
    protected $guard_name = 'specialist-web';
    protected $fillable = [
        'first_name','second_name','third_name','fourth_name', 'email', 'password','role_name','Status','phone_number'
    ];
    protected $hidden = [
        'password', 'remember_token',
        'email_verified_at'
    ];
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPasswordNotification($token, 'specialist.password.reset', 'specialists'));
    }
    public function sendEmailVerificationNotification()
    {
        $this->notify(new VerifyEmailNotification('specialist.verification.verify'));
    }

    public function reports(){
        return $this->hasMany('\App\Models\Report','specialist_id','id');
    }
}
