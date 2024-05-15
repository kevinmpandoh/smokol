<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */


    public function run(): void
    {

        User::create([

            'email' => 'admin@admin.com',
            'nama_lengkap' => 'Kevin M. Pandoh',
            'nip' => '199810132021041001',
            'bidang' => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',
            'username' => 'kevinadmin',

            "role" => "super admin",
            'password' => Hash::make('123')
        ]);

        User::create([

            'email' => 'kevinmpandoh@gmail.com',
            'nama_lengkap' => 'Kevin Pandoh',
            'nip' => '199810132021041001',
            'bidang' => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',
            'username' => 'kevin',

            'password' => Hash::make('123'),
            'role' => 'admin'
        ]);

        User::create([

            'email' => 'kevin@gmail.com',
            'nama_lengkap' => 'Mclaren',
            'nip' => '199810132021041001',
            'bidang' => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',
            'username' => 'kevin',

            'password' => Hash::make('123'),
        ]);

        User::insert([
            ["email" => 'ponim@bps.go.id',    "nama_lengkap" => 'Admin Po',    "nip" => '199810132021041001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'ponimin99', 'password' => Hash::make('password')],
            ["email" => 'umum7100@bps.go.id',    "nama_lengkap" => 'Bagian Umum',    "nip" => '000000000000000000',    "bidang" => 'Bagian Umum',    "username" => 'admin_umum', 'password' => Hash::make('password')],
            ["email" => 'satria.adwendi@bps.go.id',    "nama_lengkap" => 'Satria June Adwendi SST',    "nip" => '199307102016021001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'awe', 'password' => Hash::make('password')],
            ["email" => 'miaw_miranti@bps.go.id',    "nama_lengkap" => 'Mia Wahyumiranti',    "nip" => '198304112005022001',    "bidang" => 'Bagian Umum',    "username" => 'spk2', 'password' => Hash::make('password')],
            ["email" => 'dame.simamora@bps.go.id',    "nama_lengkap" => 'Tiara Dameani S.ST',    "nip" => '198802082009122002',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'dame', 'password' => Hash::make('password')],
            ["email" => 'hase@bps.go.id',    "nama_lengkap" => 'Hahotan Sagala SST',    "nip" => '198603202009021004',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'hahotan', 'password' => Hash::make('password')],
            ["email" => 'indiraira@bps.go.id',    "nama_lengkap" => 'Indira Anastasia Lolowang SE',    "nip" => '198301252003122001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'ira', 'password' => Hash::make('password')],
            ["email" => 'ernakusuma@bps.go.id', "nama_lengkap" => 'Erna Kusumawati SST',    "nip" => '198910192012112001',    "bidang" => 'Bagian Umum',    "username" => 'erna_kusumawati', 'password' => Hash::make('password')],
            ["email" => 'n.walangadi@bps.go.id',    "nama_lengkap" => 'Ir. Nuraini Walangadi',    "nip" => '196511231992122001',    "bidang" => 'Bagian Umum',    "username" => 'ani', 'password' => Hash::make('password')],
            ["email" => 'simon@bps.go.id',    "nama_lengkap" => 'Simon Andreas August Remiasa S.ST',    "nip" => '197710111999121001',    "bidang" => 'Bagian Umum',    "username" => 'simon', 'password' => Hash::make('password')],
            ["email" => 'hase@bps.go.id',    "nama_lengkap" => 'Hahotan Sagala SST',    "nip" => '198603202009021004',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'hase', 'password' => Hash::make('password')],
            ["email" => 'norma@bps.go.id',    "nama_lengkap" => 'Norma Olga Frida Regar, S.Si, M.Si',    "nip" => '196611291986032001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'norma', 'password' => Hash::make('password')],
            ["email" => 'ratnasuli@bps.go.id',    "nama_lengkap" => 'Ratna Sulistyowati, SST, SAB, M.Si',    "nip" => '198505262008012001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'ratna', 'password' => Hash::make('password')],
            ["email" => 'titienk@bps.go.id',    "nama_lengkap" => 'Titien Kristiningsih, SST, SE, M.Si',    "nip" => '198005252002122003',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'titien', 'password' => Hash::make('password')],
            ["email" => 'rhiniechay@bps.go.id',    "nama_lengkap" => 'Sarjani Harini Martiningsih S.Si',    "nip" => '198803062011012015',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'rhiniechay', 'password' => Hash::make('password')],
            ["email" => 'enggelingiacinta wongkar@bps.go.id',    "nama_lengkap" => 'Enggelin Giacinta Wongkar, SST',    "nip" => '199212292014122002',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'enggelin', 'password' => Hash::make('password')],
            ["email" => 'wulandanawulandana b@bps.go.id',    "nama_lengkap" => 'Ayu Puspita Wulandana B, SST',    "nip" => '199010082014102001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'wulandana', 'password' => Hash::make('password')],
            ["email" => 'sirly@bps.go.id',    "nama_lengkap" => 'Sirly Catharina Worotikan, SE., M.Si.',    "nip" => '196808281994012001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'sirly', 'password' => Hash::make('password')],
            ["email" => 'starrysolang@bps.go.id',    "nama_lengkap" => 'Starry Nouva Solang, M.Si.',    "nip" => '196709181994012001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'starry', 'password' => Hash::make('password')],
            ["email" => 'victorps@bps.go.id',    "nama_lengkap" => 'Victor Prima Sirait, SST., M.S.E',    "nip" => '198103282006021001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'victor', 'password' => Hash::make('password')],
            ["email" => 'oky@bps.go.id',    "nama_lengkap" => 'Oky Irwan Rosadi',    "nip" => '198610032011011011',    "bidang" => 'Bagian Umum',    "username" => 'oky', 'password' => Hash::make('password')],
            ["email" => 'mariane.rantung@bps.go.id',    "nama_lengkap" => 'Mariane Esther Rantung, SST',    "nip" => '199408062017012001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'esther', 'password' => Hash::make('password')],
            ["email" => 'akango@bps.go.id',    "nama_lengkap" => 'Abdullah Kango',    "nip" => '197407271997121001',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'akango',    'password' => Hash::make('password')],
            ["email" => 'elriniwuisan@bps.go.id',    "nama_lengkap" => 'Elrini D. Wuisan, SE',    "nip" => '198210022010032001',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'elri', 'password' => Hash::make('password')],
            ["email" => 'agnes.oroh@bps.go.id',    "nama_lengkap" => 'Agnes M. Oroh',    "nip" => '198208222008012014',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'agnes', 'password' => Hash::make('password')],
            ["email" => 'firra@bps.go.id',    "nama_lengkap" => 'Firra Rastraaktiva Awaliyah S.Si',    "nip" => '198512142010032002',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'firra', 'password' => Hash::make('password')],
            ["email" => 'limada iqbal@bps.go.id',    "nama_lengkap" => 'Limada Iqbal, SST',    "nip" => '199506222018021002',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'iqbal',  'password' => Hash::make('password')],
            ["email" => 'bregitta.lasut@bps.go.id',    "nama_lengkap" => 'Bregitta Sisilia Lasut SS',    "nip" => '198209182008012012',    "bidang" => 'Sosial',    "username" => 'gita', 'password' => Hash::make('password')],
            ["email" => 'junitha@bps.go.id',    "nama_lengkap" => 'Junitha Sahureka',    "nip" => '198606112009022007',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'uneth', 'password' => Hash::make('password')],
            ["email" => 'fmagdalena@bps.go.id',    "nama_lengkap" => 'Florentz Magdalena',    "nip" => '199108212014102000',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'florentz', 'password' => Hash::make('password')],
            ["email" => 'stela@bps.go.id',    "nama_lengkap" => 'Stela Engeline Doris Lomboan',    "nip" => '197209091992092001',    "bidang" => 'Bagian Umum',    "username" => 'stela', 'password' => Hash::make('password')],
            ["email" => 'joice.koyongian@bps.go.id',    "nama_lengkap" => 'Joice Juliana Koyongian A.Md',    "nip" => '198307062011012015',    "bidang" => 'Bagian Umum',    "username" => 'juliana', 'password' => Hash::make('password')],
            ["email" => 'frisda@bps.go.id',    "nama_lengkap" => 'Frisda Arisanti T',    "nip" => '198603082006042001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'frisda', 'password' => Hash::make('password')],
            ["email" => 'dame.simamora@bps.go.id',    "nama_lengkap" => 'Tiara Dameani S.ST',    "nip" => '198802082009122002',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'dame_user', 'password' => Hash::make('password')],
            ["email" => 'prisma.puspita@bps.go.id',    "nama_lengkap" => 'Prima Puspita Indramurti',    "nip" => '',    "bidang" => 'Bagian Umum',    "username" => 'prima', 'password' => Hash::make('password')],
            ["email" => 'pika@bps.go.id',    "nama_lengkap" => 'Priska Harto Lolowang',    "nip" => '198211262011011007',    "bidang" => 'Bagian Umum',    "username" => 'priska', 'password' => Hash::make('password')],
            ["email" => 'uyun@bps.go.id',    "nama_lengkap" => 'Uyun Rahmawati',    "nip" => '198502132011012017',    "bidang" => 'Bagian Umum',    "username" => 'uyun', 'password' => Hash::make('password')],
            ["email" => 'mentarandy@bps.go.id',    "nama_lengkap" => 'Randy Pratama Lumenta',    "nip" => '198911102012111001',    "bidang" => '',    "username" => 'randy', 'password' => Hash::make('password')],
            ["email" => 'windhawijaya@bps.go.id',    "nama_lengkap" => 'Windha Wijaya, SST',    "nip" => '199008012014102001',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'windha', 'password' => Hash::make('password')],
            ["email" => 'mohsam@bps.go.id',    "nama_lengkap" => 'Mohamad Samsodin',    "nip" => '198305082006021001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'mohsam', 'password' => Hash::make('password')],
            ["email" => 'sumbodo@bps.go.id',    "nama_lengkap" => 'Sumbodo Aji Cahyono, S.Si, MA',    "nip" => '197703081999011001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'sumbodo', 'password' => Hash::make('password')],
            ["email" => 'ipds7100@bps.go.id',    "nama_lengkap" => 'Administrator',    "nip" => '240171000000000000',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'admin', 'password' => Hash::make('password')],
            ["email" => 'radjid@bps.go.id',    "nama_lengkap" => 'Radjid Dwi Iskandar A.Md',    "nip" => '198504112011011009',    "bidang" => 'Bagian Umum',    "username" => 'radjid', 'password' => Hash::make('password')],
            ["email" => 'yajaivka@bps.go.id',    "nama_lengkap" => 'Yanti Jane Ivonne Kaeng',    "nip" => '198201202008012012',    "bidang" => 'Bagian Umum',    "username" => 'spk1', 'password' => Hash::make('password')],
            ["email" => 'ridwanst@bps.go.id',    "nama_lengkap" => 'Ridwan Setiawan S.Tr.Stat.',    "nip" => '199604202019011002',    "bidang" => 'Bagian Umum',    "username" => 'Ridwan',   'password' => Hash::make('password')],
            ["email" => 'karni.hamdani@bps.go.id',    "nama_lengkap" => 'Karni Hamdani S.Si.',    "nip" => '199401312019032001',    "bidang" => 'Bagian Umum',    "username" => 'karni', 'password' => Hash::make('password')],
            ["email" => 'niar@bps.go.id',    "nama_lengkap" => 'Rosniar Eliana SST., M.Stat.',    "nip" => '198601202009022008',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'niar', 'password' => Hash::make('password')],
            ["email" => 'danty.fatima@bps.go.id',    "nama_lengkap" => 'Danty Welmin Yoshida Fatima S.Tr.Stat.', "nip" => '199711032021042001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'danty123', 'password' => Hash::make('password')],
            ["email" => 'inkemargareth@bps.go.id',    "nama_lengkap" => 'Inke Margareth Tambeo',    "nip" => '198403232007012003',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'inke', 'password' => Hash::make('password')],
            ["email" => 'nurfadhila@bps.go.id',    "nama_lengkap" => 'Nurfadhila Fahmi',    "nip" => '199510092019032002',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'dhila', 'password' => Hash::make('password')],
            ["email" => 'xsiswahto@bps.go.id',    "nama_lengkap" => 'Eko Siswahto SST, M.SE',    "nip" => '198504202008011003',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'xsiswahto', 'password' => Hash::make('password')],
            ["email" => 'asim@bps.go.id',    "nama_lengkap" => 'Asim Saputra, SST, M.Ec.Dev.',    "nip" => '197609271999011001',    "bidang" => 'Kepala BPS Provinsi',    "username" => 'asim', 'password' => Hash::make('password')],
            ["email" => 'antontw@bps.go.id',    "nama_lengkap" => ' Anton Tri Wijayanto, S.ST, M.Si.',    "nip" => '198001022002121003',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'Anton', 'password' => Hash::make('password')],
            ["email" => 'dadan@bps.go.id',    "nama_lengkap" => 'Dadan Sudarmadi, SST, M.Si.',    "nip" => '197310141995121001',    "bidang" => 'Bagian Umum',    "username" => 'dadan', 'password' => Hash::make('password')],
            ["email" => 'amakhrus@bps.go.id ',    "nama_lengkap" => 'Abdul Aziz Makhrus, S.Tr.Stat.',    "nip" => '199607082019011003',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'aziz', 'password' => Hash::make('password')],
            ["email" => 'dina.atika@bps.go.id',    "nama_lengkap" => 'Dina Atika Rahmawati, SST',    "nip" => '199601152018022001',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'dina', 'password' => Hash::make('password')],
            ["email" => 'zulfanr@bps.go.id',    "nama_lengkap" => 'Zulfa Nur Fajri Ramadhani, S.Tr.Stat.',    "nip" => '199701292019012001',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'zulfa', 'password' => Hash::make('password')],
            ["email" => 'salonica.oktaviani@bps.go.id ',    "nama_lengkap" => 'Salonica Oktaviani, SST',    "nip" => '199410302018022001',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'salonica', 'password' => Hash::make('password')],
            ["email" => 'leonardo.pratama@bps.go.id',    "nama_lengkap" => 'Christian Leonardo Pratama Tamboto, S.Tr.Stat.',    "nip" => '199708072019121001',    "bidang" => 'Bagian Umum',    "username" => 'christian', 'password' => Hash::make('password')],
            ["email" => 'untarirahma@bps.go.id',    "nama_lengkap" => 'Untari Rahmawati, S.Tr.Stat.',    "nip" => '199603312019012001',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis Statistik',    "username" => 'Untari', 'password' => Hash::make('password')],
            ["email" => 'in.pande@bps.go.id',    "nama_lengkap" => 'I Nyoman Pande Suputra, SST',    "nip" => '199504272018021002',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'Pande', 'password' => Hash::make('password')],
            ["email" => 'nabella.intan@bps.go.id',    "nama_lengkap" => 'Nabella Intan Karasta, S.Tr.Stat',    "nip" => '196808281994012001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'nabella', 'password' => Hash::make('password')],
            ["email" => 'yulius.wendi@bps.go.id',    "nama_lengkap" => 'Yulius Wendi Triandaru SST',    "nip" => '199407252018021001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'Yulius', 'password' => Hash::make('password')],
            ["email" => 'nurul.hidayah@bps.go.id',    "nama_lengkap" => 'Nurul Hidayah S.Tr.Stat.',    "nip" => '199704212019012001',    "bidang" => 'Bagian Umum',    "username" => 'ida', 'password' => Hash::make('password')],
            ["email" => 'wisnu.triaji@bps.go.id',    "nama_lengkap" => 'Wisnu Triaji, SE',    "nip" => '198702142009021002',    "bidang" => 'Bagian Umum',    "username" => 'wisnu.triaji', 'password' => Hash::make('password')],
            ["email" => 'airin@bps.go.id',    "nama_lengkap" => 'Irene Ruth Longkutoy SH',    "nip" => '197403242006042000',    "bidang" => 'Bagian Umum',    "username" => 'irene', 'password' => Hash::make('password')],
            ["email" => 'stevenmontolalu@bps.go.id',    "nama_lengkap" => 'Steven Kalvin Montolalu, SE',    "nip" => '197904062003121000',    "bidang" => 'Bagian Umum',    "username" => 'steven', 'password' => Hash::make('password')],
            ["email" => 'tenty@bps.go.id',    "nama_lengkap" => 'Lazia Outenty Bimbangnaung',    "nip" => '198110000000000000',    "bidang" => 'Bagian Umum',    "username" => 'lazia', 'password' => Hash::make('password')],
            ["email" => 'olfianesilfia pelealu@bps.go.id',    "nama_lengkap" => 'Olfiane Silfia Pelealu, SE',    "nip" => '197310042003122000',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'olfiane', 'password' => Hash::make('password')],
            ["email" => 'elriniwuisan@bps.go.id',    "nama_lengkap" => 'Elrini Diane Wuisan, SE',    "nip" => '198210022010032000',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'elrini', 'password' => Hash::make('password')],
            ["email" => 'vonny@bps.go.id',    "nama_lengkap" => 'Vonny Joice Lalujan, SE',    "nip" => '196911011992022000',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'vonny', 'password' => Hash::make('password')],
            ["email" => 'dading@bps.go.id',    "nama_lengkap" => 'Dading, S.Si.',    "nip" => '199112202019031000',    "bidang" => 'Fungsi Statistik Distribusi',    "username" => 'dading', 'password' => Hash::make('password')],
            ["email" => 'iqbal.muh@bps.go.id',    "nama_lengkap" => 'Muhammad Iqbal, S.Stat.',    "nip" => '199510132019031001',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'iqbal1', 'password' => Hash::make('password')],
            ["email" => 'ponim@bps.go.id',    "nama_lengkap" => 'Ponimin',    "nip" => '199810132021041000',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'Ponimin', 'password' => Hash::make('password')],
            ["email" => 'rifqi.mubarak@bps.go.id',    "nama_lengkap" => 'Muhammad Rifqi Mubarak',    "nip" => '199901052021041000',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'Rifqi', 'password' => Hash::make('password')],
            ["email" => 'ririnh@bps.go.id',    "nama_lengkap" => 'Ririn Hidayati S.Si., MPP, MSE',    "nip" => '197311031998032005',    "bidang" => 'Fungsi Distribusi',    "username" => 'ririnh', 'password' => Hash::make('password')],
            ["email" => 'rhiniechay@bps.go.id',    "nama_lengkap" => 'Sarjani Harini Martiningsih S.Si',    "nip" => '198803062011012015',    "bidang" => 'Seksi Statistik Pertambangan, Energi dan Konstruksi',    "username" => 'rini123', 'password' => Hash::make('password')],
            ["email" => 'mustika.arum@bps.go.id',    "nama_lengkap" => 'Mustika Aridya Arum A.Md.Kb.N.',    "nip" => '200104112022012001',    "bidang" => 'Bagian Tata Usaha',    "username" => 'mustika', 'password' => Hash::make('password')],
            ["email" => 'ratriani.wardani@bps.go.id',    "nama_lengkap" => 'Ratriani Retno Wardani S.Tr.Stat.',    "nip" => '199903202022012004',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'ratriani', 'password' => Hash::make('password')],
            ["email" => 'daniel.tri@bps.go.id',    "nama_lengkap" => 'Daniel Tri Hemawan SE',    "nip" => '197610102006041003',    "bidang" => 'Fungsi Neraca Wilayah dan Analisis',    "username" => 'daniel_tri', 'password' => Hash::make('password')],
            ["email" => 'yola.larinse@bps.go.id',    "nama_lengkap" => 'Yola Christhy Larinse SST',    "nip" => '199211072014122001',    "bidang" => 'Fungsi Statistik Produksi',    "username" => 'yola', 'password' => Hash::make('password')],
            ["email" => 'risky@bps.go.id',    "nama_lengkap" => 'Risky SST',    "nip" => '199405192016021001',    "bidang" => 'Fungsi Statistik Sosial',    "username" => 'risky', 'password' => Hash::make('password')],
            ["email" => 'zaenuri@bps.go.id',    "nama_lengkap" => 'Zaenuri Putro Utomo',    "nip" => '198101262011011005',    "bidang" => 'Fungsi Integrasi Pengolahan dan Diseminasi Statistik',    "username" => 'zaenuri', 'password' => Hash::make('password')],
            ["email" => 'herman.tinungki@bps.go.id',    "nama_lengkap" => 'Herman Tinungki SE',    "nip" => '196703311986031002',    "bidang" => 'Bagian Umum',    "username" => 'herman', 'password' => Hash::make('password')],
            ["email" => 'nurul.unonongo@bps.go.id',    "nama_lengkap" => 'Nurul Hayati Unonongo SST',    "nip" => '199311112017012002',    "bidang" => 'Bagian Umum',    "username" => 'nurul.unonongo', 'password' => Hash::make('password')],
            ["email" => 'friska.patricia@bps.go.id',    "nama_lengkap" => 'Friska Patricia Raintung, SE',    "nip" => '198912292022032007',    "bidang" => 'Bagian Umum',    "username" => 'friska.patricia', 'password' => Hash::make('password')],
            ["email" => 'nova.nurviana@bps.go.id',    "nama_lengkap" => 'Nova Nurviana SST, M.T.',    "nip" => '198911222013112001',    "bidang" => 'Statistik Sosial',    "username" => 'nova.nurviana', 'password' => Hash::make('password')],
        ]);
    }
}
