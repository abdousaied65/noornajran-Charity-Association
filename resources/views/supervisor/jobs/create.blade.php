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
                <div class="card-header pb-0">
                    <h5 class="alert alert-md alert-success">
                        اضافة وظيفة جديد
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.jobs.store','test')}}" method="post" enctype="multipart/form-data">
                        {{csrf_field()}}
                        <div class="row m-t-3 mb-3">
                            <div class="col-md-4 pull-right">
                                <label> المجال  <span class="text-danger">*</span></label>
                                <select required name="field_id" class="w-100 js-example-basic-single">
                                    @foreach($fields as $field)
                                        <option value="{{$field->id}}">{{$field->field}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> الاسم <span class="text-danger">*</span></label>
                                <input required type="text" class="form-control" name="first_name" />
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> اسم الاب <span class="text-danger">*</span></label>
                                <input required type="text" class="form-control" name="second_name" />
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="row m-t-3 mb-3">
                            <div class="col-md-4 pull-right">
                                <label> اسم الجد <span class="text-danger">*</span></label>
                                <input required type="text" class="form-control" name="third_name" />
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> اسم العائلة <span class="text-danger">*</span></label>
                                <input required type="text" class="form-control" name="fourth_name" />
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> البريد الالكترونى <span class="text-danger">*</span></label>
                                <input required dir="ltr" type="email" class="form-control" name="email" />
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="row m-t-3 mb-3">
                            <div class="col-md-3 pull-right">
                                <label> السجل المدنى  <span class="text-danger">*</span></label>
                                <input required dir="ltr" type="text" name="record" class="form-control" />
                            </div>
                            <div class="col-md-3 pull-right">
                                <label> رقم الجوال <span class="text-danger">*</span></label>
                                <input required dir="ltr" type="number" min="1" class="form-control" name="phone_number" />
                            </div>
                            <div class="col-md-3 pull-right">
                                <label> السيرة الذاتية <span class="text-danger">*</span></label>
                                <input required accept=".pdf" type="file" class="form-control" name="cv" />
                            </div>
                            <div class="col-md-3 pull-right">
                                <label> المؤهل  <span class="text-danger">*</span></label>
                                <select required name="qualification_id" class="w-100 js-example-basic-single">
                                    @foreach($qualifications as $qualification)
                                        <option value="{{$qualification->id}}">{{$qualification->qualification}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">تأكيد</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
