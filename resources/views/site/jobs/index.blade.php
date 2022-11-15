@extends('site.layouts.app-main')
<style>
    .form-control {
        height: 45px !important;
    }

    .section-title {
        margin-top: 40px !important;
    }

    a.btn-link, a.btn-link:hover, a.btn-link:visited, a.btn-link:link, a.btn-link:active {
        color: dodgerblue !important;
        text-decoration: none !important;
    }
</style>
@section('content')
    <main id="main">
        <!-- ======= Contact Us Section ======= -->
        <section id="contact" class="contact">
            <div class="container" data-aos="fade-up" style="background: #fafafa; border: 1px solid #fafafa;
                box-shadow: 0 0 5px #fafafa;">
                @if((!isset($jobs) || $jobs->isEmpty()) && (!isset($submits) || $submits->isEmpty()) )
                    <div class="section-title">
                        <h2>البحث فى طلباتك للوظائف </h2>
                        <p></p>
                    </div>

                    @if (count($errors) > 0)
                        <div class="alert alert-danger" dir="rtl">
                            <strong>الاخطاء :</strong>
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    @if (session('success'))
                        <div class="alert alert-success text-center" style="margin-top: 30px;">
                            {{ session('success') }}
                        </div>
                    @endif
                    @if (session('error'))
                        <div class="alert alert-danger text-center" style="margin-top: 30px;">
                            {{ session('error') }}
                        </div>
                    @endif
                    <form dir="rtl" action="{{route('jobs.search')}}" method="post"
                          enctype="multipart/form-data">
                        {{csrf_field()}}
                        <p class="mb-3">
                            <i class="fa fa-arrow-left ml-3"></i>
                            لاستعراض طلبات الوظائف الخاصة بك يرجى البحث بالبريد الالكترونى او رقم الجوال
                        </p>
                        <div class="row mb-3 mt-3 justify-content-center">
                            <div class="col-md-4 pull-right">
                                <label> البريد الالكترونى او رقم الجوال <span class="text-danger">*</span></label>
                                <input value="{{old('identify')}}" required type="text" dir="ltr" class="form-control"
                                       name="identify"/>
                                <span class="text-danger">
                                رقم الجوال يجب ان يكون 9665xxxxxx
                            </span>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center mt-5 mb-5">
                            <button class="btn btn-info pd-x-20" type="submit">
                                <i class="fa fa-search"></i>
                                بحث
                            </button>
                        </div>
                    </form>
                @endif
                <div class="results mt-5 mb-3 text-center" dir="rtl">
                    @if(isset($jobs) && !$jobs->isEmpty())
                        <h2 class="mt-5 mb-2">طلباتك للوظائف </h2>
                        <hr class="mb-5" style="width: 20%;">
                        <table class="table table-bordered text-center">
                            <thead style="border:1px solid #2c929e; color: #fff;background: #2c929e;">
                            <tr>
                                <th class="text-center">رقم الطلب</th>
                                <th class="text-center">تاريخ طلب الوظيفة</th>
                                <th class="text-center"> الاسم</th>
                                <th class="text-center"> رقم الجوال</th>
                                <th class="text-center"> رقم السجل المدنى</th>
                                <th class="text-center"> البريد الالكترونى</th>
                                <th class="text-center"> مجال التوظيف</th>
                                <th class="text-center"> المؤهل</th>
                                <th class="text-center"> السيرة الذاتية</th>
                            </tr>
                            </thead>
                            <tbody style="border:1px solid #e91e63; color: #e91e63;background: #fff;">
                            <?php $i = 0; ?>
                            @foreach($jobs as $job)
                                <tr>
                                    <td>{{++$i}}</td>
                                    <td> {{$job->created_at}} </td>
                                    <td> {{$job->first_name." ".$job->second_name." ".$job->third_name." ".$job->fourth_name}} </td>
                                    <td> {{$job->phone_number}} </td>
                                    <td> {{$job->record}} </td>
                                    <td> {{$job->email}} </td>
                                    <td> {{$job->field->field}} </td>
                                    <td> {{$job->qualification->qualification}} </td>
                                    <td>
                                        <a class="btn btn-md btn-link" href="{{asset($job->cv)}}">
                                            <i class="fa fa-download"></i>
                                            تحميل السيرة الذاتية
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    @endif
                    @if(isset($submits) && !$submits->isEmpty())
                        <h2 class="mt-5 mb-2">طلباتك للوظائف المطروحة </h2>
                        <hr class="mb-5" style="width: 20%;">
                        <table class="table table-bordered text-center">
                            <thead style="border:1px solid #2c929e; color: #fff;background: #2c929e;">
                            <tr>
                                <th class="text-center">رقم الطلب</th>
                                <th class="text-center">تاريخ طلب الوظيفة</th>
                                <th class="text-center"> الاسم</th>
                                <th class="text-center"> رقم الجوال</th>
                                <th class="text-center"> رقم السجل المدنى</th>
                                <th class="text-center"> البريد الالكترونى</th>
                                <th class="text-center"> المؤهل</th>
                                <th class="text-center"> الوظيفة المطروحة</th>
                                <th class="text-center"> السيرة الذاتية</th>
                            </tr>
                            </thead>
                            <tbody style="border:1px solid #e91e63; color: #e91e63;background: #fff;">
                            <?php $i = 0; ?>
                            @foreach($submits as $submit)
                                <tr>
                                    <td>{{++$i}}</td>
                                    <td> {{$submit->created_at}} </td>
                                    <td> {{$submit->first_name." ".$submit->second_name." ".$submit->third_name." ".$submit->fourth_name}} </td>
                                    <td> {{$submit->phone_number}} </td>
                                    <td> {{$submit->record}} </td>
                                    <td> {{$submit->email}} </td>
                                    <td> {{$submit->qualification->qualification}} </td>
                                    <td> {{$submit->offer->title}} </td>
                                    <td>
                                        <a class="btn btn-md btn-link" href="{{asset($submit->cv)}}">
                                            <i class="fa fa-download"></i>
                                            تحميل السيرة الذاتية
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    @endif
                </div>
            </div>
        </section><!-- End Contact Us Section -->
    </main><!-- End #main -->
@endsection
