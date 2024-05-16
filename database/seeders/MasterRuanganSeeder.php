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
            ['nama' => 'Ruang Umum 2', "users_id" => 32],
            ['nama' => 'Ruang Humas dan RB', "users_id" => 3],
            ['nama' => 'Ruang Pengolahan', "users_id" => 3],
            ['nama' => 'Ruang SKF IPDS', "users_id" => 3],
            ['nama' => 'Ruang KF IPDS', "users_id" => 3],
            ['nama' => 'Ruang Brandkas', "users_id" => 3],
            ['nama' => 'Tidak Terpakai 3', "users_id" => 3],
            ['nama' => 'Tidak Terpakai 2', "users_id" => 3],
            ['nama' => 'Tidak Terpakai 1', "users_id" => 3],
            ['nama' => 'Ruang Kabag Umum', "users_id" => 3],
            ['nama' => 'Ruang Rapat Umum', "users_id" => 3],
            ['nama' => 'Ruang Umum 3', "users_id" => 3],
            ['nama' => 'Ruang Mako', "users_id" => 3],
            ['nama' => 'Ruang Aula', "users_id" => 3],
            ['nama' => 'Ruang Gudang RB', "users_id" => 3],
            ['nama' => 'Ruang Persediaan', "users_id" => 3],
            ['nama' => 'Ruang Umum 1', "users_id" => 3],
            ['nama' => 'Ruang SKF Kepegawaian', "users_id" => 3],
            ['nama' => 'Tidak Terpakai 4', "users_id" => 3],
            ['nama' => 'Ruang Arsip', "users_id" => 3],
            ['nama' => 'Ruang Musholla', "users_id" => 3],
            ['nama' => 'Lantai Dasar', "users_id" => 3],
            ['nama' => 'Ruang Laktasi', "users_id" => 3],
            ['nama' => 'Loby Lantai 1', "users_id" => 3],
            ['nama' => 'Ruang Perpustakaan', "users_id" => 3],
            ['nama' => 'Ruang tunggu lantai 2', "users_id" => 3],
            ['nama' => 'Ruang Produksi', "users_id" => 3],
            ['nama' => 'Ruang Tidak Terpakai 6', "users_id" => 3],
            ['nama' => 'Ruang Statistik Sosial', "users_id" => 3],
            ['nama' => 'Ruang Tidak Terpakai 5', "users_id" => 3],
            ['nama' => 'Ruang Tunggu Lantai 3', "users_id" => 3],
            ['nama' => 'Ruang Vicon', "users_id" => 3],
            ['nama' => 'Ruang Ruang Sekretaris', "users_id" => 3],
            ['nama' => 'Ruang Kepala', "users_id" => 3],
            ['nama' => 'Ruang tunggu lantai 4', "users_id" => 3],
            ['nama' => 'Ruang Statistik Nerwilis', "users_id" => 3],
            ['nama' => 'Ruang Statistik Distribusi', "users_id" => 3],
            ['nama' => 'Ruang Mesin Lift', "users_id" => 3],
        ];

        MasterRuangan::insert($data);
    }
}
