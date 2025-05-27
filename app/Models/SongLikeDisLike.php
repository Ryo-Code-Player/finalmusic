<?php

namespace App\Models;

use App\Modules\Song\Models\Song;
use Illuminate\Database\Eloquent\Model;

class SongLikeDisLike extends Model
{
    //
    protected $table = 'song_like_dislike';
    protected $fillable = ['id', 'song_id', 'user_id', 'like', 'dislike','created_at','updated_at','style'];

    public function song()
    {
        return $this->belongsTo(Song::class, 'song_id');
    }
}
