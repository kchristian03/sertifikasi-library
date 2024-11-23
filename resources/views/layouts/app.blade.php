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

        <!-- Alpine.js untuk interaktivitas sederhana -->
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

        <!-- Styles -->
        @livewireStyles
    </head>
    <body class="bg-gray-100">
    <nav class="bg-white shadow">
        <div class="container mx-auto px-6 py-3">
            <div class="flex items-center justify-between">
                <div>
                    <a href="{{ route('home') }}" class="text-gray-800 text-xl font-bold">Library</a>
                </div>
                <div class="flex space-x-4">
                    <a href="{{ route('books.index') }}" class="text-gray-600 hover:text-gray-800">Book</a>
                    <a href="{{ route('categories.index') }}" class="text-gray-600 hover:text-gray-800">Category</a>
                    <a href="{{ route('members.index') }}" class="text-gray-600 hover:text-gray-800">Member</a>
                    <!-- Dropdown Trash dengan Alpine.js -->
                    <div x-data="{ open: false }" class="relative">
                        <button @click="open = !open" class="text-gray-600 hover:text-gray-800 focus:outline-none">
                            Trash
                        </button>
                        <div x-show="open" @click.away="open = false" class="absolute right-0 mt-2 w-48 bg-white border rounded-md shadow-lg z-10">
                            <a href="{{ route('books.trashed') }}" class="block px-4 py-2 text-gray-800 hover:bg-gray-100">Book</a>
                            <a href="{{ route('categories.trashed') }}" class="block px-4 py-2 text-gray-800 hover:bg-gray-100">Category</a>
                            <a href="{{ route('members.trashed') }}" class="block px-4 py-2 text-gray-800 hover:bg-gray-100">Member</a>
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
