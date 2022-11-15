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
                            تعديل بيانات التقرير
                        </h5>
                        <div class="clearfix"></div>
                    </div>
                    <br>
                    {!! Form::model($report, ['method' => 'PATCH','enctype' => 'multipart/form-data','route' => ['supervisor.reports.update', $report->id]]) !!}
                    <div class="row m-t-3 mb-3">
                        <div class="parsley-input col-md-6" id="fnWrapper">
                            <label> اسم الاخصائى <span class="text-danger">*</span></label>
                            <select required name="specialist_id"
                                    data-style="btn-primary" data-title="اختر الاخصائى"
                                    class="form-control selectpicker show-tick" data-live-search="true">
                                @foreach($specialists as $specialist)
                                    <option
                                        @if($report->specialist_id == $specialist->id)
                                        selected
                                        @endif
                                        value="{{$specialist->id}}">
                                        {{$specialist->first_name." ".$specialist->second_name." ".$specialist->third_name." ".$specialist->fourth_name}}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="parsley-input col-md-6" id="fnWrapper">
                            <label> اسم المستفيد <span class="text-danger">*</span></label>
                            <select required name="beneficiary_id"
                                    data-style="btn-info" data-title="اختر المستفيد"
                                    class="form-control selectpicker show-tick" data-live-search="true">
                                @foreach($beneficiaries as $beneficiary)
                                    <option
                                        @if($report->beneficiary_id == $beneficiary->id)
                                        selected
                                        @endif
                                        value="{{$beneficiary->id}}">
                                        {{$beneficiary->first_name." ".$beneficiary->second_name." ".$beneficiary->third_name." ".$beneficiary->fourth_name}}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3 mb-3">
                        <div class="parsley-input col-md-12" id="fnWrapper">
                            <label> نص التقرير <span class="text-danger">*</span></label>
                            <textarea required name="report" style="resize: none; width: 100%; height: 250px!important;" class="form-control">{{$report->report}}</textarea>
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
