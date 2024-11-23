<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('book_category', function (Blueprint $table) {
            $table->uuid('book_uuid');
            $table->uuid('category_uuid');
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('book_uuid')->references('uuid')->on('books')->onDelete('cascade');
            $table->foreign('category_uuid')->references('uuid')->on('categories')->onDelete('cascade');

            $table->primary(['book_uuid', 'category_uuid']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('book_category');
    }
};
