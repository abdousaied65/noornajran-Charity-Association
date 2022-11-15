@extends('site.layouts.app-main')
<style>
    .input-group-prepend {
        width: 40px;
        font-size: 15px;
        text-align: center;
        padding-top: 10px;
        border-radius: 0px !important;
        height: 45px;
        background: #ddd;
    }

    .form-control {
        height: 45px !important;
    }
</style>
@section('content')
    <section class="login section-padding contact" style="margin-top: 100px!important;" dir="rtl">
        <div class="container">
            <div class="row justify-content-center">
                <div class="alert alert-warning alert-md text-center mt-4 mb-4">
                    <a class="text-center" href="{{route('beneficiary.login')}}">
                        فى حالة وجود حساب .. يرجى الضغط هنا لتسجيل الدخول
                    </a>
                </div>
                <div class="col-lg-12 col-md-12 col-xs-12">
                    <div class="login-form login-area">
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
                        @if (session('success'))
                            <div class="alert alert-success text-center" role="alert">
                                {{ session('success') }}
                            </div>
                        @endif
                        <h3 style="border-radius: 0;" class="alert alert-md alert-info text-center mb-4">
                            انشاء حساب مستفيد جديد
                        </h3>
                        <form id="myForm" enctype="multipart/form-data" class="login-form" method="POST"
                              action="{{route('beneficiary.register')}}">
                            @csrf
                            @method('POST')
                            <input type="hidden" name="start_date" value="{{date('Y-m-d')}}"/>
                            <input type="hidden" name="end_date" value="{{date('Y-m-d')}}"/>
                            <input type="hidden" name="Status" value="قيد المراجعة"/>
                            <input value="مستفيد" required class="form-control" name="role_name" type="hidden">
                            <div class="row m-t-3 mb-3">
                                <div class="parsley-input col-md-4" id="fnWrapper">
                                    <label> اسم المستفيد <span class="text-danger">*</span></label>
                                    <input class="form-control mg-b-20" value="{{old('first_name')}}"
                                           data-parsley-class-handler="#lnWrapper" name="first_name" required="" type="text">
                                </div>
                                <div class="parsley-input col-md-4" id="fnWrapper">
                                    <label> اسم الاب <span class="text-danger">*</span></label>
                                    <input class="form-control mg-b-20" value="{{old('second_name')}}"
                                           data-parsley-class-handler="#lnWrapper" name="second_name" required="" type="text">
                                </div>
                                <div class="parsley-input col-md-4" id="fnWrapper">
                                    <label> اسم الجد <span class="text-danger">*</span></label>
                                    <input class="form-control mg-b-20" value="{{old('third_name')}}"
                                           data-parsley-class-handler="#lnWrapper" name="third_name" required="" type="text">
                                </div>
                            </div>
                            <div class="row m-t-3 mb-3">
                                <div class="parsley-input col-md-4" id="fnWrapper">
                                    <label> اسم العائلة <span class="text-danger">*</span></label>
                                    <input class="form-control mg-b-20" value="{{old('fourth_name')}}"
                                           data-parsley-class-handler="#lnWrapper" name="fourth_name" required="" type="text">
                                </div>
                                <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                    <label> البريد الالكترونى : <span class="text-danger">*</span></label>
                                    <input class="form-control  mg-b-20" style="text-align: left;direction:ltr;" value="{{old('email')}}"
                                           data-parsley-class-handler="#lnWrapper" name="email" required=""
                                           type="email">
                                </div>
                                <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                    <label> تأكيد البريد الالكترونى : <span class="text-danger">*</span></label>
                                    <input class="form-control  mg-b-20" style="text-align: left;direction:ltr;" value="{{old('email_confirmation')}}"
                                           name="email_confirmation" required
                                           type="email">
                                </div>
                            </div>
                            <div class="row m-t-3 mb-3">
                                <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                    <label class="form-label"> رقم الجوال
                                        <span class="text-danger">( رقم الجوال لابد ان يكون 9665xxxxxx ) </span>
                                    </label>
                                    <input value="{{old('phone_number')}}" class="form-control  mg-b-20" style="text-align: left;direction:ltr;"
                                           maxlength="12" oninput="this.value=this.value.slice(0,this.maxLength)"
                                           name="phone_number" required=""
                                           type="number" min="1">
                                </div>
                                <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                    <label> كلمة المرور :
                                        <span class="text-danger">( كلمة المرور لابد ان تكون على الاقل 8 خانات ) </span>
                                    </label>

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend showPassword">
                                        <span class="input-group-text" id="basic-addon1">
                                            <i class="fa fa-eye basic-addon1"></i>
                                        </span>
                                        </div>
                                        <input minlength="8" id="password" type="password"
                                               class="form-control @error('password') is-invalid @enderror text-left"
                                               dir="ltr" name="password" required
                                               aria-describedby="basic-addon1">
                                    </div>
                                </div>
                                <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                    <label> تأكيد كلمة المرور : <span class="text-danger">*</span></label>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend showPassword2">
                                        <span class="input-group-text"
                                              id="basic-addon2">
                                            <i class="fa fa-eye basic-addon2"></i>
                                        </span>
                                        </div>
                                        <input minlength="8" id="confirm-password" type="password"
                                               class="form-control @error('password') is-invalid @enderror text-left"
                                               dir="ltr" name="password_confirmation" required
                                               aria-describedby="basic-addon2">
                                    </div>
                                </div>
                            </div>
                            <div class="row m-t-3 mb-3">
                                <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                    <label class="form-label"> رقم السجل المدنى
                                        <span class="text-danger">( رقم السجل المدنى لابد ان يكون 10 خانات ) </span>
                                    </label>
                                    <input value="{{old('record')}}" class="form-control  mg-b-20" style="text-align: left;direction:ltr;"
                                           maxlength="10" oninput="this.value=this.value.slice(0,this.maxLength)"
                                           name="record" required=""
                                           type="number" min="1">
                                </div>
                                <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                    <label class="form-label"> نوع الاعاقة </label>
                                    <select name="disability_id" required class="w-100 js-example-basic-single">
                                        @foreach($disabilities as $disability)
                                            <option
                                                @if(old('disability_id') == $disability->id)
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
                                                @if(old('nationality_id') == $nationality->id)
                                                selected
                                                @endif
                                                value="{{$nationality->id}}">{{$nationality->nationality}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3 m-t-3">
                                <div class="col-lg-4 mb-2">
                                    <label for="">صورة الهوية
                                        <span class="text-danger">( لابد ان يكون صورة بصيغة png او jpg او jpeg ) </span>
                                    </label>
                                    <input required accept="image/*" type="file"
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
                            <div class="form-group">
                                <div class="form-check">
                                    <p style="color: #222!important;">
                                        <i class="bx bx-chevron-left"></i>
                                        عند تسجيل الحساب فإنك توافق على
                                        <a data-bs-toggle="modal" href="javascript:;" data-bs-target="#exampleModal20">
                                            شروط الاستخدام
                                        </a>
                                        و
                                        <a data-bs-toggle="modal" href="javascript:;" data-bs-target="#exampleModal30">
                                            سياسة الخصوصية
                                        </a>
                                    </p>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-common log-btn"> انشاء حساب جديد</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
