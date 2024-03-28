<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Emotion;
use App\Models\Execution;
use App\Models\Category;

use Illuminate\Support\Str;
class MoodsList extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [

            [
                'name' => 'Радость',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Доверие',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Уверенность',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Спокойствие',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Благодарность',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Интерес',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Скуку',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Обиду',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Стыд',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Страх',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Ревность',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Joy',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Trust',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Confidence',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Calm',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Gratitude',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Interest',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Shame',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Fear',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Jealousy',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Boredom',
                'lang' => 'en',
                'status' => 1,
            ],
            [
                'name' => 'Offense',
                'lang' => 'en',
                'status' => 1,
            ],
        ];
        $data1 = [
            [
                'name' => 'Ежедневно',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'x3 в неделю',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'x2 в неделю',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'x1 в неделю',
                'lang' => 'ru',
                'status' => 1,
            ],
        ];

        $data2 = [
            [
                'name' => 'Все',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Избранное',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Любовь',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Здоровье',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Семья',
                'lang' => 'ru',
                'status' => 1,
            ],
            [
                'name' => 'Баланс',
                'lang' => 'ru',
                'status' => 1,
            ],
        ];
        foreach ($data as $item) {
            $item['slug'] = Str::slug($item['name']);
            Emotion::create($item);
        }
        foreach ($data1 as $item) {
            $item['slug'] = Str::slug($item['name']);
            Execution::create($item);
        }
        foreach ($data2 as $item) {
            $item['slug'] = Str::slug($item['name']);
            Category::create($item);
        }

    }
}
