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
                        تعديل فقرة الصفحة الرئيسية
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.index_content.update')}}" method="post"
                          enctype="multipart/form-data">
                        @csrf
                        @method('POST')
                        <div class="row mb-5">
                            <div class="col-md-4 pull-right">
                                <label> عنوان الفقرة <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" name="title" value="{{$index_content->title}}" />
                            </div>
                        </div>
                        <div class="row mb-5">
                            <div class="col-md-3 pull-right">
                                <label> فقرة المستفيدين <span class="text-danger">*</span></label>
                                <textarea class="form-control" name="beneficiaries_text" style="resize: none;width:100%; height: 200px;">{{$index_content->beneficiaries_text}}</textarea>
                            </div>

                            <div class="col-md-3 pull-right">
                                <label> فقرة المتطوعين <span class="text-danger">*</span></label>
                                <textarea class="form-control" name="volunteers_text" style="resize: none;width:100%; height: 200px;">{{$index_content->volunteers_text}}</textarea>
                            </div>

                            <div class="col-md-3 pull-right">
                                <label> فقرة الطلبات <span class="text-danger">*</span></label>
                                <textarea class="form-control" name="orders_text" style="resize: none;width:100%; height: 200px;">{{$index_content->orders_text}}</textarea>
                            </div>

                            <div class="col-md-3 pull-right">
                                <label> فقرة الوظائف <span class="text-danger">*</span></label>
                                <textarea class="form-control" name="jobs_text" style="resize: none;width:100%; height: 200px;">{{$index_content->jobs_text}}</textarea>
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
