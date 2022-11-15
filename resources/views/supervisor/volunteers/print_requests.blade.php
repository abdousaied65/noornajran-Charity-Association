<!DOCTYPE html>
<html>
<head>
    <title> طباعة طلبات تجديد المتطوعين </title>
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
                    <th class="border-bottom-0 text-center">اسم المتطوع</th>
                    <th class="border-bottom-0 text-center">مدة التجديد</th>
                    <th class="border-bottom-0 text-center">صورة التحويل</th>
                    <th class="border-bottom-0 text-center">حالة الطلب</th>
                    <th class="border-bottom-0 text-center">تاريخ الطلب</th>
                </tr>
                </thead>
                <tbody>
                @php
                    $i = 0;
                @endphp

                @foreach ($requests as $request)
                    <tr>
                        <td>{{ ++$i }}</td>
                        <td>{{ $request->volunteer->first_name." ".$request->volunteer->second_name." ".$request->volunteer->third_name." ".$request->volunteer->fourth_name }}</td>
                        <td>
                            @if($request->period == "1")
                                سنة
                            @elseif($request->period == "2")
                                سنتين
                            @elseif($request->period == "3")
                                3 سنوات
                            @endif
                        </td>
                        <td>
                            <img data-toggle="modal" href="#modaldemo9"
                                 src="{{asset($request->payment_pic)}}"
                                 style="width: 70px;cursor: pointer; height: 70px;border-radius: 100%; padding: 3px; border: 1px solid #aaa;">
                        </td>
                        <td>
                            {{$request->status}}
                        </td>
                        <td>
                            {{date('Y-m-d',strtotime($request->created_at))}}
                        </td>
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
