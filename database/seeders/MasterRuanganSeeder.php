<?php

namespace Database\Seeders;

use App\Models\MasterRuangan;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MasterRuanganSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data = [
            ['id' => 27, 'nama' => 'IPDS-Ruang Koordinator', "users_id" => 3],
            ['id' => 28, 'nama' => 'IPDS-Ruang Pegawai', "users_id" => 3],
            ['id' => 29, 'nama' => 'IPDS-Ruang Pengolahan', "users_id" => 3],
            ['id' => 30, 'nama' => 'Umum-Ruang Pegawai Umum', "users_id" => 3],
            ['id' => 31, 'nama' => 'Umum-Lobby', "users_id" => 3],
            ['id' => 32, 'nama' => 'IPDS-Pelayanan Statistik Terpadu', "users_id" => 3],
            ['id' => 33, 'nama' => 'Umum-Ruang Pegawai Perencanaan', "users_id" => 3],
            ['id' => 34, 'nama' => 'Umum-Ruang Pegawai PBJ', "users_id" => 3],
            ['id' => 35, 'nama' => 'Umum-Ruang Pegawai Keuangan', "users_id" => 3],
            ['id' => 36, 'nama' => 'Umum-Ruang Kepala Bagian', "users_id" => 3],
            ['id' => 37, 'nama' => 'Umum-Ruang Arsip', "users_id" => 3],
            ['id' => 38, 'nama' => 'Umum-Ruang Pegawai SDM', "users_id" => 3],
            ['id' => 39, 'nama' => 'Statistik Produksi-Ruang Koordinator', "users_id" => 3],
            ['id' => 40, 'nama' => 'Statistik Produksi-Ruang Pegawai', "users_id" => 3],
            ['id' => 41, 'nama' => 'Statistik Sosial-Ruang Koordinator', "users_id" => 3],
            ['id' => 42, 'nama' => 'Statistik Sosial-Ruang Pegawai', "users_id" => 3],
            ['id' => 43, 'nama' => 'Ruang Mako SP2020', "users_id" => 3],
            ['id' => 44, 'nama' => 'Aula', "users_id" => 3],
            ['id' => 45, 'nama' => 'Ruang Kepala BPS', "users_id" => 3],
            ['id' => 46, 'nama' => 'Umum-Ruang Sekretaris', "users_id" => 3],
            ['id' => 47, 'nama' => 'Ruang Vicon', "users_id" => 3],
            ['id' => 48, 'nama' => 'Nerwilis-Ruang Koordinator', "users_id" => 3],
            ['id' => 49, 'nama' => 'Nerwilis-Ruang Pegawai', "users_id" => 3],
            ['id' => 50, 'nama' => 'Statistik Distribusi-Ruang Koordinator', "users_id" => 3],
            ['id' => 51, 'nama' => 'Statistik Distribusi-Ruang Pegawai', "users_id" => 3],
            ['id' => 52, 'nama' => 'Lainnya', "users_id" => 3],
        ];

        MasterRuangan::insert($data);
    }
}
