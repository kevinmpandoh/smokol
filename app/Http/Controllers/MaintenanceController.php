<?php

namespace App\Http\Controllers;

use App\Http\Requests\RejectRequest;
use App\Http\Requests\StatusUpdateRequest;
use App\Models\Maintenance;
use App\Models\MaintenanceSequence;
use App\Http\Requests\StoreMaintenanceRequest;
use App\Http\Requests\StorePemeriksaanBMNRequest;
use App\Http\Requests\StorePemeriksaanPBJPPKRequest;
use App\Http\Requests\StorePemeriksaanRequest;
use App\Http\Requests\UpdateMaintenanceRequest;
use App\Models\Barang;
use App\Models\RiwayatBarang;
use App\Models\StatusPemeliharaan;
use Inertia\Inertia;
use Illuminate\Http\Request;

use Illuminate\Validation\ValidationException;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Carbon;

class MaintenanceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = auth()->user();

        // dd($user->id);

        // return Inertia::render('Barang', ['history_barang' => DB::table('barang_view')->where('pengguna_id', $user->id)->get()]);

        $maintenance_list = MaintenanceSequence::select(
            'maintenance_sequences.*',
            'maintenances.id as maintenance_id',
            'maintenances.kode_status',
            'status_pemeliharaan.deskripsi as status',
            'master_barang.jenis',
            'master_barang.merk',
            'master_barang.tipe',
            'master_barang.nomor_seri'
        )
            ->join('maintenances', function ($join) {
                $join->on('maintenances.sequence_id', '=', 'maintenance_sequences.id')
                    ->whereRaw('maintenances.id = (
                    SELECT id FROM maintenances as sub_maintenances
                    WHERE sub_maintenances.sequence_id = maintenances.sequence_id
                    ORDER BY sub_maintenances.id DESC
                    LIMIT 1
                )');
            })
            ->join('master_barang', 'maintenance_sequences.barang_id', '=', 'master_barang.id')
            ->join('status_pemeliharaan', 'status_pemeliharaan.kode_status', '=', 'maintenances.kode_status')
            ->where('maintenance_sequences.users_id', '=', $user->id)
            ->get();


        // $maintenance_list = DB::table('maintenances')->where('users_id', $user->id);
        // dd($maintenance_list);
        return Inertia::render('Maintenance', ['maintenance_list' => $maintenance_list]);
    }

    public function admin()
    {

        $user = auth()->user();

        if ($user->role == 'basic') {
            return 0;
        }


        // return Inertia::render('Barang', ['history_barang' => DB::table('barang_view')->where('pengguna_id', $user->id)->get()]);

        $maintenance_list = DB::table('maintenance_sequences')->select(
            'maintenance_sequences.*',
            'maintenances.id as maintenance_id',
            'status_pemeliharaan.deskripsi as status',
            'master_barang.jenis',
            'master_barang.merk',
            "master_barang.tipe",
            'master_barang.nomor_seri'
        )
            ->leftJoin('maintenances', 'maintenances.sequence_id', '=', 'maintenance_sequences.id')
            ->leftJoin('status_pemeliharaan', 'maintenances.kode_status', 'status_pemeliharaan.kode_status')
            ->leftJoin('barang', 'maintenance_sequences.barang_id', '=', 'barang.id')
            ->leftJoin('master_barang', 'barang.barang_id', '=', 'master_barang.id')

            ->get();
        $maintenance_list = MaintenanceSequence::all();
        // $maintenance_list = DB::table('maintenances')->where('users_id', $user->id);
        return Inertia::render('Admin/KelolaPengajuan', ['maintenance_list' => ['asu']]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreMaintenanceRequest $request)
    {
        $user = auth()->user();
        try {
            $validatedData = $request->validate($request->rules());
            // Log::info($validatedData['keluhan']);

            // upload file 
            // Store the uploaded file in the storage/app/public directory
            if ($request->hasFile('problem_img_path')) {
                // Store the uploaded problem_img_path in the storage/app/public directory
                // $filePaths = [];

                $path = $request->file('problem_img_path')->store('public/images/problems');
                // $imageUrl = Storage::url($path);
                // return response()->json(['data'=>$path]);

                // foreach ($request->file('problem_img_path')['fileList'] as $file) {
                //     // Store each file in the storage/app/public directory
                //     $filePath = $file->store('public/images/problems');
                //     $filePaths[] = $filePath;
                // }
                // Update a variable in $validatedData with the value of $filePath
                $validatedData['problem_img_path'] = $path;
            } else {
                $validatedData['problem_img_path'] = null;
            }

            // insert        
            $newSequences = MaintenanceSequence::create($validatedData);
            $newMaintenance = Maintenance::create(['sequence_id' => $newSequences->id, 'kode_status' => '0', 'users_id' => $user->id]);

            return response()->json(['message' => "Berhasil mengirimkan formulir pengajuan",]);
        } catch (ValidationException $e) {
            $response = [
                'message' => 'Validation error',
                'errors' => $e->errors(),
            ];
            return response()->json($response);
        } catch (\Exception $e) {
            $response = [
                'message' => 'An error occurred',
                'errors' => $e->getMessage(),
            ];
            return response()->json($response);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Maintenance $maintenance)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Maintenance $maintenance)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateMaintenanceRequest $request)
    {
        // return response()->json($request->all());
        $user = auth()->user();
        $validatedRequest = $request->validate($request->rules());

        $updateContent = [
            'keluhan' => $validatedRequest['keluhan'],
            // 'keluhan'=>$validatedRequest['keluhan'],
        ];
        if (strlen($validatedRequest['problem_img_path']) > 0) {
            // store image 
            $img_path = $request->file('problem_img_path')->store('public/images/problems');
            $updateContent['problem_img_path'] = $img_path;
        }

        $updatedSequence = MaintenanceSequence::where('id', $validatedRequest['sequence_id'])->update($updateContent);
        $maintenance_list = MaintenanceSequence::select(
            'maintenance_sequences.*',
            'maintenances.id as maintenance_id',
            'maintenances.kode_status',
            'status_pemeliharaan.deskripsi as status',
            'master_barang.jenis',
            'master_barang.merk',
            'master_barang.tipe',
            'master_barang.nomor_seri'
        )
            ->join('maintenances', function ($join) {
                $join->on('maintenances.sequence_id', '=', 'maintenance_sequences.id')
                    ->whereRaw('maintenances.id = (
                    SELECT id FROM maintenances as sub_maintenances
                    WHERE sub_maintenances.sequence_id = maintenances.sequence_id
                    ORDER BY sub_maintenances.id DESC
                    LIMIT 1
                )');
            })
            ->join('master_barang', 'maintenance_sequences.barang_id', '=', 'master_barang.id')
            ->join('status_pemeliharaan', 'status_pemeliharaan.kode_status', '=', 'maintenances.kode_status')
            ->where('maintenance_sequences.users_id', $user->id)
            ->get();
        // $maintenance_list = DB::table('maintenances')->where('users_id', $user->id);
        return Inertia::render('Maintenance', ['maintenance_list' => $maintenance_list]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Maintenance $maintenance)
    {
        //
    }
    public function check(Request $request)
    {
        $barang_id = $request->post('barang_id');
        $last_sequence = MaintenanceSequence::where('barang_id', $barang_id)->orderBy('id', 'DESC')->first();
        if ($last_sequence) {
            $last_sequence_id = $last_sequence->id;
            $maintenance = Maintenance::where('sequence_id', $last_sequence_id)->where('kode_status', '6')->get();
        } else {
            $maintenance = ['boleh'];
        }

        // $maintenance = DB::table('maintenances')
        //     ->join('maintenance_sequences', 'maintenances.sequence_id', '=', 'maintenance_sequences.id')
        //     ->where('maintenance_sequences.barang_id', $barang_id)
        //     ->where('maintenances.kode_status','6')
        //     ->get();

        return response()->json($maintenance);
    }
    public function riwayat($sequence_id)
    {

        $maintenance_list = Maintenance::join('status_pemeliharaan', 'maintenances.kode_status', 'status_pemeliharaan.kode_status')
            ->join('users', 'users.id', 'maintenances.users_id')
            ->where('sequence_id', $sequence_id)->select(
                'status_pemeliharaan.deskripsi',
                'maintenances.*',
                'users.nama_lengkap'
            )->get();
        $sequence = DB::table('maintenance_sequences')->where('id', $sequence_id)->select('barang_id', 'problem_img_path')->first();


        $detail_barang = DB::table('master_barang')->join('barang', 'barang.barang_id', 'master_barang.id')->where('barang.id', $sequence->barang_id)->select('jenis', 'merk', 'tipe', 'nomor_seri')->first();
        if (strlen($sequence->problem_img_path) > 0) {

            $detail_barang->image_path = Storage::url($sequence->problem_img_path);
        }


        return Inertia::render('User/Pengajuan/Riwayat', ['history_list' => $maintenance_list, 'detail_barang' => $detail_barang]);
    }
    public function pengajuan_fetch(Request $request)
    {
        $type = $request->query('type'); // Retrieve the 'type' query parameter
        // $id = $request->query('id'); // Retrieve the 'id' query parameter
        $query_search = $request->query('querySearch');
        $is_user = $request->query('isUser'); // Retrieve the 'id' query parameter
        $user = auth()->user();


        // Use $type and $id in your query logic
        // Example:

        // Query based on 'type'
        $maintenance_list = MaintenanceSequence::select(
            // Your select statements here
            'maintenance_sequences.id as sequence_id',
            'maintenance_sequences.keluhan',
            'maintenance_sequences.biaya',
            'maintenance_sequences.problem_img_path',
            'maintenance_sequences.kondisi_final',


            'master_barang.merk',
            'master_barang.tipe',
            'master_barang.jenis',
            'master_barang.nomor_seri',
            'master_barang.nomor_urut_pendaftaran',

            'status_pemeliharaan.deskripsi',
            'status_pemeliharaan.kode_status',

            'users.id as users_id',
            'users.nama_lengkap',
            'users.bidang',
        )
            ->join('maintenances', function ($join) {
                $join->on('maintenances.sequence_id', '=', 'maintenance_sequences.id')
                    ->whereRaw('maintenances.id = (
                    SELECT id FROM maintenances as sub_maintenances
                    WHERE sub_maintenances.sequence_id = maintenances.sequence_id
                    ORDER BY sub_maintenances.id DESC
                    LIMIT 1
                )');
            })
            ->join('status_pemeliharaan', 'status_pemeliharaan.kode_status', 'maintenances.kode_status')
            ->join('barang', 'maintenance_sequences.barang_id', 'barang.id')
            ->join('master_barang', 'master_barang.id', 'barang.barang_id')
            ->join('users', 'users.id', 'maintenance_sequences.users_id')
            ->when($type === '99', function ($query) {
                // If type is 99, ignore type in the SQL query
                return $query;
            }, function ($query) use ($type) {
                // Otherwise, add the type condition to the query
                if ($type === '0') {
                    return $query->whereIn('maintenances.kode_status', ['0', '1', "2"]);
                }
                return $query->where('maintenances.kode_status', $type);
            })

            ->when($is_user == '1', function ($query) use ($user) {
                // If query is not empty, add the search conditions to the query
                return $query->where('users.id', 'like', $user->id);
            })
            ->when($query_search, function ($query) use ($query_search) {
                // If query is not empty, add the search conditions to the query
                return $query->where(function ($query) use ($query_search) {
                    $query->where('users.nama_lengkap', 'like', '%' . $query_search . '%')
                        ->orWhere('master_barang.nomor_urut_pendaftaran', 'like', '%' . $query_search . '%')
                        ->orWhere('master_barang.merk', 'like', '%' . $query_search . '%')
                        ->orWhere('master_barang.tipe', 'like', '%' . $query_search . '%')
                        ->orWhere('master_barang.jenis', 'like', '%' . $query_search . '%')
                        ->orWhere('status_pemeliharaan.deskripsi', 'like', '%' . $query_search . '%');
                });
            })
            ->get();
        $maintenance_list->transform(function ($item, $key) use ($user) {
            $item['role'] = $user->role;
            $item['problem_img_path'] = Storage::url($item['problem_img_path']);


            return $item;
        });
        return response()->json([
            'data' => $maintenance_list,
        ]);
    }
    public function pengajuan_approve(Request $request)
    {
        $request_data = $request->all();
        try {
            // store maintenance with seq id, user id and kode status + 1
            $approved = [
                'sequence_id' => $request_data['sequence_id'],
                'users_id' => $request_data['users_id'],
                'kode_status' => $request_data['kode_status'] == "0" ? "1" : "2",
            ];
            Maintenance::create($approved);
            if ($approved['kode_status'] == '2') {
                $approved['kode_status'] = '3';
                Maintenance::create($approved);
            }
            return response()->json([
                'data' => $approved,
            ]);
        } catch (\Exception $e) {
            throw $e;
        }
    }
    public function PemeriksaanIPDS(StorePemeriksaanRequest $request)
    {
        $user = auth()->user(); // user dari admin


        $validatedData = $request->validate($request->rules()); // data yg dikirim
        $sequence = MaintenanceSequence::where('id', '=', $validatedData['sequence_id'])->first();
        $barang_status = Barang::where('id', '=', $sequence['barang_id'])->first();

        $maintenance = [
            'sequence_id' => $validatedData['sequence_id'],
            'users_id' => $user->id,
        ];
        $updatedSequence = [
            'problems' => $validatedData['problems'],
            'next_step' => $validatedData['next_step'],
        ];

        if ($validatedData['next_step'] == '2') {
            // ubah status barang menjadi rusak ringan
            $riwayat_barang = [
                'barang_id' => $sequence['barang_id'],
                'waktu_perubahan' => Carbon::now(),
                'users_id' => $sequence['users_id'], // user id of master barang
                'atribut' => "Status Barang",
                'nilai_lama' => $barang_status->kondisi,
                'nilai_baru' => "Rusak Ringan",
            ];
            $updateStatus = [
                'kondisi' => "Rusak Ringan"
            ];
            $statusUpdated = Barang::where('id', $sequence['barang_id'])->update($updateStatus);
            $riwayatStored = RiwayatBarang::create($riwayat_barang);
            // tambah status baru menjadi kode 1
            $maintenance['kode_status'] = '2';
        } else if ($validatedData['next_step'] == '0') {
            // tambah status barang menjadi kode 5 

            $maintenance['kode_status'] = '5';
            $updatedSequence['solution'] = $validatedData['solution'];
        }
        $maintenanceStored = Maintenance::create($maintenance);



        return response()->json(['data' => $validatedData]);
    }
    public function PemeriksaanBMN(StorePemeriksaanBMNRequest $request)
    {
        try {
            //code...
            $user = auth()->user(); // user dari admin


            $validatedData = $request->validate($request->rules()); // data yg dikirim
            // upload the file
            Maintenance::create([
                'sequence_id' => $validatedData['sequence_id'],
                'kode_status' => '1',
                'users_id' => $user->id,
            ]);


            return response()->json(['message' => "Berhasil mengirimkan formulir pemeriksaan BMN",]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function PemeriksaanPBJ_PPK(StorePemeriksaanPBJPPKRequest $request)
    {
        try {
            //code...
            $user = auth()->user(); // user dari admin
            $validatedData = $request->validate($request->rules());
            $formattedDate = Carbon::parse($validatedData['estimasi_penyelesaian'])->format('Y-m-d H:i:s');

            MaintenanceSequence::where('id', $validatedData['sequence_id'])->update(
                [
                    'perusahaan_id' => $validatedData['perusahaan_id'],
                    'penanggung_jawab_id' => $validatedData['penanggung_jawab_id'],
                    'estimasi_penyelesaian' => $formattedDate,
                ]
            );
            Maintenance::create(
                [
                    'kode_status' => '3',
                    'sequence_id' => $validatedData['sequence_id'],
                    'users_id' => $user->id,
                ]
            );

            return response()->json($validatedData);
            // if reject status code =  6 

        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function reject(RejectRequest $request)
    {
        // add alasan
        $user = auth()->user(); // user dari admin
        $rejectData = $request->validate($request->rules());



        MaintenanceSequence::where('sequence_id', $rejectData['sequence_id'])->update($rejectData);
        Maintenance::create([
            'sequence_id' => $rejectData['sequence_id'],
            'users_id' => $user->id,
            'kode_status' => '6'
        ]);

        return response()->json(['message' => "Berhasil mengirimkan formulir pemeriksaan PBJ / PPK",]);
    }
    public function fetch_status()
    {
        $status_list = StatusPemeliharaan::get();
        return response()->json($status_list, 200);
    }
    public function status_update(StatusUpdateRequest $request)
    {


        $user = auth()->user();

        try {
            //code...
            $validatedData = $request->validate($request->rules());
            // cek kesamaan dg kode skrg
            $currentSeq = Maintenance::where('sequence_id', $validatedData['sequence_id'])->orderBy('id', 'DESC')->first();
            $currentStatus = $currentSeq->kode_status;
            $new_maintenance = [
                'kode_status' => $validatedData['kode_status'],
                'sequence_id' => $validatedData['sequence_id'],
                'users_id' => $user->id
            ];
            // apabila kode sama
            if ($validatedData['kode_status'] === $currentStatus) {
                return response()->json(
                    ['error' => "Kode Status tidak boleh sama dengan status sebelumnya !"],
                    400
                );
            }
            // apabila kode sudah diperbaiki penyedia
            if ($validatedData['kode_status'] === '5') {
                MaintenanceSequence::where('id', $validatedData['sequence_id'])->update(
                    [
                        'biaya' => $validatedData['biaya']
                    ]
                );
            }
            // default
            if (isset($validatedData['status'])) {
                MaintenanceSequence::where('id', $validatedData['sequence_id'])->update(
                    [
                        'kondisi_final' => $validatedData['status']
                    ]
                );
                // jika baik maka kemballikan ke pengguna 
                // jika rusak ringan maka bisa memilih
                // jika rusak berat maka kembalikan ke umum

            }
            // $validatedData['users_id'] = $user->id;
            Maintenance::create(
                $new_maintenance
            );
            return response()->json(
                ['message' => 'Berhasil mengubah status pengajuan !'],
                201
            );
        } catch (\Exception $e) {
            return response()->json(['asulah' => $e->getMessage()], 400);
        }
    }
}
