@extends('site.layouts.app-main')
<style>
    form label, form a {
        font-size: 15px !important;
    }

    .input-group-prepend {
        width: 40px;
        font-size: 15px;
        text-align: center;
        padding-top: 10px;
        border-radius: 0px !important;
        height: 45px;
        background: #ddd;
    }

</style>
@section('content')
    <section class="login section-padding contact" style="margin-top: 100px!important;" dir="rtl">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-12 col-xs-12">
                    <div class="alert alert-danger alert-md text-center mt-4 mb-4">
                        <a class="text-center" href="{{route('beneficiary.register')}}">
                            ليس لديك حساب. يرجى الضغط هنا لإنشاء حساب جديد
                        </a>
                    </div>
                    <div class="login-form login-area">
                        <h3 style="border-radius: 0;" class="alert alert-md alert-info text-center mb-4">
                            تسجيل الدخول المستفيدين
                        </h3>
                        @if (session('success'))
                            <div class="alert alert-success" role="alert">
                                {{ session('success') }}
                            </div>
                        @endif
                        @if (session('error'))
                            <div class="alert alert-danger text-center" role="alert">
                                {{ session('error') }}
                            </div>
                        @endif
                        <form id="myForm" class="login-form" method="POST" action="{{route('beneficiary.login')}}">
                            @csrf
                            <div class="form-group mt-1 mb-3">
                                <label class="d-block" for="sender-email">البريد الالكترونى </label>
                                <input dir="ltr" required type="text"
                                       class="form-control @if(count($errors) > 0) is-invalid @endif"
                                       name="email"
                                       placeholder=" البريد الالكترونى  " value="{{old('email')}}">
                                @if (count($errors) > 0)
                                    @foreach ($errors->all() as $error)
                                        <span class="invalid-feedback" role="alert">
                                                <strong>{{ $error }}</strong>
                                            </span>
                                    @endforeach
                                @endif
                            </div>
                            <div class="form-group mt-1 mb-3">
                                <label class="d-block" for="password">
                                    كلمة المرور
                                </label>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend showPassword">
                                        <span class="input-group-text" id="basic-addon1">
                                            <i class="fa fa-eye basic-addon1"></i>
                                        </span>
                                    </div>
                                    <input minlength="8" id="password" type="password"
                                           class="form-control @error('password') is-invalid @enderror text-left"
                                           dir="ltr" name="password" required placeholder="كلمة المرور"
                                           aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <div class="row">
                                    <div class="col-lg-6 col-sm-12 pull-right text-right">
                                        <input id="checkedall" style="display: inline!important;" type="checkbox"
                                               name="remember" checked>
                                        <label for="checkedall" style="display: inline!important;">تذكرنى</label>
                                    </div>
                                    <div class="col-lg-6 col-sm-12 pull-left" dir="ltr">
                                        <a href="{{route('beneficiary.password.request')}}">هل نسيت كلمة
                                            المرور ؟</a>
                                    </div>
                                </div>

                            </div>

                            <div class="text-center">
                                <button button type="submit">تسجيل الدخول</button>
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
    </script>
@endsection
