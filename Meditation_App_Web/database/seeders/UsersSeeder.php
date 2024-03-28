<?php

namespace Database\Seeders;

use App\Models\User;
use Faker\Generator;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Generator $faker)
    {
        $demoUser = User::create([
            'name'              => $faker->name,
            'email'             => 'demo@demo.com',
            'password'          => Hash::make('12345'),
            'role_id'           => "administrator",
            'user_type'           => "administrator",
            'email_verified_at' => now(),
        ]);

        $demoUser = User::create([
            'name'              => $faker->name,
            'email'             => 'admin@gmail.com',
            'password'          => Hash::make('12345'),
            'role_id'           => "administrator",
            'user_type'           => "administrator",
            'email_verified_at' => now(),
        ]);

        $demoUser3 = User::create([
            'name'              => $faker->name,
            'email'             => 'user@gmail.com',
            'password'          => Hash::make('12345'),
            'role_id'           => "user",
            'user_type'           => "user",
            'email_verified_at' => now(),
        ]);
        for ($i=0; $i <10 ; $i++) {
            $test_user = User::create([
                'name'              => $faker->name,
                'email'             => $faker->email,
                'password'          => Hash::make('12345'),
                'role_id'           => "user",
                'user_type'           => "user",
                'email_verified_at' => now(),
            ]);

        }


    }
}
