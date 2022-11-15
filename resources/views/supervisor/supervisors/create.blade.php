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
                        اضافة مشرف جديد
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.supervisors.store','test')}}" method="post"
                          enctype="multipart/form-data">
                        {{csrf_field()}}
                        <div class="row m-t-3 mb-3">
                            <div class="parsley-input col-md-4" id="fnWrapper">
                                <label> اسم المشرف <span class="text-danger">*</span></label>
                                <input class="form-control mg-b-20"
                                       data-parsley-class-handler="#lnWrapper" name="first_name" required=""
                                       type="text">
                            </div>
                            <div class="parsley-input col-md-4" id="fnWrapper">
                                <label> اسم الاب <span class="text-danger">*</span></label>
                                <input class="form-control mg-b-20"
                                       data-parsley-class-handler="#lnWrapper" name="second_name" required=""
                                       type="text">
                            </div>
                            <div class="parsley-input col-md-4" id="fnWrapper">
                                <label> اسم الجد <span class="text-danger">*</span></label>
                                <input class="form-control mg-b-20"
                                       data-parsley-class-handler="#lnWrapper" name="third_name" required=""
                                       type="text">
                            </div>
                        </div>
                        <div class="row m-t-3 mb-3">
                            <div class="parsley-input col-md-4" id="fnWrapper">
                                <label> اسم العائلة <span class="text-danger">*</span></label>
                                <input class="form-control mg-b-20"
                                       data-parsley-class-handler="#lnWrapper" name="fourth_name" required=""
                                       type="text">
                            </div>
                            <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                <label> البريد الالكترونى : <span class="text-danger">*</span></label>
                                <input class="form-control  mg-b-20" style="text-align: left;direction:ltr;"
                                       data-parsley-class-handler="#lnWrapper" name="email" required=""
                                       type="email">
                            </div>
                            <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                                <label class="form-label"> مجموعة المشرفين </label>
                                <select data-live-search="true" data-style="btn-info" title="اختر مجموعة المشرفين"
                                        class="form-control selectpicker" required name="role_name">
                                    @foreach($roles as $role)
                                        <option value="{{$role}}">{{$role}}</option>
                                    @endforeach
                                </select>
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
                                           dir="ltr" name="password" required
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
                                           dir="ltr" name="confirm-password" required
                                           aria-describedby="basic-addon2">
                                </div>
                            </div>
                            <div class="col-lg-4 mb-2">
                                <label for=""> الصورة الشخصية </label>
                                <input accept="image/*" type="file"
                                       oninput="pic.src=window.URL.createObjectURL(this.files[0])" id="file"
                                       name="profile_pic" class="form-control">
                                <label for="" class="d-block"> معاينة الصورة </label>
                                <img id="pic" src=""
                                     style="width: 100px; height:100px;"/>
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
