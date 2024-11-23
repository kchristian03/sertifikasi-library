<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Book;
use App\Models\Category;
use App\Models\Member;

class DashboardController extends Controller
{
    public function index()
    {
        // Mengambil total data
        $totalBuku = Book::count();
        $totalKategori = Category::count();
        $totalAnggota = Member::count();

        // Mengambil jumlah buku yang sedang dipinjam
        $bukuDipinjam = Book::whereNotNull('member_uuid')->count();

        // Mengambil 5 buku terbaru
        $bukuTerbaru = Book::latest()->take(5)->get();

        // Mengambil 5 anggota terbaru
        $anggotaTerbaru = Member::latest()->take(5)->get();

        return view('dashboard', compact(
            'totalBuku',
            'totalKategori',
            'totalAnggota',
            'bukuDipinjam',
            'bukuTerbaru',
            'anggotaTerbaru'
        ));
    }
}
