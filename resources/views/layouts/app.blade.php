<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])

        <!-- Styles -->
        @livewireStyles
    </head>
    <body class="bg-gray-100">
    <nav class="bg-white shadow">
        <div class="container mx-auto px-6 py-3">
            <div class="flex items-center justify-between">
                <div>
                    <a href="{{ route('home') }}" class="text-gray-800 text-xl font-bold">Perpustakaan</a>
                </div>
                <div class="flex space-x-4">
                    <a href="{{ route('bukus.index') }}" class="text-gray-600 hover:text-gray-800">Buku</a>
                    <a href="{{ route('kategoris.index') }}" class="text-gray-600 hover:text-gray-800">Kategori</a>
                    <a href="{{ route('anggotas.index') }}" class="text-gray-600 hover:text-gray-800">Anggota</a>
                    <div class="relative">
                        <button class="text-gray-600 hover:text-gray-800 focus:outline-none">
                            Trash
                        </button>
                        <div class="absolute right-0 mt-2 w-48 bg-white border rounded-md shadow-lg hidden group-hover:block">
                            <a href="{{ route('bukus.trashed') }}" class="block px-4 py-2 text-gray-800 hover:bg-gray-100">Buku</a>
                            <a href="{{ route('kategoris.trashed') }}" class="block px-4 py-2 text-gray-800 hover:bg-gray-100">Kategori</a>
                            <a href="{{ route('anggotas.trashed') }}" class="block px-4 py-2 text-gray-800 hover:bg-gray-100">Anggota</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mx-auto px-6 py-8">
        @yield('content')
    </div>

    <script src="{{ asset('js/app.js') }}"></script>
    </body>
</html>
