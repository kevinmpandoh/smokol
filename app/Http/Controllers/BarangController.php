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
                'master_barang.tahun_peroleh',
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
    public function store(StoreBarangRequest $request)
    {
        try {


            $validatedData = $request->validate($request->rules());
            $validatedData['tahun_peroleh'] = Carbon::parse($validatedData['tahun_peroleh'])->format('Y-m-d H:i:s');
            $response = [
                'message' => 'Data berhasil ditambahkan',
            ];

            Barang::create($validatedData);
            $history_barang = Barang::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'Koneksi gagal',
                'data_sent' => $validatedData,
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $history_barang = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        }

        return Inertia::render('Admin/KelolaBarang', [
            'response' => $response,
            'history_barang' => $history_barang
        ]);
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

        try {
            $validatedData = $request->validate($request->rules());
            // $validatedData['tahun_peroleh'] = Carbon::parse($validatedData['tahun_peroleh'])->format('Y-m-d H:i:s');

            $updateRecord = Barang::findOrFail($validatedData['id']);

            $updateRecord->update($validatedData);
            $updateRecord->save();

            // BarangUpdating::dispatch($updateRecord);

            $response = [
                'message' => 'Berhasil melakukan update data',
                'data' => $updateRecord
            ];
        } catch (QueryException $e) {
            $response = [
                'message' => 'An asu occurred',
                'error' => $e->getMessage(),
            ];
            return response()->json($response, 429);
        } catch (ModelNotFoundException $e) {
            $response = [
                'error' => 'Record not found',
            ];
            return response()->json($response, 404);
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'error' => $e->errors(),
            ];
            return response()->json($response, 422);
        } catch (\Exception $e) {
            $response = [
                'message' => 'Another error occurred',
                'error' => json_encode($e),
            ];
            throw $e;
            return response()->json($response, 500);
        }

        return response()->json($response, 201);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        try {

            $updateRecord = Barang::findOrFail($request->query('id'));

            $updateRecord->delete();

            $response = [
                'message' => 'Berhasil menghapus data',
                'req' => $request->query('id')
            ];

            $history_barang = Barang::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not founsadsadd' . $request->query('id'),
            ];
            $history_barang = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $history_barang = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $history_barang = [];
        }
        return Inertia::render('Admin/Barang', [
            'response' => $response,
            'history_barang' => $history_barang
        ]);
    }
}
