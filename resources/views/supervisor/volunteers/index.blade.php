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

    span.badge {
        padding: 10px !important;
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
                            عرض كل المتطوعين
                        </h5>
                    </div>
                    <div class="clearfix"></div>
                </div>
                @if (session('success'))
                    <div class="alert alert-success  fade show">
                        <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                        {{ session('success') }}
                    </div>
                @endif
                @if (session('error'))
                    <div class="alert alert-danger  fade show">
                        <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                        {{ session('error') }}
                    </div>
                @endif
                <div class="row mt-1 mb-1 text-center justify-content-center align-content-center">
                    <form method="GET" action="{{route('print.selected.volunteers')}}">
                        <button type="submit" class="btn btn-md btn-warning m-1 print_selected">
                            <i class="fa fa-print"></i>
                            طباعة
                        </button>
                    </form>
                    <form method="POST" action="{{route('export.volunteers.excel')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-success m-1">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير الكل EXCEL
                        </button>
                    </form>

                    <form method="POST" class="" id="myForm" action="{{route('remove.selected.volunteers')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-danger m-1 remove_selected">
                            <i class="fa fa-trash"></i>
                            حذف
                        </button>
                    </form>

                    <a href="{{route('supervisor.volunteers.create')}}" role="button"
                       class="btn btn-md btn-info m-1">
                        <i class="fa fa-plus"></i>
                        اضافة
                    </a>

                    <a href="{{route('supervisor.renewal.requests')}}" role="button"
                       class="btn btn-md btn-secondary m-1">
                        <i class="fa fa-recycle"></i>
                        طلبات تجديد العضوية
                    </a>
                </div>

                <div class="row p-3">
                    <form method="POST" class="col-lg-4 pull-right d-inline"
                          action="{{route('export.volunteers.by.field.excel')}}">
                        @csrf
                        @method('POST')
                        <div class="form-group pull-right d-inline">
                            <label for="fields" class="d-block">اختر المجالات للتصدير</label>
                            <select required name="fields[]" multiple data-live-search="true"
                                    data-style="btn-secondary" data-actions-box="true"
                                    data-title="اختر المجالات" id="fields" class="selectpicker show-tick">
                                @foreach($fields as $field)
                                    <option value="{{$field->id}}">{{$field->field}}</option>
                                @endforeach
                            </select>
                        </div>
                        <button style="font-size: 10px!important;" type="submit"
                                class="btn btn-md btn-secondary pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير بالمجال EXCEL
                        </button>
                    </form>
                    <form method="POST" class="col-lg-4 pull-right d-inline"
                          action="{{route('export.volunteers.by.status.excel')}}">
                        @csrf
                        @method('POST')
                        <div class="form-group pull-right d-inline">
                            <label for="statuses" class="d-block">اختر الحالات للتصدير</label>
                            <select required name="statuses[]" multiple data-live-search="true"
                                    data-style="btn-warning" data-actions-box="true"
                                    data-title="اختر الحالات" id="statuses" class="selectpicker show-tick">
                                <option value="قيد المراجعة">قيد المراجعة</option>
                                <option value="سارى">سارى</option>
                                <option value="منتهى">منتهى</option>
                            </select>
                        </div>
                        <button style="font-size: 10px!important;" type="submit"
                                class="btn btn-md btn-warning pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير بالحالة EXCEL
                        </button>
                    </form>
                    <form method="POST" class="col-lg-4 pull-right d-inline"
                          action="{{route('export.volunteers.by.end.excel')}}">
                        @csrf
                        @method('POST')
                        <label for="" class="d-block">
                            تصدير المتطوعين الباقى على انتهاء عضويتهم شهر فأقل
                        </label>
                        <button style="font-size: 12px!important;" type="submit"
                                class="btn btn-md btn-block btn-danger pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            اضغط هنا للتصدير
                        </button>
                    </form>

                </div>

                <div class="card-body p-1 m-1" style="min-height: 500px!important;">
                    <div class="table-responsive hoverable-table" style="min-height: 500px!important;">
                        <table class="display w-100 table-bordered text-nowrap" id="example-table"
                               style="text-align: center;">
                            <thead>
                            <tr>
                                <th class="border-bottom-0 text-center">
                                    <input type="checkbox" id="check_all"/>
                                </th>
                                <th class="border-bottom-0 text-center">#</th>
                                <th class="border-bottom-0 text-center">اسم المتطوع</th>
                                <th class="border-bottom-0 text-center"> رقم السجل المدنى</th>
                                <th class="border-bottom-0 text-center">رقم الجوال</th>
                                <th class="border-bottom-0 text-center"> مجال التطوع</th>
                                <th class="border-bottom-0 text-center"> تاريخ تفعيل العضوية</th>
                                <th class="border-bottom-0 text-center"> حالة الاشتراك</th>
                                <th style="width: 5%!important;" class="border-bottom-0 text-center">تحكم</th>
                            </tr>
                            </thead>
                            <tbody>
                            @php
                                $i = 0;
                            @endphp

                            @foreach ($data as $key => $volunteer)
                                <tr>
                                    <td>
                                        <input class="check" name="volunteers[]" form="myForm"
                                               value="{{$volunteer->id}}"
                                               type="checkbox">
                                    </td>
                                    <td>{{ ++$i }}</td>
                                    <td>{{ $volunteer->first_name." ".$volunteer->second_name." ".$volunteer->third_name." ".$volunteer->fourth_name }}</td>
                                    <td>{{ $volunteer->record }}</td>
                                    <td>{{ $volunteer->phone_number }}</td>
                                    <td>{{ $volunteer->field->field }}</td>
                                    <td>
                                        @if($volunteer->Status == "سارى")
                                            {{ $volunteer->start_date }}
                                        @endif
                                    </td>
                                    <td>
                                        @if($volunteer->Status == "قيد المراجعة")
                                            <span class="badge badge-warning">
                                                قيد المراجعة
                                            </span>
                                        @elseif($volunteer->Status == "سارى")
                                            <span class="badge badge-success">
                                                سارى
                                            </span>
                                        @elseif($volunteer->Status == "منتهى")
                                            <span class="badge badge-danger">
                                                منتهى
                                            </span>
                                        @endif
                                    </td>
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn btn-primary dropdown-toggle"
                                                    data-toggle="dropdown">
                                                <i class="fa fa-wrench"></i>
                                                ادارة
                                            </button>
                                            <div class="dropdown-menu">
                                                @can('عرض متطوع')

                                                    <a href="{{ route('supervisor.volunteers.show', $volunteer->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-eye"></i>
                                                        عرض
                                                    </a>

{{--                                                    <a href="{{ route('supervisor.volunteers.allow', $volunteer->id) }}"--}}
{{--                                                       class="dropdown-item text-success">--}}
{{--                                                        <i class="fa fa-check"></i>--}}
{{--                                                        تفعيل--}}
{{--                                                    </a>--}}

                                                    <a href="{{ route('supervisor.volunteers.deny', $volunteer->id) }}"
                                                       class="dropdown-item text-danger">
                                                        <i class="fa fa-times"></i>
                                                        منتهى
                                                    </a>

                                                    <a href="{{ route('supervisor.volunteers.waiting', $volunteer->id) }}"
                                                       class="dropdown-item text-warning">
                                                        <i class="fa fa-clock"></i>
                                                        قيد المراجعة
                                                    </a>

                                                    <a href="{{ route('supervisor.volunteers.renew.one', $volunteer->id) }}"
                                                       class="dropdown-item text-info">
                                                        <i class="fa fa-recycle"></i>
                                                        تجديد العضوية سنة
                                                    </a>

                                                    <a href="{{ route('supervisor.volunteers.renew.two', $volunteer->id) }}"
                                                       class="dropdown-item text-info">
                                                        <i class="fa fa-recycle"></i>
                                                        تجديد العضوية سنتين
                                                    </a>

                                                    <a href="{{ route('supervisor.volunteers.renew.three', $volunteer->id) }}"
                                                       class="dropdown-item text-info">
                                                        <i class="fa fa-recycle"></i>
                                                        تجديد العضوية 3 سنين
                                                    </a>

                                                @endcan
                                                @can('تعديل متطوع')
                                                    <a href="{{ route('supervisor.volunteers.edit', $volunteer->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-edit"></i>
                                                        تعديل
                                                    </a>
                                                @endcan
                                                @can('حذف متطوع')
                                                    <a class="dropdown-item delete_volunteer"
                                                       volunteer_id="{{ $volunteer->id }}"
                                                       email="{{ $volunteer->email }}" data-toggle="modal"
                                                       href="#modaldemo8">
                                                        <i class="fa fa-trash"></i>
                                                        حذف
                                                    </a>
                                                @endcan
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
                        <h6 class="modal-title w-100" style="font-family: 'Cairo'; ">حذف متطوع</h6>
                        <button aria-label="Close" class="close"
                                data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <form action="{{ route('supervisor.volunteers.destroy', 'test') }}" method="post">
                        {{ method_field('delete') }}
                        {{ csrf_field() }}
                        <div class="modal-body">
                            <p>هل انت متأكد انك تريد الحذف ؟</p><br>
                            <input type="hidden" name="volunteer_id" id="volunteer_id" value="">
                            <input class="form-control" name="email" id="email" type="text" readonly>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">الغاء</button>
                            <button type="submit" class="btn btn-danger">حذف</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
<script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
<script>
    $(document).ready(function () {
        $('#check_all').click(function () {
            if (this.checked) {
                $('input.check').prop('checked', true);
            } else {
                $('input.check').prop('checked', false);
            }
        });
        $('.delete_volunteer').on('click', function () {
            var volunteer_id = $(this).attr('volunteer_id');
            var email = $(this).attr('email');
            $('.modal-body #volunteer_id').val(volunteer_id);
            $('.modal-body #email').val(email);
        });
        $('.remove_selected').on('click', function (e) {
            e.preventDefault();
            let volunteers = [];
            $("input:checkbox[name*='volunteers']:checked").each(function () {
                volunteers.push($(this).val());
            });
            if (volunteers.length == 0) {
                alert('اختر بعض السجلات للحذف');
            } else {
                $('#myForm').submit();
            }
        });
        $('#example-table tfoot tr th:nth-child(3)').html('<input class="form-control" type="text" placeholder="اسم المتطوع" />');
        $('#example-table tfoot tr th:nth-child(4)').html('<input class="form-control" type="text" placeholder="رقم السجل المدنى" />');
        $('#example-table tfoot tr th:nth-child(5)').html('<input class="form-control" type="text" placeholder="رقم الجوال" />');
        $('#example-table tfoot tr th:nth-child(6)').html('<select name="field_id" required class="form-control"><option value="">اختر مجال التطوع</option>@foreach($fields as $field)<option value="{{$field->field}}">{{$field->field}}</option>@endforeach</select>');
        $('#example-table tfoot tr th:nth-child(8)').html('<select name="Status" required class="form-control"><option value="">اختر الحالة </option><option value="سارى"> سارى </option><option value="منتهى"> منتهى </option><option value="قيد المراجعة"> قيد المراجعة </option></select>');

        $('#example-table').DataTable({
            "columnDefs": [
                {"orderable": false, "targets": [0, 8]}
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
                    $('select', this.footer()).on('change', function () {
                        if (that.search() !== this.value) {
                            that.search(this.value).draw();
                        }
                    });
                });
            }
        });
    });
</script>
