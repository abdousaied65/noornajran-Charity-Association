@extends('site.layouts.app-main')

@section('content')
    <section class="login section-padding contact" style="margin-top: 100px!important;" dir="rtl">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-12 col-xs-12">
                    <div class="login-form login-area">
                        @if (session('success'))
                            <div class="alert alert-success" role="alert">
                                {{ session('success') }}
                            </div>
                        @endif

                        <h3 class="text-center mb-4">
                            اعادة تعيين كلمة المرور المستفيدين
                        </h3>
                        @if (session('status'))
                            <div class="alert alert-success text-center" role="alert">
                                {{ session('status') }}
                            </div>
                        @endif
                        <form id="myForm" action="{{ route('beneficiary.password.email') }}" method="post"
                              class="login-form">
                            @csrf

                            <div class="form-group">
                                <label class="d-block mt-1 mb-3" for="sender-email">
                                    البريد الالكترونى
                                </label>
                                <div class="input-icon">
                                    <input type="email" id="sender-email"
                                           class="form-control @error('email') is-invalid @enderror"
                                           style="padding-left: 60px !important;" name="email"
                                           value="{{ old('email') }}" required autocomplete="email"
                                           autofocus placeholder="البريد الالكترونى">
                                    @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong> {{$message}}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-common log-btn">
                                    ارسال رابط اعادة تعيين كلمةالمرور
                                </button>
                            </div>
                            <div class="form-group mt-4">
                                <ul class="form-links">
                                    <li class="float-left mt-2 mb-4"><a href="{{route('beneficiary.register')}}">انشاء
                                            حساب جديد</a></li>
                                    <li class="float-right"><a href="{{route('beneficiary.login')}}">العودة الى تسجيل
                                            الدخول </a></li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
