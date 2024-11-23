<?php

namespace App\Http\Controllers;

use App\Models\Member;
use Illuminate\Http\Request;

class MemberController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $members = Member::all();
        return view('members.index', compact('members'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('members.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'address' => 'required',
            'email' => 'required|email',
            'phone' => 'required|numeric',
        ]);

        Member::create($request->all());
        return redirect()->route('members.index')->with('success', 'Success add member.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return view('members.show', [
            'member' => Member::findOrFail($id),
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return view('members.edit', [
            'member' => Member::findOrFail($id),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required',
            'address' => 'required',
            'email' => 'required|email',
            'phone' => 'required|numeric',
        ]);

        Member::findOrFail($id)->update($request->all());
        return redirect()->route('members.index')->with('success', 'Success update member.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Member::findOrFail($id)->delete();
        return redirect()->route('members.index')->with('success', 'Success delete member.');
    }

    /**
     * Show trashed member
     */
    public function trashed()
    {
        $members = Member::onlyTrashed()->get();
        return view('members.trashed', compact('members'));
    }

    /**
     * Restore trashed member
     */
    public function restore(string $id)
    {
        Member::withTrashed()->findOrFail($id)->restore();
        return redirect()->route('members.index')->with('success', 'Success restore member.');
    }
}