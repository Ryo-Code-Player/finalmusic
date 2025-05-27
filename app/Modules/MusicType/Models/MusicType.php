<?php

namespace App\Modules\MusicType\Models;

use App\Modules\Song\Models\Song;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class MusicType extends Model
{
    use HasFactory;

    protected $table = 'music_types'; // Đảm bảo rằng đây là tên bảng trong cơ sở dữ liệu

    protected $fillable = [
        'title',
        'photo',
        'slug',
        'status',
    ];
    protected $appends = ['sum_song'];

    public function getSumSongAttribute(){
        return Song::where('musictype_id', $this->id)->count();
    }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            // Tạo slug khi tạo mới
            $model->slug = Str::slug($model->title);
        });

        static::updating(function ($model) {
            // Kiểm tra nếu title đã được cập nhật thì mới tạo slug
            if ($model->isDirty('title')) {
                $model->slug = Str::slug($model->title);
            }
        });
    }

    public function song(){
        return $this->hasMany(Song::class, 'musictype_id', 'id');
    }
}
