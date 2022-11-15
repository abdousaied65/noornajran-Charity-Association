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
                        اضافة طلب جديد
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.orders.store','test')}}" method="post"
                          enctype="multipart/form-data">
                        {{csrf_field()}}
                        <div class="row m-t-3 mb-3">
                            <div class="parsley-input col-md-3" id="fnWrapper">
                                <label> الاسم <span class="text-danger">*</span></label>
                                <input class="form-control mg-b-20"
                                       data-parsley-class-handler="#lnWrapper" name="first_name" required="" type="text">
                            </div>
                            <div class="parsley-input col-md-3" id="fnWrapper">
                                <label> اسم الاب <span class="text-danger">*</span></label>
                                <input class="form-control mg-b-20"
                                       data-parsley-class-handler="#lnWrapper" name="second_name" required="" type="text">
                            </div>
                            <div class="parsley-input col-md-3" id="fnWrapper">
                                <label> اسم الجد <span class="text-danger">*</span></label>
                                <input class="form-control mg-b-20"
                                       data-parsley-class-handler="#lnWrapper" name="third_name" required="" type="text">
                            </div>
                            <div class="parsley-input col-md-3" id="fnWrapper">
                                <label> اسم العائلة <span class="text-danger">*</span></label>
                                <input class="form-control mg-b-20"
                                       data-parsley-class-handler="#lnWrapper" name="fourth_name" required="" type="text">
                            </div>
                        </div>
                        <div class="row mt-1 mb-2">
                            <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                <label> البريد الالكترونى : <span class="text-danger">*</span></label>
                                <input class="form-control  mg-b-20" style="text-align: left;direction:ltr;"
                                       data-parsley-class-handler="#lnWrapper" name="email" required=""
                                       type="email">
                            </div>
                            <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                <label class="form-label"> رقم الجوال </label>
                                <input class="form-control  mg-b-20" style="text-align: left;direction:ltr;"
                                       data-parsley-class-handler="#lnWrapper" name="phone_number" required=""
                                       type="number" min="1">
                            </div>
                            <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                <label class="form-label"> نوع الاعاقة </label>
                                <select name="disability_id" required class="w-100 js-example-basic-single">
                                    @foreach($disabilities as $disability)
                                        <option value="{{$disability->id}}">{{$disability->disability}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row m-t-3 mb-3">
                            <div class="parsley-input col-md-3 mg-t-20 mg-md-t-0" id="lnWrapper">
                                <label class="form-label"> الجنسية </label>
                                <select name="nationality_id" required class="w-100 js-example-basic-single">
                                    @foreach($nationalities as $nationality)
                                        <option value="{{$nationality->id}}">{{$nationality->nationality}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="parsley-input col-md-3 mg-t-20 mg-md-t-0" id="lnWrapper">
                                <label class="form-label"> الكمية </label>
                                <input class="form-control  mg-b-20" style="text-align: left;direction:ltr;"
                                       data-parsley-class-handler="#lnWrapper" name="quantity" required=""
                                       type="number" min="1">
                            </div>
                            <div class="parsley-input col-md-3 mg-t-20 mg-md-t-0" id="lnWrapper">
                                <label class="form-label"> الحالة </label>
                                <select name="Status" required class="form-control">
                                    <option value="">اختر الحالة</option>
                                    <option value="قيد المراجعة"> قيد المراجعة</option>
                                    <option value="تمت الموافقة"> تمت الموافقة</option>
                                    <option value="مرفوض">مرفوض</option>
                                </select>
                            </div>
                            <div class="parsley-input col-md-3 mg-t-20 mg-md-t-0" id="lnWrapper">
                                <label class="form-label"> نوع الطلب </label>
                                <select name="order_type_id" required class="w-100 js-example-basic-single">
                                    @foreach($order_types as $order_type)
                                        <option value="{{$order_type->id}}">{{$order_type->order_type}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="row m-t-3 mb-3">
                            <div class="col-lg-4 mb-2">
                                <label for=""> صورة الهوية </label>
                                <input accept="image/*" type="file"
                                       oninput="pic.src=window.URL.createObjectURL(this.files[0])" id="file"
                                       name="id_pic" class="form-control">
                                <label for="" class="d-block"> معاينة الصورة </label>
                                <img id="pic" src=""
                                     style="width: 100px; height:100px;"/>
                            </div>
                            <div class="col-lg-4 mb-2">
                                <label for=""> صورة التقرير الطبى
                                    <span class="text-danger">( لابد ان يكون الملف PDF ) </span>
                                </label>
                                <input required accept=".pdf" type="file" name="medical_report_pic" class="form-control">

                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">تأكيد</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
