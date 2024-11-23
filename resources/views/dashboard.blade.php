@extends('layouts.app')

@section('content')
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <!-- Total Buku -->
        <div class="bg-white p-6 rounded-lg shadow">
            <div class="flex items-center">
                <svg class="w-12 h-12 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                </svg>
                <div class="ml-4">
                    <h3 class="text-lg font-semibold text-gray-700">Total Buku</h3>
                    <p class="text-2xl font-bold text-gray-900">{{ $totalBuku }}</p>
                </div>
            </div>
        </div>

        <!-- Total Kategori -->
        <div class="bg-white p-6 rounded-lg shadow">
            <div class="flex items-center">
                <svg class="w-12 h-12 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
                <div class="ml-4">
                    <h3 class="text-lg font-semibold text-gray-700">Total Kategori</h3>
                    <p class="text-2xl font-bold text-gray-900">{{ $totalKategori }}</p>
                </div>
            </div>
        </div>

        <!-- Total Anggota -->
        <div class="bg-white p-6 rounded-lg shadow">
            <div class="flex items-center">
                <svg class="w-12 h-12 text-yellow-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5V10a1 1 0 00-1-1h-3.586l-1-1H17a1 1 0 00-1 1v10z"></path>
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 20h5v-8a1 1 0 00-1-1h-3l-1-1H12a1 1 0 00-1 1v8z"></path>
                </svg>
                <div class="ml-4">
                    <h3 class="text-lg font-semibold text-gray-700">Total Anggota</h3>
                    <p class="text-2xl font-bold text-gray-900">{{ $totalAnggota }}</p>
                </div>
            </div>
        </div>

        <!-- Buku Dipinjam -->
        <div class="bg-white p-6 rounded-lg shadow">
            <div class="flex items-center">
                <svg class="w-12 h-12 text-red-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 10h.01M12 10h.01M16 10h.01M21 12c0 4.418-3.582 8-8 8H5a8 8 0 01-8-8V5a8 8 0 018-8h8a8 8 0 018 8v7z"></path>
                </svg>
                <div class="ml-4">
                    <h3 class="text-lg font-semibold text-gray-700">Buku Dipinjam</h3>
                    <p class="text-2xl font-bold text-gray-900">{{ $bukuDipinjam }}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Daftar Buku Terbaru -->
    <div class="bg-white p-6 rounded-lg shadow mb-8">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-semibold">Buku Terbaru</h2>
            <a href="{{ route('books.index') }}" class="text-blue-500 hover:underline">Lihat Semua</a>
        </div>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white">
                <thead>
                <tr>
                    <th class="py-2 px-4 border-b">Judul</th>
                    <th class="py-2 px-4 border-b">Pengarang</th>
                    <th class="py-2 px-4 border-b">Tahun Terbit</th>
                </tr>
                </thead>
                <tbody>
                @forelse($bukuTerbaru as $buku)
                    <tr class="text-center">
                        <td class="py-2 px-4 border-b">{{ $buku->title }}</td>
                        <td class="py-2 px-4 border-b">{{ $buku->author }}</td>
                        <td class="py-2 px-4 border-b">{{ $buku->publish_year }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="3" class="py-4">Tidak ada buku terbaru.</td>
                    </tr>
                @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <!-- Daftar Anggota Terbaru -->
    <div class="bg-white p-6 rounded-lg shadow mb-8">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-semibold">Anggota Terbaru</h2>
            <a href="{{ route('members.index') }}" class="text-blue-500 hover:underline">Lihat Semua</a>
        </div>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white">
                <thead>
                <tr>
                    <th class="py-2 px-4 border-b">Nama</th>
                    <th class="py-2 px-4 border-b">No HP</th>
                    <th class="py-2 px-4 border-b">Email</th>
                    <th class="py-2 px-4 border-b">Alamat</th>
                </tr>
                </thead>
                <tbody>
                @forelse($anggotaTerbaru as $anggota)
                    <tr class="text-center">
                        <td class="py-2 px-4 border-b">{{ $anggota->name }}</td>
                        <td class="py-2 px-4 border-b">{{ $anggota->phone }}</td>
                        <td class="py-2 px-4 border-b">{{ $anggota->address }}</td>
                        <td class="py-2 px-4 border-b">{{ $anggota->email }}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="3" class="py-4">Tidak ada anggota terbaru.</td>
                    </tr>
                @endforelse
                </tbody>
            </table>
        </div>
    </div>
@endsection
