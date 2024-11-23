<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = Category::all();
        return view('categories.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('categories.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'category_name' => 'required|unique:categories',
        ]);

        Category::create($request->all());
        return redirect()->route('categories.index')->with('success', 'Success add category.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        // Mengambil kategori berdasarkan UUID dan eager load relasi 'books'
        $category = Category::with('books')->where('uuid', $id)->firstOrFail();

        // Mengambil buku yang terkait dengan kategori tersebut, dengan pagination
        $books = $category->books()->get();

        return view('categories.books', compact('category', 'books'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        return view('categories.edit', [
            'category' => Category::findOrFail($id),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'category_name' => 'required|unique:categories,category_name,' . $id . ',uuid',
        ]);

        Category::findOrFail($id)->update($request->all());
        return redirect()->route('categories.index')->with('success', 'Success update category.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Category::findOrFail($id)->delete();
        return redirect()->route('categories.index')->with('success', 'Success delete category.');
    }

    /**
     * Show trashed data.
     */
    public function trashed()
    {
        $categories = Category::onlyTrashed()->get();
        return view('categories.trashed', compact('categories'));
    }

    /**
     * Restore the specified resource from storage.
     */
    public function restore(string $id)
    {
        Category::withTrashed()->findOrFail($id)->restore();
        return redirect()->route('categories.index')->with('success', 'Success restore category.');
    }


}
