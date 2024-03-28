<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MeditationCard extends Model
{
    use HasFactory;
    protected $guarded = [];

    /**
     * Get the user associated with the MeditationCard
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
