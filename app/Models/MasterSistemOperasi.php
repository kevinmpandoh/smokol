<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterSistemOperasi extends Model
{
    use HasFactory;
    protected $table = "master_sistem_operasi";
    protected $fillable = ["id", "nama", "arsitektur"];
}
