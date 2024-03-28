<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Audio extends Model
{
    use HasFactory;
    protected $guarded = [];

    /**
     * Get the category associated with the Audio
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
}
