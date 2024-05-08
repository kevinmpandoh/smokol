<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RiwayatBarang extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = 'riwayat_barang';
    protected $fillable = ['barang_id', 'modified_at', 'users_id', 'original_data', 'modified_data'];

    public function barang()
    {
        return $this->belongsTo(Barang::class);
    }
}
