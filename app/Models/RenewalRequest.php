<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class RenewalRequest extends Model
{
    protected $table = 'renewal_requests';
    protected $fillable = [
        'volunteer_id','period','payment_pic','status'
    ];
    public function volunteer(){
        return $this->belongsTo('\App\Models\Volunteer','volunteer_id','id');
    }
}
