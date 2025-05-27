@extends('frontend.layouts.master')
@section('content')
<div style="background: linear-gradient(100deg, #2d1a4a 0%, #4E205F 25%,#2d1a4a 50%, #4E205F 75%, #2d1a4a 100%); padding-bottom: 40px;">
    <div style="max-width: 1100px; margin: 0 auto; padding: 40px 20px 0 20px;">
        <div style="display: flex; align-items: center;">
           
            <img src=" {{ $Singer->photo ?  asset('storage/'.$Singer->photo) : 'https://i.pinimg.com/736x/bc/43/98/bc439871417621836a0eeea768d60944.jpg' }} " alt="avatar" style="width: 120px; height: 120px; border-radius: 50%; object-fit: cover; border: 4px solid #fff;">
            <div style="margin-left: 30px;">
                <h1 style="color: #fff; font-size: 48px; font-weight: bold;">{{ $Singer->full_name }}</h1>
            </div>
        </div>
    </div>
</div>



<div style="max-width: 100%;background: #181028; border-radius: 20px; padding: 40px 30px;">
    <h2 style="color: #fff; font-size: 24px; font-weight: bold;">Bài Hát Nổi Bật</h2>
    <div style="margin-top: 20px;">
  
        @foreach($Singer->song as $song)
                @php
                    $songUrl = str_replace(':8000/', '', $song->resourcesSong[0]->url);  
                @endphp
            <div style="display: flex; align-items: center; background: #232135; border-radius: 12px; padding: 12px 20px; margin-bottom: 16px;">
                <img src="{{ $Singer->photo ?  asset('storage/'.$Singer->photo) : 'https://i.pinimg.com/736x/bc/43/98/bc439871417621836a0eeea768d60944.jpg' }} "" style="width: 44px; height: 44px; border-radius: 8px; object-fit: cover;">
                <div style="margin-left: 16px; flex: 1;">
                    <div style="color: #fff; font-size: 17px; font-weight: bold; letter-spacing: 1px;">{{ $song->title }}</div>
                </div>
                <div style="color: #b3b3b3; font-size: 14px; margin-right: 24px;">{{ $song->created_at->diffForHumans() }}</div>
                <button style="background: linear-gradient(135deg, #a259ff 0%, #6c47ff 100%); border: none; 
                border-radius: 50%; width: 36px; height: 36px; display: flex; align-items: center; 
                justify-content: center; margin-right: 10px; cursor: pointer;"  onclick="playSong('{{ asset($songUrl) }}',
                     '{{ $song->title }}', '{{ $song->user->full_name }}','{{ asset('storage/'.$song->user->photo) }}',{{ $song->id }})">
                    <svg width="18" height="18" fill="#fff" viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg>
                </button>

                @if(auth()->check())
                <button style="background:none;border:none;cursor:pointer;padding:0;margin-right:8px;" onclick="openAddPlaylistPopup('{{ $song->id }}', '{{ $song->title }}', '{{ asset('storage/'.$song->user->photo) }}')">
                    <svg width="28" height="28" fill="#fff" viewBox="0 0 24 24"><circle cx="12" cy="12" r="12" fill="#44406a"/><line x1="12" y1="8" x2="12" y2="16" stroke="#fff" stroke-width="2" stroke-linecap="round"/><line x1="8" y1="12" x2="16" y2="12" stroke="#fff" stroke-width="2" stroke-linecap="round"/></svg>
                </button>
                <a 
                href="{{ route('front.song.share', [
                    'id' => $song->id,
                    'url' => $songUrl,
                    'ref' => request()->get('ref') // Lấy 'ref' từ request hiện tại,
                    
                ]) }}"
                style="background: #23213a; border: none; border-radius: 50%; width: 36px; height: 36px; display: flex; align-items: center; justify-content: center; cursor: pointer;">
                    <i class="fa-solid fa-share"></i>
                </a>
               
                @endif
            </div>
        @endforeach
     
    </div>
   
    <div style="max-width: 100%; margin: 0 auto; padding: 40px 0 0 0;">
        <h2 style="color: #fff; font-size: 26px; font-weight: bold; margin-bottom: 32px;">Bạn Có Thể Thích</h2>
        <div style="display: flex; justify-content: center; gap: 48px; flex-wrap: wrap;">
            @foreach($suggestedSingers as $singer)
                <a href="{{ route('front.zingsinger_slug', $singer->id) }}" 
                    style="display: flex; flex-direction: column; align-items: center; width: 220px; text-decoration: none;">
                    <img src="{{ $singer->photo ? asset('storage/'.$singer->photo) : 'https://i.pinimg.com/736x/bc/43/98/bc439871417621836a0eeea768d60944.jpg' }}" style="width: 200px; height: 200px; border-radius: 50%; object-fit: cover; margin-bottom: 16px; border: 4px solid #2d1a4a;">
                    <div style="color: #fff; font-size: 20px; font-weight: bold; text-align: center;">{{ $singer->full_name }}</div>
                    <div style="color: #b3b3b3; font-size: 15px; margin: 4px 0 12px 0; text-align: center;">{{ number_format($singer->followers) }} quan tâm</div>
                    {{-- <button style="background: #a259ff; color: #fff; border: none; border-radius: 20px; padding: 7px 28px; font-size: 15px; font-weight: 500; cursor: pointer;">QUAN TÂM</button> --}}
                </a>
                
            @endforeach
        </div>
    </div>

