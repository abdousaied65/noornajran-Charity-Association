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
                            تعديل بيانات الوظيفة
                        </h5>
                        <div class="clearfix"></div>
                    </div>
                    <br>
                    {!! Form::model($job, ['method' => 'PATCH','enctype' => 'multipart/form-data','route' => ['supervisor.jobs.update', $job->id]]) !!}
                    <div class="row m-t-3 mb-3">
                        <div class="col-md-4 pull-right">
                            <label> المجال <span class="text-danger">*</span></label>
                            <select required name="field_id" class="w-100 js-example-basic-single">
                                @foreach($fields as $field)
                                    <option
                                        @if(isset($job) && $job->field_id == $field->id )
                                        selected
                                        @endif
                                        value="{{$field->id}}">{{$field->field}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-4 pull-right">
                            <label> الاسم <span class="text-danger">*</span></label>
                            <input required value="{{$job->first_name}}" type="text" class="form-control"
                                   name="first_name"/>
                        </div>
                        <div class="col-md-4 pull-right">
                            <label> اسم الاب <span class="text-danger">*</span></label>
                            <input required value="{{$job->second_name}}" type="text" class="form-control"
                                   name="second_name"/>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="row m-t-3 mb-3">
                        <div class="col-md-4 pull-right">
                            <label> اسم الجد <span class="text-danger">*</span></label>
                            <input required value="{{$job->third_name}}" type="text" class="form-control"
                                   name="third_name"/>
                        </div>
                        <div class="col-md-4 pull-right">
                            <label> اسم العائلة <span class="text-danger">*</span></label>
                            <input required value="{{$job->fourth_name}}" type="text" class="form-control"
                                   name="fourth_name"/>
                        </div>
                        <div class="col-md-4 pull-right">
                            <label> البريد الالكترونى <span class="text-danger">*</span></label>
                            <input required value="{{$job->email}}" dir="ltr" type="email" class="form-control"
                                   name="email"/>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row m-t-3 mb-3">
                        <div class="col-md-3 pull-right">
                            <label> السجل المدنى <span class="text-danger">*</span></label>
                            <input required value="{{$job->record}}" dir="ltr" type="text" name="record"
                                   class="form-control"/>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label> رقم الجوال <span class="text-danger">*</span></label>
                            <input required value="{{$job->phone_number}}" dir="ltr" type="number" min="1"
                                   class="form-control" name="phone_number"/>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label> السيرة الذاتية <span class="text-danger">*</span></label>
                            <input accept=".pdf" type="file" class="form-control" name="cv"/>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label> المؤهل <span class="text-danger">*</span></label>
                            <select required name="qualification_id" class="w-100 js-example-basic-single">
                                @foreach($qualifications as $qualification)
                                    <option
                                        @if(isset($job) && $job->qualification_id == $qualification->id )
                                        selected
                                        @endif
                                        value="{{$qualification->id}}">{{$qualification->qualification}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="col-lg-12 text-center mt-3 mb-3">
                        <button class="btn btn-info btn-md" type="submit"> تحديث</button>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    <!-- main-content closed -->
@endsection
