<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'email ', 'age', 'image'
    ];

    protected $hidden = ['updated_at', 'created_at'];

    public function mappings()
    {
        return $this->hasMany(Mapping::class, 'student_id');
    }
}
