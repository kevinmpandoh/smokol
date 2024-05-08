<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        //     DB::statement("
        //     CREATE VIEW barang_view AS
        //     SELECT barang.*,master_barang.jenis as barang_jenis,master_barang.merk as barang_merk, master_barang.tipe as barang_tipe, master_barang.nomor_seri as barang_nomor_seri,
        //     master_barang.tahun_peroleh as barang_peroleh, master_ruangan.nama as ruangan_nama, master_sistem_operasi.nama as sistem_operasi_nama, master_sistem_operasi.arsitektur as sistem_operasi_arsitektur,  
        //     master_jabatan.nama as jabatan_nama, master_jabatan.tingkat as jabatan_tingkat, master_jabatan.jenis as jabatan_jenis, users.nama_lengkap as users_nama_lengkap  

        //     FROM `barang`,`master_barang`,`master_ruangan`,`master_sistem_operasi`,`master_jabatan`,`users` 

        //     WHERE barang.barang_id = master_barang.id and barang.sistem_operasi_id = master_sistem_operasi.id and ruangan_id = master_ruangan.id and barang.users_id = users.id 
        //     and users.jabatan_id = master_jabatan.id
        // ");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // DB::statement("DROP VIEW barang_view");
    }
};
