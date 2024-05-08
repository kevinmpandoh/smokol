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
        Schema::create('master_barang', function (Blueprint $table) {

            $table->id();
            $table->string("jenis", 50);
            $table->string("merk", 50);
            $table->string("tipe", 50);
            $table->string('nomor_urut_pendaftaran')->default('');
            $table->date("tahun_peroleh")->nullable();
            $table->string("nomor_seri", 50);
            // $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('master_barang');
    }
};
