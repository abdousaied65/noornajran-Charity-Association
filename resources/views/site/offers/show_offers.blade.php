@extends('site.layouts.app-main')
<style>
    .form-control {
        height: 45px !important;
    }

    .section-title {
        margin-top: 40px !important;
    }

    a.btn-link, a.btn-link:hover, a.btn-link:visited, a.btn-link:link, a.btn-link:active {
        color: dodgerblue !important;
        text-decoration: none !important;
    }

    .offer {
        border: 1px solid #ddd;
        padding: 20px;
        box-shadow: 0 0 5px #ddd;
    }

    .offer h2 {
        font-size: 20px !important;
    }

    .offer img {
        width: 100%;
        height: 200px;
    }

    .offer p {
        margin-top: 30px;
    }
</style>
@section('content')
    <main id="main">
        <!-- ======= Contact Us Section ======= -->
        <section id="contact" class="contact">
            <div class="container" data-aos="fade-up" style="background: #fafafa; border: 1px solid #fafafa;
                box-shadow: 0 0 5px #fafafa;">
                <div class="section-title">
                    <h2> الوظائف المطروحة حاليا </h2>
                    <p></p>
                </div>
                @if(isset($offers) && !$offers->isEmpty())
                    <div class="row" dir="rtl">
                        @foreach($offers as $offer)
                            <div class="col-lg-4 mb-5 pull-right text-center">
                                <div class="offer" style="height: 460px!important;">
                                    <h2>
                                        {{$offer->title}}
                                    </h2>
                                    <hr>
                                    <img data-bs-toggle="modal" href="javascript:;" data-bs-target="#exampleModal4"
                                        style="cursor: pointer;" class="img_full" src="{{asset($offer->brochure)}}" alt="">
                                    <p dir="rtl" style="min-height: 80px!important;">
                                        {{mb_substr($offer->description,0,125)}} ..
                                    </p>
                                    <div class="clearfix"></div>

                                    <hr>
                                    <a href="{{route('submit.offer',$offer->id)}}" class=" btn btn-common btn-md"
                                       role="button">
                                        <i class="fa fa-paper-plane"></i>
                                        تقديم طلب على الوظيفة
                                    </a>
                                </div>
                            </div>
                        @endforeach
                        <div class="clearfix"></div>
                    </div>

                @endif
            </div>
        </section><!-- End Contact Us Section -->
    </main><!-- End #main -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h5 class="modal-title w-100" id="exampleModalLabel4">
                        عرض صورة بروشور الوظيفة
                    </h5>
                    <button type="button" class="btn btn-default btn-md btn-close" data-bs-dismiss="modal"
                            aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                </div>
                <div class="modal-body text-center" dir="rtl">
                    <img id="image_larger" alt="image" style="width: 100%;height: auto!important;  "/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">اغلاق</button>
                </div>
            </div>
        </div>
    </div>
@endsection

<script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
<script>
    $(document).ready(function () {
        $('.img_full').on('click', function () {
            var image_larger = $('#image_larger');
            var path = $(this).attr('src');
            $(image_larger).prop('src', path);
        });
    });
</script>

