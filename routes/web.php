<?php

use App\Http\Controllers\BookController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\MemberController;
use Illuminate\Support\Facades\Route;

//Route::resource('categories', CategoryController::class);
//Route::resource('books', BookController::class);
//Route::resource('members', MemberController::class);

// Home Route
Route::get('/', [DashboardController::class, 'index'])->name('home');


//// Routes for trashed data
//Route::prefix('members')->name('members.')->group(function () {
//    Route::get('trashed', [MemberController::class, 'trashed'])->name('trashed');
//});
//Route::prefix('categories')->name('categories.')->group(function () {
//    Route::get('trashed', [CategoryController::class, 'trashed'])->name('trashed');
//});
//Route::prefix('books')->name('books.')->group(function () {
//    Route::get('trashed', [BookController::class, 'trashed'])->name('trashed');
//});

Route::get('members/trashed', [MemberController::class, 'trashed'])->name('members.trashed');
Route::get('categories/trashed', [CategoryController::class, 'trashed'])->name('categories.trashed');
Route::get('books/trashed', [BookController::class, 'trashed'])->name('books.trashed');

// Routes untuk restore data
Route::post('members/{uuid}/restore', [MemberController::class, 'restore'])->name('members.restore');
Route::post('categories/{uuid}/restore', [CategoryController::class, 'restore'])->name('categories.restore');
Route::post('books/{uuid}/restore', [BookController::class, 'restore'])->name('books.restore');

// Route untuk menampilkan daftar buku berdasarkan kategori
Route::get('/categories/{uuid}/show', [CategoryController::class, 'show'])->name('categories.show');

// Route untuk menampilkan daftar buku yang dipinjam oleh anggota
Route::get('/members/{uuid}/show', [MemberController::class, 'show'])->name('members.show');

// Resource Routes
Route::resource('members', MemberController::class);
Route::resource('categories', CategoryController::class);
Route::resource('books', BookController::class);


Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});
