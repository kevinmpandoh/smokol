<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterRuangan extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $table = "master_ruangan";
    protected $fillable = ["id", "nama", "users_id", "kode_siman", "kode_baru", "lantai", "gedung"];
}
