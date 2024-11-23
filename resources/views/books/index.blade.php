@extends('layouts.app')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold">Book List</h1>
        <a href="{{ route('books.create') }}" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Add Book</a>
    </div>

    @if(session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
            {{ session('success') }}
        </div>
    @endif

    <div class="overflow-x-auto">
        <table class="min-w-full bg-white shadow rounded">
            <thead>
            <tr>
{{--                <th class="py-2 px-4 border-b">UUID</th>--}}
                <th class="py-2 px-4 border-b">Title</th>
                <th class="py-2 px-4 border-b">Author</th>
                <th class="py-2 px-4 border-b">Publish Year</th>
                <th class="py-2 px-4 border-b">Category</th>
                <th class="py-2 px-4 border-b">Borrowed by</th>
                <th class="py-2 px-4 border-b">Action</th>
            </tr>
            </thead>
            <tbody>
            @forelse($books as $book)
                <tr class="text-center">
{{--                    <td class="py-2 px-4 border-b">{{ $book->uuid }}</td>--}}
                    <td class="py-2 px-4 border-b">{{ $book->title }}</td>
                    <td class="py-2 px-4 border-b">{{ $book->author }}</td>
                    <td class="py-2 px-4 border-b">{{ $book->publish_year }}</td>
                    <td class="py-2 px-4 border-b">
                        @if($book->category && $book->category->isNotEmpty())
                            @foreach($book->category as $category)
                                <span class="inline-block bg-gray-200 text-gray-700 px-2 py-1 rounded-full text-xs">{{ $category->category_name }}</span>
                            @endforeach
                        @else
                            <span class="text-gray-500">Tidak ada kategori</span>
                        @endif
                    </td>
                    <td class="py-2 px-4 border-b">
                        @if($book->member)
                            {{ $book->member->name }}
                        @else
                            <span class="text-gray-500">Not Borrowed</span>
                        @endif
                    </td>
                    <td class="py-2 px-4 border-b">
                        <a href="{{ route('books.edit', $book->uuid) }}" class="text-yellow-500 hover:text-yellow-700 mr-2">Edit</a>
                        <form action="{{ route('books.destroy', $book->uuid) }}" method="POST" class="inline-block" onsubmit="return confirm('Are you sure you want to delete this book?');">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="text-red-500 hover:text-red-700">Delete</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="7" class="py-4">No books available.</td>
                </tr>
            @endforelse
            </tbody>
        </table>
    </div>
@endsection
