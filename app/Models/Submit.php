<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static create(array $array)
 * @method static where(string $string, $id)
 * @method static findOrFail($admin_id)
 */
class Submit extends Model
{
    protected $table = "submits";
    protected $fillable = [
        'offer_id','qualification_id','first_name','second_name','third_name','fourth_name','email','record','phone_number','cv'
    ];

    public function offer(){
        return $this->belongsTo('\App\Models\Offer','offer_id','id');
    }

    public function qualification(){
        return $this->belongsTo('\App\Models\Qualification','qualification_id','id');
    }

}
