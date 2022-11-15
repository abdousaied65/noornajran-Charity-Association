<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static create(array $array)
 * @method static where(string $string, $id)
 * @method static findOrFail($admin_id)
 */
class Job extends Model
{
    protected $table = "jobs";
    protected $guard = 'supervisor-web';
    protected $guard_name = 'supervisor-web';
    protected $fillable = [
        'field_id','qualification_id','first_name','second_name','third_name','fourth_name','email','record','phone_number','cv'
    ];

    public function field(){
        return $this->belongsTo('\App\Models\Field','field_id','id');
    }
    public function qualification(){
        return $this->belongsTo('\App\Models\Qualification','qualification_id','id');
    }
}
