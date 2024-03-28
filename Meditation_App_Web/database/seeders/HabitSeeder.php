<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Habit;
class HabitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [

            [
                'image' => 'documents/habits/book.png',
                'lang' => 'ru',
                'status' => 1,
            ],[
                'image' => 'documents/habits/clock.png',
                'lang' => 'ru',
                'status' => 1,
            ],[
                'image' => 'documents/habits/sun.png',
                'lang' => 'ru',
                'status' => 1,
            ],[
                'image' => 'documents/habits/drop.png',
                'lang' => 'ru',
                'status' => 1,
            ],[
                'image' => 'documents/habits/heart.png',
                'lang' => 'ru',
                'status' => 1,
            ],[
                'image' => 'documents/habits/heart-beat.png',
                'lang' => 'ru',
                'status' => 1,
            ],[
                'image' => 'documents/habits/moon.png',
                'lang' => 'ru',
                'status' => 1,
            ],[
                'image' => 'documents/habits/smile.png',
                'lang' => 'ru',
                'status' => 1,
            ],[
                'image' => 'documents/habits/star.png',
                'lang' => 'ru',
                'status' => 1,
            ],

        ];

        foreach ($data as $item) {
            Habit::create($item);
        }
    }
}
