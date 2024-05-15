<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Percakapan extends Model
{
    use HasFactory;

    protected $table = "percakapan";

    protected $fillable = [
        'permintaan_id',
        'user1_id',
        'user2_id',
    ];

    public function permintaan()
    {
        return $this->belongsTo(Permintaan::class);
    }

    public function user1()
    {
        return $this->belongsTo(User::class, 'user1_id');
    }

    public function user2()
    {
        return $this->belongsTo(User::class, 'user2_id');
    }
}
