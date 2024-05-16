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
        Schema::create('status_pemeliharaan', function (Blueprint $table) {
            $table->string('kode_status', 2);
            $table->primary('kode_status');
            $table->string('deskripsi', 255);
        });

        Schema::create('maintenances', function (Blueprint $table) {
            $table->id();
            $table->integer('sequence_id');
            $table->string('kode_status', 2)->default(0);
            // $table->foreign('kode_status')->references('kode_status')->on('status_pemeliharaan')->onUpdate('CASCADE');
            $table->unsignedBigInteger('users_id')->default('5');
            $table->foreign('users_id')->references('id')->on('users')->onUpdate('CASCADE')->default('5');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('maintenances');
        Schema::dropIfExists('status_pemeliharaan');
    }
};
