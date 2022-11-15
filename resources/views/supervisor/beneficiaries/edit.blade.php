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
                            تعديل بيانات المستفيد
                        </h5>
                        <div class="clearfix"></div>
                    </div>
                    <br>
                    {!! Form::model($beneficiary, ['method' => 'PATCH','enctype' => 'multipart/form-data','route' => ['supervisor.beneficiaries.update', $beneficiary->id]]) !!}
                    <input type="hidden" value="مستفيد" name="role_name"/>
                    <div class="row m-t-3 mb-3">
                        <div class="parsley-input col-md-4" id="fnWrapper">
                            <label> اسم المستفيد <span class="text-danger">*</span></label>
                            <input value="{{$beneficiary->first_name}}" class="form-control mg-b-20"
                                   data-parsley-class-handler="#lnWrapper" name="first_name" required="" type="text">
                        </div>
                        <div class="parsley-input col-md-4" id="fnWrapper">
                            <label> اسم الاب <span class="text-danger">*</span></label>
                            <input value="{{$beneficiary->second_name}}" class="form-control mg-b-20"
                                   data-parsley-class-handler="#lnWrapper" name="second_name" required="" type="text">
                        </div>
                        <div class="parsley-input col-md-4" id="fnWrapper">
                            <label> اسم الجد <span class="text-danger">*</span></label>
                            <input value="{{$beneficiary->third_name}}" class="form-control mg-b-20"
                                   data-parsley-class-handler="#lnWrapper" name="third_name" required="" type="text">
                        </div>
                    </div>
                    <div class="row m-t-3 mb-3">
                        <div class="parsley-input col-md-4" id="fnWrapper">
                            <label> اسم العائلة <span class="text-danger">*</span></label>
                            <input value="{{$beneficiary->fourth_name}}" class="form-control mg-b-20"
                                   data-parsley-class-handler="#lnWrapper" name="fourth_name" required="" type="text">
                        </div>

                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label> البريد الالكترونى : <span class="text-danger">*</span></label>
                            <input value="{{$beneficiary->email}}" class="form-control  mg-b-20"
                                   style="text-align: left;direction:ltr;"
                                   data-parsley-class-handler="#lnWrapper" name="email" required=""
                                   type="email">
                        </div>
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> رقم الجوال </label>
                            <input value="{{$beneficiary->phone_number}}" class="form-control  mg-b-20"
                                   style="text-align: left;direction:ltr;"
                                   data-parsley-class-handler="#lnWrapper" name="phone_number" required=""
                                   type="number" min="1">
                        </div>
                    </div>
                    <div class="row m-t-3 mb-3">
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label> كلمة المرور : <span class="text-danger">*</span></label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                        <span class="input-group-text showPassword" id="basic-addon1">
                                            <i class="fa fa-eye basic-addon1"></i>
                                        </span>
                                </div>
                                <input id="password" type="password"
                                       class="form-control @error('password') is-invalid @enderror text-left"
                                       dir="ltr" name="password"
                                       aria-describedby="basic-addon1">
                            </div>
                        </div>
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label> تأكيد كلمة المرور : <span class="text-danger">*</span></label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                        <span class="input-group-text showPassword2"
                                              id="basic-addon2">
                                            <i class="fa fa-eye basic-addon2"></i>
                                        </span>
                                </div>
                                <input id="confirm-password" type="password"
                                       class="form-control @error('password') is-invalid @enderror text-left"
                                       dir="ltr" name="confirm-password"
                                       aria-describedby="basic-addon2">
                            </div>
                        </div>
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> رقم السجل المدنى </label>
                            <input value="{{$beneficiary->record}}" class="form-control  mg-b-20"
                                   style="text-align: left;direction:ltr;"
                                   data-parsley-class-handler="#lnWrapper" name="record" required=""
                                   type="number" min="1">
                        </div>
                    </div>
                    <div class="row m-t-3 mb-3">
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> نوع الاعاقة </label>
                            <select name="disability_id" required class="w-100 js-example-basic-single">
                                @foreach($disabilities as $disability)
                                    <option
                                        @if(isset($beneficiary) && $beneficiary->disability_id == $disability->id)
                                        selected
                                        @endif
                                        value="{{$disability->id}}">{{$disability->disability}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> الجنسية </label>
                            <select name="nationality_id" required class="w-100 js-example-basic-single">
                                @foreach($nationalities as $nationality)
                                    <option
                                        @if(isset($beneficiary) && $beneficiary->nationality_id == $nationality->id)
                                        selected
                                        @endif
                                        value="{{$nationality->id}}">{{$nationality->nationality}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label class="form-label"> الحالة </label>
                            <select name="Status" required class="form-control">
                                <option value="">اختر الحالة</option>
                                <option @if(isset($beneficiary) && $beneficiary->Status == "قيد المراجعة") selected
                                        @endif value="قيد المراجعة"> قيد المراجعة
                                </option>
                                <option @if(isset($beneficiary) && $beneficiary->Status == "تمت الموافقة") selected
                                        @endif value="تمت الموافقة"> تمت الموافقة
                                </option>
                                <option @if(isset($beneficiary) && $beneficiary->Status == "مرفوض") selected
                                        @endif value="مرفوض"> مرفوض
                                </option>
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
                            <img id="pic" src="{{asset($beneficiary->id_pic)}}"
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

    <script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
    <script>
        $(".showPassword").click(function () {
            if ($("#password").attr("type") == "password") {
                $("#password").attr("type", "text");
                $(".showPassword").find('i.fa').toggleClass('fa-eye fa-eye-slash');
            } else {
                $("#password").attr("type", "password");
                $(".showPassword").find('i.fa').toggleClass('fa-eye fa-eye-slash');
            }
        });
        $(".showPassword2").click(function () {
            if ($("#confirm-password").attr("type") == "password") {
                $("#confirm-password").attr("type", "text");
                $(".showPassword2").find('i.fa').toggleClass('fa-eye fa-eye-slash');
            } else {
                $("#confirm-password").attr("type", "password");
                $(".showPassword2").find('i.fa').toggleClass('fa-eye fa-eye-slash');
            }
        });
    </script>

@endsection
