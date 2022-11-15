@extends('supervisor.layouts.master')
<style>

</style>
@section('content')
    <!-- main-content closed -->
    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <strong>Errors :</strong>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <!-- row opened -->
    <div class="row row-sm">
        <div class="col-xl-12">
            <div class="card">
                @if (session('success'))
                    <div class="alert alert-success  fade show">
                        <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                        {{ session('success') }}
                    </div>
                @endif
                <div class="card-header pb-0">
                    <h5 class="alert alert-md alert-success">
                        اعدادات الموقع
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.settings.update')}}" method="post" enctype="multipart/form-data">
                        @csrf
                        @method('POST')
                        <div class="row m-t-3 mb-3">
                            <div class="col-md-4 pull-right">
                                <label> اسم الموقع باللغة العربية  <span class="text-danger">*</span></label>
                                <input type="text" value="{{$settings->arabic_name}}" class="form-control" name="arabic_name">
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> اسم الموقع باللغة الانجليزية  <span class="text-danger">*</span></label>
                                <input dir="ltr" type="text" value="{{$settings->english_name}}" class="form-control" name="english_name">
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> البريد الالكترونى <span class="text-danger">*</span></label>
                                <input dir="ltr" type="email" value="{{$settings->email}}" class="form-control" name="email">
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="row m-t-3 mb-3">
                            <div class="col-md-4 pull-right">
                                <label> الوصف <span class="text-danger">*</span></label>
                                <textarea class="form-control" name="description" style="resize: none; width: 100%; height: 250px;">{{$settings->description}}</textarea>
                            </div>
                            <div class="col-lg-4 mb-2">
                                <label for=""> الشعار </label>
                                <input accept="image/*" type="file" oninput="pic.src=window.URL.createObjectURL(this.files[0])" id="file"
                                       name="logo" class="form-control">
                                <label for="" class="d-block"> معاينة الصورة </label>
                                <img id="pic" src="{{asset($settings->logo)}}"
                                     style="width: 100px; height:100px;"/>
                            </div>
                            <div class="col-lg-4 mb-2">
                                <label for=""> الأيقونة المفضلة </label>
                                <input accept="image/*" type="file" oninput="pic2.src=window.URL.createObjectURL(this.files[0])" id="file"
                                       name="favicon" class="form-control">
                                <label for="" class="d-block"> معاينة الصورة </label>
                                <img id="pic2" src="{{asset($settings->favicon)}}"
                                     style="width: 100px; height:100px;"/>
                            </div>

                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">تحديث</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
