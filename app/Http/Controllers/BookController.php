<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Category;
use Illuminate\Http\Request;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $books = Book::with('category', 'member')->get();
        return view('books.index', compact('books'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('books.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'author' => 'required|digits:4|integer',
            'categories' => 'required|array',
            'member_uuid' => 'nullable|exists:members,uuid',
        ]);

        $book = Book::create($request->only(['title', 'author', 'publish_year', 'member_uuid']));
        $book->category()->attach($request->categories);
        return redirect()->route('books.index')->with('success', 'Success add book.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return view('books.show', [
            'book' => Book::with('category', 'member')->findOrFail($id),
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
//        $categories = Category::all();
        return view('books.edit', [
            'book' => Book::with('category', 'member')->findOrFail($id),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'title' => 'required',
            'author' => 'required|digits:4|integer',
            'categories' => 'required|array',
            'member_uuid' => 'nullable|exists:members,uuid',
        ]);

        $book = Book::findOrFail($id);
        $book->update($request->only(['title', 'author', 'publish_year', 'member_uuid']));
        $book->category()->sync($request->categories);
        return redirect()->route('books.index')->with('success', 'Success update book.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Book::findOrFail($id)->delete();
        return redirect()->route('books.index')->with('success', 'Success delete book.');
    }

    /**
     * Show trashed data.
     */
    public function trashed()
    {
        $books = Book::onlyTrashed()->get();
        return view('books.trashed', compact('books'));
    }

    /**
     * Restore the specified resource from storage.
     */
    public function restore(string $id)
    {
        Book::withTrashed()->findOrFail($id)->restore();
        return redirect()->route('books.index')->with('success', 'Success restore book.');
    }
}
