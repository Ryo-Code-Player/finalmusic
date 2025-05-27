@extends('frontend.layouts.master')
@section('content')
<style>
    .category-container {
        width: 90%;
        max-width: 100%;
        margin: 0 auto;
        padding: 40px 20px;
    }

    .category-title {
        text-align: center;
        font-size: 2.5rem;
        color: white;
        margin-bottom: 50px;
        position: relative;
    }

    .category-title::after {
        content: '';
        position: absolute;
        bottom: -15px;
        left: 50%;
        transform: translateX(-50%);
        width: 100px;
        height: 3px;
        background: #7200a1;
    }

    .category-grid {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 20px;
        padding: 20px;
    }

    .category-card {
        background: #231b2e;
        border-radius: 15px;
        color: #fff;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: all 0.3s ease;
        position: relative;
    }

    .category-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    }

    .category-image {
        width: 100%;
        height: 180px;
        object-fit: cover;
        transition: transform 0.5s ease;
    }

    .category-card:hover .category-image {
        transform: scale(1.1);
    }

    .category-content {
        padding: 15px;
    }

    .category-name {
        font-size: 1.2rem;
        color: #fff;
        margin-bottom: 8px;
        font-weight: 600;
    }

    .category-description {
        color: #fff;
        line-height: 1.4;
        margin-bottom: 15px;
        font-size: 0.9rem;
    }

    .category-link {
        display: inline-block;
        padding: 8px 20px;
        background: #7200a1;
        color: white;
        text-decoration: none;
        border-radius: 25px;
        transition: all 0.3s ease;
        border: none;
        cursor: pointer;
        font-size: 0.9rem;
    }

    .category-link:hover {
        transform: scale(1.05);
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    @media (max-width: 1200px) {
        .category-grid {
            grid-template-columns: repeat(4, 1fr);
        }
    }

    @media (max-width: 992px) {
        .category-grid {
            grid-template-columns: repeat(3, 1fr);
        }
    }

    @media (max-width: 768px) {
        .category-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (max-width: 480px) {
        .category-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<div class="category-container">
    <h1 class="category-title">Danh Mục Âm Nhạc</h1>
    
    <div class="category-grid">
        @foreach($categories as $category)
        <div class="category-card">
            <img src="{{ $category->photo }}" alt="{{ $category->title }}" class="category-image">
            <div class="category-content">
                <h3 class="category-name">{{ $category->title }}</h3>
                <p class="category-description">{{ $category->sum_song }} bài hát</p>
                <a href="{{ route('front.categories.detail', ['slug' => $category->id]) }}" class="category-link">Xem bài hát</a>
            </div>
        </div>
        @endforeach
    </div>
</div>
@endsection
