<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center">
    <div dir="rtl" class="container d-flex align-items-center justify-content-between">
        <div class="logo pull-right" style="margin-top: 30px!important;">
            <a class="logo_img" href="{{route('index')}}">
                <img src="{{asset($settings->logo)}}">
            </a>
        </div>

        <nav id="navbar" class="navbar pull-left">
            <ul>
                <li><a class="nav-link scrollto {{ Request::is('/') ? 'active' : '' }}" href="{{route('index')}}">الرئيسية</a>
                </li>
                <li><a class="nav-link scrollto {{ Request::is('about') ? 'active' : '' }}" href="{{route('about')}}">من
                        نحن</a></li>
                <li class="dropdown">
                    <a href="javascript:;"><span> الوظائف </span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="{{route('jobs.create')}}">
                                طلب وظيفة
                            </a></li>
                        <li><a href="{{route('jobs.index')}}">
                                البحث فى طلباتك للوظائف
                            </a></li>

                        <li><a href="{{route('show.offers')}}">
                                عرض الوظائف المطروحة
                            </a></li>

                    </ul>
                </li>
                <li class="dropdown">
                    <a href="javascript:;"><span> الطلبات </span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="{{route('orders.create')}}">
                                تقديم الطلب
                            </a></li>
                        <li><a href="{{route('orders.index')}}">
                                البحث فى الطلبات
                            </a></li>
                    </ul>
                </li>
                <li><a class="nav-link scrollto {{ Request::is('contact') ? 'active' : '' }}"
                       href="{{route('contact')}}">تواصل معنا</a></li>
                <li class="dropdown">
                    <a href="javascript:;"><span>تسجيل الدخول</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="{{route('volunteer.login')}}">تسجيل دخول متطوع</a></li>
                        <li><a href="{{route('beneficiary.login')}}">تسجيل دخول مستفيد</a></li>
                        <li><a href="{{route('specialist.login')}}">تسجيل دخول اخصائى</a></li>
                    </ul>
                </li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->
