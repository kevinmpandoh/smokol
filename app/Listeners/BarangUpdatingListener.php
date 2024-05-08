<?php

namespace App\Listeners;

use App\Events\BarangUpdating;
use App\Models\Barang;
use App\Models\RiwayatBarang;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use PhpParser\ErrorHandler\Throwing;
use Throwable;

class BarangUpdatingListener
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(BarangUpdating $event): void
    {
        $barang = $event->barang;
        $originalData = json_encode($barang->getOriginal());
        $modifiedData = json_encode($barang->getAttributes());

        RiwayatBarang::create([
            'barang_id' => $barang->id,
            'original_data' => $originalData,
            'modified_data' => $modifiedData,
            'users_id' => $barang->users_id
        ]);
    }
    public function failed(BarangUpdating $event, Throwable $exception): void
    {
    }
}
