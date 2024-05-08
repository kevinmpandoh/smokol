<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StatusPemeliharaan extends Model
{
    use HasFactory;
    protected $table = 'status_pemeliharaan';
    public $timestamps = false;
}
