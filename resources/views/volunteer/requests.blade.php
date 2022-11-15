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
    span.badge{
        padding:10px!important;
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
                    <?php
                    $end_date = $volunteer->end_date;
                    $now = time(); // or your date as well
                    $your_date = strtotime($end_date);
                    $datediff = $your_date - $now;
                    $rest_days = round($datediff / (60 * 60 * 24));

                    $start_date = $volunteer->start_date;
                    $start_date = strtotime($start_date);
                    $end_date = $volunteer->end_date;
                    $end_date = strtotime($end_date);

                    $datediff = $end_date - $start_date;
                    $all_days = round($datediff / (60 * 60 * 24));
                    if($rest_days <= 0){
                        $rest_days = 0;
                        $percent = 0;
                    }
                    else{
                        $percent = ( $rest_days / $all_days ) * 100 ;
                    }
                    ?>
                    <aside>
                        <div class="sidebar-box">
                            <div class="user">
                                <div class="progress-pie-chart" data-percent="{{$percent}}">
                                    <div class="ppc-progress">
                                        <div class="ppc-progress-fill"></div>
                                    </div>
                                    <div class="ppc-percents" dir="rtl">
                                        <div class="pcc-percents-wrapper">
                                            <span>
                                                {{$rest_days}}
                                                يوم
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <h6 class="mt-3" dir="rtl">
                                    <i class="fa fa-clock-o"></i>
                                    المدة المتبقية على انتهاء اشتراكك
                                </h6>
                                <hr class="">
                                <div class="usercontent">
                                    <h3>
                                        {{$volunteer->first_name." ".$volunteer->second_name." ".$volunteer->third_name." ".$volunteer->fourth_name}}
                                    </h3>
                                    <h4> متطوع </h4>
                                </div>
                            </div>
                            <nav class="navdashboard">
                                <ul>
                                    <li>
                                        <a href="{{route('volunteer.home')}}"><i
                                                class="fa fa-dashboard"></i> لوحة التحكم </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('volunteer.download.pdf') }}"
                                           onclick="event.preventDefault();document.getElementById('print-form').submit();">
                                            <i class="fa fa-print"></i>
                                            طباعة بطاقة متطوع
                                        </a>
                                        <form target="_blank" id="print-form" action="{{ route('volunteer.download.pdf') }}"
                                              method="get"
                                              style="display: none;">
                                        </form>
                                    </li>
                                    <li>
                                        <a data-bs-toggle="modal" href="javascript:;" data-bs-target="#exampleModal">
                                            <i class="fa fa-recycle"></i>
                                            طلب تجديد العضوية
                                        </a>
                                    </li>
                                    <li>
                                        <a class="active" href="{{route('renewal.requests')}}">
                                            <i class="fa fa-list-alt"></i>
                                            طلبات تجديد العضوية السابقة
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{{ route('volunteer.logout') }}"
                                           onclick="event.preventDefault();document.getElementById('logout').submit();">
                                            <i class="fa fa-power-off"></i>
                                            تسجيل الخروج
                                        </a>
                                        <form id="logout" action="{{ route('volunteer.logout') }}" method="post"
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
                                <h2 class="dashbord-title">طلبات تجديد العضوية السابقة</h2>
                            </div>
                            <table class="table table-bordered text-center">
                                <thead style="border:1px solid #e91e63; color: #fff;background: #e91e63;">
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">مدة التجديد</th>
                                    <th class="text-center"> ايصال تسديد الرسوم</th>
                                    <th class="text-center">الحالة</th>
                                    <th class="text-center">تاريخ الطلب</th>
                                </tr>
                                </thead>
                                <tbody style="border:1px solid #e91e63; color: #e91e63;background: #fff;">
                                <?php $i = 0; ?>
                                @foreach($requests as $request)
                                    <tr>
                                        <td>{{++$i}}</td>
                                        <td>
                                            @if($request->period == 1)
                                                سنة
                                            @elseif($request->period == 2)
                                                سنتان
                                            @elseif($request->period == 3)
                                                3 سنوات
                                            @endif
                                        </td>
                                        <td>
                                            <img src="{{asset($request->payment_pic)}}"
                                                 data-bs-toggle="modal" data-bs-target="#exampleModal2"
                                                 style="width: 70px;cursor: pointer; height: 70px;border-radius: 100%; padding: 3px; border: 1px solid #aaa;">
                                        </td>
                                        <td>
                                            @if($request->status == 'قيد المراجعة')
                                                <span class="badge badge-warning">
                                                    قيد المراجعة
                                                </span>
                                            @elseif($request->status == 'تمت الموافقة')
                                                <span class="badge badge-success">
                                                    تمت الموافقة
                                                </span>
                                            @elseif($request->status == 'مرفوض')
                                                <span class="badge badge-danger">
                                                     مرفوض
                                                </span>
                                            @endif
                                        </td>
                                        <td>{{$request->created_at}}</td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h5 class="modal-title w-100" id="exampleModalLabel">
                        طلب تجديد العضوية
                    </h5>
                    <button type="button" class="btn btn-default btn-md btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                </div>
                <div class="modal-body text-right">
                    <form dir="rtl" id="myForm" action="{{route('renewal.request')}}" enctype="multipart/form-data"
                          method="post">
                        @csrf
                        @method('POST')
                        <div class="form-group">
                            <label for=""> مدة التجديد </label>
                            <select name="period" required class="w-100 js-example-basic-single">
                                <option value="1">سنة</option>
                                <option value="2">سنتان</option>
                                <option value="3">3 سنوات</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for=""> برجاء ارفاق ايصال تسديد الرسوم
                                <span class="text-danger">( لابد ان يكون صورة بصيغة png او jpg او jpeg ) </span>
                            </label>
                            <input required accept="image/*" type="file"
                                   oninput="pic.src=window.URL.createObjectURL(this.files[0])" id="file"
                                   name="payment_pic" class="form-control">
                            <label for="" class="d-block"> معاينة الصورة </label>
                            <img id="pic" src=""
                                 style="width: 100px; height:100px;"/>
                        </div>
                    </form>
                </div>
                <div class="modal-footer w-100">
                    <button type="button" class="btn btn-danger" dir="ltr" data-bs-dismiss="modal">اغلاق</button>
                    <button dir="rtl" form="myForm" type="submit" class="btn btn-md btn-success">
                        <i class="fa fa-recycle"></i>
                        ارسال الطلب
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h5 class="modal-title w-100" id="exampleModalLabel2">
                        عرض صورة الايصال
                    </h5>
                    <button type="button" class="btn btn-default btn-md btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                </div>
                <div class="modal-body text-right">
                    <img id="image_larger" alt="image" style="width: 100%;height: 400px!important;  "/>
                </div>
                <div class="modal-footer w-100">
                    <button type="button" class="btn btn-danger" dir="ltr" data-bs-dismiss="modal">اغلاق</button>
                </div>
            </div>
        </div>
    </div>
@endsection
<script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
<script>
    $(document).ready(function () {
        $('img').on('click', function () {
            var image_larger = $('#image_larger');
            var path = $(this).attr('src');
            $(image_larger).prop('src', path);
        });
    });
</script>
