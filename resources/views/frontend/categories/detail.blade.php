@extends('frontend.layouts.master')
@section('content')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
.zc-container {
    background: #181828;
    color: #fff;
    padding: 32px 0;
    min-height: 100vh;
    font-family: 'Segoe UI', sans-serif;
}
.zc-tabs {
    display: flex;
    gap: 16px;
    margin-bottom: 32px;
}
.zc-tab {
    background: #2d2d44;
    color: #fff;
    border: none;
    padding: 10px 28px;
    border-radius: 20px;
    cursor: pointer;
    font-weight: 500;
    font-size: 16px;
    transition: background 0.2s;
}
.zc-tab.active, .zc-tab:hover {
    background: #a259ff;
    color: #fff;
}
.zc-table {
    width: 100%;
    border-collapse: collapse;
}
.zc-table th, .zc-table td {
    padding: 14px 12px;
    text-align: left;
}
.zc-table th {
    color: #a0a0c0;
    font-size: 14px;
    font-weight: 600;
    border-bottom: 1px solid #33334d;
}
.zc-table tr {
    border-bottom: 1px solid #23234a;
}
.zc-table tr:last-child {
    border-bottom: none;
}
.zc-song-img {
    width: 40px;
    height: 40px;
    border-radius: 8px;
    object-fit: cover;
    margin-right: 12px;
}
.zc-song-title {
    font-weight: 600;
    font-size: 16px;
}
.zc-premium {
    background: #ffb800;
    color: #181828;
    font-size: 12px;
    font-weight: bold;
    border-radius: 6px;
    padding: 2px 8px;
    margin-left: 8px;
}
.zc-chartjs-container {
    background: #181828;
    border-radius: 18px;
    padding: 32px 24px 24px 24px;
    margin-bottom: 32px;
    box-shadow: 0 2px 16px 0 rgba(0,0,0,0.12);
    width: 100%;
    max-width: 1100px;
    margin-left: auto;
    margin-right: auto;
}
.zc-chartjs-title {
    color: #fff;
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 18px;
}
</style>
<div class="zc-container">
   
    <table class="zc-table">
        <thead>
            <tr>
                <th></th>
                <th>BÀI HÁT</th>
                <th>PHÁT HÀNH</th>
                
                <th></th>
            </tr>
        </thead>
        <tbody>
     
            @foreach($category->song as $key => $s)
          
                @php
                    $songUrl = str_replace(':8000/', '', $s->resourcesSong[0]->url);  
                @endphp
                <tr>
                    <td style="display:flex;align-items:center;">
                        <span style="vertical-align: middle; margin-right: 8px;">
                            <svg width="18" height="18" fill="#a259ff" viewBox="0 0 24 24"><path d="M9 17.5A2.5 2.5 0 1 1 4 17.5a2.5 2.5 0 0 1 5 0zm10-2.5V6a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v9.5a4.5 4.5 0 1 0 2 0V8h8v7a4.5 4.5 0 1 0 2 0z"></path></svg>
                        </span>
                        <img class="zc-song-img" src="{{$s->user->photo ? asset('storage/'.$s->user->photo) : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg'}}" alt="" />
                    </td>
                    <td><span class="zc-song-title">{{Str::limit($s->title, 25) }}</span><br><span style="color:#aaa;font-size:13px;">{{ $s['artist'] }}</span></td>
                    <td>{{ $s->created_at->diffForHumans() }}</td>
                    <td>
                        <a style="background:none;border:none;cursor:pointer;padding:0;margin-right:8px;" href="{{ route('front.zingplay_slug', $s->slug) }}">
                            <svg width="28" height="28" fill="#fff" viewBox="0 0 24 24"><circle cx="12" cy="12" r="12" fill="#a259ff"/><polygon points="10,8 16,12 10,16" fill="#fff"/></svg>
                        </a>
                        <button style="background:none;border:none;cursor:pointer;padding:0;margin-right:8px;" onclick="openAddPlaylistPopup('{{ $s->id }}', '{{ $s->title }}', '{{ asset('storage/'.$s->user->photo) }}')">
                            <svg width="28" height="28" fill="#fff" viewBox="0 0 24 24"><circle cx="12" cy="12" r="12" fill="#44406a"/><line x1="12" y1="8" x2="12" y2="16" stroke="#fff" stroke-width="2" stroke-linecap="round"/><line x1="8" y1="12" x2="16" y2="12" stroke="#fff" stroke-width="2" stroke-linecap="round"/></svg>
                        </button>
                        @if(auth()->check())
                        <a 
                        
                        href="{{ route('front.song.share', [
                            'id' => $s->id,
                            'url' => $songUrl,
                            'ref' => request()->get('ref') // Lấy 'ref' từ request hiện tại,
                            
                        ]) }}"
                        
                        class="zc-share-btn" title="Chia sẻ" style="display:inline-flex;align-items:center;justify-content:center;width:32px;height:32px;background:none;border:none;cursor:pointer;padding:0;">
                            <svg width="24" height="24" fill="#a259ff" viewBox="0 0 24 24"><path d="M18 8a3 3 0 1 0-2.83-4A3 3 0 0 0 18 8zm-12 8a3 3 0 1 0 2.83 4A3 3 0 0 0 6 16zm12 0a3 3 0 1 0 2.83 4A3 3 0 0 0 18 16zm-9.71-2.29a1 1 0 0 0 1.42 0l6-6a1 1 0 1 0-1.42-1.42l-6 6a1 1 0 0 0 0 1.42z"/></svg>
                        </a>
                        @endif
                    </td>
                </tr>
            @endforeach 
        </tbody>
    </table>
</div>



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
@endsection
