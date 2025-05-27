@extends('frontend.layouts.master')
@section('content')
<div class="player-container">
    <div class="main-content">
        <!-- Main Video Player -->
        <div class="video-section">
            <div class="video-wrapper">
                @php
                    $url = $song->resourcesSong[0]->url;
                    preg_match('/(?:v=|be\\/)([\\w-]+)/', $url, $matches);
                    $videoId = $matches[1] ?? '';
                    $embedUrl = $videoId ? "https://www.youtube.com/embed/$videoId" : '';
                @endphp
                <iframe 
                    width="100%" 
                    height="100%" 
                    src="{{ $embedUrl }}" 
                    {{-- src="https://www.youtube.com/watch?v=cqNIe8b2skM" --}}
                    title="YouTube video player" 
                    frameborder="0" 
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                    allowfullscreen>
                </iframe>
            </div>
            <div class="video-info">
                <h2 class="video-title">{{ $song->title }}</h2>
                <p class="video-description">{{ $song->summary }}</p>
                @if(auth()->check())
                <div class="interaction-bar">
                    <div class="like-section">
                        <button class="
                        @if($check)
                            liked
                      
                          
                        @endif
                          like-btn
                       " id="likeBtn" data-song-id="{{ $song->id }}">
                            <i class="fas fa-thumbs-up"></i>
                            <span> {{ $song->like ?? 0 }}  Like</span>
                        </button>
                        <button class="dislike-btn  @if($check_dislike)
                            disliked
                      
                          
                        @endif">
                            <i class="fas fa-thumbs-down"></i>
                            <span>{{ $song->dislike ?? 0 }} Dislike</span>
                        </button>
                    </div>
                    <div class="share-section">
                        <a 
                        href="{{ route('front.song.share', [
                            'id' => $song->id,
                            'url' => $song->resourcesSong[0]->url,
                            'ref' => request()->get('ref') // Lấy 'ref' từ request hiện tại,
                            
                        ]) }}"
                        class="share-btn" style="text-decoration: none;color: #000;">
                            <i class="fas fa-share"></i>
                            <span>Share</span>
                        </a>
                    </div>
                </div>
                @endif
                <!-- Comments Section -->
                <div class="comments-section">
                    <h3>Bình luận</h3>
                    @if(auth()->check())
                    <div class="comment-form">
                        <img src="{{ auth()->user()->photo ? asset('storage/' . auth()->user()->photo) : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg' }}" alt="User Avatar" class="user-avatar">
                        <div class="comment-input-wrapper">
                            <input type="text" placeholder="Bình luận vào bài hát ..." class="comment-input">
                            <button class="send-comment-btn">
                                <i class="fas fa-paper-plane"></i>
                                Gửi
                            </button>
                        </div>
                    </div>
                    @endif
                    <div class="comments-list">
                        @foreach ($song->songComent as $s)
                            <div class="comment-item">
                                <img src="{{$s->user->photo ? asset('storage/' . $s->user->photo) : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg' }}" alt="User Avatar" class="user-avatar">
                                <div class="comment-content">
                                    <div class="comment-header">
                                        <span class="user-name">{{$s->user->full_name}}</span>
                                        <span class="comment-time">{{$s->created_at->diffForHumans()}}</span>
                                    </div>
                                    <p class="comment-text">{{$s->content}}</p>
                                    @if(auth()->check())
                                    <div class="comment-actions">
                                        <button class="comment-like-btn 
                                        @if(auth()->check())
                                        @if(in_array(auth()->user()->id, json_decode($s->user_like ?? '[]'))) 
                                            liked @endif
                                        @endif
                                        "
                                             data-comment-id="{{ $s->id }}">
                                            <i class="fas fa-thumbs-up"></i>
                                            <span>{{ $s->like ?? 0 }} Like</span>
                                        </button>
                                        <button class="reply-btn" data-comment-id="{{ $s->id }}">Trả lời</button>
                                        @if(auth()->check())
                                        @if(auth()->user()->id == $s->user_id || auth()->user()->role == 'admin')
                                        <button class="edit-comment-btn" data-comment-id="{{ $s->id }}" data-comment-content="{{ $s->content }}">
                                            <i class="fas fa-edit"></i> Sửa
                                        </button>
                                        <button class="delete-comment-btn" data-comment-id="{{ $s->id }}">
                                            <i class="fas fa-trash"></i> Xóa
                                        </button>
                                        @endif
                                        @endif
                                    </div>
                                    @endif
                                    <!-- Replies Section -->
                                    <div class="replies-section" id="replies-{{ $s->id }}">
                                   
                                        @foreach($s->songReply as $reply)
                                        <div class="reply-item">
                                            <img src="{{$reply->user->photo ? asset('storage/' . $reply->user->photo) : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg' }}" alt="User Avatar" class="user-avatar">
                                            <div class="reply-content">
                                                <div class="reply-header">
                                                    <span class="user-name">{{$reply->user->full_name}}</span>
                                                    <span class="reply-time">{{$reply->created_at->diffForHumans()}}</span>
                                                </div>
                                                <p class="reply-text">{{$reply->content}}</p>
                                                @if(auth()->check())
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
                                                @endif
                                            </div>
                                        </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            @if(auth()->check())
                                <div class="reply-form" id="reply-form-{{ $s->id }}" style="display: none; margin-left: 50px; margin-top: 10px;">
                                    <div class="comment-form">
                                        <img src="{{auth()->user()->photo ? asset('storage/' . auth()->user()->photo) : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg' }}" alt="User Avatar" class="user-avatar">
                                        <div class="comment-input-wrapper">
                                            <input type="text" placeholder="Trả lời bình luận..." class="reply-input" data-comment-id="{{ $s->id }}">
                                            <button class="send-reply-btn" data-comment-id="{{ $s->id }}">
                                                <i class="fas fa-paper-plane"></i>
                                                Gửi
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            @endif
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

        <!-- Suggested Videos -->
        <div class="suggested-section">
            <h3 class="suggested-title">Bài hát liên quan</h3>
            <div class="suggested-list">
                @foreach ($getSong as $s)
                    @php
                        $url = $s->resourcesSong[0]->url;
                        preg_match('/(?:v=|be\\/)([\\w-]+)/', $url, $matches);
                        $videoId = $matches[1] ?? '';
                        $thumbnail = $videoId ? "https://img.youtube.com/vi/$videoId/hqdefault.jpg" : '';
                    @endphp
                    <a href="{{ route('front.zingplay_slug', $s->slug) }}" class="suggested-item" style="text-decoration: none;color: #000;">
                        <div class="thumbnail">
                            <img src="{{ $thumbnail }}" alt="Thumbnail">
                        </div>
                        <div class="video-details">
                            <h4>{{$s->title}}</h4>
                            <p class="channel-name">{{$s->user->full_name}}</p>
                            <p class="video-meta">Thời gian: {{$s->created_at->diffForHumans()}}</p>
                        </div>
                    </a>
                @endforeach
            </div>
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
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.player-container {
    width: 100%;
    max-width: 100%;
    margin: 0 auto;
    padding: 20px;
}

