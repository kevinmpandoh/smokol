<?php

namespace App\Http\Controllers;

use App\Models\Message;
use App\Models\Percakapan;
use Illuminate\Database\Events\QueryExecuted;
use Illuminate\Database\QueryException;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class MessageController extends Controller
{
    public function index()
    {
        $messages = Message::join('users', 'users.id', 'messages.user_id')
            ->join('percakapans', 'percakapans.id', 'messages.percakapan_id')
            ->select('messages.*', 'users.nama_lengkap as users_nama', 'percakapans.permintaan_id as permintaan_id')->where()
            ->get();

        return response()->json([
            'data' => $messages
        ]);
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        try {

            $validatedData = $request->validate([
                'konten' => 'required',
                'permintaan_id' => 'required'
            ]);
            $validatedData['user_id'] = Auth::id();

            $percakapan = Percakapan::find($validatedData['permintaan_id']);

            if (!$percakapan) {
                dd('masuk');
                Percakapan::create([
                    'permintaan_id' => $validatedData['permintaan_id'],
                    'user1_id' => Auth::id(),
                    'user2_id' => 1

                ]);
            }

            $validatedData['percakapan_id'] = $percakapan->id;

            $message = Message::create($validatedData);

            // $message = new Message();
            // $message->konten = $validatedData['konten'];
            // $message->user_id = Auth::id();
            // $message->percakapan_id = $request['percakapan_id'];
            // $message->save();

            return response()->json([
                'message' => 'Message created',
                'data' => $message
            ], 201);
        } catch (ValidationException $e) {
            return response()->json([
                'message' => 'Validation error',
                'errors' => $e->errors()
            ], 400);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Query error',
                'errors' => $e->getMessage()
            ], 500);
        }
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
