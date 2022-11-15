<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Description" content="{{$settings->arabic_name}}">
    <meta name="Author" content="{{$settings->arabic_name}}">
    <meta name="Keywords"
          content="جمعية,نور,نجران,جمعية نور,نور نجران,جمعية نجران,نجران نور,نور جمعية,نجران جمعية"/>
    @include('specialist.layouts.head')

    <style type="text/css" media="print">
        @media print {
            .app-content, .content {
                margin-right: 0 !important;
            }

            body {
                -webkit-print-color-adjust: exact;
                -moz-print-color-adjust: exact;
                print-color-adjust: exact;
                -o-print-color-adjust: exact;
            }

            .no-print {
                display: none;
            }

            .printy {
                display: block !important;
            }
        }
    </style>
    <style>
        @font-face {
            font-family: 'Cairo';
            src: url("{{asset('fonts/Cairo.ttf')}}");
        }

        label {
            font-size: 13px !important;
        }

        table {
            font-size: 13px !important;
        }

        h1, h2, h3, h4, h5, h6 {
            font-family: 'Cairo' !important;
        }

        .dropdown-menu.dropdown-menu-right.show {
            width: 200px !important;
        }

        body, html {
            font-family: 'Cairo' !important;
            font-size: 13px !important;
        }

        .navigation.navigation-main {
            padding-bottom: 200px !important;
        }

        .btn.dropdown-toggle.bs-placeholder, .btn.dropdown-toggle {
            height: 40px !important;
        }
    </style>
</head>
<body class="main-body bg-danger-transparent">
<!-- /Loader -->
@yield('content')
@include('specialist.layouts.footer-scripts')
</body>
</html>
