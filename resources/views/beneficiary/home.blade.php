@extends('site.layouts.app-main')
<style>
    input.form-control {
        height: 45px !important;
    }

    label {
        color: #444;
    }

    .usercontent h4 {
        color:#2c929e!important;
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
                                        <a class="active" href="{{route('beneficiary.home')}}"><i
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
                                        <a href="{{route('beneficiary.reports')}}"><i
                                                class="fa fa-file"></i>  تقارير الاخصائيين </a>
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
                                <h2 class="dashbord-title">اعدادات الحساب الشخصى</h2>
                            </div>
                            <div class="tabs-wrp account-settings brd-rd5 text-center">
                                <div class="account-settings-inner">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-lg-12">
                                            <div class="profile-info-form-wrap">
                                                <form enctype="multipart/form-data" id="myform"
                                                      class="profile-info-form"
                                                      action="{{route('beneficiary.profile.update',$beneficiary->id)}}"
                                                      method="POST">
                                                    @csrf
                                                    @method('PATCH')
                                                    <input type="hidden" name="beneficiary_id"
                                                           value="{{Auth::user()->id}}"/>
                                                    <div class="row p-4" dir="rtl">
                                                        <div class="mt-2 mb-2 col-lg-6">
                                                            <label class="d-block">الاسم
                                                                <sup>*</sup></label>
                                                            <input class="brd-rd3 text-right form-control"
                                                                   type="text" readonly
                                                                   value="{{$beneficiary->first_name." ".$beneficiary->second_name." ".$beneficiary->third_name." ".$beneficiary->fourth_name}}"
                                                                   dir="rtl"
                                                                   placeholder="اكتب الاسم">
                                                        </div>
                                                        <div class="mt-2 mb-2 col-lg-6">
                                                            <label>البريد الالكترونى
                                                                <sup>*</sup></label>
                                                            <input class="brd-rd3 text-left  form-control"
                                                                   type="email" name="email"
                                                                   value="{{$beneficiary->email}}"
                                                                   dir="ltr"
                                                                   placeholder="اكتب البريد الالكترونى">
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="mt-2 mb-2 col-lg-6 pull-right">
                                                            <label> رقم الجوال <sup>*</sup></label>
                                                            <input class="brd-rd3 text-left  form-control"
                                                                   type="number" min="1" required
                                                                   dir="ltr" name="phone_number"
                                                                   value="{{$beneficiary->phone_number}}"
                                                                   placeholder="اكتب رقم الجوال">
                                                        </div>
                                                        <div class="mt-2 mb-2 col-lg-6 pull-right">
                                                            <label> كلمة المرور <sup>*</sup></label>
                                                            <input class="brd-rd3 text-left  form-control"
                                                                   type="password" required
                                                                   dir="ltr" name="password"
                                                                   placeholder="اكتب كلمة المرور">
                                                        </div>
                                                        <div class="clearfix"></div>

                                                        <div class="mt-2 mb-2 col-lg-6 pull-right">
                                                            <label> تأكيد كلمة المرور <sup>*</sup></label>
                                                            <input class="brd-rd3 text-left  form-control"
                                                                   type="password" required
                                                                   dir="ltr" name="confirm-password"
                                                                   placeholder="أكد كلمة المرور">
                                                        </div>
                                                        <div class="clearfix"></div>

                                                        <div class="mt-2 mb-2 col-md-12 col-sm-12 col-lg-12"
                                                             style="margin-top: 40px">
                                                            <button dir="rtl" type="submit"
                                                                    class="btn btn-md btn-common">
                                                                <i class="fa fa-check"></i> تحديث
                                                                البيانات
                                                            </button>
                                                        </div>

                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
