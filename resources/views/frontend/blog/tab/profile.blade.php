@php
  use App\Models\Post;
  use App\Modules\Singer\Models\Singer;




@endphp
<div class="tab-content" id="tab-profile" @if($user->id == auth()->user()->id) style="display:block;" @else style="display:none;" @endif>
    <div class="profile-content">
      <div class="profile-sidebar">
        <h3>Thông tin cá nhân</h3>
        <p>{{ $user->description ?? 'Chưa cập nhật' }}</p>
        <ul>
          <li>🎓 {{ $user->role == 'customer' ? 'Tài khoản người dùng' : 'Quản trị viên' }}</li>
          <li>✉️ {{ $user->email }}</li>
    
          <li><i class="fa fa-phone"></i> {{ $user->phone ?? 'Chưa cập nhật' }}</li>
          <li>📍 {{ $user->taxaddress ?? 'Chưa cập nhật' }}</li>
        </ul>
        <h3>Hình ảnh liên quan</h3>
        <div class="photos">
          @foreach ($image_user as $image)
            <div class="photo-item" style="position:relative;display:inline-block;">
              <img src="{{ asset('storage/' . $image->image) }}" alt="Ảnh" class="modern-gallery-img">
            </div>
          @endforeach
        </div>
      </div>
      <div class="profile-main">
        <div class="status-box">
          <textarea placeholder="{{ $user->full_name }}, Bạn đang nghĩ gì?"></textarea>
          <div id="youtube-preview" style="display:none; margin-top:10px;"></div>
          <div class="status-actions">
            <button type="button" id="photo-btn">Tải hình ảnh</button>
            <input type="file" id="photo-input" accept="image/*" style="display:none;">
            
            <button class="post-btn" id="post-btn">Đăng bài</button>
          </div>
          <div id="photo-preview" style="display:none; margin-top:10px;"></div>
        </div>

        @foreach ($posts as $post)
        
          <div class="post">
            <a href="{{ route('front.blog.index', ['id' => $post->user->id]) }}" 
              class="post-header" 
              style="display: flex; align-items: center; justify-content: space-between; text-decoration:none;">
              <div style="display: flex; align-items: center; gap: 10px;">
                <img src="{{ $post->user->photo ? asset('storage/' . $post->user->photo) : 'https://i.pinimg.com/736x/bc/43/98/bc439871417621836a0eeea768d60944.jpg' }}" alt="Avatar" class="avatar-small">
                <div>
                  <strong>{{ $post->user->full_name }}</strong>
                
                  <a href="#" style="color:#888; font-size:0.9em; text-decoration:none;">{{ $post->created_at->diffForHumans() }}</a>
               
                  {{-- @if($post->post_form)
                      @php 
                            $post_check =   Post::with('user')->find($post->post_form);
                            
                      @endphp
                   <span
                   @if($post->url_share)
                   onclick="window.open('{{ $post->url_share }}', '_blank')">
                   @endif
                   
                    <br><br> (Bài viết chia sẽ từ: {{ $post->user->full_name }})
                  </span>
                  @else --}}
                        @if($post->url_share)
                        <br>
                        <a href="{{ $post->url_share }}" target="_blank" style="color:#888; font-size:0.9em; text-decoration:none;">
                        @php
                            $user_share = DB::table('users')->where('id', $post->url_user_id)->first();
                           
                        @endphp
                            (Bài viết chia sẽ từ: {{ $user_share->full_name }})
                        @endif
                        
                        </a>
                  {{-- @endif --}}
                  @if($post->post_singer)
                      @php 
                            $Sing =  Singer::find($post->post_singer)->alias;
                            
                      @endphp
                   <span> <br> (Bài viết chia sẽ từ ca sĩ: {{ $Sing }})
                  
                  </span>
                  @endif
                </div>
              </div>
              
            </a>
            <div class="post-content">
              <p >{!! preg_replace('~(https?://[^"]+)~', '<button onClick="playSong1(\'$1\')" 
              style="color:#1877f2;cursor:pointer; border:none; background:none;"
              >$1</button>', subject: Str::limit($post->description, 2000)) !!}</p>
             
              @if ($post->image)
                <div style="background:#f46c3b; width:100%; max-width:680px; height:380px; display:flex; align-items:center; justify-content:center; color:#222; font-size:2em; margin:15px auto; border-radius:8px;">
                  <img src="{{ $post->image }}" alt="Image" class="post-image" style="width:100%; height:100%; object-fit:cover; cursor:pointer;">
                </div>
              @endif
              @if(isset($post->link) && $post->link)
                    <div id="youtube-preview-{{ $post->id }}" style="display:flex; align-items:center; justify-content:center; margin-top: 10px;"></div>
                    <script>
                      document.addEventListener('DOMContentLoaded', function() {
                        var link = @json($post->link);
                        var previewId = 'youtube-preview-{{ $post->id }}';
                        if (link && (link.includes('youtube.com') || link.includes('youtu.be'))) {
                          fetch('https://www.youtube.com/oembed?url=' + encodeURIComponent(link) + '&format=json')
                            .then(res => res.json())
                            .then(data => {
                              document.getElementById(previewId).innerHTML = `
                                <div onClick="playSong1('${link}')" style="
                                background:#222;border-radius:10px;overflow:hidden;max-width:480px;box-shadow:0 2px 8px #0003;position:relative; cursor:pointer;">
                                  <img src="${data.thumbnail_url}" style="width:100%;display:block;max-height:240px;object-fit:cover;">
                                  <div style="padding:16px 18px 12px 18px;">
                                    <div style="color:#aaa;font-size:13px;letter-spacing:1px;margin-bottom:2px;">YOUTUBE.COM</div>
                                    <div style="font-weight:bold;font-size:1.15em;color:#fff;margin-bottom:6px;">${data.title}</div>
                                    <div style="color:#ccc;font-size:0.98em;line-height:1.4;">${data.author_name}</div>
                                  </div>
                                </div>
                              `;
                            })
                            .catch(() => {
                              document.getElementById(previewId).innerHTML = '<div style="color:#f00;">Không lấy được thông tin video!</div>';
                            });
                        }
                      });
                    </script>
              @endif
            </div>
            <div class="post-actions" style="display:flex; align-items:center; gap:20px; margin-top:10px;">
              <span class="like-btn" data-id="{{ $post->id }}" style="display:flex; align-items:center; gap:5px; cursor:pointer;">
                  
                @if ($post->postUser->contains('user_id', $user->id))
                  <i class="fa fa-thumbs-up" style="transition:color 0.2s; color:rgb(24, 119, 242);"></i>
                @else
                  <i class="fa fa-thumbs-up" style="transition:color 0.2s;"></i>
                @endif
                @if ($post->like)
                  <b>{{ $post->like }}</b>
                @else
                  <b>0</b>
                @endif
              </span>
        
              <span class="comment-btn" data-id="{{ $post->id }}" style="display:flex; align-items:center; gap:5px; cursor:pointer;">💬 <b>{{ $post->comment }}</b></span>
              <span class="share-btn" style="display:flex; align-items:center; gap:5px; cursor:pointer;" data-id="{{ $post->id }}" >↗️ <b>{{ $post->share }}</b></span>
            </div>
            <div class="comments" style="margin-top:15px;">
              
              @if ($post->commentUser->count() > 0)
                @foreach ($post->commentUser->take(2) as $comment)
               
                  <div class="comment" style="display:flex; gap:10px; margin-bottom:10px;">
                    <img src="{{ $comment->user->photo ? asset('storage/' . $comment->user->photo) : 'https://i.pinimg.com/736x/bc/43/98/bc439871417621836a0eeea768d60944.jpg' }}" alt="" class="avatar-small">
                    <div>
                      <b>{{ optional($comment->user)->full_name }}</b> <span style="color:#888; font-size:0.9em;">{{ $comment->created_at->diffForHumans() }}</span>
                      <div style="padding: 10px;">{{ $comment->content }}</div>
                      <div style="margin-top:4px;display:flex;gap:12px;align-items:center;">
                        <button class="comment-like-btn" data-id="{{ $comment->id }}" data-liked="{{ $comment->like }}" data-count="{{ $comment->like }}" style="background:none;border:none;color:#888;cursor:pointer;font-size:1em;display:flex;align-items:center;gap:4px;">
                          @if ($comment->commentChildrenUser->contains('user_id', $user->id))
                            <i class="fa fa-thumbs-up" style="transition:color 0.2s; color:rgb(24, 119, 242);"></i>
                          @else
                            <i class="fa fa-thumbs-up" style="transition:color 0.2s;"></i>
                          @endif
                          <span class="like-count">
                            {{ $comment->like }}
                          </span> Lượt thích</button>
                        <button class="comment-reply-btn" data-id="{{ $comment->id }}" style="background:none;border:none;color:#888;cursor:pointer;font-size:1em;display:flex;align-items:center;gap:4px;"> {{ $comment->reply }} Lượt Trả lời</button>
                        @if($comment->user_id == $user->id)
                          <button class="comment-edit-btn" data-id="{{ $comment->id }}" data-content="{{ $comment->content }}" style="background:none;border:none;color:#888;cursor:pointer;font-size:1em;display:flex;align-items:center;gap:4px;"><i class="fa fa-edit"></i> Chỉnh sửa</button>
                          <button class="comment-delete-btn" data-id="{{ $comment->id }}" style="background:none;border:none;color:#888;cursor:pointer;font-size:1em;display:flex;align-items:center;gap:4px;"><i class="fa fa-trash"></i> Xóa</button>
                        @endif
                      </div>
                    </div>
                  </div>
                  <!-- Khung trả lời chỉ cho comment này -->
                  <div class="reply-input-box" id="reply-input-{{ $comment->id }}" style="display:none; margin-top:10px; margin-left:50px;">
                    <b style="margin:5px 0px;">{{ optional($comment->user)->full_name }}</b>
                    <textarea rows="2" style="width:95%;border-radius:8px;padding:8px 12px;border:1px solid #ddd;resize:none; margin-left:10px;" placeholder="Nhập trả lời..."></textarea>
                    <button class="send-reply-btn" data-id="{{ $comment->id }}" style="margin-top:6px;background:#1877f2;color:#fff;border:none;padding:7px 18px;border-radius:8px;cursor:pointer;float:right; margin-right:10px;">Gửi</button>
                  </div>
          
                  @if($comment->replyComment && $comment->replyComment->count())
                    @foreach($comment->replyComment->take(2) as $reply)
                      <div class="comment reply-comment" style="display:flex; gap:10px; margin-bottom:10px; margin-left:50px;">
                        <img src="{{  asset('storage/' . optional($reply->user)->photo) }}" alt="" class="avatar-small">
                        <div>
                          <b>{{ optional($reply->user)->full_name }}</b> <span style="color:#888; font-size:0.9em;">{{ $reply->created_at->diffForHumans() }}</span>
                          <div style="padding: 10px;">{{ $reply->content }}</div>
                          <div style="display:flex; gap:10px; margin-top:4px;">
                            @if($reply->user_id == $user->id)
                              <button class="reply-edit-btn" data-id="{{ $reply->id }}" data-content="{{ $reply->content }}" style="background:none;border:none;color:#888;cursor:pointer;font-size:1em;display:flex;align-items:center;gap:4px;transition:color 0.3s;"><i class="fa fa-edit"></i> Chỉnh sửa</button>
                            @endif
                            @if($reply->user_id == $user->id  || $post->user_id == $user->id)
                              <button class="reply-delete-btn" data-id="{{ $reply->id }}" style="background:none;border:none;color:#888;cursor:pointer;font-size:1em;display:flex;align-items:center;gap:4px;transition:color 0.3s;"><i class="fa fa-trash"></i> Xóa</button>
                            @endif
                          </div>
                        </div>
                      </div>
                    @endforeach
                  @endif
                @endforeach
              @endif
              <div class="comment-input-box" id="comment-input-{{ $post->id }}" style="display:none; margin-top:10px; margin-bottom:30px;">
                <textarea rows="2" style="width:97%;border-radius:8px;padding:8px 12px;border:1px solid #ddd;resize:none;" placeholder="Nhập bình luận..."></textarea>
                <button class="send-comment-btn" data-id="{{ $post->id }}" style="margin-top:6px;
                background:#1877f2;color:#fff;border:none;padding:7px 18px;
                border-radius:8px;cursor:pointer;float:right; margin-right:10px;">Gửi</button>
              </div>
            
            </div>
            <button class="show-more-comments">Xem thêm bình luận</button>
          </div>
        @endforeach
      </div>
    </div>
  </div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.share-btn').forEach(function(btn) {
        btn.addEventListener('click', function() {
            var postId = this.getAttribute('data-id');
            fetch('{{ route('front.share.post') }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ id: postId })
            })
            .then(response => response.json())
            .then(data => {
                if(data.success) {
                    this.querySelector('b').textContent = data.share_count;
                    Notiflix.Notify.success('Chia sẻ thành công!');
                    setTimeout(() => {
                        window.location.reload();
                    }, 1000);
                } else {
                    Notiflix.Notify.failure('Có lỗi xảy ra!');
                }
            })
            .catch(error => {
                Notiflix.Notify.failure('Lỗi kết nối!');
            });
        });
    });
    // Xử lý nút "Xem thêm bình luận"
    document.querySelectorAll('.show-more-comments').forEach(function(btn) {
        btn.addEventListener('click', function() {
            var postId = this.closest('.post').querySelector('.comment-btn').getAttribute('data-id');
            
            fetch('{{ route('front.get.comments') }}?post_id=' + postId)
                .then(res => res.json())
                .then(data => {
                    let html = '';
                    data.posts.comment_user.forEach(function(comment) {
                      console.log(comment);
                      
                        html += `
                        <div style=\"display:flex; gap:10px; margin-bottom:18px;\">
                            <img src=\"${comment.user.photo ? '/storage/' + comment.user.photo : 'https://i.pinimg.com/736x/bc/43/98/bc439871417621836a0eeea768d60944.jpg'}\" alt=\"\" style=\"width:40px;height:40px;border-radius:50%;object-fit:cover;\">
                            <div>
                                <b style="color:black; margin-right:10px;">${comment.user.full_name}</b> <span style="color:#888; ">${comment.time}</span>
                                <div style=\"color:black; margin:4px 0 6px 0;\">${comment.content}</div>
                                <div style=\"display:flex; gap:18px; align-items:center; font-size:0.98em; color:#1877f2; margin-bottom:4px;\">
                                    <button class=\"popup-comment-like-btn\" data-id=\"${comment.id}\" style=\"background:none;border:none;color:#1877f2;cursor:pointer;\">
                                        <i class=\"fa fa-thumbs-up\"></i> <span class=\"like-count\">${comment.like}</span> Lượt thích
                                    </button>
                                    <button class=\"popup-comment-reply-btn\" data-id=\"${comment.id}\" style=\"background:none;border:none;color:#1877f2;cursor:pointer;\">
                                        ${comment.reply_comment.length} Lượt Trả lời
                                    </button>
                                    ${comment.user_id ===  "{{ $user->id }}" || data.posts.user_id === {{ $user->id }} ? 
                                        `<button class=\"popup-comment-delete-btn\" data-id=\"${comment.id}\" style=\"background:none;border:none;color:#1877f2;cursor:pointer;\">
                                            <i class=\"fa fa-trash\"></i> Xóa
                                        </button>` : ''}
                                    ${comment.user_id ===  "{{ $user->id }}" ? 
                                        `<button class=\"popup-comment-edit-btn\" data-id=\"${comment.id}\" data-content=\"${comment.content}\" style=\"background:none;border:none;color:#1877f2;cursor:pointer;\">
                                            <i class=\"fa fa-edit\"></i> Chỉnh sửa
                                        </button>` : ''}
                                </div>
                                <div class=\"popup-reply-list\" >
                                    ${comment.reply_comment.map(reply => `
                                        <div style="display:flex; gap:10px; margin-bottom:10px; color:black; padding:5px 0px;">
                                            <img src="${reply.user.photo || reply.user.photo == null ? '/storage/' + reply.user.photo : 'https://i.pinimg.com/736x/bc/43/98/bc439871417621836a0eeea768d60944.jpg'}\" alt="" style="width:34px;height:34px;border-radius:50%;object-fit:cover;">
                                            <div>
                                                <b style="color:black; margin-right:10px;">${reply.user.full_name}</b> <span style="color:#888;">${reply.time}</span>
                                                <div style="color:black; margin:4px 0 0 0;">${reply.content}</div>
                                                <div style="display:flex; gap:10px; margin-top:4px;">
                                                    ${reply.user_id === {{ $user->id }} ? 
                                                    `<button class="reply-edit-btn" data-id="${reply.id}" data-content="${reply.content}" style="background:none;border:none;color:#888;cursor:pointer;font-size:1em;display:flex;align-items:center;gap:4px;transition:color 0.3s;"><i class="fa fa-edit"></i> Chỉnh sửa</button>` : ''}
                                                    ${reply.user_id === {{ $user->id }} || data.posts.user_id === {{ $user->id }} ? 
                                                    `<button class="reply-delete-btn" data-id="${reply.id}" style="background:none;border:none;color:#888;cursor:pointer;font-size:1em;display:flex;align-items:center;gap:4px;transition:color 0.3s;"><i class="fa fa-trash"></i> Xóa</button>` : ''}
                                                </div>
                                            </div>
                                        </div>
                                    `).join('')}
                                </div>
                                <div class=\"popup-reply-input-box\" id=\"popup-reply-input-${comment.id}\" style=\"display:none; margin-top:10px;\">
                                    <textarea rows=\"2\" style=\"width:90%;border-radius:8px;padding:8px 12px;border:1px solid #ddd;resize:none;\" placeholder=\"Nhập trả lời...\"></textarea>
                                    <button class=\"popup-send-reply-btn\" data-id=\"${comment.id}\" style=\"margin-top:6px;background:#1877f2;color:#fff;border:none;padding:7px 18px;border-radius:8px;cursor:pointer;\">Gửi</button>
                                </div>
                            </div>
                        </div>
                        `;
                    });
                    html += `<div style=\"text-align:center; margin-top:18px; display:flex; gap:12px; align-items:center;\">
                        <textarea id=\"modal-comment-input\" data-id=\"${postId}\" style=\"width:90%;border-radius:8px;padding:8px 12px;border:1px solid #ddd;resize:none;\" placeholder=\"Nhập bình luận...\"></textarea>
                        <button id=\"modal-send-comment\" style=\"margin-top:6px;background:#1877f2;color:#fff;border:none;padding:7px 18px;border-radius:8px;cursor:pointer;\">Gửi</button>
                    </div>`;
                    document.getElementById('modal-comments-content').innerHTML = html;
                    document.getElementById('comment-modal').style.display = 'flex';

                    // Like comment
                    document.querySelectorAll('.popup-comment-like-btn').forEach(function(btn) {
                        btn.onclick = function() {
                            var commentId = this.getAttribute('data-id');
                            fetch('{{ route('front.blog.likeComment') }}', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                                },
                                body: JSON.stringify({ id: commentId })
                            })
                            .then(res => res.json())
                            .then(data => {
                                if(data.success) {
                                    
                                    // this.querySelector('.like-count').textContent = data.like_count;
                                    Notiflix.Notify.success('Bình luận đã được like');
                                    setTimeout(() => {
                                        window.location.reload();
                                    }, 1000);
                                }else{
                                    Notiflix.Notify.failure('Bình luận đã hủy like');
                                    setTimeout(() => {
                                        window.location.reload();
                                    }, 1000);
                                }
                            });
                        };
                    });
                    // Hiện khung trả lời
                    document.querySelectorAll('.popup-comment-reply-btn').forEach(function(btn) {
                        btn.onclick = function() {
                            var commentId = this.getAttribute('data-id');
                            var box = document.getElementById('popup-reply-input-' + commentId);
                            if (box) box.style.display = 'block';
                        };
                    });
                    // Gửi trả lời
                    document.querySelectorAll('.popup-send-reply-btn').forEach(function(btn) {
                        btn.onclick = function() {
                            var commentId = this.getAttribute('data-id');
                            var textarea = this.previousElementSibling;
                            var content = textarea.value;
                            fetch('{{ route('front.blog.replyComment') }}', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                                },
                                body: JSON.stringify({ comment_id: commentId, content: content })
                            })
                            .then(res => res.json())
                            .then(data => {
                                if(data.success) {
                                  
                                    Notiflix.Notify.success('Trả lời đã được gửi');
                                    setTimeout(() => {
                                        window.location.reload();
                                    }, 1000);
                                }
                            });
                        };
                    });
                    // Like reply
                    document.querySelectorAll('.popup-reply-like-btn').forEach(function(btn) {
                        btn.onclick = function() {
                            var replyId = this.getAttribute('data-id');
                            fetch('/api/like-reply', {
                                method: 'POST',
                                headers: {
                                    'Content-Type': 'application/json',
                                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                                },
                                body: JSON.stringify({ id: replyId })
                            })
                            .then(res => res.json())
                            .then(data => {
                                if(data.success) {
                                    this.querySelector('.like-count').textContent = data.like_count;
                                }
                            });
                        };
                    });
                    console.log(data.posts);

                    let postImgHtml = '';
                    if(data.posts.image) {
                        postImgHtml = `<img src="${data.posts.image}" alt="Post Image" style="max-width:100%; max-height:500px; border-radius:10px; box-shadow:0 2px 12px #0002;">`;
                    } else {
                        postImgHtml = `<div style='width:100%;height:300px;display:flex;align-items:center;justify-content:center;color:#888;background:#f4f4f4;border-radius:10px;'>Không có ảnh</div>`;
                    }
                    document.getElementById('modal-post-image').innerHTML = postImgHtml;
                    document.getElementById('modal-post-content').innerHTML = data.posts.description;
                });
        });
    });
    // Đóng modal
    document.getElementById('close-comment-modal').onclick = function() {
        document.getElementById('comment-modal').style.display = 'none';
    };
    // Gửi bình luận mới trong modal (cần bổ sung code gửi AJAX thực tế)
    document.addEventListener('click', function(e) {
        if (e.target && e.target.id === 'modal-send-comment') {
            var postId = document.getElementById('modal-comment-input').getAttribute('data-id');
            var content = document.getElementById('modal-comment-input').value;
            fetch('{{ route('front.blog.comment') }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ post_id: postId, content: content })
            })
            .then(res => res.json())
            .then(data => {
                if(data.success) {
                    Notiflix.Notify.success('Bình luận đã được gửi');
                    setTimeout(() => {
                        window.location.reload();
                    }, 1000);
                }
            });
        }
    });

    // Bắt sự kiện click vào nút xóa bình luận
    document.addEventListener('click', function(e) {
        if (e.target && e.target.closest('.comment-delete-btn')) {
            var btn = e.target.closest('.comment-delete-btn');
            var commentId = btn.getAttribute('data-id');
            Notiflix.Confirm.show(
                'Xác nhận xóa',
                'Bạn có chắc chắn muốn xóa bình luận này?',
                'Có',
                'Không',
                function() {
                    fetch('{{ route('front.blog.deleteComment') }}', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        body: JSON.stringify({ id: commentId })
                    })
                    .then(res => res.json())
                    .then(data => {
                        if (data.success) {
                            Notiflix.Notify.success('Bình luận đã được xóa');
                            setTimeout(() => {
                                window.location.reload();
                            }, 1000);
                        } else {
                            Notiflix.Notify.failure('Có lỗi xảy ra khi xóa bình luận');
                        }
                    })
                    .catch(error => {
                        Notiflix.Notify.failure('Lỗi kết nối!');
                    });
                },
                function() {
                    Notiflix.Notify.info('Đã hủy xóa bình luận');
                }
                
            );
        }
    });

    // Xử lý xóa reply comment
    document.addEventListener('click', function(e) {
        if (e.target && e.target.closest('.reply-delete-btn')) {
            var btn = e.target.closest('.reply-delete-btn');
            var replyId = btn.getAttribute('data-id');
            fetch('{{ route('front.blog.deleteReply') }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ id: replyId })
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    Notiflix.Notify.success('Phản hồi đã được xóa');
                    setTimeout(() => {
                        window.location.reload();
                    }, 1000);
                } else {
                    Notiflix.Notify.failure('Có lỗi xảy ra khi xóa phản hồi');
                }
            })
            .catch(error => {
                Notiflix.Notify.failure('Lỗi kết nối!');
            });
        }
    });

    // Xử lý xóa comment trong popup
    document.addEventListener('click', function(e) {
        if (e.target && e.target.closest('.popup-comment-delete-btn')) {
            var btn = e.target.closest('.popup-comment-delete-btn');
            var commentId = btn.getAttribute('data-id');
            fetch('{{ route('front.blog.deleteComment') }}', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                },
                body: JSON.stringify({ id: commentId })
            })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    Notiflix.Notify.success('Bình luận đã được xóa');
                    setTimeout(() => {
                        window.location.reload();
                    }, 1000);
                } else {
                    Notiflix.Notify.failure('Có lỗi xảy ra khi xóa bình luận');
                }
            })
            .catch(error => {
                Notiflix.Notify.failure('Lỗi kết nối!');
            });
        }
    });

    // Xử lý chỉnh sửa reply
    let currentEditReplyId = null;
    
    // Hiển thị modal chỉnh sửa
    document.addEventListener('click', function(e) {
        if (e.target && e.target.closest('.reply-edit-btn')) {
            const btn = e.target.closest('.reply-edit-btn');
            const replyId = btn.getAttribute('data-id');
            const content = btn.getAttribute('data-content');
            
            currentEditReplyId = replyId;
            document.getElementById('edit-reply-content').value = content;
            document.getElementById('edit-reply-modal').style.display = 'flex';
        }
    });

    // Đóng modal chỉnh sửa
    document.getElementById('close-edit-reply-modal').onclick = function() {
        document.getElementById('edit-reply-modal').style.display = 'none';
        currentEditReplyId = null;
    };

    // Lưu nội dung đã chỉnh sửa
    document.getElementById('save-edit-reply').onclick = function() {
        if (!currentEditReplyId) return;
        
        const newContent = document.getElementById('edit-reply-content').value;
        
        fetch('{{ route('front.blog.editReply') }}', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({ 
                id: currentEditReplyId,
                content: newContent 
            })
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                Notiflix.Notify.success('Đã cập nhật phản hồi');
                setTimeout(() => {
                    window.location.reload();
                }, 1000);
            } else {
                Notiflix.Notify.failure('Có lỗi xảy ra khi cập nhật');
            }
        })
        .catch(error => {
            Notiflix.Notify.failure('Lỗi kết nối!');
        });
    };

    // Xử lý chỉnh sửa comment
    let currentEditCommentId = null;
    
    // Hiển thị modal chỉnh sửa comment
    document.addEventListener('click', function(e) {
        if (e.target && e.target.closest('.comment-edit-btn')) {
            const btn = e.target.closest('.comment-edit-btn');
            const commentId = btn.getAttribute('data-id');
            const content = btn.getAttribute('data-content');
            
            currentEditCommentId = commentId;
            document.getElementById('edit-comment-content').value = content;
            document.getElementById('edit-comment-modal').style.display = 'flex';
        }
    });

    // Đóng modal chỉnh sửa comment
    document.getElementById('close-edit-comment-modal').onclick = function() {
        document.getElementById('edit-comment-modal').style.display = 'none';
        currentEditCommentId = null;
    };

    // Lưu nội dung đã chỉnh sửa comment
    document.getElementById('save-edit-comment').onclick = function() {
        if (!currentEditCommentId) return;
        
        const newContent = document.getElementById('edit-comment-content').value;
        
        fetch('{{ route('front.blog.editComment') }}', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({ 
                id: currentEditCommentId,
                content: newContent 
            })
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                Notiflix.Notify.success('Đã cập nhật bình luận');
                setTimeout(() => {
                    window.location.reload();
                }, 1000);
            } else {
                Notiflix.Notify.failure('Có lỗi xảy ra khi cập nhật');
            }
        })
        .catch(error => {
            Notiflix.Notify.failure('Lỗi kết nối!');
        });
    };

    // Xử lý chỉnh sửa comment trong popup
    let currentEditPopupCommentId = null;
    
    // Hiển thị modal chỉnh sửa comment trong popup
    document.addEventListener('click', function(e) {
        if (e.target && e.target.closest('.popup-comment-edit-btn')) {
            const btn = e.target.closest('.popup-comment-edit-btn');
            const commentId = btn.getAttribute('data-id');
            const content = btn.getAttribute('data-content');
            
            currentEditPopupCommentId = commentId;
            document.getElementById('edit-popup-comment-content').value = content;
            document.getElementById('edit-popup-comment-modal').style.display = 'flex';
        }
    });

    // Đóng modal chỉnh sửa comment trong popup
    document.getElementById('close-edit-popup-comment-modal').onclick = function() {
        document.getElementById('edit-popup-comment-modal').style.display = 'none';
        currentEditPopupCommentId = null;
    };

    // Lưu nội dung đã chỉnh sửa comment trong popup
    document.getElementById('save-edit-popup-comment').onclick = function() {
        if (!currentEditPopupCommentId) return;
        
        const newContent = document.getElementById('edit-popup-comment-content').value;
        
        fetch('{{ route('front.blog.editComment') }}', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({ 
                id: currentEditPopupCommentId,
                content: newContent 
            })
        })
        .then(res => res.json())
        .then(data => {
            if (data.success) {
                Notiflix.Notify.success('Đã cập nhật bình luận');
                setTimeout(() => {
                    window.location.reload();
                }, 1000);
            } else {
                Notiflix.Notify.failure('Có lỗi xảy ra khi cập nhật');
            }
        })
        .catch(error => {
            Notiflix.Notify.failure('Lỗi kết nối!');
        });
    };
});
</script>
<!-- Modal hiển thị bình luận -->
<div id="comment-modal" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background:rgba(0,0,0,0.7); z-index:9999; align-items:center; justify-content:center;">
  <div style="background:#fff; border-radius:10px; max-width:1100px; width:auto;  max-height:90vh;
   overflow:auto; position:relative; padding:24px; display:flex; gap:32px;">
    <button id="close-comment-modal" style="position:absolute; top:10px; right:10px; background:none; border:none; font-size:1.5em; cursor:pointer;">&times;</button>
    <div style=" margin-bottom:16px;">
        <div id="modal-post-image" style="flex:1; display:flex; align-items:center; justify-content:center;">
            <!-- Ảnh bài post sẽ được render ở đây -->
          </div>
        <br>
        <hr>
        <div id="modal-post-content" style="color:black;">
            <!-- Ảnh bài post sẽ được render ở đây -->
        </div>
        <hr>
        <br><br>
        <div id="modal-comments-content" style="flex:1; min-width:0;">
           
        </div>
        <br><br>
    </div>
   
  </div>
