<?php

namespace App\Models;

use App\Modules\Song\Models\Song;
use Illuminate\Database\Eloquent\Model;

class SongComent extends Model
{
    //
    protected $table = 'song_coment';
    protected $fillable = ['id', 'song_id', 'user_id', 'content', 'created_at', 'updated_at','like','reply','user_like'];

    public function song()
    {
        return $this->belongsTo(Song::class, 'song_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function songReply()
    {
        return $this->hasMany(SongReply::class, 'comment_id');
    }
}
