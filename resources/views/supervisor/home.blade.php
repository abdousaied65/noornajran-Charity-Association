@extends('supervisor.layouts.master')
<style>
    span.float-right > i.fa {
        font-size: 40px !important;
    }
</style>
@section('page-header')
    <!-- breadcrumb -->
    <div class="breadcrumb-header justify-content-between">
        <div class="left-content">
            <div>
                <h2 class="main-content-title tx-24 mg-b-1 mg-b-lg-1">مرحبًا بكم مرة أخرى!</h2>
                <p class="mg-b-0">
                    لوحة تحكم المشرفين (الادارة)
                </p>
            </div>
        </div>
    </div>
    <!-- /breadcrumb -->
@endsection
@section('content')
    @if (session('status'))
        <div class="alert alert-success" role="alert">
            {{ session('status') }}
        </div>
    @endif
    <!-- row -->
        <div class="row">
            @can('اضافة مشرف','عرض مشرف')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.supervisors.index')}}">
                    <div class="card overflow-hidden sales-card bg-primary-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white">المشرفين</h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$supervisors->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-users fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        @can('اضافة صلاحية','عرض صلاحية')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.roles.index')}}">
                    <div class="card overflow-hidden sales-card bg-danger-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white">صلاحيات المشرفين</h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$roles->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-lock fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        @can('اضافة جنسية','عرض جنسية')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.nationalities.index')}}">
                    <div class="card overflow-hidden sales-card bg-success-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white">
                                    الجنسيات
                                </h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$nationalities->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-address-card fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        @can('اضافة نوع اعاقة','عرض نوع اعاقة')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.disabilities.index')}}">
                    <div class="card overflow-hidden sales-card bg-warning-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white"> انواع الاعاقة </h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$disabilities->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-wheelchair fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        
        @can('اضافة نوع طلب','عرض نوع طلب')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.order_types.index')}}">
                    <div class="card overflow-hidden sales-card bg-info-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white"> انواع الطلبات </h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$order_types->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-list fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        @can('اضافة مجال','عرض مجال')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.fields.index')}}">
                    <div class="card overflow-hidden sales-card bg-secondary-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white"> المجالات </h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$fields->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-code-branch fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        @can('اضافة وظيفة','عرض وظيفة')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.jobs.index')}}">
                    <div class="card overflow-hidden sales-card bg-purple-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white"> الوظائف </h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$jobs->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-tasks fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        @can('اضافة مستفيد','عرض مستفيد')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.beneficiaries.index')}}">
                    <div class="card overflow-hidden sales-card bg-success-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white"> المستفيدين </h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$beneficiaries->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-users fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        
        @can('اضافة طلب','عرض طلب')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.orders.index')}}">
                    <div class="card overflow-hidden sales-card bg-warning-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white"> الطلبات</h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$orders->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-paper-plane fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        @can('اضافة متطوع','عرض متطوع')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.volunteers.index')}}">
                    <div class="card overflow-hidden sales-card bg-info-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white"> المتطوعين</h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$volunteers->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-users fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        @can('عرض تقرير')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.contacts.index')}}">
                    <div class="card overflow-hidden sales-card bg-secondary-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white"> التقارير </h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$reports->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-address-card fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
        @can('اضافة اخصائى','عرض اخصائى')
            <div class="col-xl-3 col-lg-6 col-md-6 col-xm-12">
                <a href="{{route('supervisor.specialists.index')}}">
                    <div class="card overflow-hidden sales-card bg-danger-gradient">
                        <div class="pl-3 pt-3 pr-3 pb-2 pt-0">
                            <div class="">
                                <h3 class="mb-3 text-white">الاخصائيين</h3>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <div class="">
                                        <h1 class="tx-50 font-weight-bold mb-1 text-white">{{$specialists->count()}}</h1>
                                    </div>
                                    <span class="float-right my-auto mr-auto">
                                <i class="fas fa-users fa-5x text-white"></i>
                            </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        @endcan
    </div>
    <!-- row closed -->
@endsection


