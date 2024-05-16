<?php

namespace Database\Seeders;

use App\Models\Barang;
use App\Models\MasterBarang;
use App\Models\User;
use Illuminate\Database\Seeder;


class BarangSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $master_barang = MasterBarang::all();
        $data = [];
        $users = User::all();


        foreach ($master_barang as $barang) {
            $data[] = [
                'barang_id' => $barang['id'],
                'users_id' => 3,
                'sistem_operasi_id' => '5',
                'ruangan_id' => 27,
                'record_time' => '2023-06-12',
            ];
        }

        Barang::insert($data);
    }
}
