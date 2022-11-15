@extends('specialist.layouts.master')
<!-- Internal Data table css -->
<style>
    i.la {
        font-size: 15px !important;
    }

    img.specialist-avatar {
        border-radius: 100%;
        border: 1px solid #aaa;
        padding: 3px;
        width: 60px;
        height: 60px;
    }

    h6.specialist-name {
        font-size: 15px !important;
    }

    .shopping-cart-footer {
        border: 0 !important;
    }
</style>
@section('content')
    <div class="row text-center">
        <div class="col-lg-12 mt-5">
            <p class="alert alert-info alert-md text-center"> عرض بيانات المستفيد </p>
        </div>
        <div class="table-responsive hoverable-table">
            <table class="table table-striped table-condensed table-bordered text-center">
                <thead>
                <tr>
                    <th class="border-bottom-0 text-center">اسم المستفيد</th>
                    <th class="border-bottom-0 text-center">رقم الجوال</th>
                    <th class="border-bottom-0 text-center"> رقم السجل المدنى</th>
                    <th class="border-bottom-0 text-center"> نوع الاعاقة</th>
                    <th class="border-bottom-0 text-center"> الجنسية</th>
                    <th class="border-bottom-0 text-center"> الحالة</th>
                    <th class="border-bottom-0 text-center"> البريد الالكترونى</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>{{ $beneficiary->first_name." ".$beneficiary->second_name." ".$beneficiary->third_name." ".$beneficiary->fourth_name }}</td>
                    <td>{{ $beneficiary->phone_number }}</td>
                    <td>{{ $beneficiary->record }}</td>
                    <td>{{ $beneficiary->disability->disability }}</td>
                    <td>{{ $beneficiary->nationality->nationality }}</td>
                    <td>{{ $beneficiary->Status }}</td>
                    <td>{{ $beneficiary->email }}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="col-lg-12">
            @if (session('success'))
                <div class="alert alert-success  fade show">
                    <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                    {{ session('success') }}
                </div>
            @endif
            <p class="alert alert-info alert-md text-center"> عرض تقارير الاخصائيين عن هذا المستفيد </p>
            <!-- row -->
            <div class="row">
                <div class="col-xl-12 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <!-- Shopping Cart-->
                            <div class="shopping-cart-footer">
                                <div class="column text-right">
                                    <a class="btn btn-secondary pull-right"
                                       href="{{route('specialist.beneficiaries.index')}}">
                                        <i class="fa fa-arrow-right"></i>
                                        العودة الى المستفيدين</a>
                                </div>

                                <div class="column text-left">
                                    <a class="btn btn-success"
                                       href="{{route('specialist.reports.create',$beneficiary->id)}}">
                                        <i class="fa fa-plus"></i>
                                        اضافة تقرير جديد لهذا المستفيد
                                    </a>
                                </div>
                            </div>
                            @if(isset($reports) &&!$reports->isEmpty())
                                <div class="product-details table-responsive text-nowrap">
                                    <table class="table table-bordered table-hover mb-0 text-nowrap text-center">
                                        <thead>
                                        <tr>
                                            <th style="width:20%!important;">الاخصائى</th>
                                            <th style="width:60%!important;">التقرير</th>
                                            <th style="width:10%!important;">تاريخ الاضافة</th>
                                            <th style="width:10%!important;">تحكم</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach($reports as $report)
                                            <tr>
                                                <td>
                                                    <img class="specialist-avatar"
                                                         src="{{asset('admin-assets/img/user.png')}}"
                                                         alt="img"/>
                                                    <h6 class="mt-2 specialist-name">
                                                        {{$report->specialist->first_name." ".$report->specialist->second_name." ".$report->specialist->third_name." ".$report->specialist->fourth_name}}
                                                    </h6>
                                                </td>
                                                <td class="text-center text-lg text-medium">
                                                    {{mb_substr($report->report,0,50)}} ..
                                                </td>
                                                <td class="text-center text-lg text-medium">
                                                    {{$report->created_at}}
                                                </td>
                                                <td class="text-center">
                                                    <a data-toggle="modal" href="#modaldemo8"
                                                       report_id="{{$report->id}}"
                                                       class="btn btn-md btn-success show_report"
                                                       style="padding: 10px!important;">
                                                        <i class="fa fa-eye"></i>
                                                    </a>
                                                    @if($report->specialist_id == Auth::user()->id)
                                                        <?php
                                                        $now = time();
                                                        $created = strtotime($report->created_at);
                                                        $datediff = $now - $created;
                                                        $diff = round($datediff / (60 * 60), 2);
                                                        ?>
                                                        @if($diff < 24)
                                                            <a href="{{route('specialist.reports.edit',$report->id)}}"
                                                               class="btn btn-md btn-info"
                                                               style="padding: 10px!important;">
                                                                <i class="fa fa-edit"></i>
                                                            </a>

                                                            <a class="btn btn-md btn-danger delete_report"
                                                               data-toggle="modal"
                                                               href="#modaldemo9"
                                                               beneficiary_id="{{$report->beneficiary_id}}"
                                                               report_id="{{$report->id}}"
                                                               report="{{mb_substr($report->report,0,50)}} .."
                                                               style="padding: 10px!important;">
                                                                <i class="fa fa-trash"></i>
                                                            </a>
                                                        @endif
                                                    @endif
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            @else
                                <p class="alert alert-danger alert-md text-center">
                                    لا يوجد تقارير من الاخصائيين لهذا المستفيد
                                </p>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
            <!-- row closed -->
        </div>
    </div>

    <!-- Modal effects -->
    <div class="modal" id="modaldemo8">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content modal-content-demo">
                <div class="modal-header text-center">
                    <h6 class="modal-title w-100" style="font-family: 'Cairo'; ">
                        عرض التقرير
                    </h6>
                    <button aria-label="Close" class="close"
                            data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body report_details">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">الغاء</button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal" id="modaldemo9">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content modal-content-demo">
                <div class="modal-header text-center">
                    <h6 class="modal-title w-100" style="font-family: 'Cairo'; ">حذف تقرير</h6>
                    <button aria-label="Close" class="close"
                            data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                </div>
                <form action="{{ route('specialist.reports.destroy') }}" method="post">
                    {{ method_field('delete') }}
                    {{ csrf_field() }}
                    <div class="modal-body">
                        <p>هل انت متأكد انك تريد الحذف ؟</p><br>
                        <input type="hidden" name="report_id" id="report_id" value="">
                        <input type="hidden" name="beneficiary_id" id="beneficiary_id" value="">
                        <input class="form-control" name="report" id="report" readonly>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">الغاء</button>
                        <button type="submit" class="btn btn-danger">حذف</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

<script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
<script>
    $(document).ready(function () {
        $('.show_report').on('click', function () {
            $('.report_details').html("");
            let report_id = $(this).attr('report_id');
            $.post('{{route('show.report.details')}}', {
                "_token": "{{ csrf_token() }}", report_id: report_id
            }, function (data) {
                $('.report_details').html(data);
            })
        });
        $('.delete_report').on('click', function () {
            var report_id = $(this).attr('report_id');
            var beneficiary_id = $(this).attr('beneficiary_id');
            var report = $(this).attr('report');
            $('.modal-body #beneficiary_id').val(beneficiary_id);
            $('.modal-body #report_id').val(report_id);
            $('.modal-body #report').val(report);
        });
    });
</script>

