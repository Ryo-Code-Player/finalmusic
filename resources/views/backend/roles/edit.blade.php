@extends('backend.layouts.master')
@section ('scriptop')

<meta name="csrf-token" content="{{ csrf_token() }}">
 
@endsection
@section('content')

<div class = 'content'>
    <div class="intro-y flex items-center mt-8">
        <h2 class="text-lg font-medium mr-auto">
            Điều chỉnh role
        </h2>
    </div>
    <div class="grid grid-cols-12 gap-12 mt-5">
        <div class="intro-y col-span-12 lg:col-span-12">
            <!-- BEGIN: Form Layout -->
            <form method="post" action="{{route('admin.role.update',$role->id)}}">
                @csrf
                @method('patch')
                <div class="intro-y box p-5">
                    <div>
                        <label for="regular-form-1" class="form-label">Alias</label>
                         <h6 class="font-medium" > {{$role->alias}} </h6>
                    </div>
                    <div class="mt-3">
                        <label for="regular-form-1" class="form-label">Tiêu đề</label>
                        <input id="title" name="title" type="text" value="{{$role->title}}" class="form-control" placeholder="title">
                    </div>
                     
                    <div class="mt-3">
                        <div class="flex flex-col sm:flex-row items-center">
                            <label style="min-width:70px  " class="form-select-label" for="status">Tình trạng</label>
                           
                            <select name="status"  class="form-select mt-2 sm:mr-2"   >
                               
                                <option value ="active" {{$role->status=='active'?'selected':''}}>Active</option>
                                <option value = "inactive" {{$role->status=='inactive'?'selected':''}}>Inactive</option>
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
                        <button type="submit" class="btn btn-primary w-24">Cập nhật</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@section ('scripts')


 
 
 
@endsection