</div>

<!-- Thêm modal chỉnh sửa reply -->
<div id="edit-reply-modal" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background:rgba(0,0,0,0.7); z-index:9999; align-items:center; justify-content:center;">
    <div style="background:#fff; border-radius:10px; width:500px; padding:24px; position:relative;">
        <button id="close-edit-reply-modal" style="position:absolute; top:10px; right:10px; background:none; border:none; font-size:1.5em; cursor:pointer;">&times;</button>
        <h3 style="margin-bottom:16px; color:black;">Chỉnh sửa phản hồi</h3>
        <textarea id="edit-reply-content" style="width:94%; height:100px; padding:12px; border:1px solid #ddd; border-radius:8px; resize:none; margin-bottom:16px;"></textarea>
        <button id="save-edit-reply" style="background:#1877f2; color:#fff; border:none; padding:8px 24px; border-radius:8px; cursor:pointer; float:right;">Lưu</button>
    </div>
</div>

<!-- Thêm modal chỉnh sửa comment -->
<div id="edit-comment-modal" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background:rgba(0,0,0,0.7); z-index:9999; align-items:center; justify-content:center;">
    <div style="background:#fff; border-radius:10px; width:500px; padding:24px; position:relative;">
        <button id="close-edit-comment-modal" style="position:absolute; top:10px; right:10px; background:none; border:none; font-size:1.5em; cursor:pointer;">&times;</button>
        <h3 style="margin-bottom:16px; color:black;">Chỉnh sửa bình luận</h3>
        <textarea id="edit-comment-content" style="width:94%; height:100px; padding:12px; border:1px solid #ddd; border-radius:8px; resize:none; margin-bottom:16px;"></textarea>
        <button id="save-edit-comment" style="background:#1877f2; color:#fff; border:none; padding:8px 24px; border-radius:8px; cursor:pointer; float:right;">Lưu</button>
    </div>
</div>

<!-- Thêm modal chỉnh sửa comment trong popup -->
<div id="edit-popup-comment-modal" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background:rgba(0,0,0,0.7); z-index:9999; align-items:center; justify-content:center;">
    <div style="background:#fff; border-radius:10px; width:500px; padding:24px; position:relative;">
        <button id="close-edit-popup-comment-modal" style="position:absolute; top:10px; right:10px; background:none; border:none; font-size:1.5em; cursor:pointer;">&times;</button>
        <h3 style="margin-bottom:16px; color:black;">Chỉnh sửa bình luận</h3>
        <textarea id="edit-popup-comment-content" style="width:94%; height:100px; padding:12px; border:1px solid #ddd; border-radius:8px; resize:none; margin-bottom:16px;"></textarea>
        <button id="save-edit-popup-comment" style="background:#1877f2; color:#fff; border:none; padding:8px 24px; border-radius:8px; cursor:pointer; float:right;">Lưu</button>
    </div>
</div>