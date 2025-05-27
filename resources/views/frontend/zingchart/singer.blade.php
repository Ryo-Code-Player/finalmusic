@extends('frontend.layouts.master')
@section('content')

      <style>
        .singer-list {
            display: flex;
            gap: 40px;
            flex-wrap: wrap;
            margin: 40px;
            
        }

        .singer-card {
            text-align: center;
            color: #fff;
            font-family: 'Inter', sans-serif;
            flex: 0 0 calc(20% - 32px);
        }

        .singer-avatar-wrapper {
            position: relative;
            display: inline-block;
        }

        .singer-avatar {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            border: 4px solid #ff3b5c;
            object-fit: cover;
        }

        .live-badge {
            position: absolute;
            left: 50%;
            bottom: 0px;
            transform: translateX(-50%);
            background: #ff3b5c;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            padding: 2px 14px;
            border-radius: 8px;
            z-index: 2;
            letter-spacing: 1px;
        }

        .singer-logo {
            position: absolute;
            right: -18px;
            bottom: 10px;
            width: 48px;
            height: 48px;
            border-radius: 50%;
            border: 3px solid #fff;
            background: #fff;
            object-fit: cover;
            z-index: 2;
        }

        .singer-name {
            margin-top: 12px;
            font-size: 20px;
            font-weight: 600;
            
        }

        .singer-listeners {
            margin-top: 4px;
            font-size: 16px;
            color: #b3b3b3;
        }

        
    </style>

    <div class="singer-list">
        @foreach($Singer as $s)
            <a href="{{ route('front.zingsinger_slug', $s->id) }}" style="text-decoration: none;color: #fff;">
                <div class="singer-card">
                    <div class="singer-avatar-wrapper">
                        <img class="singer-avatar" src="{{ asset($s->photo ?'storage/'.$s->photo : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg') }}" alt="{{ $s->full_name }}">
                        <!-- <span class="live-badge">{{ optional($s->musicType)->title ?? 'N/A' }}</span> -->
                        <img class="singer-logo" src="{{ asset($s->photo ? 'storage/'.$s->photo : 'https://i.pinimg.com/236x/5e/e0/82/5ee082781b8c41406a2a50a0f32d6aa6.jpg') }}" alt="{{ $s->full_name }}">
                    </div>
                    <div class="singer-name">{{ $s->full_name }}</div>
                    <div class="singer-listeners">Lượt theo dõi: {{ $s->following }}</div>
                </div>
            </a>
        @endforeach
    </div>

  
@endsection
