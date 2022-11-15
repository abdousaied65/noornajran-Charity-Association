<!DOCTYPE html>
<html>
<head>
    <title> طباعة الوظائف المطروحة </title>
    <meta charset="utf-8"/>
    <link href="{{asset('/admin-assets/css/bootstrap.min.css')}}" rel="stylesheet"/>
    <style type="text/css" media="screen">
        @font-face {
            font-family: 'Cairo';
            src: url({{asset('fonts/Cairo.ttf')}});
        }

        * {
            color: #000 !important;
            font-size: 14px !important;
            font-weight: bold !important;
        }

        .img-footer {
            width: 100% !important;
            height: 120px !important;
            max-height: 120px !important;

        }

        body, html {
            font-family: 'Cairo' !important;
        }

        .table-container {
            width: 70%;
            margin: 10px auto;
        }

        .no-print {
            position: fixed;
            bottom: 0;
            right: 10px;
            border-radius: 0;
            z-index: 9999;
        }
    </style>
    <style type="text/css" media="print">
        body, html {
            font-family: 'Cairo' !important;
        }

        * {
            font-size: 14px !important;
            color: #000 !important;
            font-weight: bold !important;
        }

        .img-footer {

            width: 100% !important;
            height: 120px !important;
            max-height: 120px !important;

        }

        .no-print, .noprint {
            display: none;
        }
    </style>
</head>
<body style="background: #fff">
<table class="table table-bordered table-container">
    <tbody>
    <tr>
        <td class="text-center">
            <img style="width: 100px!important; height: 100px!important;" src="{{asset($settings->logo)}}" alt="">
        </td>
    </tr>
    <tr>
        <td>
            <table dir="rtl" class="table table-condensed display table-bordered text-center">
                <thead>
                <tr>
                    <th class="border-bottom-0 text-center">#</th>
                    <th class="border-bottom-0 text-center"> عنوان الوظيفة</th>
                    <th class="border-bottom-0 text-center"> وصف الوظيفة</th>
                    <th class="border-bottom-0 text-center"> بروشور الوظيفة </th>
                    <th class="border-bottom-0 text-center"> حالة الوظيفة </th>
                </tr>
                </thead>
                <tbody>
                @php
                    $i = 0;
                @endphp
                @foreach ($offers as $offer)
                    <tr>
                        <td>{{ ++$i }}</td>
                        <td>{{ $offer->title }}</td>
                        <td>{{ $offer->description }}</td>
                        <td>
                            <img src="{{asset($offer->brochure)}}"
                                 style="width: 70px;cursor: pointer; height: 70px;border-radius: 100%; padding: 3px; border: 1px solid #aaa;">
                        </td>
                        <td>{{ $offer->status }}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
<button onclick="window.print();" class="no-print btn btn-lg btn-success text-white">اضغط للطباعة</button>
<script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
</body>
</html>
