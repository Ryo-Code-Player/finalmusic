    @extends('frontend.layouts.master')
    @section('content')

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <div class="blog-detail-container">
        <div class="blog-detail-card">
            <div class="blog-detail-header">
                <img class="blog-detail-cover" src="{{ $blogs->photo ? (is_array(json_decode($blogs->photo, true)) 
                ? asset(json_decode($blogs->photo, true)[0]) : asset($blogs->photo)) : '/frontend/images/default.jpg' }}" alt="{{ $blogs->title }}">
                <div class="blog-detail-author">
                    <img class="author-avatar" src="{{ $blogs->user->photo ? asset('storage/' . $blogs->user->photo) : 'https://i.pinimg.com/736x/bc/43/98/bc439871417621836a0eeea768d60944.jpg' }}" alt="Tác giả">
                    <div>
                        <div class="author-name" style="color:#555">{{ $blogs->user->full_name ?? 'Ẩn danh' }}</div>
                        <div class="blog-date">{{ \Carbon\Carbon::parse($blogs->created_at)->diffForHumans() }}</div>
                    </div>
                </div>
            </div>
            <div class="blog-detail-content">
                <h1 class="blog-title" style="color:black">{{ $blogs->title }}</h1>
        
                    <div class="blog-tags">
                        @php
                            use App\Models\Tag;
                            if($blogs->tags){
                                $tags = Tag::whereIn('id', json_decode($blogs->tags, true))->get();
                            }else{
                                $tags = [];
                            }

                        @endphp
                        @foreach($tags as $tag)
                            <a href="#" class="blog-tag" style="color:black">#{{ $tag->title }}</a>
                        @endforeach
                    </div>
            
                <div class="blog-body">
                    {!! $blogs->summary !!}
                </div>
                <div class="blog-body">
                    {!! $blogs->content !!}
                </div>
                <!-- BẮT ĐẦU: Giao diện bình luận và like giống ảnh -->
                <div class="blog-actions" style="display:flex; align-items:center; gap:8px; margin-bottom:18px;">
                    <button id="like-blog-btn" style="background:none; border:none; 
                    color:#e53935; font-size:1.3em; cursor:pointer; display:flex; align-items:center; gap:4px; padding:0;">
                        <i class="fa fa-heart{{ in_array(auth()->user()->id, json_decode($blogs->user_love ?? '[]')) ? '' : '-o' }}"></i>
                    </button>
                    <span id="blog-like-count" style="font-size:1.1em; color:#888;">{{ $blogs->love ?? 0 }}</span>

                    <div class="share-section" style="margin-left:20px;">
                        <a href="{{ route('front.blog.share', ['slug' => $blogs->slug]) }}" class="share-btn" style="text-decoration: none;color: #000;">
                            <i class="fas fa-share"></i>
                            <span>Share</span>
                        </a>
                    </div>
                </div>
                <div class="blog-comments" style="padding:0 0 0 0; margin-top:18px;">
                    <h3 style="margin-bottom:16px; font-size:1.25em; font-weight:bold;">
                        Bình luận ({{ count($blogs->comments ?? []) }})
                    </h3>
                    <!-- Form bình luận -->
                    <div style="margin-bottom:18px;">
                        <div class="comment-form">
                            <img src="{{auth()->user()->photo ? asset('storage/' . auth()->user()->photo) : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg' }}" alt="User Avatar" class="user-avatar">
                            <div class="comment-input-wrapper">
                                <input type="text" id="comment-input" placeholder="Bình luận vào bài viết ..." class="comment-input">
                                <button id="send-comment-btn" class="send-comment-btn">
                                    <i class="fas fa-paper-plane"></i>
                                    Gửi
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- Danh sách bình luận -->
                    <div class="comments-list"> 
                        @foreach ($blogs->blogComent ?? [] as $comment)
                            <div class="comment-item">
                                <img src="{{  $comment->user->photo ? asset('storage/' . $comment->user->photo) : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg' }}" alt="User Avatar" class="user-avatar">
                                <div class="comment-content">
                                    <div class="comment-header">
                                        <span class="user-name">{{$comment->user->full_name}}</span>
                                        <span class="comment-time">{{$comment->created_at->diffForHumans()}}</span>
                                    </div>
                                    <p class="comment-text">{{$comment->content}}</p>
                                    <div class="comment-actions">
                                        <button class="comment-like-btn 
                                        @if(in_array(auth()->user()->id, json_decode($comment->user_like ?? '[]'))) 
                                            liked @endif"
                                             data-comment-id="{{ $comment->id }}">
                                            <i class="fas fa-thumbs-up"></i>
                                            <span>{{ $comment->like ?? 0 }} Like</span>
                                        </button>
                                        <button class="reply-btn" data-comment-id="{{ $comment->id }}">Trả lời</button>
                                        @if(auth()->user()->id == $comment->user_id || auth()->user()->role == 'admin')
                                        <button class="edit-comment-btn" data-comment-id="{{ $comment->id }}" data-comment-content="{{ $comment->content }}">
                                            <i class="fas fa-edit"></i> Sửa
                                        </button>
                                        <button class="delete-comment-btn" data-comment-id="{{ $comment->id }}">
                                            <i class="fas fa-trash"></i> Xóa
                                        </button>
                                        @endif
                                    </div>
                                    <!-- Replies Section -->
                                    <div class="replies-section" id="replies-{{ $comment->id }}">
                                        @foreach($comment->blogReply ?? [] as $reply)
                                        <div class="reply-item">
                                            <img src="{{ asset($reply->user->photo ?'storage/'.$reply->user->photo : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg') }}" alt="User Avatar" class="user-avatar">
                                            <div class="reply-content">
                                                <div class="reply-header">
                                                    <span class="user-name">{{$reply->user->full_name}}</span>
                                                    <span class="reply-time">{{$reply->created_at->diffForHumans()}}</span>
                                                </div>
                                                <p class="reply-text">{{$reply->content}}</p>
                                                <div class="reply-actions">
                                                    @if(auth()->user()->id == $reply->user_id || auth()->user()->role == 'admin')
                                                    <button class="edit-reply-btn" data-reply-id="{{ $reply->id }}" data-reply-content="{{ $reply->content }}">
                                                        <i class="fas fa-edit"></i> Sửa
                                                    </button>
                                                    <button class="delete-reply-btn" data-reply-id="{{ $reply->id }}">
                                                        <i class="fas fa-trash"></i> Xóa
                                                    </button>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="reply-form" id="reply-form-{{ $comment->id }}" style="display: none; margin-left: 50px; margin-top: 10px;">
                                <div class="comment-form">
                                    <img src="{{ auth()->user()->photo ? asset('storage/' . auth()->user()->photo) : 'https://i.pinimg.com/736x/bc/43/98/bc439871417621836a0eeea768d60944.jpg' }}" alt="User Avatar" class="user-avatar">
                                    <div class="comment-input-wrapper">
                                        <input type="text" placeholder="Trả lời bình luận..." class="reply-input" data-comment-id="{{ $comment->id }}">
                                        <button class="send-reply-btn" data-comment-id="{{ $comment->id }}">
                                            <i class="fas fa-paper-plane"></i>
                                            Gửi
                                        </button>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
                <!-- KẾT THÚC: Giao diện bình luận và like giống ảnh -->
            </div>
        </div>
    </div>

    <!-- Modal chỉnh sửa bình luận thuần -->
    <div id="customEditModal" class="custom-modal">
        <div class="custom-modal-content">
            <span class="custom-modal-close" id="closeEditModal">&times;</span>
            <h3 style="color:black;">Chỉnh sửa bình luận</h3>
            <textarea id="customEditCommentContent" rows="4" style="width:100%;margin-bottom:12px;"></textarea>
            <div style="text-align:right;">
                <button id="cancelEditComment" style="margin-right:8px; background: #e53935; color: white; b
                order: none; border-radius: 4px; cursor: pointer; padding: 8px 15px;
                 font-size: 0.9rem; transition: background-color 0.2s; border: none;">Hủy</button>
                <button id="saveCustomEditComment" style="background: #1a73e8; color: white; b
                order: none; border-radius: 4px; cursor: pointer; padding: 8px 15px;
                 font-size: 0.9rem; transition: background-color 0.2s; border: none;">Lưu thay đổi</button>
            </div>
        </div>
    </div>

    <style>
    .blog-detail-container {
        display: flex;
        justify-content: center;
        padding: 32px 8px;
    
    }
    .blog-detail-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 4px 32px #0001;
        max-width: 90%;
        width: 100%;
        overflow: hidden;
        padding-bottom: 32px;
    }
    .blog-detail-header {
        position: relative;
    }
    .blog-detail-cover {
        width: 100%;
        height: 320px;
        object-fit: cover;
        border-bottom: 1px solid #eee;
    }
    .blog-detail-author {
        display: flex;
        align-items: center;
        gap: 14px;
        position: absolute;
        left: 24px;
        bottom: -32px;
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 2px 8px #0002;
        padding: 10px 18px;
    }
    .author-avatar {
        width: 48px;
        height: 48px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #eee;
    }
    .author-name {
        font-weight: bold;
        font-size: 1.1em;
    }
    .blog-date {
        color: #888;
        font-size: 0.95em;
    }
    .blog-detail-content {
        padding: 48px 32px 0 32px;
    }
    .blog-title {
        font-size: 2.1em;
        font-weight: bold;
        margin-bottom: 12px;
    }
    .blog-tags {
        margin-bottom: 18px;
    }
    .blog-tag {
        display: inline-block;
        background: #e3f2fd;
        color: #1976d2;
        border-radius: 6px;
        padding: 4px 12px;
        margin-right: 6px;
        font-size: 0.98em;
        text-decoration: none;
        transition: background 0.2s;
    }
    .blog-tag:hover {
        background: #bbdefb;
    }
    .blog-body {
        font-size: 1.15em;
        line-height: 1.7;
        color: #222;
        margin-bottom: 32px;
    }
    .blog-detail-footer {
        padding: 0 32px;
        margin-top: 32px;
    }
    .blog-related-title {
        font-weight: bold;
        margin-bottom: 12px;
        font-size: 1.1em;
    }
    .blog-related-list {
        display: flex;
        gap: 18px;
        overflow-x: auto;
    }
    .blog-related-item {
        display: flex;
        flex-direction: column;
        min-width: 180px;
        background: #f8fafc;
        border-radius: 10px;
        box-shadow: 0 2px 8px #0001;
        text-decoration: none;
        color: #222;
        transition: box-shadow 0.2s;
    }
    .blog-related-item:hover {
        box-shadow: 0 4px 16px #0002;
    }
    .blog-related-item img {
        width: 100%;
        height: 100px;
        object-fit: cover;
        border-radius: 10px 10px 0 0;
    }
    .blog-related-info {
        padding: 10px;
    }
    .blog-related-title {
        font-size: 1em;
        font-weight: bold;
        margin-bottom: 4px;
    }
    .blog-related-date {
        color: #888;
        font-size: 0.95em;
    }
    .blog-comments {
        padding: 0 32px;
        margin-top: 32px;
    }
    @media (max-width: 600px) {
        .blog-detail-card { padding-bottom: 0; }
        .blog-detail-content, .blog-detail-footer, .blog-comments { padding: 18px 8px 0 8px; }
        .blog-detail-cover { height: 180px; }
        .blog-detail-author { left: 8px; bottom: -24px; padding: 6px 10px; }
    }
    .comment-form {
        display: flex;
        gap: 10px;
        margin-bottom: 20px;
    }

    .comment-input-wrapper {
        flex: 1;
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .user-avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        object-fit: cover;
    }

    .comment-input {
        flex: 1;
        padding: 10px;
        border: none;
        border-bottom: 1px solid #ddd;
        outline: none;
        font-size: 0.9rem;
    }

    .send-comment-btn {
        padding: 8px 15px;
        background-color: #1a73e8;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 5px;
        font-size: 0.9rem;
        transition: background-color 0.2s;
    }

    .send-comment-btn:hover {
        background-color: #1557b0;
    }

    .send-comment-btn i {
        font-size: 0.8rem;
    }

    .comments-list {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .comment-item {
        display: flex;
        gap: 10px;
    }

    .comment-content {
        flex: 1;
    }

    .comment-header {
        display: flex;
        gap: 10px;
        margin-bottom: 5px;
    }

    .user-name {
        font-weight: 600;
        color: #333;
    }

    .comment-time {
        color: #888;
        font-size: 0.8rem;
    }

    .comment-text {
        color: #333;
        line-height: 1.4;
        margin-bottom: 5px;
    }

    .comment-actions {
        display: flex;
        gap: 15px;
    }

    .edit-reply-btn{
        background: none;
        border: none;
        color: #666;
        cursor: pointer;
        font-size: 0.8rem;
        padding: 5px 0;
    }
    .delete-reply-btn{
        background: none;
        border: none;
        color: #666;
        cursor: pointer;
        font-size: 0.8rem;
        padding: 5px 0;
    }
    .comment-actions button {
        background: none;
        border: none;
        color: #666;
        cursor: pointer;
        font-size: 0.8rem;
        padding: 5px 0;
    }

    .comment-actions button:hover {
        color: #333;
    }

    .reply-form {
        border-left: 2px solid #eee;
        padding-left: 10px;
    }

    .reply-input {
        flex: 1;
        padding: 10px;
        border: none;
        border-bottom: 1px solid #ddd;
        outline: none;
        font-size: 0.9rem;
    }

    .send-reply-btn {
        padding: 8px 15px;
        background-color: #1a73e8;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        display: flex;
        align-items: center;
        gap: 5px;
        font-size: 0.9rem;
        transition: background-color 0.2s;
    }

    .send-reply-btn:hover {
        background-color: #1557b0;
    }

    .send-reply-btn i {
        font-size: 0.8rem;
    }

    .replies-section {
        margin-top: 15px;
        padding-left: 10px;
        border-left: 2px solid #eee;
    }

    .reply-item {
        display: flex;
        gap: 10px;
        margin-bottom: 15px;
    }

    .reply-content {
        flex: 1;
    }

    .reply-header {
        display: flex;
        gap: 10px;
        margin-bottom: 5px;
    }

    .reply-time {
        color: #888;
        font-size: 0.8rem;
    }

    .reply-text {
        color: #333;
        line-height: 1.4;
        margin-bottom: 5px;
    }

    .reply-actions {
        display: flex;
        gap: 15px;
    }

    .reply-like-btn {
        background: none;
        border: none;
        color: #666;
        cursor: pointer;
        font-size: 0.8rem;
        padding: 5px 0;
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .reply-like-btn:hover {
        color: #333;
    }

    .reply-like-btn.liked, .reply-like-btn.liked i {
        color: #e74c3c !important;
    }
    .liked{
        color: #e74c3c !important;
    }
    .delete-comment-btn {
        background: none;
        border: none;
        color: #dc3545;
        cursor: pointer;
        font-size: 0.8rem;
        padding: 5px 0;
        display: flex;
        align-items: center;
        gap: 5px;
        transition: color 0.2s;
    }
    .delete-comment-btn:hover {
        color: #c82333;
    }
    .edit-comment-btn {
        background: none;
        border: none;
        color: #28a745;
        cursor: pointer;
        font-size: 0.8rem;
        padding: 5px 0;
        display: flex;
        align-items: center;
        gap: 5px;
        transition: color 0.2s;
    }
    .edit-comment-btn:hover {
        color: #218838;
    }
    .modal-content {
        border-radius: 15px;
    }
    .modal-header {
        border-bottom: 1px solid #eee;
        padding: 15px 20px;
    }
    .modal-footer {
        border-top: 1px solid #eee;
        padding: 15px 20px;
    }
    .modal-title {
        font-weight: 600;
        color: #333;
    }
    #editCommentContent {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 10px;
        resize: none;
    }
    .btn-primary {
        background-color: #1a73e8;
        border-color: #1a73e8;
    }
    .btn-primary:hover {
        background-color: #1557b0;
        border-color: #1557b0;
    }
    .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
    }
    .btn-secondary:hover {
        background-color: #5a6268;
        border-color: #545b62;
    }
    .custom-modal {
        display: none; 
        position: fixed; 
        z-index: 9999; 
        left: 0; top: 0; width: 100%; height: 100%;
        overflow: auto; background: rgba(0,0,0,0.4);
    }
    .custom-modal-content {
        background: #fff; margin: 10% auto; padding: 20px; border-radius: 8px;
        width: 90%; max-width: 400px; position: relative;
        box-shadow: 0 4px 32px #0002;
    }
    .custom-modal-close {
        position: absolute; right: 12px; top: 8px; font-size: 1.5em; cursor: pointer; color: #888;
    }
    .custom-modal-close:hover { color: #e53935; }
    </style>
    @endsection

    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/notiflix@3.2.7/dist/notiflix-aio-3.2.7.min.js"></script>
    <script>
    // Đảm bảo jQuery đã load
    if (typeof jQuery != 'undefined') {
        console.log('jQuery is loaded');
    } else {
        console.log('jQuery is not loaded');
    }

    // Đợi document ready
    $(document).ready(function() {
        console.log('Document ready');
        
        // Kiểm tra xem button có tồn tại không
        if ($('#send-comment-btn').length) {
            console.log('Comment button found');
        } else {
            console.log('Comment button not found');
        }

        // Like functionality
        $('#like-blog-btn').on('click', function() {
            var btn = $(this);
            var blogId = {{ $blogs->id }};
            
            if (btn.find('i').hasClass('fa-heart')) {
              
                $.ajax({
                    url: '{{ route('front.blog.love') }}',
                    method: 'POST',
                    data: {
                        blog_id: blogId,
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        Notiflix.Notify.success('Đã unlike bài viết thành công!');
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    },
                    error: function() {
                        Notiflix.Notify.failure('Có lỗi xảy ra khi unlike!');
                    }
                });
            } else {
                // Like functionality
                $.ajax({
                    url: '{{ route('front.blog.love') }}',
                    method: 'POST',
                    data: {
                        blog_id: blogId,
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        Notiflix.Notify.success('Đã like bài viết thành công!');
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    },
                    error: function() {
                        Notiflix.Notify.failure('Có lỗi xảy ra khi like!');
                    }
                });
            }
        });

        // Comment functionality
        $(document).on('click', '#send-comment-btn', function(e) {
            e.preventDefault();
            console.log('Button clicked');
            
            var commentInput = $('#comment-input');
            var comment = commentInput.val().trim();
            var blogId = {{ $blogs->id }};

            console.log('Comment:', comment);
            console.log('Blog ID:', blogId);

            if (comment === '') {
                Notiflix.Notify.warning('Vui lòng nhập nội dung bình luận!');
                return;
            }

            $.ajax({
                url: '{{ route('front.blog.commentUser') }}',
                method: 'POST',
                data: {
                    blog_id: blogId,
                    content: comment,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    console.log('Success response:', response);
                    if(response.success) {
                        Notiflix.Notify.success('Bình luận đã được gửi thành công!');
                        commentInput.val(''); // Clear input
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    } else {
                        Notiflix.Notify.failure(response.message || 'Có lỗi xảy ra khi gửi bình luận!');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error details:', {
                        status: status,
                        error: error,
                        response: xhr.responseText
                    });
                    Notiflix.Notify.failure('Có lỗi xảy ra khi gửi bình luận!');
                }
            });
        });

        // Allow Enter key to submit comment
        $(document).on('keypress', '#comment-input', function(e) {
            if (e.which === 13) { // Enter key
                e.preventDefault();
                $('#send-comment-btn').click();
            }
        });

        // Comment like functionality
        $('.comment-like-btn').on('click', function() {
            var btn = $(this);
            var commentId = btn.data('comment-id');
            
            if (btn.hasClass('liked')) {
                // Unlike comment
                $.ajax({
                    url: '{{ route('front.blog.commentLike') }}',
                    method: 'POST',
                    data: {
                        comment_id: commentId,
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        Notiflix.Notify.success('Đã bỏ like bình luận!');
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    },
                    error: function() {
                        Notiflix.Notify.failure('Có lỗi xảy ra khi bỏ like bình luận!');
                    }
                });
            } else {
                // Like comment
                $.ajax({
                    url: '{{ route('front.blog.commentLike') }}',
                    method: 'POST',
                    data: {
                        comment_id: commentId,
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        Notiflix.Notify.success('Đã like bình luận!');
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    },
                    error: function() {
                        Notiflix.Notify.failure('Có lỗi xảy ra khi like bình luận!');
                    }
                });
            }
        });

        // Reply button functionality
        $('.reply-btn').on('click', function() {
            var commentId = $(this).data('comment-id');
            var replyForm = $('#reply-form-' + commentId);
            
            // Hide all other reply forms
            $('.reply-form').not(replyForm).hide();
            
            // Toggle current reply form
            replyForm.slideToggle();
        });

        // Send reply functionality
        $('.send-reply-btn').on('click', function() {
            var btn = $(this);
            var commentId = btn.data('comment-id');
            var replyInput = $('.reply-input[data-comment-id="' + commentId + '"]');
            var reply = replyInput.val().trim();
            var blogId = {{ $blogs->id }};

            if (reply === '') {
                Notiflix.Notify.warning('Vui lòng nhập nội dung trả lời!');
                return;
            }

            $.ajax({
                url: '{{ route('front.blog.commentReply') }}',
                method: 'POST',
                data: {
                    blog_id: blogId,
                    comment_id: commentId,
                    content: reply,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    Notiflix.Notify.success('Đã gửi trả lời thành công!');
                    replyInput.val(''); // Clear input
                    $('#reply-form-' + commentId).hide(); // Hide reply form
                    setTimeout(function() {
                        location.reload();
                    }, 1000);
                },
                error: function() {
                    Notiflix.Notify.failure('Có lỗi xảy ra khi gửi trả lời!');
                }
            });
        });

        // Allow Enter key to submit reply
        $('.reply-input').on('keypress', function(e) {
            if (e.which === 13) { // Enter key
                e.preventDefault();
                $(this).siblings('.send-reply-btn').click();
            }
        });

        // Delete comment functionality
        $(document).on('click', '.delete-comment-btn', function() {
            

            var btn = $(this);
            var commentId = btn.data('comment-id');
            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa bình luận này?',
                'Xóa',
                'Hủy',
                function() {
                    $.ajax({
                        url: '{{ route('front.blog.commentDelete') }}', // Đổi route cho đúng với controller của bạn
                        method: 'POST',
                        data: {
                            comment_id: commentId,
                            _token: '{{ csrf_token() }}'
                        },
                        success: function(response) {
                            if(response.success) {
                                Notiflix.Notify.success('Đã xóa bình luận thành công!');
                                btn.closest('.comment-item').fadeOut(300, function() {
                                    $(this).remove();
                                });
                            } else {
                                Notiflix.Notify.failure(response.message || 'Có lỗi xảy ra khi xóa bình luận!');
                            }
                        },
                        error: function() {
                            Notiflix.Notify.failure('Có lỗi xảy ra khi xóa bình luận!');
                        }
                    });
                }
            );
        });

        // Xử lý sửa bình luận chính
        let currentCommentId = null;
        let isEditingComment = false; // Flag để phân biệt đang sửa comment hay reply

        // Sửa lại cách bind event cho nút edit comment
        $(document).on('click', '.edit-comment-btn', function(e) {
            e.preventDefault();
            console.log('Edit comment button clicked');
            
            isEditingComment = true; // Đánh dấu đang sửa comment
            var btn = $(this);
            currentCommentId = btn.data('comment-id');
            var currentContent = btn.data('comment-content');
            
            console.log('Comment ID:', currentCommentId);
            console.log('Current content:', currentContent);
            
            $('#customEditCommentContent').val(currentContent);
            $('#customEditModal h3').text('Chỉnh sửa bình luận');
            $('#customEditModal').fadeIn(150);
        });

        // Xử lý sửa reply
        $(document).on('click', '.edit-reply-btn', function(e) {
            e.preventDefault();
            console.log('Edit reply button clicked');
            
            isEditingComment = false; // Đánh dấu đang sửa reply
            currentReplyId = $(this).data('reply-id');
            let content = $(this).data('reply-content');
            
            console.log('Reply ID:', currentReplyId);
            console.log('Current content:', content);
            
            $('#customEditCommentContent').val(content);
            $('#customEditModal h3').text('Chỉnh sửa trả lời');
            $('#customEditModal').fadeIn(150);
        });

        // Đóng modal
        $('#closeEditModal, #cancelEditComment').on('click', function() {
            $('#customEditModal').fadeOut(150);
            $('#customEditCommentContent').val('');
            currentCommentId = null;
            currentReplyId = null;
            isEditingComment = false;
        });

        // Lưu thay đổi
        $('#saveCustomEditComment').on('click', function() {
            console.log('Save button clicked');
            
            var newContent = $('#customEditCommentContent').val().trim();
            console.log('New content:', newContent);
            
            if (newContent === '') {
                Notiflix.Notify.warning('Nội dung không được để trống!');
                return;
            }

            if (isEditingComment) {
                // Xử lý sửa comment
                console.log('Saving comment edit');
                $.ajax({
                    url: '{{ route('front.blog.commentEdit') }}',
                    method: 'POST',
                    data: {
                        comment_id: currentCommentId,
                        content: newContent,
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        console.log('Comment edit response:', response);
                        if(response.success) {
                            Notiflix.Notify.success('Đã cập nhật bình luận thành công!');
                            // Cập nhật nội dung bình luận trên giao diện
                            $('.comment-item').each(function() {
                                var commentItem = $(this);
                                if (commentItem.find('.edit-comment-btn').data('comment-id') === currentCommentId) {
                                    commentItem.find('.comment-text').text(newContent);
                                    commentItem.find('.edit-comment-btn').data('comment-content', newContent);
                                }
                            });
                            $('#customEditModal').fadeOut(150);
                        } else {
                            Notiflix.Notify.failure(response.message || 'Có lỗi xảy ra khi cập nhật bình luận!');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Comment edit error:', error);
                        Notiflix.Notify.failure('Có lỗi xảy ra khi cập nhật bình luận!');
                    }
                });
            } else {
                // Xử lý sửa reply
                console.log('Saving reply edit');
                $.ajax({
                    url: '{{ route('front.blog.replyEdit') }}',
                    method: 'POST',
                    data: {
                        reply_id: currentReplyId,
                        content: newContent,
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        console.log('Reply edit response:', response);
                        if(response.success) {
                            Notiflix.Notify.success('Đã cập nhật trả lời thành công!');
                            $('.reply-item').each(function() {
                                let replyItem = $(this);
                                if (replyItem.find('.edit-reply-btn').data('reply-id') === currentReplyId) {
                                    replyItem.find('.reply-text').text(newContent);
                                    replyItem.find('.edit-reply-btn').data('reply-content', newContent);
                                }
                            });
                            $('#customEditModal').fadeOut(150);
                        } else {
                            Notiflix.Notify.failure(response.message || 'Có lỗi xảy ra khi cập nhật trả lời!');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Reply edit error:', error);
                        Notiflix.Notify.failure('Có lỗi xảy ra khi cập nhật trả lời!');
                    }
                });
            }
        });
    });
    </script>
