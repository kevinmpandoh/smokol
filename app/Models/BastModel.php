<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BastModel extends Model
{
    use HasFactory;
    protected $table = 'bast';
    protected $fillable = ['barang_id', 'uploaded_date', 'is_approved', 'approval_date', 'path', 'comment'];
    public $timestamps = false;
}
