@extends('frontend.layouts.master')
@section('content')
<section class="blog-section" id="blog-section" style="margin-bottom: 100px !important; padding:20px;">
    <h2>Blog</h2>
    <div class="blog-tabs" style="display:flex;gap:32px;margin-bottom:24px;margin-top:12px;">
        <span class="blog-tab active" data-tab="featured">Bài viết nổi bật</span>
        @if(auth()->check())
        <span class="blog-tab" data-tab="mine">Bài viết của tôi</span>
        @endif
    </div>
    <div class="blog-list blog-list-featured " style="display:flex;">
        @foreach($blogs as $b)
        <div class="blog-card">
            <img src="{{ asset($b->photo) }}" alt="Blog 1">
            <div class="blog-info">
                <h3 class="blog-title">{{ $b->title }}</h3>
                <p class="blog-desc">{{ \Illuminate\Support\Str::limit($b->summary, 25) }}</p>
                <div style="display:flex;gap:8px;margin-top:10px;">
                   
                    <a href="{{ route('front.blog.detail', $b->slug) }}" class="blog-btn">Xem chi tiết</a>
                    <a href="{{ route('front.blog.share', $b->slug) }}" class="blog-btn" style="background:#1976d2;">Chia sẻ</a>
                </div>
            </div>
        </div>
        @endforeach
    </div>
    <div class="blog-list blog-list-mine" style="display:none;">
        <div class="create-playlist-card" onclick="window.location.href='{{ route('front.blog.create') }}'">
            <div class="plus-icon">+</div>
            <div class="create-text">Tạo Blog mới mới</div>
        </div>
        @foreach($myBlogs as $b)
            <div class="blog-card">
                <img src="{{ asset($b->photo) }}" alt="Blog 1">
                <div class="blog-info">
                    <h3 class="blog-title">{{ $b->title }}</h3>
                    <p class="blog-desc">{{ \Illuminate\Support\Str::limit($b->summary, 25) }}</p>
                    <div style="display:flex;gap:8px;margin-top:10px;">
                        <a href="{{ route('front.blog.editblog', $b->id) }}" class="blog-btn" style="background:#4caf50;">sửa</a>
                        
                        <a href="{{ route('front.blog.detail', $b->slug) }}" class="blog-btn">Xem</a>
                        
                        <form action="{{ route('front.blog.destroy', $b->id) }}" method="POST" >
                            @csrf
                            
                            <button type="submit" class="blog-btn" style="background:#e53935;">Xóa</button>
                        </form>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</section>
<style>
.blog-tabs {
    display: flex;
    gap: 32px;
    margin-bottom: 24px;
    margin-top: 12px;
}
.blog-tab {
    color: #a084e8;
    font-weight: 600;
    font-size: 1.2em;
    cursor: pointer;
    padding-bottom: 4px;
    border-bottom: 2px solid transparent;
    transition: color 0.2s, border-color 0.2s;
}
.blog-tab.active {
    color: #a084e8;
    border-bottom: 2.5px solid #a084e8;
}
.blog-list-featured {
    display: ;
    flex-wrap: wrap;
    gap: 24px;
}
.blog-list-mine {
    display: flex;
    flex-wrap: wrap;
    gap: 24px;
}
.create-playlist-card {
    width: 260px;
    height: 340px;
    border: 2px dashed #555;
    border-radius: 20px;
    background: #181728;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    margin-bottom: 24px;
    margin-right: 24px;
    cursor: pointer;
    transition: border-color 0.2s, box-shadow 0.2s;
}
.create-playlist-card:hover {
    border-color: #a084e8;
    box-shadow: 0 0 0 2px #a084e833;
}
.plus-icon {
    font-size: 3rem;
    color: #a084e8;
    margin-bottom: 18px;
    font-weight: bold;
    line-height: 1;
}
.create-text {
    color: #fff;
    font-size: 1.4rem;
    font-weight: 400;
    text-align: center;
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.blog-tab').forEach(tab => {
        tab.addEventListener('click', function() {
            document.querySelectorAll('.blog-tab').forEach(t => t.classList.remove('active'));
            this.classList.add('active');
            if (this.dataset.tab === 'featured') {
                document.querySelector('.blog-list-featured').style.display = 'flex ';
                document.querySelector('.blog-list-mine').style.display = 'none ';
            } else {
                document.querySelector('.blog-list-featured').style.display = 'none ';
                document.querySelector('.blog-list-mine').style.display = 'flex ';
            }
        });
    });
});


</script>
@endsection
