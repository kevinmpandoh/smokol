<?php

namespace App\Http\Controllers;

use App\Models\BastModel;
use App\Http\Requests\StoreBastModelRequest;
use App\Http\Requests\UpdateBastModelRequest;
use App\Models\Barang;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Storage;

use PDF;

class BastController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
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
    public function store(StoreBastModelRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(BastModel $bastModel)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(BastModel $bastModel)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateBastModelRequest $request, BastModel $bastModel)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(BastModel $bastModel)
    {
        //
    }

    public function get_bast_by_barangId(Request $request)
    {
        $id = $request->get('barang_id');
        $bastList = BastModel::where('barang_id', $id)->get();

        return response()->json([$bastList]);
    }

    public function upload(Request $request)
    {
        try {
            //code...
            $path = $request->file('file')->store('public/files/bast');
            $barang_id = $request->post('barang_id');

            Barang::where('id', $barang_id)->update(
                ['bast_path' => $path]
            );
            return response()->json(
                ['message' => 'Berhasil mengunnggah dokumen BAST'],
                201
            );
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function show_file(Request $request)
    {
        $filePath =  $request->get('filepath');

        if (Storage::exists($filePath)) {
            $fileContents = Storage::get($filePath);

            // Specify the Content-Type header as application/pdf
            $headers = [
                'Content-Type' => 'application/pdf',
            ];

            // Use Symfony's Response class to return the file contents with headers
            return new Response($fileContents, 200, $headers);
        } else {
            // Return a response with 404 status if the file is not found
            return response()->json([$filePath]);
        }
    }
}
