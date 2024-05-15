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
        Schema::create('messages', function (Blueprint $table) {
            $table->id();
            $table->text('konten');
            $table->unsignedBigInteger('percakapan_id');
            $table->unsignedBigInteger('user_id');

            $table->foreign('percakapan_id')->references('id')->on('percakapan')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');


            $table->timestamps();
        });
    }

    /**
     */
    public function down(): void
    {
        Schema::dropIfExists('messages');
    }
};
