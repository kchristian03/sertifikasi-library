@extends('layouts.app')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold">Deleted Book</h1>
        <a href="{{ route('books.index') }}" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Back</a>
    </div>

    @if(session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
            {{ session('success') }}
        </div>
    @endif

    @if($books->isEmpty())
        <div class="text-center text-gray-700">No books deleted.</div>
    @else
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white shadow rounded">
                <thead>
                <tr>
                    <th class="py-2 px-4 border-b">UUID</th>
                    <th class="py-2 px-4 border-b">Title</th>
                    <th class="py-2 px-4 border-b">Author</th>
                    <th class="py-2 px-4 border-b">Publish Year</th>
                    <th class="py-2 px-4 border-b">Delete at</th>
                    <th class="py-2 px-4 border-b">Action</th>
                </tr>
                </thead>
                <tbody>
                @foreach($books as $book)
                    <tr class="text-center">
                        <td class="py-2 px-4 border-b">{{ $book->uuid }}</td>
                        <td class="py-2 px-4 border-b">{{ $book->title }}</td>
                        <td class="py-2 px-4 border-b">{{ $book->author }}</td>
                        <td class="py-2 px-4 border-b">{{ $book->publish_year }}</td>
                        <td class="py-2 px-4 border-b">{{ $book->deleted_at->format('d M Y, H:i') }}</td>
                        <td class="py-2 px-4 border-b">
                            <form action="{{ route('books.restore', $book->uuid) }}" method="POST" class="inline-block" onsubmit="return confirm('Do you want to restore this book?');">
                                @csrf
                                <button type="submit" class="bg-green-500 text-white px-3 py-1 rounded hover:bg-green-600">Restore</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    @endif
@endsection
