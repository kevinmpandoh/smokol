<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\MasterBarang;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class BarangUserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = auth()->user();
        // $history_barang = Barang::join('master_barang', 'barang.barang_id', '=', 'master_barang.id')
        //     ->join('master_ruangan', 'barang.ruangan_id', '=', 'master_ruangan.id')
        //     ->join('master_sistem_operasi', 'barang.sistem_operasi_id', '=', 'master_sistem_operasi.id')
        //     ->join('users', 'barang.users_id', '=', 'users.id')
        //     ->join('master_jabatan', 'users.jabatan_id', '=', 'master_jabatan.id')
        //     // ->leftJoin('bast', 'bast.barang_id', 'like', 'barang.id')
        //     ->select(
        //         'barang.id',
        //         'barang.barang_id',
        //         'barang.sistem_operasi_id',
        //         'barang.users_id',
        //         'barang.ruangan_id',
        //         'master_barang.tanggal_peroleh',
        //         // 'barang.tanggal_kembali',
        //         'barang.kondisi',
        //         'barang.status_pemeliharaan',
        //         'barang.bast_path',
        //         'barang.bast_upload_date',
        //         'barang.is_approved',
        //         'master_barang.jenis as barang_jenis',
        //         'master_barang.merk as barang_merk',
        //         'master_barang.tipe as barang_tipe',
        //         'master_barang.nomor_seri as barang_nomor_seri',
        //         // 'master_barang.tahun_peroleh as barang_peroleh',
        //         'master_ruangan.nama as ruangan_nama',
        //         'master_sistem_operasi.nama as sistem_operasi_nama',
        //         'master_sistem_operasi.arsitektur as sistem_operasi_arsitektur',
        //         'master_jabatan.nama as jabatan_nama',
        //         'master_jabatan.tingkat as jabatan_tingkat',
        //         'master_jabatan.jenis as jabatan_jenis',
        //         'users.nama_lengkap as users_nama_lengkap'
        //     )
        //     ->where('users.id', $user->id)
        //     ->get();

        $data = MasterBarang::join('barang', 'barang.barang_id', 'master_barang.id')
            ->leftJoin('users', 'users.id', 'barang.users_id')
            ->leftJoin('master_ruangan', 'master_ruangan.id', 'barang.ruangan_id')
            ->select(
                'barang.id',
                'barang.users_id',
                'barang.ruangan_id',
                'barang.kondisi',
                'barang.sistem_operasi_id',
                'barang.bast_path',
                'master_barang.id as barang_id',
                'master_barang.jenis',
                'master_barang.merk',
                'master_barang.tipe',
                'master_barang.nomor_seri',
                'master_barang.nomor_urut_pendaftaran',
                'master_barang.tanggal_peroleh',
                'users.nama_lengkap',
                'master_ruangan.nama as ruangan_nama'
            )
            ->where('users.id', '=', $user->id)
            ->get();

        // $result is now a collection of the retrieved data
        // $history_barang = DB::table('barang_view')->where('pengguna_id', $user->id)->get();
        $data = $data->map(function ($row) {
            $row['bast_path'] = $row['bast_path'] ? Storage::url($row['bast_path']) : NULL;
            return $row;
        });

        return Inertia::render('Barang', ['history_barang' => $data]);

        // return Inertia::render('Barang', ['daftar_barang' => DB::table('view_barang_details')->where('id_pengguna', $user->id)->get()]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
