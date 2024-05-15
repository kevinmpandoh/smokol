<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permintaan extends Model
{
    use HasFactory;

    protected $table = "permintaan";

    protected $fillable = [
        'no_ticket',
        'nama_permintaan',
        'deskripsi',
        'nama_item',
        'kategori',
        'sub_kategori',
        'ruangan_id',
        'no_telp',
        'status',
        'user_id',
    ];

    public function ruangan()
    {
        return $this->belongsTo(MasterRuangan::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function percakapan()
    {
        return $this->hasOne(Percakapan::class);
    }
}
