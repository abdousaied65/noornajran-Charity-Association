@extends('supervisor.layouts.master')
<style>
</style>
@section('content')
    <!-- row -->
    <div class="row">
        <div class="col-lg-12 col-md-12">

            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <strong>الاخطاء :</strong>
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <div class="card">
                <div class="card-body">
                    <div class="col-lg-12 margin-tb">
                        <h5 style="min-width: 300px;" class="pull-right alert alert-md alert-success">
                            تعديل بيانات نوع الاعاقة
                        </h5>
                        <div class="clearfix"></div>
                    </div>
                    <br>
                    {!! Form::model($disability, ['method' => 'PATCH','enctype' => 'multipart/form-data','route' => ['supervisor.disabilities.update', $disability->id]]) !!}
                    <div class="row mb-3 mt-3">
                        <div class="parsley-input col-md-4" id="fnWrapper">
                            <label> نوع الاعاقة : <span class="tx-danger">*</span></label>
                            {!! Form::text('disability', null, array('class' => 'form-control','required')) !!}
                        </div>
                    </div>
                    <div class="col-lg-12 text-center mt-3 mb-3">
                        <button class="btn btn-info btn-md" type="submit"> تحديث </button>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    <!-- main-content closed -->
@endsection
