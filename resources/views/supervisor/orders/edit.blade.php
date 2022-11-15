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
                            تعديل بيانات الطلب
                        </h5>
                        <div class="clearfix"></div>
                    </div>
                    <br>
                    {!! Form::model($order, ['method' => 'PATCH','enctype' => 'multipart/form-data','route' => ['supervisor.orders.update', $order->id]]) !!}
                    <div class="row m-t-3 mb-3">
                        <div class="parsley-input col-md-3" id="fnWrapper">
                            <label> الاسم <span class="text-danger">*</span></label>
                            <input value="{{$order->first_name}}" class="form-control mg-b-20"
                                   data-parsley-class-handler="#lnWrapper" name="first_name" required="" type="text">
                        </div>
                        <div class="parsley-input col-md-3" id="fnWrapper">
                            <label> اسم الاب <span class="text-danger">*</span></label>
                            <input value="{{$order->second_name}}" class="form-control mg-b-20"
                                   data-parsley-class-handler="#lnWrapper" name="second_name" required="" type="text">
                        </div>
                        <div class="parsley-input col-md-3" id="fnWrapper">
                            <label> اسم الجد <span class="text-danger">*</span></label>
                            <input value="{{$order->third_name}}" class="form-control mg-b-20"
                                   data-parsley-class-handler="#lnWrapper" name="third_name" required="" type="text">
                        </div><div class="parsley-input col-md-3" id="fnWrapper">
                            <label> اسم العائلة <span class="text-danger">*</span></label>
                            <input value="{{$order->fourth_name}}" class="form-control mg-b-20"
                                   data-parsley-class-handler="#lnWrapper" name="fourth_name" required="" type="text">
                        </div>
                    </div>
                    <div class="row mt-2 mb-2">
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label> البريد الالكترونى : <span class="text-danger">*</span></label>
                            <input value="{{$order->email}}" class="form-control  mg-b-20"
                                   style="text-align: left;direction:ltr;"
                                   data-parsley-class-handler="#lnWrapper" name="email" required=""
                                   type="email">
                        </div>
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> رقم الجوال </label>
                            <input value="{{$order->phone_number}}" class="form-control  mg-b-20"
                                   style="text-align: left;direction:ltr;"
                                   data-parsley-class-handler="#lnWrapper" name="phone_number" required=""
                                   type="number" min="1">
                        </div>
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> نوع الاعاقة </label>
                            <select name="disability_id" required class="w-100 js-example-basic-single">
                                @foreach($disabilities as $disability)
                                    <option
                                        @if(isset($order) && $order->disability_id == $disability->id)
                                            selected
                                        @endif
                                        value="{{$disability->id}}">{{$disability->disability}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="row m-t-3 mb-3">
                        <div class="parsley-input col-md-3 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> الجنسية </label>
                            <select name="nationality_id" required class="w-100 js-example-basic-single">
                                @foreach($nationalities as $nationality)
                                    <option
                                        @if(isset($order) && $order->nationality_id == $nationality->id)
                                        selected
                                        @endif
                                        value="{{$nationality->id}}">{{$nationality->nationality}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="parsley-input col-md-3 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> الكمية </label>
                            <input value="{{$order->quantity}}" class="form-control  mg-b-20" style="text-align: left;direction:ltr;"
                                   data-parsley-class-handler="#lnWrapper" name="quantity" required=""
                                   type="number" min="1">
                        </div>
                        <div class="parsley-input col-md-3 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> الحالة </label>
                            <select name="Status" required class="form-control">
                                <option value="">اختر الحالة</option>
                                <option @if(isset($order) && $order->Status == "قيد المراجعة") selected @endif value="قيد المراجعة"> قيد المراجعة</option>
                                <option @if(isset($order) && $order->Status == "تمت الموافقة") selected @endif value="تمت الموافقة"> تمت الموافقة</option>
                                <option @if(isset($order) && $order->Status == "مرفوض") selected @endif value="مرفوض">مرفوض</option>
                            </select>
                        </div>
                        <div class="parsley-input col-md-3 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> نوع الطلب </label>
                            <select name="order_type_id" required class="w-100 js-example-basic-single">
                                @foreach($order_types as $order_type)
                                    <option
                                        @if(isset($order) && $order->order_type_id == $order_type->id)
                                        selected
                                        @endif
                                        value="{{$order_type->id}}">{{$order_type->order_type}}</option>
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
                            <img id="pic" src="{{asset($order->id_pic)}}"
                                 style="width: 100px; height:100px;"/>
                        </div>
                        <div class="col-lg-4 mb-2">
                            <label for=""> صورة التقرير الطبى
                                <span class="text-danger">( لابد ان يكون الملف PDF ) </span>
                            </label>
                            <input required accept=".pdf" type="file" name="medical_report_pic" class="form-control">
                        </div>
                    </div>

                    <div class="col-lg-12 text-center mt-3 mb-3">
                        <button class="btn btn-info btn-md" type="submit"> تحديث</button>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    <!-- main-content closed -->
@endsection
