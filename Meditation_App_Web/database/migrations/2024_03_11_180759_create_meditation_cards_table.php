<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('meditation_cards', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->longText('description')->nullable();
            $table->longText('task')->nullable();
            $table->enum('lang', ['en', 'ru'])->nullable()->default('ru');
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('meditation_cards');
    }
};
