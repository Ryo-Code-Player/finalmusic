<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BlogReply extends Model
{
    //
    protected $table = 'blog_reply';
    protected $fillable = ['id', 'user_id', 'content', 'created_at', 'updated_at','comment_id'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
