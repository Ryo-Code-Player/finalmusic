<aside class="sidebar">
    <div class="logo"><img src="{{ asset('images/Miquinn.png') }}" alt="Logo"></div>
    <nav>
        <ul>
            <a href="/" style="text-decoration:none;color:#fff;"><li class="{{ request()->is('/') ? 'active' : '' }}"><i class="fas fa-home"></i> Trang Chủ</li><a href="/" style="text-decoration:none;color:#fff;"></a>
            <a href="/zingchart" style="text-decoration:none;color:#fff;"><li class="{{ request()->is('zingchart') ? 'active' : '' }}"><i class="fa fa-music"></i> Bài hát</li></a>
            <a href="/zingchart-100" style="text-decoration:none;color:#fff;"><li class="{{ request()->is('zingchart-100') ? 'active' : '' }}"><i class="fas fa-chart-line"></i> Top bài hát</li></a>
            <a href="/categories" style="text-decoration:none;color:#fff;"><li class="{{ request()->is('categories') ? 'active' : '' }}"><i class="far fa-clipboard"></i> Thể loại</li></a>

            {{-- <li><i class="fas fa-music"></i> <a href="/thuvien" style="text-decoration:none;color:#fff;">Thư Viện</a></li>
            <li><i class="fas fa-star"></i> <a href="/top100" style="text-decoration:none;color:#fff;">Top 100</a></li> --}}
        </ul>
    </nav>
    <div class="library">
        <ul>
              <h4>CHỦ ĐỀ</h4>
          <a href="{{ route('front.blog') }}" style="text-decoration:none;color:#fff;"><li class="{{ request()->is('blog') ? 'active' : '' }}"><i class="fa-solid fa-blog"></i>Bài viết</li></a>

            @if(auth()->check())
            
          
            
            <a href="{{ route('front.blog.index',['id' => auth()->user()->id]) }}" style="text-decoration:none;color:#fff;"><li class="{{ request()->is('blog-index') ? 'active' : '' }}"><i class="fab fa-codepen"></i>Cộng đồng</li></a>
        @endif
            <h4>THƯ VIỆN</h4>
            <a href="{{ route('front.playlist') }}" style="text-decoration:none;color:#fff;"><li class="{{ request()->is('playlist') ? 'active' : '' }}" ><i class="fas fa-list"></i> Playlist</li></a>

            <a href="{{ route('front.fanclub') }}" style="text-decoration:none;color:#fff;"><li class="{{ request()->is('fanclub') ? 'active' : '' }}" ><i class="fas fa-compact-disc"></i> Fanclub</li></a>
           
        </ul>
    </div>
 
</aside>