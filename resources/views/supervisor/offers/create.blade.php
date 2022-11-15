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
                        اضافة وظيفة مطروحة جديدة
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.offers.store','test')}}" method="post" enctype="multipart/form-data">
                        {{csrf_field()}}
                        <div class="row m-t-3 mb-3">
                            <div class="col-md-4 pull-right">
                                <label> عنوان الوظيفة <span class="text-danger">*</span></label>
                                <input required type="text" class="form-control" name="title" />
                                <div class="clearfix"></div>
                                <br>
                                <label> الحالة <span class="text-danger">*</span></label>
                                <select name="status" required class="form-control">
                                    <option value="">اختر الحالة</option>
                                    <option value="مفعل">مفعل</option>
                                    <option value="معطل">معطل</option>
                                </select>
                                <div class="clearfix"></div>

                            </div>
                            <div class="col-md-4 pull-right">
                                <label> الوصف <span class="text-danger">*</span></label>
                                <textarea required name="description" class="form-control" style="resize: none; width: 100%; height: 170px;"></textarea>
                            </div>
                            <div class="col-lg-4 mb-2">
                                <label for=""> بروشور الوظيفة </label>
                                <input required accept="image/*" type="file" oninput="pic.src=window.URL.createObjectURL(this.files[0])" id="file"
                                       name="brochure" class="form-control">
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
