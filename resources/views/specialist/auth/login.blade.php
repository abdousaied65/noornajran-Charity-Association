@extends('specialist.layouts.master2')
@section('content')
    <div class="container-fluid">
        <div class="row no-gutter">
            <!-- The image half -->
            <!-- The content half -->
            <div class="col-md-6 col-lg-6 col-xl-5 bg-white">
                <div class="login d-flex align-items-center py-2">
                    <!-- Demo content-->
                    <div class="container p-0">
                        <div class="row">
                            <div class="col-md-10 col-lg-10 col-xl-9 mx-auto">
                                <div class="card-sigin">
                                    <div class="mb-5 text-center"><a href="{{route('index')}}"><img
                                                src="{{URL::asset($settings->logo)}}"
                                                class="sign-favicon ht-100" alt="logo"></a>

                                    </div>
                                    <div class="card-sigin">
                                        <div class="main-signup-header">
                                            <h2 class="text-danger">مرحبا بك</h2>
                                            <h5 class="font-weight-semibold alert alert-sm alert-danger text-center mb-4">
                                                تسجيل الدخول كأخصائى</h5>
                                            <form method="POST" action="{{ route('specialist.login') }}">
                                                @csrf
                                                <div class="form-group">
                                                    <label>البريد الالكتروني</label>
                                                    <input id="email" type="email"
                                                           class="form-control @error('email') is-invalid @enderror"
                                                           name="email" dir="ltr" value="{{ old('email') }}" required
                                                           autocomplete="email" autofocus>
                                                    @error('email')
                                                    <span class="invalid-feedback" role="alert">
                                                     <strong>{{ $message }}</strong>
                                                     </span>
                                                    @enderror
                                                </div>

                                                <div class="form-group">
                                                    <label>كلمة المرور</label>

                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text showPassword"
                                                                  id="basic-addon1"><i
                                                                    class="fa fa-eye basic-addon1"></i></span>
                                                        </div>
                                                        <input id="password" type="password"
                                                               class="form-control @error('password') is-invalid @enderror text-left"
                                                               dir="ltr" name="password" required
                                                               aria-describedby="basic-addon1">
                                                    </div>

                                                    @error('password')
                                                    <span class="invalid-feedback" role="alert">
                                                  <strong>{{ $message }}</strong>
                                                  </span>
                                                    @enderror
                                                    <div class="form-group row">
                                                        <div class="col-md-6 offset-md-4">
                                                            <div class="form-check">
                                                                <input checked class="form-check-input bg-danger" type="checkbox"
                                                                       name="remember"
                                                                       id="remember" {{ old('remember') ? 'checked' : '' }}>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <label class="form-check-label text-danger" for="remember">
                                                                    {{ __('تذكرني') }}
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-danger btn-block">
                                                    تسجيل الدخول كأخصائى
                                                </button>
                                            </form>
                                            @if (Route::has('specialist.password.request'))
                                                <a class="btn btn-link text-danger mt-1 pull-right"
                                                   href="{{ route('specialist.password.request') }}">
                                                    هل نسيت كلمة المرور ؟
                                                </a>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- End -->
                </div>
            </div><!-- End -->

            <div class="col-md-6 col-lg-6 col-xl-7 d-none d-md-flex bg-danger-transparent">
                <div class="row wd-100p mx-auto text-center">
                    <div class="col-md-12 col-lg-12 col-xl-12 my-auto mx-auto wd-100p">
                        <img src="{{URL::asset($settings->logo)}}" class="w-50 h-50" alt="logo">
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection
@section('js')
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
