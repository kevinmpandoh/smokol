<?php

namespace App\Http\Controllers;

use App\Models\MasterPerusahaan;
use Illuminate\Http\Request;

class MasterPerusahaanController extends Controller
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
    public function fetch(Request $request)
    {
        $perusahaan_id = $request->input('perusahaan_id');

        if (strlen($perusahaan_id) > 0) {
            $data = MasterPerusahaan::where('master_perusahaan.id', $perusahaan_id)
                ->join('master_pj_perusahaan', 'master_pj_perusahaan.id', 'master_perusahaan.id')
                ->select('master_perusahaan.*', 'master_pj_perusahaan.nama as nama_pj', 'master_pj_perusahaan.jabatan as jabatan_pj')
                ->first();
        } else {
            $data = MasterPerusahaan::get();
        }
        return response()->json([
            'data' => $data
        ]);
    }
}
