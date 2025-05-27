<?php

namespace App\Http\Controllers\frontend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\BlogCategory;
use App\Models\Post;
use App\Models\User;
use App\Modules\Blog\Models\Blog;
use Illuminate\Support\Str;

class BlogPageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function __construct( )
    {

    }
    public function index()
    {
        $blogs = Blog::select('id', 'title', 'slug', 'photo', 'summary', 'user_id', 'created_at')
            ->with([
                'user' => function ($query) {
                    $query->select('id', 'full_name', 'photo');
                },
                'Tcomments' => function ($query) {
                    $query->where('parent_id', 0)
                          ->select('id', 'item_id', 'user_id', 'content', 'parent_id', 'created_at')
                          ->with(['user' => function ($q) {
                              $q->select('id', 'full_name', 'photo');
                          }])
                          ->take(3)
                          ->latest();
                },
                'Tmotion' => function ($query) {
                    $query->select('id', 'item_id', 'item_code', 'motions', 'user_motions');
                }
            ])
            ->latest()
            ->get();
        $myBlogs = Blog::where('user_id', auth()->user()->id ?? '')->get();
        return view('frontend.blog.index_blog', compact('blogs', 'myBlogs'));
    }

    public function loadComments(Request $request, $blogId)
    {
        $request->validate(['offset' => 'integer|min:0']);
        $offset = $request->input('offset', 0);
        $limit = 3;

        $comments = \App\Modules\TuongTac\Models\TComment::where('item_id', $blogId)
            ->where('item_code', 'blog')
            ->where('parent_id', 0)
            ->select('id', 'item_id', 'user_id', 'content', 'parent_id', 'created_at')
            ->with([
                'user' => function ($query) {
                    $query->select('id', 'full_name', 'photo');
                },
                'replies' => function ($query) {
                    $query->select('id', 'item_id', 'user_id', 'content', 'parent_id', 'created_at')
                          ->with(['user' => function ($q) {
                              $q->select('id', 'full_name', 'photo');
                          }]);
                }
            ])
            ->skip($offset)
            ->take($limit)
            ->latest()
            ->get();

        return response()->json([
            'comments' => $comments,
            'hasMore' => $comments->count() === $limit
        ]);
    }

    public function detail($id)
    {
       
    
        $blogs = Blog::where('slug', $id)->with('user','blogComent.user','blogComent.blogReply.user')->first();
        // dd($blogs);
        return view('frontend.blog.edit', compact('blogs'));
    }

    public function create()
    {
        $blogCategories = BlogCategory::where('status', 'active')->get();
        return view('frontend.blog.create', compact('blogCategories'));
    }

    public function store(Request $request)
    {   

        $image = null;
        if($request->hasFile('photo')){
            $image = asset('storage/'.$request->file('photo')->store('avatar','public'));
        }
       
        
        Blog::create([
            'title'=>$request->title,
            'photo'=>$image,
            'status'=>$request->status,
            'user_id'=>auth()->user()->id,
            'slug'=> Str::slug($request->title),
            'summary'=>$request->description,
            'content'=>$request->content,
            'cat_id'=>$request->category,
        ]);
        return redirect()->route('front.blog')->with('success', 'Bài viết đã được tạo thành công');
        
        // $blogCategory = BlogCategory::where('id', $request->category)->first();
        // if(!$blogCategory)
        // {
        //     return redirect()->back()->with('error', 'Danh mục không tồn tại');
        // }
        // dd($blogCategory);
    }

    public function update(Request $request)
    {
       
       $blog = Blog::where('id', $request->id)->first();
       $blog->update([
        'title'=>$request->title,
        'slug'=> Str::slug($request->title),
        
        'status'=>$request->status,
        'content'=>$request->content,
        'cat_id'=>$request->category,
       ]);
       $image = null;
       if($request->hasFile('photo')){
           $image = asset('storage/'.$request->file('photo')->store('avatar','public'));
           $blog->photo = $image;
           $blog->save();
       }
        
       return redirect()->route('front.blog')->with('success', 'Bài viết đã được cập nhật thành công');
    }

    public function share($slug)
    {
        $blog = Blog::where('slug', $slug)->first();

        Post::create([
            'description' => $blog->content,
            'music_links' =>  null,
            'image' => $blog->photo,
            'user_id' => auth()->user()->id,
            'like' => 0,
            'dislike' => 0,
            'comment' => 0,
            'share' => 0,
            'status' => 1,
            'created_at' => now(),
            'updated_at' => now(),
            'url_share' => asset('blogs/'.$blog->slug),
            'url_user_id' => $blog->user_id
          
        ]);
        return redirect()->back()->with('success', 'Bài viết đã được chia sẻ thành công');
    }
}
