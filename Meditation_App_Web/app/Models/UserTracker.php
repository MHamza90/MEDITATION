<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserTracker extends Model
{
    use HasFactory;
    protected $guarded = [];

    /**
     * Get the habit ad with the UserTracker
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function habit()
    {
        return $this->hasOne(Habit::class,'id','habit_id');
    }

     /**
     * Get the execution ad with the UserTracker
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function execution()
    {
        return $this->hasOne(Execution::class,'id','execution_id');
    }
}
