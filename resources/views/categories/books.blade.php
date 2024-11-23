@extends('layouts.app')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold">Books in Category: {{ $category->nama_kategori }}</h1>
        <a href="{{ route('categories.index') }}" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Back</a>
    </div>

    @if($books->isEmpty())
        <div class="text-center text-gray-700">There are no books in this category.</div>
    @else
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white shadow rounded">
                <thead>
                <tr>
{{--                    <th class="py-2 px-4 border-b">UUID</th>--}}
                    <th class="py-2 px-4 border-b">Title</th>
                    <th class="py-2 px-4 border-b">Author</th>
                    <th class="py-2 px-4 border-b">Publish Year</th>
                    <th class="py-2 px-4 border-b">Borrowed By</th>
                </tr>
                </thead>
                <tbody>
                @foreach($books as $book)
                    <tr class="text-center">
{{--                        <td class="py-2 px-4 border-b">{{ $book->uuid }}</td>--}}
                        <td class="py-2 px-4 border-b">{{ $book->title }}</td>
                        <td class="py-2 px-4 border-b">{{ $book->author }}</td>
                        <td class="py-2 px-4 border-b">{{ $book->publish_year }}</td>
                        <td class="py-2 px-4 border-b">
                            @if($book->member)
                                {{ $book->member->name }}
                            @else
                                <span class="text-gray-500">Not Borrowed</span>
                            @endif
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    @endif
@endsection
