@extends('layouts.app')

@section('content')
    <div class="max-w-2xl mx-auto bg-white p-8 rounded shadow">
        <h2 class="text-xl font-semibold mb-6">Add Book</h2>

        @if ($errors->any())
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4">
                <ul class="list-disc pl-5">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('books.store') }}" method="POST">
            @csrf
            <div class="mb-4">
                <label for="title" class="block text-gray-700">Title</label>
                <input type="text" name="title" id="title" value="{{ old('title') }}" class="w-full mt-1 p-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600">
            </div>
            <div class="mb-4">
                <label for="author" class="block text-gray-700">Author</label>
                <input type="text" name="author" id="author" value="{{ old('author') }}" class="w-full mt-1 p-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600">
            </div>
            <div class="mb-4">
                <label for="publish_year" class="block text-gray-700">Publish Year</label>
                <input type="number" name="publish_year" id="publish_year" value="{{ old('publish_year') }}" class="w-full mt-1 p-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600" min="1000" max="{{ date('Y') }}">
            </div>
            <div class="mb-4">
                <label for="categories" class="block text-gray-700">Category</label>
                @foreach($categories as $category)
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" name="categories[]" id="category{{ $category->uuid }}" value="{{ $category->uuid }}"
                            {{ (is_array(old('categories')) && in_array($category->uuid, old('categories'))) ? 'checked' : '' }}>
                        <label class="form-check-label" for="category{{ $category->uuid }}">{{ $category->category_name }}</label>
                    </div>
                @endforeach
            </div>
            <div class="mb-4">
                <label for="member_uuid" class="block text-gray-700">Borrowed by</label>
                <select name="member_uuid" id="member_uuid" class="w-full mt-1 p-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-600">
                    <option value="">Not Borrowed</option>
                    @foreach($members as $member)
                        <option value="{{ $member->uuid }}" {{ (old('member_uuid') == $member->uuid) ? 'selected' : '' }}>{{ $member->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="flex justify-end">
                <a href="{{ route('books.index') }}" class="bg-gray-500 text-white px-4 py-2 rounded mr-2 hover:bg-gray-600">Cancel</a>
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Save</button>
            </div>
        </form>
    </div>
@endsection
