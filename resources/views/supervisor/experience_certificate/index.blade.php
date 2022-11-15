@extends('supervisor.layouts.master')
<style>

</style>
@section('content')
    <!-- main-content closed -->
    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <strong>Errors :</strong>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <!-- row opened -->
    <div class="row row-sm">
        <div class="col-xl-12">
            <div class="card">
                @if (session('success'))
                    <div class="alert alert-success  fade show">
                        <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                        {{ session('success') }}
                    </div>
                @endif
                <div class="card-header pb-0">
                    <h5 class="alert alert-md alert-success">
                        تعديل اعدادات طباعة شهادة الخبرة
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.experience_certificate.update')}}" method="post"
                          enctype="multipart/form-data">
                        @csrf
                        @method('POST')
                        <div class="row mb-3">
                            <div class="col-md-6 pull-right">
                                <label> امكانية الطباعة بعد (عدد ايام) <span class="text-danger">*</span></label>
                                <input type="number" dir="ltr" class="form-control" name="print_after_period" value="{{$experience_certificate->print_after_period}}" />
                            </div>
                            <div class="col-md-6 pull-right">
                                <label> عدد مرات الطباعة <span class="text-danger">*</span></label>
                                <input type="number" dir="ltr" class="form-control" name="prints_number" value="{{$experience_certificate->prints_number}}" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">تحديث</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
