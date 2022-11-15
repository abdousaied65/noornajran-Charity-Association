<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @method static create(array $array)
 * @method static where(string $string, $id)
 * @method static findOrFail($admin_id)
 */
class ExperienceCertificate extends Model
{
    protected $table = "experience_certificate";
    protected $guard = 'supervisor-web';
    protected $guard_name = 'supervisor-web';
    protected $fillable = [
        'volunteer_id'
    ];
    public function volunteer(){
        return $this->belongsTo('\App\Models\Volunteer','volunteer_id','id');
    }
}
