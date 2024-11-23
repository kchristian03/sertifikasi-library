@extends('layouts.app')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold">Members List</h1>
        <a href="{{ route('members.create') }}" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Add Member</a>
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
                <th class="py-2 px-4 border-b">Name</th>
                <th class="py-2 px-4 border-b">Phone</th>
                <th class="py-2 px-4 border-b">Email</th>
                <th class="py-2 px-4 border-b">Address</th>
                <th class="py-2 px-4 border-b">Action</th>
            </tr>
            </thead>
            <tbody>
            @forelse($members as $member)
                <tr class="text-center">
{{--                    <td class="py-2 px-4 border-b">{{ $member->uuid }}</td>--}}
                    <td class="py-2 px-4 border-b">{{ $member->name }}</td>
                    <td class="py-2 px-4 border-b">{{ $member->phone }}</td>
                    <td class="py-2 px-4 border-b">{{ $member->email }}</td>
                    <td class="py-2 px-4 border-b">{{ $member->address }}</td>
                    <td class="py-2 px-4 border-b">
                        <a href="{{ route('members.show', $member->uuid) }}" class="text-blue-500 hover:underline mr-2">Detail</a>
                        <a href="{{ route('members.edit', $member->uuid) }}" class="text-yellow-500 hover:text-yellow-700 mr-2">Edit</a>
                        <form action="{{ route('members.destroy', $member->uuid) }}" method="POST" class="inline-block" onsubmit="return confirm('Are you sure you want to delete this member?');">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="text-red-500 hover:text-red-700">Delete</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="5" class="py-4">No members available.</td>
                </tr>
            @endforelse
            </tbody>
        </table>
    </div>
@endsection
