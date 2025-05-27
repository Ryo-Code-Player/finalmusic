<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BlogComent extends Model
{
    //
    protected $table = 'blog_coment';
    protected $fillable = ['id', 'blog_id', 'user_id', 'content', 'created_at', 'updated_at','like','reply','user_like'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function blogReply()
    {
        return $this->hasMany(BlogReply::class, 'comment_id');
    }
}
