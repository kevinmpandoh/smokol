<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Hash;

class UserStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            // 'id' => 'required',
            'nama_lengkap' => 'required',
            'nip' => 'nullable',
            'email' => 'required',
            'bidang' => 'nullable',
            'jabatan_id' => 'nullable',
            'foto' => 'nullable',
            'role' => 'required',
            'username' => 'required',
            'password' => 'required'
        ];
    }
}
