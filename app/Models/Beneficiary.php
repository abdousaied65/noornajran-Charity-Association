<?php
namespace App\Models;
use App\Notifications\ResetPasswordNotification;
use App\Notifications\VerifyEmailNotification;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
class Beneficiary extends Authenticatable
{
    use Notifiable,HasRoles;
    protected $table = 'beneficiaries';
    protected $guard = 'beneficiary-web';
    protected $guard_name = 'beneficiary-web';
    protected $fillable = [
        'first_name','second_name','third_name','fourth_name', 'email', 'password','role_name','Status','phone_number',
        'record','nationality_id','disability_id'
        ,'id_pic','medical_report_pic'
    ];
    protected $hidden = [
        'password', 'remember_token',
        'email_verified_at'
    ];
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function nationality(){
        return $this->belongsTo('\App\Models\Nationality','nationality_id','id');
    }
    public function disability(){
        return $this->belongsTo('\App\Models\Disability','disability_id','id');
    }
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new ResetPasswordNotification($token, 'beneficiary.password.reset', 'beneficiaries'));
    }
    public function sendEmailVerificationNotification()
    {
        $this->notify(new VerifyEmailNotification('beneficiary.verification.verify'));
    }
    public function reports(){
        return $this->hasMany('\App\Models\Report','beneficiary_id','id');
    }
}