</div>

<!-- YouTube Video Player Blur Background -->
<div id="youtube-blur-bg"></div>
<!-- YouTube Video Player -->
<div id="youtube-player">
    <div style="position:relative;width:100%;height:100%;">
        <button id="close-video" style="position:absolute;top:10px;right:10px;background:rgba(0,0,0,0.5);color:#fff;border:none;border-radius:50%;width:30px;height:30px;cursor:pointer;">×</button>
        <iframe id="youtube-iframe" width="100%" height="100%" frameborder="0" allowfullscreen></iframe>
    </div>
</div>
<style>
    #youtube-blur-bg {
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        background: rgba(0,0,0,0.5);
        backdrop-filter: blur(12px);
        z-index: 9999;
        display: none;
        transition: opacity 0.3s;
    }
    #youtube-player {
        position: fixed;
        top: 50%;
        left: 50%;
        width: 90vw;
        max-width: 640px;
        height: 50vw;
        max-height: 360px;
        background: #000;
        z-index: 10000;
        display: none;
        transform: translate(-50%, -50%);
        border-radius: 12px;
        box-shadow: 0 8px 32px rgba(0,0,0,0.5);
        padding: 0;
    }
    #youtube-iframe {
        width: 100%;
        height: 100%;
        border-radius: 12px;
        display: block;
    }
    #close-video {
        position: absolute;
        top: 10px;
        right: 10px;
        background: rgba(0,0,0,0.5);
        color: #fff;
        border: none;
        border-radius: 50%;
        width: 30px;
        height: 30px;
        cursor: pointer;
        z-index: 2;
    }
