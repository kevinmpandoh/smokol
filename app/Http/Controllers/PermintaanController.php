<?php

namespace App\Http\Controllers;

use App\Models\Percakapan;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Permintaan;
use Illuminate\Validation\ValidationException;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Auth;

class PermintaanController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();




        if ($user->role == 'Super Admin') {
            $permintaan = Permintaan::join('users', 'users.id', 'permintaan.user_id')
                ->join("master_ruangan", "master_ruangan.id", "permintaan.ruangan_id")
                ->join('percakapan', 'permintaan.id', '=', 'percakapan.permintaan_id')
                ->join('users as u2', 'u2.id', '=', 'percakapan.user2_id')
                ->select('permintaan.*',  'users.nama_lengkap as users_nama', 'master_ruangan.nama as nama_ruangan', 'percakapan.user2_id', 'u2.nama_lengkap as user2_nama')
                ->get();
        } else if ($user->role == 'admin') {
            $permintaan = Permintaan::join('users', 'users.id', 'permintaan.user_id')
                ->join("master_ruangan", "master_ruangan.id", "permintaan.ruangan_id")
                ->join("percakapan", "percakapan.permintaan_id", "permintaan.id")
                ->join('users as u2', 'u2.id', '=', 'percakapan.user2_id')
                ->select('permintaan.*',  'users.nama_lengkap as users_nama', 'master_ruangan.nama as nama_ruangan', 'percakapan.user2_id', 'u2.nama_lengkap as user2_nama')
                ->where('percakapan.user2_id', $user->id)
                ->get();
        } else {

            $permintaan = Permintaan::select('permintaan.*',  'users.nama_lengkap as users_nama', 'master_ruangan.nama as nama_ruangan')
                ->join('users', 'users.id', 'permintaan.user_id')
                ->join("master_ruangan", "master_ruangan.id", "permintaan.ruangan_id")
                // ->join("percakapans", "percakapans.permintaan_id", "permintaans.id")
                ->where('permintaan.user_id', '=', $user->id)
                ->where("permintaan.status", "=", "open")
                ->get();
        }


        // return response()->json($permintaan);

        return Inertia::render('Permintaan', [
            'permintaan' => $permintaan,
        ]);
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
        try {


            $validatedData = $request->validate([
                'nama_permintaan' => 'required',
                'kategori' => 'required',
                'sub_kategori' => 'required',
                'ruangan_id' => 'required',
                'no_telp' => 'required',
                'nama_item' => 'required',
                'deskripsi' => 'required',
            ]);

            $validatedData['status'] = 'open';
            $validatedData['no_ticket'] = 'TICKET-' . date('YmdHis'); // TICKET-[YYYYMMDDHHIISS            
            $validatedData['user_id'] = Auth::id();

            $response = [
                'message' => 'Data berhasil ditambahkan',
            ];



            $permintaan = Permintaan::create($validatedData);

            $percakapan = new Percakapan();
            $percakapan->user1_id = Auth::id();
            $percakapan->user2_id = 1;
            $percakapan->permintaan_id = $permintaan->id;
            $percakapan->save();




            $permintaan = Permintaan::all();
        } catch (QueryException $e) {
            $response = [
                'message' => 'Koneksi gagal',
                'data_sent' => $validatedData,
                'errors' => $e->getMessage(),
            ];
            $permintaan = [];
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            $permintaan = [];
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            $permintaan = [];
        }

        return response()->json($response);

        // return Inertia::render('Permintaan', [
        //     'response' => $response,
        //     'permintann' => $permintaan
        // ]);
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
    public function update(Request $request)
    {
        try {

            $validatedData = $request->validate([
                'nama_permintaan' => 'required',
                'kategori' => 'required',
                'sub_kategori' => 'required',
                'ruangan_id' => 'required',
                'no_telp' => 'required',
                'nama_item' => 'required',
                'deskripsi' => 'required',
                "status" => "required",
            ]);



            $permintaan = Permintaan::findOrFail($request->id);
            $permintaan->update($validatedData);
            $permintaan->save();

            $percakapan = Percakapan::where('permintaan_id', $request->id)->first();
            // Update percakapan user2_id
            $percakapan->user2_id = $request->user2_id;
            $percakapan->save();


            return response()->json(
                ['message' => 'data berhasil disimpan'],
                200
            );
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        if (strlen($id) < 1) {
            return response()->json(['error' => 'Invalid parameter thrown'], 404);
        }
        try {
            $permintaan = Permintaan::findOrFail($id);
            $permintaan->delete();
            return response()->json(null, 204);
        } catch (\Exception $ex) {
            return response()->json(['error' => 'Permintaan not found'], 404);
        }
    }
}
