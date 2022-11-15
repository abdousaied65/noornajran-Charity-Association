@extends('site.layouts.app-main')
<style>

</style>
@section('content')
    <main id="main">
        <!-- ======= About Section ======= -->
        <section id="about" class="about" dir="rtl">
            <div class="container">
                <div class="row justify-content-between">
                    <div class="col-lg-5 d-flex align-items-center justify-content-center about-img">
                        <img src="{{asset('assets/img/about-img.svg')}}" class="img-fluid" alt="" data-aos="zoom-in">
                    </div>
                    <div class="col-lg-6 pt-5 pt-lg-0">
                        <h3 data-aos="fade-up">
                            {{$about_content->title}}
                        </h3>
                        <p data-aos="fade-up" data-aos-delay="100" style="text-align: justify;text-justify: inter-word;">
                            {{$about_content->description}}
                        </p>
                        <div class="row">
                            <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                                <i class="bx bx-receipt"></i>
                                <h4>{{$about_content->paragraph_one_title}}</h4>
                                <p style="text-align: justify;text-justify: inter-word;">
                                    {{$about_content->paragraph_one_text}}
                                </p>
                            </div>
                            <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                                <i class="bx bx-cube-alt"></i>
                                <h4>{{$about_content->paragraph_two_title}}</h4>
                                <p style="text-align: justify;text-justify: inter-word;">
                                    {{$about_content->paragraph_two_text}}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- End About Section -->
    </main>
    <!-- End #main -->

@endsection
