@extends('supervisor.layouts.master')
<!-- Internal Data table css -->
<style>
    i.la {
        font-size: 15px !important;
    }
</style>
@section('content')
    <div class="row text-center">
        <div class="col-lg-12 mt-5">
            <p class="alert alert-info alert-md text-center"> عرض بيانات الوظيفة </p>
        </div>
        <div class="table-responsive hoverable-table">
            <table class="table table-striped table-condensed table-bordered text-center">
                <thead>
                <tr>
                    <th class="border-bottom-0 text-center"> المجال  </th>
                    <th class="border-bottom-0 text-center"> المؤهل  </th>
                    <th class="border-bottom-0 text-center"> الاسم  </th>
                    <th class="border-bottom-0 text-center"> البريد الالكترونى  </th>
                    <th class="border-bottom-0 text-center">  السجل المدنى  </th>
                    <th class="border-bottom-0 text-center"> رقم الجوال  </th>
                    <th class="border-bottom-0 text-center"> السيرة الذاتيه  </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>{{ $job->field->field }}</td>
                    <td>{{ $job->qualification->qualification }}</td>
                    <td>{{ $job->first_name." ".$job->second_name." ".$job->third_name." ".$job->fourth_name }}</td>
                    <td>{{ $job->email }}</td>
                    <td>{{ $job->record }}</td>
                    <td>{{ $job->phone_number }}</td>
                    <td>
                        <a href="{{asset($job->cv)}}" class="btn bnt-md btn-link">
                            <i class="fa fa-download"></i>
                            تحميل
                        </a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
@endsection
