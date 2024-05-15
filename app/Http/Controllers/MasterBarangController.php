<?php

namespace App\Http\Controllers;

use App\Models\MasterBarang;
use App\Http\Requests\StoreMasterBarangRequest;
use App\Http\Requests\UpdateMasterBarangRequest;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;

use Illuminate\Http\Request;

use Illuminate\Validation\ValidationException;

use Inertia\Inertia;
use Illuminate\Support\Carbon;


class MasterBarangController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreMasterBarangRequest $request)
    {
        try {

            $validatedData = $request->validate($request->rules());
            $validatedData['tahun_peroleh'] = Carbon::parse($validatedData['tahun_peroleh'])->format('Y-m-d H:i:s');
            $response = [
                'message' => 'Data berhasil ditambahkan',
            ];



            MasterBarang::create($validatedData);
            $master_barang = MasterBarang::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'Koneksi gagal',
                'data_sent' => $validatedData,
                'errors' => $e->getMessage(),
            ];
            $master_barang = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $master_barang = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_barang = [];
        }

        return Inertia::render('Admin/MasterBarang', [
            'response' => $response,
            'master_barang' => $master_barang
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(MasterBarang $masterBarang)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(MasterBarang $masterBarang)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMasterBarangRequest $request)
    {


        try {
            $validatedData = $request->validate($request->rules());
            $validatedData['tahun_peroleh'] = Carbon::parse($validatedData['tahun_peroleh'])->format('Y-m-d H:i:s');

            $updateRecord = MasterBarang::findOrFail($request->id);

            $updateRecord->update($validatedData);

            $response = [
                'message' => 'Berhasil melakukan update data',
                'data' => $updateRecord
            ];

            $master_barang = MasterBarang::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_barang = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not found',
            ];
            $master_barang = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $master_barang = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_barang = [];
        } catch (\Illuminate\Database\Eloquent\MassAssignmentException $e) {
            // Tangkap exception jika terjadi kesalahan mass assignment
            $response = [
                'message' => 'Gagal melakukan update data: ' . $e->getMessage(),
                'error' => $e->getMessage(),
            ];
        }

        return Inertia::render('Admin/MasterBarang', [
            'response' => $response,
            'master_barang' => $master_barang
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        try {

            $updateRecord = MasterBarang::findOrFail($request->query('id'));

            $updateRecord->delete();

            $response = [
                'message' => 'Berhasil menghapus data',
                'req' => $request->query('id')
            ];

            $master_barang = MasterBarang::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_barang = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not founsadsadd' . $request->query('id'),
            ];
            $master_barang = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $master_barang = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_barang = [];
        }
        return Inertia::render('Admin/MasterBarang', [
            'response' => $response,
            'master_barang' => $master_barang
        ]);
    }
}
