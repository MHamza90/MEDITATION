<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('email')->unique()->nullable();
            $table->date('date_of_birth')->nullable();
            $table->string('password')->nullable();
            $table->string('avatar')->nullable()->default('documents/default.png');
            $table->enum('role_id', ['administrator',"user"])->nullable()->default("user");
            $table->enum('user_type', ['administrator',"user"])->nullable()->default("user");
            $table->string('google_id')->nullable();
            $table->string('device_token')->nullable();
            $table->enum('lang', ['en', 'ru'])->nullable()->default('ru');
            $table->integer('otp')->nullable();
            $table->tinyInteger('display_habit')->nullable()->default(0);
            $table->tinyInteger('meditation_reminder')->nullable()->default(0);
            $table->tinyInteger('habit_reminder')->nullable()->default(0);
            $table->tinyInteger('is_verified')->nullable()->default(0);
            $table->tinyInteger('status')->nullable()->default(1)->comment('0: Inactive or Suspended, 1: Active, 2: Pending Approval');
            $table->timestamp('email_verified_at')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};
