<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('master_ruangan', function (Blueprint $table) {
            $table->id();
            $table->string("nama", 100);
            $table->string('kode_baru', 3)->nullable();
            $table->string('gedung', 2)->nullable();
            $table->string('kode_siman', 3)->nullable();
            $table->string('lantai', 1)->nullable();
            $table->unsignedBigInteger('users_id')->default(5);
            $table->foreign('users_id')->references('id')->on('users')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('master_ruangan');
    }
};
