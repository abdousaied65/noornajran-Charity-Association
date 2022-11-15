@extends('supervisor.layouts.master')
<style>
</style>
@section('content')
    <!-- row -->
    <div class="row">
        <div class="col-lg-12 col-md-12">

            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <strong>الاخطاء :</strong>
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <div class="card">
                <div class="card-body">
                    <div class="col-lg-12 margin-tb">
                        <h5 style="min-width: 300px;" class="pull-right alert alert-md alert-success">
                            تعديل بيانات الوظيفة
                        </h5>
                        <div class="clearfix"></div>
                    </div>
                    <br>
                    {!! Form::model($offer, ['method' => 'PATCH','enctype' => 'multipart/form-data','route' => ['supervisor.offers.update', $offer->id]]) !!}
                    <div class="row m-t-3 mb-3">
                        <div class="col-md-4 pull-right">
                            <label> عنوان الوظيفة <span class="text-danger">*</span></label>
                            <input required value="{{$offer->title}}" type="text" class="form-control" name="title" />

                            <div class="clearfix"></div>
                            <br>
                            <label> الحالة <span class="text-danger">*</span></label>
                            <select name="status" required class="form-control">
                                <option value="">اختر الحالة</option>
                                <option @if($offer->status == "مفعل") selected @endif value="مفعل">مفعل</option>
                                <option @if($offer->status == "معطل") selected @endif value="معطل">معطل</option>
                            </select>
                            <div class="clearfix"></div>

                        </div>
                        <div class="col-md-4 pull-right">
                            <label> الوصف <span class="text-danger">*</span></label>
                            <textarea required name="description" class="form-control" style="resize: none; width: 100%; height: 170px;">{{$offer->description}}</textarea>
                        </div>
                        <div class="col-lg-4 mb-2">
                            <label for=""> بروشور الوظيفة </label>
                            <input accept="image/*" type="file" oninput="pic.src=window.URL.createObjectURL(this.files[0])" id="file"
                                   name="brochure" class="form-control">
                            <label for="" class="d-block"> معاينة الصورة </label>
                            <img id="pic" src="{{asset($offer->brochure)}}"
                                 style="width: 100px; height:100px;"/>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-lg-12 text-center mt-3 mb-3">
                        <button class="btn btn-info btn-md" type="submit"> تحديث </button>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    <!-- main-content closed -->
@endsection
