<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserStoreRequest;
use App\Http\Requests\UserUpdateRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;

class UserController extends Controller
{
    public function index()
    {
        $users = User::get();
        return Inertia::render('Admin/MasterUsers', ['users' => $users]);
    }
    public function update(UserUpdateRequest $request)
    {
        try {
            //code...
            $validatedReq = $request->validate($request->rules());
            $user = User::findOrFail($validatedReq['id']);
            $user->update($validatedReq);
            $user->save();

            return response()->json(
                ['message' => 'data berhasil disimpan'],
                200
            );
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function store(UserStoreRequest $request)
    {
        try {
            //code...
            $validatedReq = $request->validate($request->rules());
            $newUser = [];

            $validatedReq['foto_url'] = $validatedReq['foto'];
            $validatedReq['password'] = Hash::make($validatedReq['password']);
            // $newUser = $item;


            User::create($validatedReq);


            return response()->json(
                ['message' => 'data berhasil disimpan'],
                200
            );
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function delete(Request $request)
    {
        $id = $request->input('id');
        if (strlen($id) < 1) {
            return response()->json(['error' => 'Invalid parameter thrown'], 404);
        }
        try {
            $user = User::findOrFail($id);
            $user->delete();
            return response()->json(null, 204);
        } catch (\Exception $ex) {
            return response()->json(['error' => 'User not found'], 404);
        }
    }
}
