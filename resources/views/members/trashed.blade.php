@extends('layouts.app')

@section('content')
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-semibold">Member Deleted</h1>
        <a href="{{ route('members.index') }}" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Back</a>
    </div>

    @if(session('success'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
            {{ session('success') }}
        </div>
    @endif

    @if($members->isEmpty())
        <div class="text-center text-gray-700">No members were removed.</div>
    @else
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white shadow rounded">
                <thead>
                <tr>
{{--                    <th class="py-2 px-4 border-b">UUID</th>--}}
                    <th class="py-2 px-4 border-b">Name</th>
                    <th class="py-2 px-4 border-b">Phone</th>
                    <th class="py-2 px-4 border-b">Email</th>
                    <th class="py-2 px-4 border-b">Address</th>
                    <th class="py-2 px-4 border-b">Delete at</th>
                    <th class="py-2 px-4 border-b">Action</th>
                </tr>
                </thead>
                <tbody>
                @foreach($members as $member)
                    <tr class="text-center">
{{--                        <td class="py-2 px-4 border-b">{{ $member->uuid }}</td>--}}
                        <td class="py-2 px-4 border-b">{{ $member->name }}</td>
                        <td class="py-2 px-4 border-b">{{ $member->phone }}</td>
                        <td class="py-2 px-4 border-b">{{ $member->email }}</td>
                        <td class="py-2 px-4 border-b">{{ $member->address }}</td>
                        <td class="py-2 px-4 border-b">{{ $member->deleted_at->format('d M Y, H:i') }}</td>
                        <td class="py-2 px-4 border-b">
                            <form action="{{ route('members.restore', $member->uuid) }}" method="POST" class="inline-block" onsubmit="return confirm('Do you want to restore this member?');">
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
