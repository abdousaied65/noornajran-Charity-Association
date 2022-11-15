@extends('specialist.layouts.master')
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
                <h2 class="main-content-title tx-24 mg-b-1 mg-b-lg-1">
                    لوحة تحكم الاخصائيين
                </h2>
                <p class="mg-b-0">
                    مرحبًا بكم مرة أخرى !
                    اهلا بك يا
                    {{$user->first_name}}
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

    <!-- row closed -->
@endsection