.main-content {
    display: flex;
    gap: 20px;
}

/* Video Section Styles */
.video-section {
    flex: 2;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    overflow: hidden;
}

.video-wrapper {
    position: relative;
    width: 100%;
    padding-top: 56.25%; /* 16:9 Aspect Ratio */
}

.video-wrapper iframe {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border: none;
}

.video-info {
    padding: 20px;
}

.video-title {
    font-size: 1.5rem;
    color: #333;
    margin-bottom: 10px;
}

.video-description {
    color: #666;
    line-height: 1.5;
    margin-bottom: 20px;
}

/* Interaction Bar Styles */
.interaction-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 0;
    border-bottom: 1px solid #eee;
    margin-bottom: 20px;
}

.like-section, .share-section {
    display: flex;
    gap: 10px;
    align-items: center;
}

.like-btn, .dislike-btn, .share-btn {
    background: none;
    border: none;
    padding: 8px 15px;
    border-radius: 20px;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 5px;
    font-size: 0.9rem;
    color: #666;
    display: flex;
    align-items: center;
    transition: background-color 0.2s;
}

.like-btn:hover, .dislike-btn:hover, .share-btn:hover {
    background-color: #f5f5f5;
}

.like-btn.liked, .like-btn.liked i {
    color: #e74c3c !important;
    background: #ffeaea;
}
.liked i{
    color: #e74c3c !important;
    /* background: #ffeaea; */

}
.dislike-btn.disliked, .dislike-btn.disliked i {
    color: #3498db !important;
    background: #eaf2f8;
}

/* Comments Section Styles */
.comments-section {
    margin-top: 20px;
}

