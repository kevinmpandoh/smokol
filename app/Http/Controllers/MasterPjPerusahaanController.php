<?php

namespace App\Http\Controllers;

use App\Models\MasterPjPerusahaan;
use Illuminate\Http\Request;

class MasterPjPerusahaanController extends Controller
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
        $penanggung_jawab_id = $request->input('penanggung_jawab_id');

        if (strlen($penanggung_jawab_id) > 0) {
            $data = MasterPjPerusahaan::where('id', $penanggung_jawab_id)->first();
        } else {
            $data = MasterPjPerusahaan::where('perusahaan_id', $perusahaan_id)->get();
        }
        return response()->json([
            'data' => $data
        ]);
    }
}
