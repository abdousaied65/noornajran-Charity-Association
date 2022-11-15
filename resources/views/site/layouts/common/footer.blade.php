<!-- ======= Footer ======= -->
<footer id="footer">
    <div class="footer-newsletter">
        <div class="container">
            @if (session('success-subscribe'))
                <div class="alert alert-success  text-center" style="margin-top: 30px;">
                    {{ session('success-subscribe') }}
                </div>
            @endif
            @if (session('error-subscribe'))
                <div class="alert alert-danger  text-center" style="margin-top: 30px;">
                    {{ session('error-subscribe') }}
                </div>
            @endif
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <h4>اشترك فى القائمة البريدية خاصتنا</h4>
                    <p>
                        اكتب بالاسفل البريد الالكترونى الخاص بك حتى تشترك
                        <br>
                        فى القائمة البريدية خاصتنا ويصلك كل جديد لدينا
                    </p>
                    <form action="{{route('subscribe')}}" method="post">
                        @csrf
                        @method('POST')
                        <input class="form-control" type="email" name="email"><input type="submit" value="اشترك">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-top" dir="rtl">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 footer-contact">
                    <h4 style="color:#2c929e;">
                        {{$settings->arabic_name}}
                    </h4>
                    <p>
                        <i class="bx bx-map-pin"></i>
                        <strong> العنوان : </strong> {{$informations->address}}
                    </p>
                    <p>
                        <i class="bx bx-phone-call"></i>
                        <strong> رقم الجوال : </strong> {{$informations->phone_number}} <br>
                    </p>
                    <p>
                        <i class="bx bx-envelope"></i>
                        <strong> البريد الالكترونى : </strong> {{$informations->email}} <br>
                    </p>
                </div>

                <div class="col-lg-2 col-md-6 footer-links">
                    <h4 style="color:#2c929e;">روابط هامة</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="{{route('index')}}">الرئيسية</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="{{route('about')}}">من نحن</a></li>
                        <li>
                            <i class="bx bx-chevron-right"></i>
                            <a data-bs-toggle="modal" href="javascript:;" data-bs-target="#exampleModal20">
                                شروط الاستخدام
                            </a>
                        </li>
                        <li>
                            <i class="bx bx-chevron-right"></i>
                            <a data-bs-toggle="modal" href="javascript:;" data-bs-target="#exampleModal30">
                                سياسة الخصوصية
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="col-lg-2 col-md-6 footer-links">
                    <h4 style="color:#2c929e;">تسجيل الدخول</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="{{route('volunteer.login')}}">تسجيل دخول
                                متطوع</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="{{route('beneficiary.login')}}">تسجيل دخول
                                مستفيد</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="{{route('specialist.login')}}">تسجيل دخول
                                اخصائى</a></li>
                    </ul>
                </div>

                <div class="col-lg-4 col-md-6 footer-links">
                    <h4 style="color:#2c929e;">تواصل معنا من اى مكان فى اى وقت</h4>
                    <p>
                        تستطيع التواصل معنا من خلال
                        <br>
                        منصات التواصل الاجتماعى فى اى وقت
                    </p>
                    <div class="social-links mt-3">
                        @if(!empty($informations->facebook))
                            <a target="_blank" href="{{$informations->facebook}}" class="facebook"><i
                                    class="bx bxl-facebook"></i></a>
                        @endif
                        @if(!empty($informations->instagram))
                            <a target="_blank" href="{{$informations->instagram}}" class="instagram"><i
                                    class="bx bxl-instagram"></i></a>
                        @endif
                        @if(!empty($informations->twitter))
                            <a target="_blank" href="{{$informations->twitter}}" class="twitter"><i
                                    class="bx bxl-twitter"></i></a>
                        @endif
                        @if(!empty($informations->snapchat))
                            <a target="_blank" href="{{$informations->snapchat}}" class="snapchat"><i
                                    class="bx bxl-snapchat"></i></a>
                        @endif
                        @if(!empty($informations->telegram))
                            <a target="_blank" href="{{$informations->telegram}}" class="telegram"><i
                                    class="bx bxl-telegram"></i></a>
                        @endif
                        @if(!empty($informations->website))
                            <a target="_blank" href="{{$informations->website}}" class="website"><i
                                    class="fa fa-globe"></i></a>
                        @endif

                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="container text-center justify-content-center align-content-center">
        <div class="copyright text-center">
            &copy; حقوق النشر <strong><span style="color:#2c929e;">
                    {{$settings->arabic_name}}
                </span></strong>. جميع الحقوق
            محفوظة
        </div>
    </div>
</footer><!-- End Footer -->
