@extends('site.layouts.app-main')
<style>
    #main {
        margin-top: 0px !important;
    }
    .icon-box{
        max-height: 250px!important;
        min-height: 250px!important;
        height: 250px!important;
        min-width: 100% !important;
        max-width: 100% !important;
        width: 100% !important;
    }
</style>
@section('content')

    <!-- ======= Hero Section ======= -->
    <section id="hero">
        <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

            <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

            <div class="carousel-inner" role="listbox">
            @if(isset($sliders) && !$sliders->isEmpty())
                @foreach($sliders as $slider)
                    <!-- Slide -->
                        <div class="carousel-item @if ($loop->first) active @endif">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <img style="width: 100%; height: 400px; margin: 20px auto !important;"
                                             class="animated" src="{{asset($slider->image_path)}}" alt="">
                                    </div>
                                    <div class="col-lg-6" style="padding-top: 100px!important;">
                                        <h2>
                                            {{$slider->title}}
                                        </h2>
                                        <h4 class="m-5" dir="rtl" style="color: #e91e63!important;font-size: 20px;text-align: justify;text-justify: inter-word;">
                                            {{$slider->text}}
                                        </h4>
                                        <div>
                                            <a href="{{route('about')}}" class="btn-get-started scrollto">تعرف علينا
                                                اكثر</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Slide -->
                @endforeach
            @else
                <!-- Slide -->
                    <div class="carousel-item active">
                        <div class="container">
                            <div class="row" dir="rtl">
                                <div class="col-lg-6" style="padding-top: 100px!important;">
                                    <h2>هنا عنوان يمكن استبداله </h2>
                                    <h3 style="color: #e91e63!important;">
                                        هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من
                                        مولد النص العربى،
                                        حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى
                                    </h3>
                                    <div>
                                        <a href="{{route('about')}}" class="btn-get-started scrollto">تعرف علينا
                                            اكثر</a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <img style="width: 100%; height: 400px; margin: 20px auto !important;"
                                         class="animated" src="{{asset('assets/img/slide/1.png')}}" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Slide -->
                    <!-- Slide -->
                    <div class="carousel-item">
                        <div class="container">
                            <div class="row" dir="rtl">
                                <div class="col-lg-6" style="padding-top: 100px!important;">
                                    <h2>هنا عنوان يمكن استبداله </h2>
                                    <h3 style="color: #e91e63!important;">
                                        هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من
                                        مولد النص العربى،
                                        حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى
                                    </h3>
                                    <div>
                                        <a href="{{route('about')}}" class="btn-get-started scrollto">تعرف علينا
                                            اكثر</a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <img style="width: 100%; height: 400px; margin: 20px auto !important;"
                                         class="animated" src="{{asset('assets/img/slide/2.png')}}" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Slide -->
                    <!-- Slide -->
                    <div class="carousel-item">
                        <div class="container">
                            <div class="row" dir="rtl">
                                <div class="col-lg-6" style="padding-top: 100px!important;">
                                    <h2>هنا عنوان يمكن استبداله </h2>
                                    <h3 style="color: #e91e63!important;">
                                        هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من
                                        مولد النص العربى،
                                        حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى
                                    </h3>
                                    <div>
                                        <a href="{{route('about')}}" class="btn-get-started scrollto">تعرف علينا
                                            اكثر</a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <img style="width: 100%; height: 400px; margin: 20px auto !important;"
                                         class="animated" src="{{asset('assets/img/slide/3.png')}}" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Slide -->
                    <!-- Slide -->
                    <div class="carousel-item">
                        <div class="container">
                            <div class="row" dir="rtl">
                                <div class="col-lg-6" style="padding-top: 100px!important;">
                                    <h2>هنا عنوان يمكن استبداله </h2>
                                    <h3 style="color: #e91e63!important;">
                                        هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من
                                        مولد النص العربى،
                                        حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى
                                    </h3>
                                    <div>
                                        <a href="{{route('about')}}" class="btn-get-started scrollto">تعرف علينا
                                            اكثر</a>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <img style="width: 100%; height: 400px; margin: 20px auto !important;"
                                         class="animated" src="{{asset('assets/img/slide/4.png')}}" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Slide -->

                @endif
            </div>

            <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
                <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
            </a>

            <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
                <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
            </a>

        </div>
    </section><!-- End Hero -->

    <main id="main">
        <!-- ======= Services Section ======= -->
        <section id="services" class="services section-bg">
            <div class="container" data-aos="fade-up">

                <div class="section-title">
                    <p>
                        {{$index_content->title}}
                    </p>
                </div>

                <div class="row" dir="rtl">
                    <div style="cursor: pointer;" class="col-md-6 col-lg-3 d-flex align-items-stretch"
                         data-aos="zoom-in" data-aos-delay="100">
                        <div class="icon-box">
                            <a href="{{route('beneficiary.login')}}">
                                <div class="icon"><i class="bx bx-group"></i></div>
                                <h4 class="title"><a href="{{route('beneficiary.login')}}">
                                        المستفيدين
                                    </a></h4>
                                <p class="description">
                                    {{mb_substr($index_content->beneficiaries_text,0,90)}} ..
                                </p>
                            </a>
                        </div>
                    </div>

                    <div style="cursor:pointer;" class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in"
                         data-aos-delay="200">
                        <div class="icon-box">
                            <a href="{{route('volunteer.login')}}">
                                <div class="icon"><i class="bx bx-user-plus"></i></div>
                                <h4 class="title"><a href="{{route('volunteer.login')}}">
                                        المتطوعين
                                    </a></h4>
                                <p class="description">
                                    {{mb_substr($index_content->volunteers_text,0,90)}} ..
                                </p>
                            </a>
                        </div>
                    </div>

                    <div style="cursor: pointer;" class="col-md-6 col-lg-3 d-flex align-items-stretch"
                         data-aos="zoom-in" data-aos-delay="300">
                        <div class="icon-box">
                            <a href="{{route('orders.create')}}">
                                <div class="icon"><i class="bx bx-list-ul"></i></div>
                                <h4 class="title"><a href="{{route('orders.create')}}">
                                        الطلبات
                                    </a></h4>
                                <p class="description">
                                    {{mb_substr($index_content->orders_text,0,90)}} ..
                                </p>
                            </a>
                        </div>
                    </div>

                    <div style="cursor: pointer;" class="col-md-6 col-lg-3 d-flex align-items-stretch"
                         data-aos="zoom-in" data-aos-delay="400">
                        <div class="icon-box">
                            <a href="{{route('jobs.create')}}">
                                <div class="icon"><i class="bx bx-task"></i></div>
                                <h4 class="title"><a href="{{route('jobs.create')}}">
                                        الوظائف
                                    </a></h4>
                                <p class="description">
                                    {{mb_substr($index_content->jobs_text,0,90)}} ..
                                </p>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- End Services Section -->
    </main>
    <!-- End main -->
@endsection
