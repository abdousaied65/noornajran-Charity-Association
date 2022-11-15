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
                <div class="card-header pb-0">
                    <h5 class="alert alert-md alert-success">
                        اضافة صورة جديد الى السلايدر
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.slider.store','test')}}" method="post" enctype="multipart/form-data">
                        {{csrf_field()}}
                        <div class="row m-t-3 mb-3">
                            <div class="col-md-4 pull-right">
                                <label for=""> عنوان الفقرة </label>
                                <input required type="text" name="title" class="form-control" />
                            </div>
                            <div class="col-md-4 pull-right">
                                <label for=""> نص الفقرة </label>
                                <textarea required class="form-control" name="text" style="resize: none; width: 100%; height: 200px;"></textarea>
                            </div>
                            <div class="col-md-4 pull-right">
                                <label for=""> الصورة </label>
                                <input required accept="image/*" type="file"
                                       oninput="pic.src=window.URL.createObjectURL(this.files[0])" id="file"
                                       name="image_path" class="form-control">
                                <label for="" class="d-block"> معاينة الصورة </label>
                                <img id="pic" src=""
                                     style="width: 100px; height:100px;"/>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">تأكيد</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
