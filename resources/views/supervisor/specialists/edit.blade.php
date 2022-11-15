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
                            تعديل بيانات الاخصائى
                        </h5>
                        <div class="clearfix"></div>
                    </div>
                    <br>
                    {!! Form::model($specialist, ['method' => 'PATCH','enctype' => 'multipart/form-data','route' => ['supervisor.specialists.update', $specialist->id]]) !!}
                    <input type="hidden" value="اخصائى" name="role_name"/>
                    <div class="row mb-3 mt-3">
                        <div class="parsley-input col-md-3" id="fnWrapper">
                            <label> اسم الاخصائى : <span class="tx-danger">*</span></label>
                            {!! Form::text('first_name', null, array('class' => 'form-control','required')) !!}
                        </div>
                        <div class="parsley-input col-md-3" id="fnWrapper">
                            <label> اسم الاب : <span class="tx-danger">*</span></label>
                            {!! Form::text('second_name', null, array('class' => 'form-control','required')) !!}
                        </div>
                        <div class="parsley-input col-md-3" id="fnWrapper">
                            <label> اسم الجد : <span class="tx-danger">*</span></label>
                            {!! Form::text('third_name', null, array('class' => 'form-control','required')) !!}
                        </div>
                        <div class="parsley-input col-md-3" id="fnWrapper">
                            <label> اسم العائلة : <span class="tx-danger">*</span></label>
                            {!! Form::text('fourth_name', null, array('class' => 'form-control','required')) !!}
                        </div>
                    </div>
                    <div class="row mb-3 mt-3">
                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label> البريد الالكترونى : <span class="tx-danger">*</span></label>
                            {!! Form::text('email', null, array('class' => 'form-control text-left','dir'=>'ltr','required')) !!}
                        </div>

                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label> كلمة المرور : <span class="tx-danger">*</span></label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                        <span class="input-group-text showPassword" id="basic-addon1">
                                            <i class="fa fa-eye basic-addon1"></i>
                                        </span>
                                </div>
                                <input id="password" type="password"
                                       class="form-control @error('password') is-invalid @enderror text-left"
                                       dir="ltr" name="password"
                                       aria-describedby="basic-addon1">
                            </div>
                        </div>

                        <div class="parsley-input col-md-4 mg-t-20 mg-md-t-0" id="lnWrapper">
                            <label> تأكيد كلمة المرور : <span class="tx-danger">*</span></label>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                        <span class="input-group-text showPassword2"
                                              id="basic-addon2">
                                            <i class="fa fa-eye basic-addon2"></i>
                                        </span>
                                </div>
                                <input id="confirm-password" type="password"
                                       class="form-control @error('password') is-invalid @enderror text-left"
                                       dir="ltr" name="confirm-password"
                                       aria-describedby="basic-addon2">
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-12 text-center mt-3 mb-3">
                        <button class="btn btn-info btn-md" type="submit"> تحديث</button>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    <!-- main-content closed -->

    <script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
    <script>
        $(".showPassword").click(function () {
            if ($("#password").attr("type") == "password") {
                $("#password").attr("type", "text");
                $(".showPassword").find('i.fa').toggleClass('fa-eye fa-eye-slash');
            } else {
                $("#password").attr("type", "password");
                $(".showPassword").find('i.fa').toggleClass('fa-eye fa-eye-slash');
            }
        });
        $(".showPassword2").click(function () {
            if ($("#confirm-password").attr("type") == "password") {
                $("#confirm-password").attr("type", "text");
                $(".showPassword2").find('i.fa').toggleClass('fa-eye fa-eye-slash');
            } else {
                $("#confirm-password").attr("type", "password");
                $(".showPassword2").find('i.fa').toggleClass('fa-eye fa-eye-slash');
            }
        });
    </script>

@endsection
