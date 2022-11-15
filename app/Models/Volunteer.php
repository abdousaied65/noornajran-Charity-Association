<?php
namespace App\Models;
use App\Notifications\ResetPasswordNotification;
use App\Notifications\VerifyEmailNotification;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
class Volunteer extends Authenticatable
{
    use Notifiable,HasRoles;
    protected $table = 'volunteers';
    protected $guard = 'volunteer-web';
    protected $guard_name = 'volunteer-web';
    protected $fillable = [
        'first_name','second_name','third_name','fourth_name', 'email','phone_number','record','field_id','transfer_pic','cv','start_date',
        'end_date', 'password','role_name','Status'
    ];
    protected $hidden = [
        'password', 'remember_token',
        'email_verified_at'
    ];
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function field(){
        return $this->belongsTo('\App\Models\Field','field_id','id');
    }

    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPasswordNotification($token, 'volunteer.password.reset', 'volunteer'));
    }
    public function sendEmailVerificationNotification()
    {
        $this->notify(new VerifyEmailNotification('volunteer.verification.verify'));
    }
}
