<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MaintenanceSequence extends Model
{
    use HasFactory;

    protected $table = 'maintenance_sequences';
    protected $fillable = [
        'barang_id', 'problem_img_path', 'users_id', 'keluhan', 'kondisi_final',
        'catatan_admin', 'bukti_rusak_berat', 'biaya',
        'problem_img_path', 'problems', 'next_step', 'solution',
        'created_at', 'updated_at'
    ];
}
