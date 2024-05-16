<?php

namespace App\Http\Controllers;

use App\Events\BarangUpdating;
use App\Models\Barang;
use App\Models\MasterBarang;
use App\Http\Requests\StoreBarangRequest;
use App\Http\Requests\UpdateBarangRequest;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;


class BarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = MasterBarang::join('barang', 'barang.barang_id', 'master_barang.id')
            ->leftJoin('users', 'users.id', 'barang.users_id')
            ->leftJoin('master_ruangan', 'master_ruangan.id', 'barang.ruangan_id')
            ->select(
                'barang.id',
                'barang.users_id',
                'barang.ruangan_id',
                'barang.kondisi',
                'barang.sistem_operasi_id',

                'master_barang.jenis',
                'master_barang.merk',
                'master_barang.tipe',
                'master_barang.nomor_seri',
                'master_barang.nomor_urut_pendaftaran',
                'master_barang.tanggal_peroleh',
                'users.nama_lengkap',
                'master_ruangan.nama as ruangan_nama'
            )
            ->get();
        return Inertia::render('Admin/KelolaBarang', ['history_barang' => $data]);
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

        $validatedData = $request->validate([
            'users_id' => 'required',
            'ruangan_id' => 'required',
            'kondisi' => 'required',
            'sistem_operasi_id' => 'required',
            "barang_id" => "required",
        ]);


        $response = [
            'message' => 'Data berhasil ditambahkan',
        ];

        $tes = Barang::create($validatedData);



        return response()->json("ok");




        // $history_barang = Barang::all();


        // return Inertia::render('Admin/KelolaBarang', [
        //     'response' => $response,
        //     'history_barang' => $history_barang
        // ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Barang $Barang)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Barang $Barang)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBarangRequest $request)
    {



        $validatedData = $request->validate($request->rules());



        $updateRecord = Barang::findOrFail($validatedData['id']);

        $updateRecord->update($validatedData);
        $updateRecord->save();

        // BarangUpdating::dispatch($updateRecord);

        $response = [
            'message' => 'Berhasil melakukan update data',
            'data' => $updateRecord
        ];


        return response()->json($response, 201);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {

        $updateRecord = Barang::findOrFail($request->query('id'));

        $updateRecord->delete();

        $response = [
            'message' => 'Berhasil menghapus data',
            'req' => $request->query('id')
        ];

        return response()->json($response, 201);
    }
}
