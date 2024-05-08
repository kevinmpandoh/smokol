<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    use HasFactory;

    protected $fillable = [
        'percakapan_id',
        'user_id',
        'konten',
    ];

    public function percakapan()
    {
        return $this->belongsTo(Percakapan::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
