<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Report extends Model
{
    protected $table = "reports";
    protected $fillable = [
        'report','beneficiary_id','specialist_id'
    ];

    public function beneficiary(){
        return $this->belongsTo('\App\Models\Beneficiary','beneficiary_id','id');
    }
    public function specialist(){
        return $this->belongsTo('\App\Models\Specialist','specialist_id','id');
    }
}
