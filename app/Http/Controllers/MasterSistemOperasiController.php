<?php

namespace App\Http\Controllers;

use App\Models\MasterSistemOperasi;
use App\Http\Requests\StoreMasterSistemOperasiRequest;
use App\Http\Requests\UpdateMasterSistemOperasiRequest;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;


class MasterSistemOperasiController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Inertia::render('Admin/MasterSistemOperasi', ['master_sistem_operasi' => MasterSistemOperasi::all()]);
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
    public function store(StoreMasterSistemOperasiRequest $request)
    {
        try {
            $validatedData = $request->validate($request->rules());

            $response = [
                'message' => 'Data berhasil ditambahkan',
            ];

            MasterSistemOperasi::create($validatedData);
            $master_sistem_operasi = MasterSistemOperasi::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'Koneksi gagal',
                'data_sent' => $validatedData,
                'errors' => $e->getMessage(),
            ];
            $master_sistem_operasi = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $master_sistem_operasi = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_sistem_operasi = [];
        }

        return Inertia::render('Admin/MasterSistemOperasi', [
            'response' => $response,
            'master_sistem_operasi' => $master_sistem_operasi
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(MasterSistemOperasi $masterSistemOperasi)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(MasterSistemOperasi $masterSistemOperasi)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMasterSistemOperasiRequest $request, MasterSistemOperasi $masterSistemOperasi)
    {
        try {
            $validatedData = $request->validate($request->rules());
            $updateRecord = MasterSistemOperasi::findOrFail($request->id);

            $updateRecord->update($validatedData);

            $response = [
                'message' => 'Berhasil melakukan update data'
            ];

            $master_sistem_operasi = MasterSistemOperasi::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_sistem_operasi = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not found',
            ];
            $master_sistem_operasi = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $master_sistem_operasi = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_sistem_operasi = [];
        }

        return Inertia::render('Admin/MasterSistemOperasi', [
            'response' => $response,
            'master_sistem_operasi' => $master_sistem_operasi
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request)
    {
        try {

            $deleted_record = MasterSistemOperasi::findOrFail($request->query('id'));

            $deleted_record->delete();

            $response = [
                'message' => 'Berhasil menghapus data',
                'req' => $request->query('id')
            ];

            $master_sistem_operasi = MasterSistemOperasi::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_sistem_operasi = [];
        } catch (ModelNotFoundException $e) {
            $response = [
                'errors' => 'Record not founsadsadd' . $request->query('id'),
            ];
            $master_sistem_operasi = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $master_sistem_operasi = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $master_sistem_operasi = [];
        }
        return Inertia::render('Admin/MasterSistemOperasi', [
            'response' => $response,
            'master_sistem_operasi' => $master_sistem_operasi
        ]);
    }
}