</style>
@if(auth()->check())
<div id="addPlaylistPopup" style="display:none;position:fixed;z-index:300;left:0;top:0;width:100vw;height:100vh;background:rgba(23,15,35,0.7);backdrop-filter:blur(2px);justify-content:center;align-items:center;">
    <div style="background:#221f35;padding:32px 24px;border-radius:16px;min-width:320px;max-width:90vw;">
        <button onclick="closeAddPlaylistPopup()" style="float:right;background:none;border:none;color:#fff;font-size:22px;cursor:pointer;">&times;</button>
        <h3 style="color:#fff;margin-bottom:18px;">Thêm vào playlist của tôi</h3>
        <div id="playlist-list">
            @php
                $playlist = App\Modules\Playlist\Models\Playlist::orderByDesc('order_id')->where('user_id', auth()->user()->id)->get();
            @endphp
            <input type="hidden" id="songId" value="">
            <ul style="list-style:none;padding:0;margin:0;">
                @forelse($playlist as $item)
                    <li style="display:flex;align-items:center;justify-content:space-between;padding:10px 0;border-bottom:1px solid #333;">
                        <div style="display:flex;align-items:center;gap:12px;">
                            <img src="{{ asset($item->photo) }}" alt="{{ $item->title }}" style="width:38px;height:38px;border-radius:8px;object-fit:cover;">
                            <span style="color:#fff;font-size:1rem;">{{ $item->title }}</span>
                        </div>
                        <button onclick="addSongToPlaylist2({{ $item->id }})" style="background:#7c3aed;color:#fff;border:none;border-radius:50%;width:32px;height:32px;display:flex;align-items:center;justify-content:center;font-size:1.3rem;cursor:pointer;">+</button>
                    </li>
                @empty
                    <li style="color:#aaa;">Bạn chưa có playlist nào.</li>
                @endforelse
            </ul>
        </div>
    </div>
</div>
@endif
<script>
function openAddPlaylistPopup(songId, songTitle, songImg) {
 
    document.getElementById('addPlaylistPopup').style.display = 'flex';
    
   
    $('#songId').val(songId);
}
function closeAddPlaylistPopup() {
    document.getElementById('addPlaylistPopup').style.display = 'none';
}

function addSongToPlaylist2(playlistId) {
    const songId = document.getElementById('songId').value;
    if (!songId) { Notiflix.Notify.failure('Không xác định được bài hát!'); return; }
    $.ajax({
        url: '/playlist/' + playlistId + '/add-song',
        type: 'POST',
        data: { 
            song_id: songId,
            _token: '{{ csrf_token() }}',
            playlistId: playlistId
        },
        success: function(response) {
            console.log(response);
            if (response.success) {
                Notiflix.Notify.success('Đã thêm vào playlist!');
                addToPlaylistModal.style.display = 'none';
                document.getElementById('addPlaylistPopup').style.display = 'none';

            } else {
                Notiflix.Notify.failure('Lỗi: ' + response.message);
            }
        },
        error: function(xhr, status, error) {
            alert('Lỗi: ' + error);
        }
    })
}

const ctx = document.getElementById('zingLineChart').getContext('2d');

</script>
<script>
let youtubePlayer = document.getElementById('youtube-player');
let youtubeIframe = document.getElementById('youtube-iframe');
let closeVideoBtn = document.getElementById('close-video');
let youtubeBlurBg = document.getElementById('youtube-blur-bg');
let isPlaying = false;
function playSong(url, title, singer, photo,id = null) {
    // Extract YouTube video ID from URL
    let videoId = '';
    if (url.includes('youtube.com/watch?v=')) {
        videoId = url.split('v=')[1].split('&')[0];
    } else if (url.includes('youtu.be/')) {
        videoId = url.split('youtu.be/')[1].split('?')[0];
    }
    if (videoId) {
        youtubeIframe.src = `https://www.youtube.com/embed/${videoId}?autoplay=1`;
        youtubePlayer.style.display = 'block';
        youtubeBlurBg.style.display = 'block';
        isPlaying = true;
    }
    if (id) {
            fetch(`{{ route('front.song.view') }}`, {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    song_id: id,
                    viewed_at: new Date().toISOString()
                })
            })
            .then(response => response.json())
            .then(data => {
                console.log('View updated', data);
            })
            .catch(error => {
                console.error('Error updating view:', error);
            });
        }
}
closeVideoBtn.addEventListener('click', function() {
    youtubePlayer.style.display = 'none';
    youtubeBlurBg.style.display = 'none';
    youtubeIframe.src = '';
    isPlaying = false;
});
</script>

@endsection
