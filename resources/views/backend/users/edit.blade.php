@extends('backend.layouts.master')
 
@section ('scriptop')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endsection
@section('content')

 
    <div class="intro-y flex items-center mt-8">
        <h2 class="text-lg font-medium mr-auto">
            Điều chỉnh người dùng
        </h2>
    </div>
  
    <div class="grid grid-cols-12 gap-12 mt-5">
        <div class="intro-y col-span-12 lg:col-span-12">
             <!-- BEGIN: Form Layout -->
            
             <form method="post" action="{{route('admin.user.update',$user->id)}}">
                @csrf
                @method('patch')
                <div class="intro-y box p-5">
                    
                    <div>
                        <label for="regular-form-1" class="form-label">Tên</label>
                        <input id="title" name="full_name" type="text" value="{{$user->full_name}}" class="form-control" placeholder="tên" required>
                    </div>
                    <!-- upload photo -->
                    <div class="mt-3">
                    <label for="" class="form-label">Photo</label>
                        <div class="px-4 pb-4 mt-5 flex items-center  cursor-pointer relative">
                            <div data-single="true" id="mydropzone" class="dropzone  "    url="{{route('admin.upload.avatar')}}" >
                                <div class="fallback"> <input name="file" type="file" /> </div>
                                <div class="dz-message" data-dz-message>
                                    <div class=" font-medium">Kéo thả hoặc chọn ảnh.</div>
                                        
                                </div>
                            </div>
                             
                        </div>
                        <div class="grid grid-cols-10 gap-5 pl-4 pr-5 py-5">
                                <?php
                                    $photos = explode( ',', $user->photo);
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
                    <!-- end upload photo -->
                    @if(auth()->user()->role=="admin")
                    <div class="mt-3">
                        <label for="regular-form-1" class="form-label">Điện thoại</label>
                        <input id="phone" value="{{$user->phone}}" name="phone" type="text" class="form-control" placeholder="điện thoại" required>
                        <div class="form-help">Chỉ admin mới có quyền thay đổi. Tuy nhiên số điện thoại không được trùng.</div>
                    </div>
                    @endif
                    <div class="mt-3">
                        <label for="regular-form-1" class="form-label">Địa chỉ</label>
                        <input id="address" name="taxaddress" value="{{$user->taxaddress}}"  type="text" class="form-control" placeholder="địa chỉ" required>
                    </div>
                    <div class="mt-3">
                        <label for="regular-form-1" class="form-label">Email</label>
                        <input id="email" name="email" value="{{$user->email}}" type="text" class="form-control" placeholder="email">
                        
                    </div>
                    <div class="mt-3">
                        <label for="regular-form-1" class="form-label">Password</label>
                        <input id="password" name="password" type="text" class="form-control" placeholder="password">
                        <div class="form-help">Để trống nếu không reset mật khẩu</div>
                    </div>
                    <div class="mt-3">
                        
                        <label for="" class="form-label">Mô tả</label>
                       
                        <textarea class="editor"   id="editor1" name="description" >
                            <?php echo $user->description;?>
                        </textarea>
                    </div>
                   
                    <div class="mt-3">
                        <div class="flex flex-col sm:flex-row items-center">
                            <label style="min-width:70px  " class="form-select-label" for="">Vai trò</label><br/>
                            <select name="role"  class="form-select mt-2 sm:mr-2"   >
                                @foreach ($uroles as $role )
                                <option {{$user->role==$role->alias?'selected':''}} value ="{{$role->alias}}"> {{$role->title}} </option> 
                                
                                @endforeach
                                
                            </select>
                        </div>
                    </div>
                   <div class="mt-3">
                        <div class="flex flex-col sm:flex-row items-center">
                            <label style="min-width:70px  " class="form-select-label" for="status">Nhóm người dùng</label><br/>
                            <select name="ugroup_id"  class="form-select mt-2 sm:mr-2"   >
                                
                                @foreach($ugroups as $ugroup)
                                    <option value ="{{$ugroup->id}}" {{$ugroup->id == $user->ugroup_id?'selected':''}}> {{ $ugroup->title}} </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="mt-3">
                        <div class="flex flex-col sm:flex-row items-center">
                            <label style="min-width:70px  " class="form-select-label"  for="status">Tình trạng</label>
                           
                            <select name="status" class="form-select mt-2 sm:mr-2"   >
                                <option value ="active" {{$user->status=='active'?'selected':''}}>Active</option>
                                <option value = "inactive" {{$user->status =='inactive'?'selected':''}}>Inactive</option>
                            </select>
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
                        <button type="submit" class="btn btn-primary w-24">Lưu</button>
                    </div>
                </div>
            </form>
           <!-- end form -->
             
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
    // Dropzone.instances[0].options.multiple = true;
    // Dropzone.instances[0].options.autoQueue= true;
    // Dropzone.instances[0].options.maxFilesize =  1; // MB
    // Dropzone.instances[0].options.maxFiles =5;
    // Dropzone.instances[0].options.acceptedFiles= "image/jpeg,image/png,image/gif";
    // Dropzone.instances[0].options.previewTemplate =  '<div class="col-span-5 md:col-span-2 h-28 relative image-fit cursor-pointer zoom-in">'
    //                                            +' <img    data-dz-thumbnail >'
    //                                            +' <div title="Xóa hình này?" class="tooltip w-5 h-5 flex items-center justify-center absolute rounded-full text-white bg-danger right-0 top-0 -mr-2 -mt-2"> <i data-lucide="octagon"   data-dz-remove> x </i> </div>'
    //                                        +' </div>';
    // // Dropzone.instances[0].options.previewTemplate =  '<li><figure><img data-dz-thumbnail /><i title="Remove Image" class="icon-trash" data-dz-remove ></i></figure></li>';      
    // Dropzone.instances[0].options.addRemoveLinks =  true;
    // Dropzone.instances[0].options.headers= {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')};

    Dropzone.instances[0].options.multiple = false;
        Dropzone.instances[0].options.autoQueue= true;
        Dropzone.instances[0].options.maxFilesize =  1; // MB
        Dropzone.instances[0].options.maxFiles =1;
        Dropzone.instances[0].options.dictDefaultMessage = 'Drop images anywhere to upload (6 images Max)';
        Dropzone.instances[0].options.acceptedFiles= "image/jpeg,image/png,image/gif";
        Dropzone.instances[0].options.previewTemplate =  '<div class=" d-flex flex-column  position-relative">'
                                        +' <img    data-dz-thumbnail >'
                                        
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

<script src="{{asset('js/js/ckeditor.js')}}"></script>
 
<script>
     
     // CKSource.Editor
     ClassicEditor.create( document.querySelector( '#editor1' ), 
     {
         ckfinder: {
             uploadUrl: '{{route("admin.upload.ckeditor")."?_token=".csrf_token()}}'
             },
                mediaEmbed: {previewsInData: true}
         

     })

     .then( editor => {
         console.log( editor );
     })
     .catch( error => {
         console.error( error );
     })

</script>
@endsection