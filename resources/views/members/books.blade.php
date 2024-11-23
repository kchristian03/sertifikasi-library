@extends('layouts.app')

@section('content')
<div class="flex justify-between items-center mb-6">
    <h1 class="text-2xl font-semibold">Buku yang Dipinjam oleh: {{ $anggota->nama }}</h1>
    <a href="{{ route('anggotas.index' )}}" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Kembali</a>
</div>

@if($bukus->isEmpty())
<div class="text-center text-gray-700">Anggota ini belum meminjam buku apapun.</div>
@else
<div class="overflow-x-auto">
    <table class="min-w-full bg-white shadow rounded">
        <thead>
        <tr>
            <th class="py-2 px-4 border-b">UUID</th>
            <th class="py-2 px-4 border-b">Judul</th>
            <th class="py-2 px-4 border-b">Pengarang</th>
            <th class="py-2 px-4 border-b">Tahun Terbit</th>
            <th class="py-2 px-4 border-b">Kategori</th>
        </tr>
        </thead>
        <tbody>
        @foreach($bukus as $buku)
        <tr class="text-center">
            <td class="py-2 px-4 border-b">{{ $buku->uuid }}</td>
            <td class="py-2 px-4 border-b">{{ $buku->judul }}</td>
            <td class="py-2 px-4 border-b">{{ $buku->pengarang }}</td>
            <td class="py-2 px-4 border-b">{{ $buku->tahun_terbit }}</td>
            <td class="py-2 px-4 border-b">
                @foreach($buku->kategoris as $kategori)
                <span class="inline-block bg-gray-200 text-gray-700 px-2 py-1 rounded-full text-xs">{{ $kategori->nama_kategori }}</span>
                @endforeach
            </td>
        </tr>
        @endforeach
        </tbody>
    </table>
</div>
@endif
@endsection
