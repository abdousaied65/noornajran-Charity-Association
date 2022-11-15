<!DOCTYPE html>
<html>
<head>
    <title> طباعة التقارير الخاصة بى </title>
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
                    <th class="border-bottom-0 text-center"> اسم الاخصائى</th>
                    <th class="border-bottom-0 text-center"> اسم المستفيد</th>
                    <th class="border-bottom-0 text-center"> نص التقرير</th>
                    <th class="border-bottom-0 text-center"> تاريخ التقرير</th>
                </tr>
                </thead>
                <tbody>
                @php
                    $i = 0;
                @endphp
                @foreach ($reports as $report)
                    <tr>
                        <td>{{ ++$i }}</td>
                        <td>{{$report->specialist->first_name." ".$report->specialist->second_name." ".$report->specialist->third_name." ".$report->specialist->fourth_name}}</td>
                        <td>{{$report->beneficiary->first_name." ".$report->beneficiary->second_name." ".$report->beneficiary->third_name." ".$report->beneficiary->fourth_name}}</td>
                        <td>{{mb_substr($report->report,0,50)}} ..</td>
                        <td>{{ $report->created_at }}</td>
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
