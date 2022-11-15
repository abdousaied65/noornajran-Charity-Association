<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="rtl">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="{{asset($settings->favicon)}}" type="image/png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>{{$settings->arabic_name}}</title>
    @include('site.layouts.common.css_links')
    <style>
        @font-face {
            font-family: 'Cairo';
            src: url("{{asset('fonts/Cairo.ttf')}}");
        }
        span.text-danger{
            font-size: 12px!important;
        }

        h1, h2, h3, h4, h5, h6, p, span, div, table {
            font-family: 'Cairo' !important;
        }

        body, html {
            font-family: 'Cairo' !important;
            font-size: 13px !important;
        }
        h4 , h4 >* ,h2 {
            color:#2c929e!important;
        }
        p , p>*{
            color:#e91e63 !important;
        }
        .contact #myForm {
            width: 100%;
            border-top: 3px solid #e91e63;
            border-bottom: 3px solid #e91e63;
            padding: 30px;
            background: #fff;
            box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);
        }

        .contact #myForm .form-group {
            padding-bottom: 8px;
        }

        .contact #myForm .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .contact #myForm input, .contact #myForm textarea {
            border-radius: 0;
            box-shadow: none;
            font-size: 14px;
        }

        .contact #myForm input[type="text"],.contact #myForm input[type="password"],.contact #myForm input[type="number" min="1"]{
            height: 44px;
        }

        .contact #myForm textarea {
            padding: 10px 12px;
        }

        .contact #myForm button[type=submit] {
            background: #e91e63;
            border: 0;
            padding: 10px 24px;
            color: #fff;
            transition: 0.4s;
            border-radius: 4px;
        }

        .contact #myForm button[type=submit]:hover {
            background: #ef7f4d;
        }

        @media only screen and (max-width: 768px) {
            #header .logo .logo_img img{
                width: 100px!important; height: 100px!important;
            }
            #hero{
                /*margin-top: 100px!important;*/
                padding-top: 1200px!important;
            }
        }
        .select2-selection__rendered {
            line-height: 45px !important; border-radius: 0!important;
        }
        .select2-container .select2-selection--single {
            height: 45px !important;border-radius: 0!important;
        }
        .select2-selection__arrow {
            height: 45px !important;border-radius: 0!important;
        }
        .select2-search__field{
            height: 40px!important;
            line-height: 40px!important;
            outline: 0!important;
        }
        #header .logo .logo_img img{
            border: 1px solid #2c929e;
            border-radius: 10px;
            box-shadow: 0 0 3px #2c929e;
        }


    </style>
</head>
<body itemscope>
<main>
    @include('site.layouts.common.header')
    @yield('content')
    @include('site.layouts.common.footer')

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>
    @include('site.layouts.common.js_links')

<!-- Modal -->
    <div class="modal fade" id="exampleModal20" tabindex="-1" aria-labelledby="exampleModalLabel20" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h5 class="modal-title w-100" id="exampleModalLabel20">
                        شروط الاستخدام
                    </h5>
                    <button type="button" class="btn btn-default btn-md btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                </div>
                <div class="modal-body text-right" dir="rtl">
                    {{$informations->terms}}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">اغلاق</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal30" tabindex="-1" aria-labelledby="exampleModalLabel30" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h5 class="modal-title w-100" id="exampleModalLabel30">
                        سياسة الخصوصية
                    </h5>
                    <button type="button" class="btn btn-default btn-md btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                </div>
                <div class="modal-body text-right" dir="rtl">
                    {{$informations->policy}}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">اغلاق</button>
                </div>
            </div>
        </div>
    </div>

</main>
</body>
</html>
