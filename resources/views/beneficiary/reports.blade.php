@extends('site.layouts.app-main')
<style>
    input.form-control {
        height: 45px !important;
    }

    label {
        color: #444;
    }

    .usercontent h4 {
        color: #2c929e!important;
    }

    .navdashboard ul li a, .navdashboard ul li a i {
        color: #2c929e!important;
        background: #fff !important;
        font-size: 15px !important;
    }

    .navdashboard ul li a.active, .navdashboard ul li a.active i {
        color: #fff !important;
        background: #2c929e!important;
    }

    img.specialist-avatar {
        border-radius: 100%;
        border: 1px solid #aaa;
        padding: 3px;
        width: 60px;
        height: 60px;
    }

    h6.specialist-name {
        font-size: 15px !important;
    }

</style>
@section('content')
    <div id="content" class="section-padding" style="margin-top: 100px;">
        <div class="container-fluid">
            <div class="row" dir="rtl">
                <div class="col-lg-12">
                    @if (count($errors) > 0)
                        <div class="alert alert-danger alert-dismissible fade show text-center">
                            <strong>الاخطاء :</strong>
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                </div>
                <div class="col-lg-12">
                    @if (session('success'))
                        <div class="alert alert-success alert-dismissible fade show text-center">
                            {{ session('success') }}
                        </div>
                    @endif
                </div>
                <div class="col-lg-12">
                    @if (session('status'))
                        <div class="alert text-center alert-dismissible fade show alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                </div>
                <div class="col-sm-12 col-md-4 col-lg-3">
                    <aside>
                        <div class="sidebar-box">
                            <div class="user">
                                <div class="usercontent">
                                    <h3>
                                        {{$beneficiary->first_name." ".$beneficiary->second_name." ".$beneficiary->third_name." ".$beneficiary->fourth_name}}
                                    </h3>
                                    <h4> مستفيد </h4>
                                </div>
                            </div>
                            <nav class="navdashboard">
                                <ul>
                                    <li>
                                        <a href="{{route('beneficiary.home')}}"><i
                                                class="fa fa-dashboard"></i> لوحة التحكم </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('beneficiary.download.pdf') }}"
                                           onclick="event.preventDefault();document.getElementById('print-form').submit();">
                                            <i class="fa fa-print"></i>
                                            طباعة بطاقة مستفيد
                                        </a>
                                        <form target="_blank" id="print-form"
                                              action="{{ route('beneficiary.download.pdf') }}" method="get"
                                              style="display: none;">
                                        </form>
                                    </li>
                                    <li>
                                        <a class="active" href="{{route('beneficiary.reports')}}"><i
                                                class="fa fa-file"></i> تقارير الاخصائيين </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('beneficiary.logout') }}"
                                           onclick="event.preventDefault();document.getElementById('logout').submit();">
                                            <i class="fa fa-power-off"></i>
                                            تسجيل الخروج
                                        </a>
                                        <form id="logout" action="{{ route('beneficiary.logout') }}" method="post"
                                              style="display: none;">
                                            @csrf
                                            @method('POST')
                                        </form>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </aside>
                </div>
                <div class="col-sm-12 col-md-8 col-lg-9">
                    <div class="page-content">
                        <div class="inner-box">
                            <div class="dashboard-box text-center">
                                <h2 class="dashbord-title">
                                    تقارير الاخصائيين
                                </h2>
                            </div>
                            @if(isset($reports) &&!$reports->isEmpty())
                                <div class="product-details table-responsive text-nowrap">
                                    <table
                                        class="table table-bordered mb-0 text-nowrap text-center">
                                        <thead>
                                        <tr>
                                            <th class="text-center" style="width:20%!important;">الاخصائى
                                            </th>
                                            <th class="text-center" style="width:60%!important;">التقرير
                                            </th>
                                            <th class="text-center" style="width:10%!important;">تاريخ
                                                الاضافة
                                            </th>
                                            <th class="text-center" style="width:10%!important;">تحكم</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($reports as $report)
                                            <tr>
                                                <td>
                                                    <img class="specialist-avatar"
                                                         src="{{asset('admin-assets/img/user.png')}}"
                                                         alt="img"/>
                                                    <h6 class="mt-2 specialist-name">
                                                        {{$report->specialist->first_name." ".$report->specialist->second_name." ".$report->specialist->third_name." ".$report->specialist->fourth_name}}
                                                    </h6>
                                                </td>
                                                <td class="text-center text-lg text-medium">
                                                    {{mb_substr($report->report,0,50)}} ..
                                                </td>
                                                <td class="text-center text-lg text-medium">
                                                    {{$report->created_at}}
                                                </td>
                                                <td class="text-center">
                                                    <a href="javascript:;" data-bs-toggle="modal" data-bs-target="#exampleModal8"
                                                       report_id="{{$report->id}}"
                                                       class="btn btn-md btn-success show_report"
                                                       style="padding: 10px!important;">
                                                        <i class="fa fa-eye"></i>
                                                    </a>
                                                    <a target="_blank" class="btn btn-md btn-info" href="{{ route('beneficiary.download.report',$report->id) }}"
                                                       style="padding: 10px!important;">
                                                        <i class="fa fa-print"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            @else
                                <p class="alert alert-danger alert-md text-center">
                                    لا يوجد تقارير من الاخصائيين لك
                                </p>
                        @endif
                        <!-- row closed -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal8" tabindex="-1" aria-labelledby="exampleModalLabel8" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h5 class="modal-title w-100" id="exampleModalLabel8">
                        عرض التقرير
                    </h5>
                    <button type="button" class="btn btn-default btn-md btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                </div>
                <div class="modal-body report_details text-right" dir="rtl">

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
        $('.show_report').on('click', function () {
            $('.report_details').html("");
            let report_id = $(this).attr('report_id');
            $.post('{{route('beneficiary.show.report.details')}}', {
                "_token": "{{ csrf_token() }}", report_id: report_id
            }, function (data) {
                $('.report_details').html(data);
            })
        });
    });
</script>

