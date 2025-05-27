@extends('frontend.layouts.master')
@section('content')
<style>
 
    .custom-list {
        list-style-type: none;
        padding: 0;
        margin: 0;
        max-width: 400px;
        background: #f8f9fa;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }
    .custom-list li {
        padding: 12px 20px;
        border-bottom: 1px solid #e0e0e0;
        font-size: 16px;
        color: #333;
        transition: background 0.2s;
    }
    .custom-list li:last-child {
        border-bottom: none;
    }
    .custom-list li:hover {
        background: #e3f2fd;
    }
    .blog-form-container {
        width: 90%;
        margin: 40px auto;
        background: #332440;
        border-radius: 18px;
        box-shadow: 0 2px 24px rgba(60,0,100,0.18);
        padding: 32px 40px 24px 40px;
        color: #fff;
    }
    .blog-form-title {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 24px;
        color: #fff;
        text-align: center;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-label {
        font-weight: 500;
        margin-bottom: 8px;
        display: block;
        color: #e0d7ff;
    }
    .form-control, .form-select {
        width: 97%;
        padding: 12px 16px;
        border: 1.5px solid #a084e8;
        border-radius: 10px;
        font-size: 1rem;
        background: #f5f3ff;
        color: #2d1046;
        transition: border 0.2s, box-shadow 0.2s;
        margin-top: 2px;
    }
    .form-control:focus, .form-select:focus {
        border-color: #b983ff;
        outline: none;
        background: #fff;
        box-shadow: 0 0 0 2px #b983ff44;
    }
    .form-photo {
        border: 2px dashed #a084e8;
        border-radius: 12px;
        padding: 32px;
        text-align: center;
        color: #b983ff;
        margin-bottom: 16px;
        background: #1a0736;
    }
    .btn-save {
        background: linear-gradient(90deg, #b983ff 0%, #a084e8 100%);
        color: #fff;
        border: none;
        padding: 14px 0;
        border-radius: 10px;
        font-size: 1.1rem;
        font-weight: 600;
        cursor: pointer;
        width: 100%;
        margin-top: 10px;
        transition: background 0.2s, box-shadow 0.2s;
        box-shadow: 0 2px 8px #a084e844;
    }
    .btn-save:hover {
        background: linear-gradient(90deg, #a084e8 0%, #b983ff 100%);
        box-shadow: 0 4px 16px #b983ff55;
    }
    #preview-photo img {
        display: block;
        margin: 10px auto;
        /* border-radius: 50%; */
        border: 3px solid #b983ff;
        box-shadow: 0 2px 12px #a084e855;
        max-width: 300px;
        max-height: 300px;
        background: #fff;
    }
</style>

<div class="blog-form-container">
    <div class="blog-form-title">Thêm bài viết</div>
    <form method="POST" enctype="multipart/form-data" action="{{ route('front.blog.store') }}">
        @csrf
        <div class="form-group">
            <label class="form-label" for="title">Tiêu đề</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Nhập tiêu đề bài viết" required>
        </div>
        <div class="form-group">
            <label class="form-label">Photo</label>
            <div id="preview-photo" style="margin-top: 10px;"></div>
            <div class="form-photo">
                Kéo thả hoặc chọn ảnh.<br>
                <input type="file" name="photo" accept="image/*" style="margin-top:10px;">
            </div>
        </div>
        <div class="form-group">
            <label class="form-label" for="description">Mô tả ngắn</label>
            <input type="text" class="form-control" id="description" name="description" placeholder="Nhập mô tả ngắn" required>
        </div>
        <div class="form-group">
            <label class="form-label" for="content">Nội dung</label>
            <textarea class="form-control" id="content" name="content" rows="7" placeholder="Nhập nội dung bài viết"></textarea>
        </div>
        <div class="form-group">
            <label class="form-label" for="category">Danh mục</label>
            <select class="form-select" id="category" name="category" required>
                <option value="">- Chọn danh mục -</option>
                @foreach($blogCategories as $blogCategory)
                    <option value="{{ $blogCategory->id }}">{{ $blogCategory->title }}</option>
                @endforeach
            </select>
        </div>
      
        <div class="form-group">
            <label class="form-label" for="status">Tình trạng</label>
            <select class="form-select" id="status" name="status" required>
                <option value="active">Hoạt động</option>
                <option value="inactive">Không hoạt động</option>
            </select>
        </div>
        <button type="submit" class="btn-save">Lưu</button>
    </form>
</div>

<script>
    // Photo preview functionality
    document.querySelector('input[type="file"][name="photo"]').addEventListener('change', function(e) {
        const preview = document.getElementById('preview-photo');
        preview.innerHTML = '';
        const file = e.target.files[0];
        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();
            reader.onload = function(evt) {
                const img = document.createElement('img');
                img.src = evt.target.result;
                preview.appendChild(img);
            };
            reader.readAsDataURL(file);
        }
    });
</script>

<!-- Load CKEditor script -->
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<script>
    // Wait for CKEditor to load
    window.onload = function() {
        if (typeof CKEDITOR !== 'undefined') {
            CKEDITOR.replace('content', {
                height: 300,
                removeButtons: 'PasteFromWord',
                toolbar: [
                    { name: 'document', items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
                    { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
                    { name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
                    { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
                    '/',
                    { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
                    { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
                    { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
                    '/',
                    { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
                    { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
                    { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] }
                ],
                language: 'vi',
                uiColor: '#332440',
                contentsCss: [
                    'body { color: #2d1046; background: #f5f3ff; }',
                    'body { font-family: Arial, sans-serif; }'
                ]
            });
        } else {
            console.error('CKEditor failed to load');
        }
    };
</script>
@endsection
