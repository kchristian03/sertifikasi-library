<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Book extends Model
{
    use SoftDeletes;

    public $incrementing = false;
    protected $keyType = 'string';
    protected $primaryKey = 'uuid';
    protected $fillable = ['uuid', 'title', 'author', 'publish_year', 'member_uuid'];

    protected static function boot(): void
    {
        parent::boot();
        static::creating(function ($model) {
            if (empty($model->{$model->getKeyName()})) {
                $model->{$model->getKeyName()} = (string) Str::uuid();
            }
        });
    }

    public function category()
    {
        return $this->belongsToMany(Category::class, 'book_category', 'book_uuid', 'category_uuid')->withTimestamps()->withPivot('deleted_at')->wherePivot('deleted_at', null);
    }

    public function member(): BelongsTo
    {
        return $this->belongsTo(Member::class, 'member_uuid', 'uuid');
    }
}
