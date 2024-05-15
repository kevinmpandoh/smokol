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
        Schema::create('barang', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('barang_id');
            $table->foreign('barang_id')->references('id')->on('master_barang')->onDelete('cascade');

            $table->unsignedBigInteger('sistem_operasi_id');
            $table->foreign('sistem_operasi_id')->references('id')->on('master_sistem_operasi')->onDelete('cascade');

            $table->unsignedBigInteger('users_id');
            $table->foreign('users_id')->references('id')->on('users')->onDelete('cascade');

            $table->unsignedBigInteger('ruangan_id');
            $table->foreign('ruangan_id')->references('id')->on('master_ruangan');

            $table->date('record_time')->nullable();

            $table->string('kondisi', 12)->default('Baik');
            // $table->string('status_pemeliharaan', 20)->default('Operasional');
            $table->string('bast_path', 255)->nullable();

            $table->date('bast_upload_date')->nullable();

            $table->boolean('is_approved')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('barang');
    }
};