.comments-section h3 {
    margin-bottom: 20px;
    color: #333;
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

/* Suggested Videos Section */
.suggested-section {
    flex: 1;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    padding: 20px;
}

.suggested-title {
    font-size: 1.2rem;
    color: #333;
    margin-bottom: 15px;
    padding-bottom: 10px;
    border-bottom: 1px solid #eee;
}

.suggested-list {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.suggested-item {
    display: flex;
    gap: 10px;
    cursor: pointer;
    padding: 10px;
    border-radius: 4px;
    transition: background-color 0.2s ease;
}

.suggested-item:hover {
    background-color: #f5f5f5;
}

.thumbnail {
    flex-shrink: 0;
    width: 120px;
    height: 68px;
}

.thumbnail img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 4px;
}

.video-details {
    flex: 1;
}

.video-details h4 {
    font-size: 0.9rem;
    color: #333;
    margin-bottom: 5px;
    line-height: 1.3;
}

.channel-name {
    font-size: 0.8rem;
    color: #666;
    margin-bottom: 3px;
}

.video-meta {
    font-size: 0.8rem;
    color: #888;
}

/* Responsive Design */
@media (max-width: 768px) {
    .main-content {
        flex-direction: column;
    }
    
    .video-section,
    .suggested-section {
        width: 100%;
    }
    
    .suggested-item {
        padding: 8px;
    }
    
    .thumbnail {
        width: 100px;
        height: 56px;
    }

    .interaction-bar {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }
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
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/notiflix@3.2.7/dist/notiflix-aio-3.2.7.min.js"></script>
<script>
$(document).ready(function() {
    // Like functionality
    $('#likeBtn').on('click', function() {
        var btn = $(this);
        var songId = btn.data('song-id');
        
        if (btn.hasClass('liked')) {
            // Unlike functionality
            $.ajax({
                url: '{{ route('front.song.like') }}',
                method: 'POST',
                data: {
                    song_id: songId,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    Notiflix.Notify.success('Đã unlike bài hát thành công!');
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
                url: '{{ route('front.song.like') }}',
                method: 'POST',
                data: {
                    song_id: songId,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    Notiflix.Notify.success('Đã like bài hát thành công!');
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

    // Dislike functionality
    $('.dislike-btn').on('click', function() {
        var btn = $(this);
        var songId = $('#likeBtn').data('song-id');
        
        if (btn.hasClass('disliked')) {
            // Undislike functionality
            $.ajax({
                url: '{{ route('front.song.dislike') }}',
                method: 'POST',
                data: {
                    song_id: songId,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    Notiflix.Notify.success('Đã bỏ dislike bài hát thành công!');
                    setTimeout(function() {
                        location.reload();
                    }, 1000);
                },
                error: function() {
                    Notiflix.Notify.failure('Có lỗi xảy ra khi bỏ dislike!');
                }
            });
        } else {
            // Dislike functionality
            $.ajax({
                url: '{{ route('front.song.dislike') }}',
                method: 'POST',
                data: {
                    song_id: songId,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    Notiflix.Notify.success('Đã dislike bài hát thành công!');
                    setTimeout(function() {
                        location.reload();
                    }, 1000);
                },
                error: function() {
                    Notiflix.Notify.failure('Có lỗi xảy ra khi dislike!');
                }
            });
        }
    });

    // Comment functionality
    $('.send-comment-btn').on('click', function() {
        var commentInput = $('.comment-input');
        var comment = commentInput.val().trim();
        var songId = $('#likeBtn').data('song-id');

        if (comment === '') {
            Notiflix.Notify.warning('Vui lòng nhập nội dung bình luận!');
            return;
        }

        $.ajax({
            url: '{{ route('front.song.comment') }}',
            method: 'POST',
            data: {
                song_id: songId,
                comment: comment,
                _token: '{{ csrf_token() }}'
            },
            success: function(response) {
                Notiflix.Notify.success('Bình luận đã được gửi thành công!');
                commentInput.val(''); // Clear input
                setTimeout(function() {
                    location.reload();
                }, 1000);
            },
            error: function() {
                Notiflix.Notify.failure('Có lỗi xảy ra khi gửi bình luận!');
            }
        });
    });

    // Comment like functionality
    $('.comment-like-btn').on('click', function() {
        var btn = $(this);
        var commentId = btn.data('comment-id');
        
        if (btn.hasClass('liked')) {
            // Unlike comment
            $.ajax({
                url: '{{ route('front.song.comment.like') }}',
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
                url: '{{ route('front.song.comment.like') }}',
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

    // Allow Enter key to submit comment
    $('.comment-input').on('keypress', function(e) {
        if (e.which === 13) { // Enter key
            e.preventDefault();
            $('.send-comment-btn').click();
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
        var songId = $('#likeBtn').data('song-id');

        if (reply === '') {
            Notiflix.Notify.warning('Vui lòng nhập nội dung trả lời!');
            return;
        }

        $.ajax({
            url: '{{ route('front.song.comment.reply') }}',
            method: 'POST',
            data: {
                song_id: songId,
                comment_id: commentId,
                reply: reply,
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

    // Reply like functionality
    
});

let currentReplyId = null;
let currentCommentId = null;

// Mở modal sửa reply
$(document).on('click', '.edit-reply-btn', function() {
    currentReplyId = $(this).data('reply-id');
    let content = $(this).data('reply-content');
    $('#customEditCommentContent').val(content);
    $('#customEditModal h3').text('Chỉnh sửa trả lời');
    $('#customEditModal').fadeIn(150);
    currentCommentId = null;
});

// Mở modal sửa comment (nếu có)
$(document).on('click', '.edit-comment-btn', function() {
    currentCommentId = $(this).data('comment-id');
    let content = $(this).data('comment-content');
    $('#customEditCommentContent').val(content);
    $('#customEditModal h3').text('Chỉnh sửa bình luận');
    $('#customEditModal').fadeIn(150);
    currentReplyId = null;
});

// Đóng modal
$('#closeEditModal, #cancelEditComment').on('click', function() {
    $('#customEditModal').fadeOut(150);
    $('#customEditCommentContent').val('');
    currentReplyId = null;
    currentCommentId = null;
});

// Lưu sửa reply hoặc comment
$('#saveCustomEditComment').off('click').on('click', function() {
    let newContent = $('#customEditCommentContent').val().trim();
    if (newContent === '') {
        Notiflix.Notify.warning('Nội dung không được để trống!');
        return;
    }
    if (currentReplyId) {
        // Sửa reply
        $.ajax({
            url: '{{ route('front.song.replyEdit') }}',
            method: 'POST',
            data: {
                reply_id: currentReplyId,
                content: newContent,
                _token: '{{ csrf_token() }}'
            },
            success: function(response) {
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
                    setTimeout(function() {
                        location.reload();
                    }, 1000);
                } else {
                    Notiflix.Notify.failure(response.message || 'Có lỗi xảy ra khi cập nhật trả lời!');
                }
            },
            error: function() {
                Notiflix.Notify.failure('Có lỗi xảy ra khi cập nhật trả lời!');
            }
        });
    } else if (currentCommentId) {
        // Sửa comment (nếu có)
        $.ajax({
            url: '{{ route('front.song.commentEdit') }}',
            method: 'POST',
            data: {
                comment_id: currentCommentId,
                content: newContent,
                _token: '{{ csrf_token() }}'
            },
            success: function(response) {
                if(response.success) {
                    Notiflix.Notify.success('Đã cập nhật bình luận thành công!');
                    $('.comment-item').each(function() {
                        let commentItem = $(this);
                        if (commentItem.find('.edit-comment-btn').data('comment-id') === currentCommentId) {
                            commentItem.find('.comment-text').text(newContent);
                            commentItem.find('.edit-comment-btn').data('comment-content', newContent);
                        }
                    });
                    $('#customEditModal').fadeOut(150);
                    setTimeout(function() {
                        location.reload();
                    }, 1000);
                } else {
                    Notiflix.Notify.failure(response.message || 'Có lỗi xảy ra khi cập nhật bình luận!');
                }
            },
            error: function() {
                Notiflix.Notify.failure('Có lỗi xảy ra khi cập nhật bình luận!');
            }
        });
    }
    currentReplyId = null;
    currentCommentId = null;
});

// Xóa reply
$(document).on('click', '.delete-reply-btn', function() {
    let replyId = $(this).data('reply-id');
    let btn = $(this);
    Notiflix.Confirm.show(
        'Xác nhận xóa',
        'Bạn có chắc chắn muốn xóa trả lời này?',
        'Xóa',
        'Hủy',
        function() {
            $.ajax({
                url: '{{ route('front.song.replyDelete') }}',
                method: 'POST',
                data: {
                    reply_id: replyId,
                    _token: '{{ csrf_token() }}'
                },
                success: function(response) {
                    if(response.success) {
                        Notiflix.Notify.success('Đã xóa trả lời thành công!');
                        btn.closest('.reply-item').fadeOut(300, function() {
                            $(this).remove();
                        });
                    } else {
                        Notiflix.Notify.failure(response.message || 'Có lỗi xảy ra khi xóa trả lời!');
                    }
                },
                error: function() {
                    Notiflix.Notify.failure('Có lỗi xảy ra khi xóa trả lời!');
                }
            });
        }
    );
});

// Xóa comment
$(document).on('click', '.delete-comment-btn', function() {
    let commentId = $(this).data('comment-id');
    let btn = $(this);
    Notiflix.Confirm.show(
        'Xác nhận xóa',
        'Bạn có chắc chắn muốn xóa bình luận này?',
        'Xóa',
        'Hủy',
        function() {
            $.ajax({
                url: '{{ route('front.song.commentDelete') }}',
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
</script>
@endsection




