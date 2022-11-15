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
                        تعديل صفحة من نحن
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.about_content.update')}}" method="post"
                          enctype="multipart/form-data">
                        @csrf
                        @method('POST')
                        <div class="row mb-3">
                            <div class="col-md-4 pull-right">
                                <label> عنوان الفقرة <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="title" value="{{$about_content->title}}" />
                            </div>
                            <div class="col-md-8 pull-right">
                                <label> الوصف (فقرة ما تحت العنوان) <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="description" value="{{$about_content->description}}" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4 pull-right">
                                <label> عنوان الفقرة الاولى <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="paragraph_one_title" value="{{$about_content->paragraph_one_title}}" />
                            </div>
                            <div class="col-md-8 pull-right">
                                <label> نص الفقرة الاولى <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="paragraph_one_text" value="{{$about_content->paragraph_one_text}}" />
                            </div>

                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4 pull-right">
                                <label> عنوان الفقرة الثانية <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="paragraph_two_title" value="{{$about_content->paragraph_two_title}}" />
                            </div>
                            <div class="col-md-8 pull-right">
                                <label> نص الفقرة الثانية <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="paragraph_two_text" value="{{$about_content->paragraph_two_text}}" />
                            </div>

                        </div>

                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">تحديث</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
