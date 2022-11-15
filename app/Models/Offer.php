<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static create(array $array)
 * @method static where(string $string, $id)
 * @method static findOrFail($admin_id)
 */
class Offer extends Model
{
    protected $table = "offers";
    protected $guard = 'supervisor-web';
    protected $guard_name = 'supervisor-web';
    protected $fillable = [
        'title','description','brochure','status'
    ];
    public function submits(){
        return $this->hasMany('\App\Models\Submit','offer_id','id');
    }
}
