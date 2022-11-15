@extends('supervisor.layouts.master')
<style>
    tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }

    .btn-md {
        height: 40px !important;
        min-width: 100px !important;
        padding: 10px !important;
        text-align: center !important;
    }

    input[type="checkbox"] {
        width: 20px;
        height: 20px;
    }
</style>
@section('content')

    <!-- row opened -->
    <div class="row row-sm">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header pb-0">
                    <div class="col-lg-12 margin-tb">
                        <h5 style="min-width: 300px;" class="pull-right alert alert-md alert-success">
                            عرض كل التقارير
                        </h5>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row mt-1 mb-1 text-center justify-content-center align-content-center">
                    <form method="GET" action="{{route('print.selected.reports')}}">
                        <button type="submit" class="btn btn-md btn-warning m-1 print_selected">
                            <i class="fa fa-print"></i>
                            طباعة
                        </button>
                    </form>
                    <form method="POST" action="{{route('export.reports.excel')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-success m-1">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير الكل EXCEL
                        </button>
                    </form>
                    <form method="POST" class="" id="myForm" action="{{route('remove.selected.reports')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-danger m-1 remove_selected">
                            <i class="fa fa-trash"></i>
                            حذف
                        </button>
                    </form>
                </div>
                <div class="row p-3">
                    <form method="POST" class="col-lg-6 pull-right d-inline"
                          action="{{route('export.reports.by.beneficiary.excel')}}">
                        @csrf
                        @method('POST')
                        <div class="form-group pull-right d-inline">
                            <label for="beneficiaries" class="d-block">اختر المستفيدين للتصدير</label>
                            <select required name="beneficiaries[]" multiple data-live-search="true"
                                    data-style="btn-secondary" data-actions-box="true"
                                    data-title="اختر المستفيدين" id="beneficiaries" class="selectpicker show-tick">
                                @foreach($beneficiaries as $beneficiary)
                                    <option value="{{$beneficiary->id}}">
                                        {{$beneficiary->first_name." ".$beneficiary->second_name." ".$beneficiary->third_name." ".$beneficiary->fourth_name}}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <button style="font-size: 13px!important;" type="submit"
                                class="btn btn-md btn-secondary pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير بالمستفيدين EXCEL
                        </button>
                    </form>
                    <form method="POST" class="col-lg-6 pull-right d-inline"
                          action="{{route('export.reports.by.specialist.excel')}}">
                        @csrf
                        @method('POST')
                        <div class="form-group pull-right d-inline">
                            <label for="specialists" class="d-block">اختر الاخصائيين للتصدير</label>
                            <select required name="specialists[]" multiple data-live-search="true"
                                    data-style="btn-danger" data-actions-box="true"
                                    data-title="اختر الاخصائيين" id="specialists" class="selectpicker show-tick">
                                @foreach($specialists as $specialist)
                                    <option value="{{$specialist->id}}">
                                        {{$specialist->first_name." ".$specialist->second_name." ".$specialist->third_name." ".$specialist->fourth_name}}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <button style="font-size: 13px!important;" type="submit"
                                class="btn btn-md btn-danger pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير بالاخصائيين EXCEL
                        </button>
                    </form>
                </div>
                @if (session('success'))
                    <div class="alert alert-success  fade show">
                        <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                        {{ session('success') }}
                    </div>
                @endif
                @if (session('error'))
                    <div class="alert alert-danger fade show">
                        <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                        {{ session('error') }}
                    </div>
                @endif
                <div class="card-body p-1 m-1">
                    <div class="table-responsive hoverable-table">
                        <table class="display w-100 text-nowrap table-bordered" id="example-table"
                               style="text-align: center;">
                            <thead>
                            <tr>
                                <th class="border-bottom-0 text-center">
                                    <input type="checkbox" id="check_all"/>
                                </th>
                                <th class="border-bottom-0 text-center">#</th>
                                <th class="border-bottom-0 text-center"> اسم الاخصائى</th>
                                <th class="border-bottom-0 text-center"> اسم المستفيد</th>
                                <th class="border-bottom-0 text-center"> نص التقرير</th>
                                <th class="border-bottom-0 text-center"> تاريخ التقرير</th>
                                <th style="width: 5%!important;" class="border-bottom-0 text-center">تحكم</th>
                            </tr>
                            </thead>
                            <tbody>
                            @php
                                $i = 0;
                            @endphp

                            @foreach ($reports as $report)
                                <tr>
                                    <td>
                                        <input class="check" name="reports[]" form="myForm"
                                               value="{{$report->id}}"
                                               type="checkbox">
                                    </td>
                                    <td>{{ ++$i }}</td>
                                    <td>
                                        {{$report->specialist->first_name." ".$report->specialist->second_name." ".$report->specialist->third_name." ".$report->specialist->fourth_name}}
                                    </td>
                                    <td>
                                        {{$report->beneficiary->first_name." ".$report->beneficiary->second_name." ".$report->beneficiary->third_name." ".$report->beneficiary->fourth_name}}
                                    </td>
                                    <td>{{mb_substr($report->report,0,50)}} ..</td>
                                    <td>{{ $report->created_at }}</td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn btn-primary dropdown-toggle"
                                                    data-toggle="dropdown">
                                                <i class="fa fa-wrench"></i>
                                                ادارة
                                            </button>
                                            <div class="dropdown-menu">
                                                <a data-toggle="modal" href="#modaldemo9"
                                                   report_id="{{$report->id}}"
                                                   class="dropdown-item show_report">
                                                    <i class="fa fa-eye"></i>
                                                    عرض
                                                </a>
                                                <a target="_blank" class="dropdown-item"
                                                   href="{{ route('supervisor.download.report',$report->id) }}">
                                                    <i class="fa fa-print"></i>
                                                    طباعة التقرير
                                                </a>

                                                <a href="{{ route('supervisor.reports.edit', $report->id) }}"
                                                   class="dropdown-item">
                                                    <i class="fa fa-edit"></i>
                                                    تعديل
                                                </a>

                                                <a class="dropdown-item delete_report"
                                                   report_id="{{ $report->id }}"
                                                   report="{{ $report->beneficiary->first_name." ".$report->beneficiary->second_name." ".$report->beneficiary->third_name." ".$report->beneficiary->fourth_name }}" data-toggle="modal"
                                                   href="#modaldemo8">
                                                    <i class="fa fa-trash"></i>
                                                    حذف
                                                </a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                            <tfoot>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                            </tfoot>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--/div-->

        <!-- Modal effects -->
        <div class="modal" id="modaldemo8">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content modal-content-demo">
                    <div class="modal-header text-center">
                        <h6 class="modal-title w-100" style="font-family: 'Cairo'; ">حذف تقرير</h6>
                        <button aria-label="Close" class="close"
                                data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <form action="{{ route('supervisor.reports.destroy', 'test') }}" method="post">
                        {{ method_field('delete') }}
                        {{ csrf_field() }}
                        <div class="modal-body">
                            <p>هل انت متأكد انك تريد الحذف ؟</p><br>
                            <input type="hidden" name="report_id" id="report_id" value="">
                            <input class="form-control" name="report" id="report" type="text" readonly>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">الغاء</button>
                            <button type="submit" class="btn btn-danger">حذف</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Modal effects -->
        <div class="modal" id="modaldemo9">
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

    </div>
