<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $fillable = [
        'code', 'name', 'description', 'duration', 'category_id'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function materis()
    {
        return $this->hasMany(Materi::class);
    }
}
