<?php

namespace App\Http\Controllers;

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

        if ($user->role == 'super admin') {
            $permintaan = Permintaan::join('users', 'users.id', 'permintaans.user_id')
                ->join("master_ruangan", "master_ruangan.id", "permintaans.ruangan_id")
                ->select('permintaans.*',  'users.nama_lengkap as users_nama', 'users.id as users_id', 'master_ruangan.nama as nama_ruangan')
                ->get();
        } else if ($user->role == 'admin') {
            $permintaan = Permintaan::join('users', 'users.id', 'permintaans.user_id')
                ->join("master_ruangan", "master_ruangan.id", "permintaans.ruangan_id")
                ->join("percakapans", "percakapans.permintaan_id", "permintaans.id")
                ->select('permintaans.*',  'users.nama_lengkap as users_nama', 'users.id as users_id', 'master_ruangan.nama as nama_ruangan')
                ->where('percakapans.user2_id', $user->id)
                ->get();
        } else {
            $permintaan = Permintaan::select('permintaans.*',  'users.nama_lengkap as users_nama', 'master_ruangan.nama as nama_ruangan')
                ->join('users', 'users.id', 'permintaans.user_id')
                ->join("master_ruangan", "master_ruangan.id", "permintaans.ruangan_id")
                ->join("percakapans", "percakapans.permintaan_id", "permintaans.id")
                ->where('permintaans.user_id', $user->id)
                ->get();
        }

        $messages = Permintaan::select('messages.konten', 'messages.user_id', 'messages.created_at', 'users.nama_lengkap as nama_lengkap')
            ->join('percakapans', 'permintaans.id', '=', 'percakapans.permintaan_id')
            ->join('messages', 'percakapans.id', '=', 'messages.percakapan_id')
            ->join('users', 'users.id', '=', 'messages.user_id')
            ->get();

        return Inertia::render('Permintaan', [
            'permintaan' => $permintaan,
            'messages' => $messages
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



            Permintaan::create($validatedData);
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
    public function update(Request $request, string $id)
    {
        //
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
