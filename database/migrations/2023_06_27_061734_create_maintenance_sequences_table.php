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
        Schema::create('maintenance_sequences', function (Blueprint $table) {
            $table->id();
            $table->integer('barang_id');
            $table->integer('users_id');
            $table->text('keluhan')->nullable();
            $table->string('kondisi_final', 255)->nullable();
            $table->string('catatan_admin', 255)->nullable();
            $table->string('bukti_rusak_berat', 255)->nullable();
            $table->integer('biaya')->nullable();

            $table->string('problem_img_path', 255)->nullable();
            $table->string('problems', 511)->nullable();
            $table->string('next_step', 1)->nullable();
            $table->string('solution', 255)->nullable();
            $table->string('spek_path', 255)->nullable();
            $table->date('estimasi_penyelesaian')->nullable();
            $table->unsignedBigInteger('perusahaan_id')->nullable();
            // $table->foreign('perusahaan_id')->references('id')->on('maser_perusahaan');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('maintenance_sequences');
    }
};