@endsection
<script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
<script>
    $(document).ready(function () {
        $('.show_report').on('click', function () {
            $('.report_details').html("");
            let report_id = $(this).attr('report_id');
            $.post('{{route('supervisor.show.report.details')}}', {
                "_token": "{{ csrf_token() }}", report_id: report_id
            }, function (data) {
                $('.report_details').html(data);
            })
        });

        $('#check_all').click(function () {
            if (this.checked) {
                $('input.check').prop('checked', true);
            } else {
                $('input.check').prop('checked', false);
            }
        });
        $('.delete_report').on('click', function () {
            var report_id = $(this).attr('report_id');
            var report = $(this).attr('report');
            $('.modal-body #report_id').val(report_id);
            $('.modal-body #report').val(report);
        });
        $('img').on('click', function () {
            var image_larger = $('#image_larger');
            var path = $(this).attr('src');
            $(image_larger).prop('src', path);
        });
        $('.remove_selected').on('click', function (e) {
            e.preventDefault();
            let reports = [];
            $("input:checkbox[name*='reports']:checked").each(function () {
                reports.push($(this).val());
            });
            if (reports.length == 0) {
                alert('اختر بعض السجلات للحذف');
            } else {
                $('#myForm').submit();
            }
        });
        $('#example-table tfoot tr th:nth-child(3)').html('<input class="form-control" type="text" placeholder="الاخصائى" />');
        $('#example-table tfoot tr th:nth-child(4)').html('<input class="form-control" type="text" placeholder="المستفيد" />');
        $('#example-table tfoot tr th:nth-child(5)').html('<input class="form-control" type="text" placeholder="نص التقرير" />');
        $('#example-table').DataTable({
            "columnDefs": [
                {"orderable": false, "targets": [0, 6]}
            ],
            "order": [[1, "desc"]],
            initComplete: function () {
                this.api().columns().every(function () {
                    var that = this;
                    $('input[type="text"]', this.footer()).on('keyup change clear', function () {
                        if (that.search() !== this.value) {
                            that.search(this.value).draw();
                        }
                    });
                });
            }
        });
    });
</script>
