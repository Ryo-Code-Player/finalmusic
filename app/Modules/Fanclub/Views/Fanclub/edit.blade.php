@extends('backend.layouts.master')
@section ('scriptop')

<meta name="csrf-token" content="{{ csrf_token() }}">
 
@endsection
@section('content')

<div class = 'content'>
    <div class="intro-y flex items-center mt-8">
        <h2 class="text-lg font-medium mr-auto">
            Điều chỉnh câu lạc bộ
        </h2>
    </div>
    <div class="grid grid-cols-12 gap-12 mt-5">
        <div class="intro-y col-span-12 lg:col-span-12">
            <!-- BEGIN: Form Layout -->
            <form method="post" action="{{route('admin.Fanclub.update',$fanclub->id)}}" enctype="multipart/form-data">
                @csrf
                @method('patch')
                <div class="intro-y box p-5">
                    <div class="mt-3">
                        <label for="regular-form-1" class="form-label">Tên câu lạc bộ</label>
                        <input id="title" name="title" type="text" class="form-control" placeholder="Tên câu lạc bộ" value="{{ old('title', $fanclub->title) }}">
                 
                    </div>

                    <div class="mt-3">
                        <label for="" class="form-label">Ảnh đại diện</label>
                        <div class="px-4 pb-4 mt-5 flex items-center cursor-pointer relative">
                            <div data-single="true" id="mydropzone" class="dropzone" url="{{ route('upload.avatar') }}">
                                <div class="fallback"><input name="file" type="file" multiple /></div>
                                <div class="dz-message" data-dz-message>
                                    <div class="font-medium">Kéo thả hoặc chọn ảnh.</div>
                                </div>
                            </div>
                        </div>
                            <div class="grid grid-cols-10 gap-5 pl-4 pr-5 py-5">
                                    <?php
                                        $photos = explode( ',', $fanclub->photo);
                                    ?>
                                    @foreach ( $photos as $photo)
                                    <div data-photo="{{$photo}}" class="product_photo col-span-5 md:col-span-2 h-28 relative image-fit cursor-pointer zoom-in">
                                        <img class="rounded-md "   src="{{$photo}}">
                                        <div title="Xóa hình này?" class="tooltip w-5 h-5 flex items-center justify-center absolute rounded-full text-white bg-danger right-0 top-0 -mr-2 -mt-2"> <i data-lucide="x" class="btn_remove w-4 h-4"></i> </div>  
                                    </div>
                                    @endforeach  
                                
                                    <input type="hidden" id="photo_old" name="photo_old"/>
                                    
                            </div>
                            <input type="hidden" id="photo" name="photo"/>
                        </div>
                    </div>

                    <label for="regular-form-1" class="form-label">Mô tả</label>
                    <input id="summary" name="summary" type="text" class="form-control" placeholder="Mô tả" value="{{ old('summary', $fanclub->summary)}}">
                        
                        <label for="" class="form-label">Nội dung</label>
                       
                        <textarea class="editor"  id="editor1" name="content" >
                            {{old('content', $fanclub->content)}}
                        </textarea>

                    <div class="mt-3">
                        <div class="flex flex-col sm:flex-row items-center">
                            <label for="status" class="form-select-label">Trạng thái</label>
                            <select id="status" name="status" class="form-select mt-2">
                                <option value="active" {{ old('status', $fanclub->status) == 'active' ? 'selected' : '' }}>Active</option>
                                <option value="inactive" {{ old('status', $fanclub->status) == 'inactive' ? 'selected' : '' }}>Inactive</option>
                            </select>
                            @error('status')
                                <div class="text-danger mt-1">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>
                    
                    <div class="mt-3">
                        @if($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>    {{$error}} </li>
                                    @endforeach
                            </ul>
                        </div>
                        @endif
                    </div>
                    <div class="text-right mt-5">
                        <button type="submit" class="btn btn-primary w-24">Cập nhật</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@section ('scripts')
<script>
    $(".btn_remove").click(function(){
        $(this).parent().parent().remove();   
        var link_photo = "";
        $('.product_photo').each(function() {
            if (link_photo != '')
            {
            link_photo+= ',';
            }   
            link_photo += $(this).data("photo");
        });
        $('#photo_old').val(link_photo);
    });

 
                // previewsContainer: ".dropzone-previews",
    Dropzone.instances[0].options.multiple = true;
    Dropzone.instances[0].options.autoQueue= true;
    Dropzone.instances[0].options.maxFilesize =  1; // MB
    Dropzone.instances[0].options.maxFiles =5;
    Dropzone.instances[0].options.acceptedFiles= "image/jpeg,image/png,image/gif";
    Dropzone.instances[0].options.previewTemplate =  '<div class="col-span-5 md:col-span-2 h-28 relative image-fit cursor-pointer zoom-in">'
                                               +' <img    data-dz-thumbnail >'
                                               +' <div title="Xóa hình này?" class="tooltip w-5 h-5 flex items-center justify-center absolute rounded-full text-white bg-danger right-0 top-0 -mr-2 -mt-2"> <i data-lucide="octagon"   data-dz-remove> x </i> </div>'
                                           +' </div>';
    // Dropzone.instances[0].options.previewTemplate =  '<li><figure><img data-dz-thumbnail /><i title="Remove Image" class="icon-trash" data-dz-remove ></i></figure></li>';      
    Dropzone.instances[0].options.addRemoveLinks =  true;
    Dropzone.instances[0].options.headers= {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')};
 
    Dropzone.instances[0].on("addedfile", function (file ) {
        // Example: Handle success event
        console.log('File addedfile successfully!' );
    });
    Dropzone.instances[0].on("success", function (file, response) {
        // Example: Handle success event
        // file.previewElement.innerHTML = "";
        if(response.status == "true")
        {
            var value_link = $('#photo').val();
            if(value_link != "")
            {
                value_link += ",";
            }
            value_link += response.link;
            $('#photo').val(value_link);
        }
           
        // console.log('File success successfully!' +$('#photo').val());
    });
    Dropzone.instances[0].on("removedfile", function (file ) {
            $('#photo').val('');
        console.log('File removed successfully!'  );
    });
    Dropzone.instances[0].on("error", function (file, message) {
        // Example: Handle success event
        file.previewElement.innerHTML = "";
        console.log(file);
       
        console.log('error !' +message);
    });
     console.log(Dropzone.instances[0].options   );
 
    // console.log(Dropzone.optionsForElement);
 
</script>

<script src="{{ asset('js/js/ckeditor.js') }}"></script>
<script>
    ClassicEditor
        .create(document.querySelector('#editor1'))
        .catch(error => {
            console.error(error);
        });

    ClassicEditor
        .create(document.querySelector('#editor2'))
        .catch(error => {
            console.error(error);
        });
</script>


<script src="{{asset('js/js/ckeditor.js')}}"></script>

@endsection