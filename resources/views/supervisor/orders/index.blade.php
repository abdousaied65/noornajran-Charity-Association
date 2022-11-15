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

    .bootstrap-select {
        width: 50% !important; margin:0!important;
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
                            عرض كل الطلبات
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
                    <div class="alert alert-danger fade show">
                        <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                        {{ session('error') }}
                    </div>
                @endif
                <div class="row mt-1 mb-1 text-center justify-content-center align-content-center">
                    <form method="GET" action="{{route('print.selected.orders')}}">
                        <button type="submit" class="btn btn-md btn-warning m-1 print_selected">
                            <i class="fa fa-print"></i>
                            طباعة
                        </button>
                    </form>
                    <form method="POST" action="{{route('export.orders.excel')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-success m-1">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير الكل EXCEL
                        </button>
                    </form>
                    <form method="POST" class="" id="myForm" action="{{route('remove.selected.orders')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-danger m-1 remove_selected">
                            <i class="fa fa-trash"></i>
                            حذف
                        </button>
                    </form>

                    <a href="{{route('supervisor.orders.create')}}" role="button"
                       class="btn btn-md btn-info m-1">
                        <i class="fa fa-plus"></i>
                        اضافة
                    </a>
                </div>
                <div class="row">
                    <form method="POST" class="col-lg-3 pull-right d-inline"
                          action="{{route('export.orders.by.nationality.excel')}}">
                        @csrf
                        @method('POST')
                        <div class="form-group pull-right d-inline">
                            <label for="nationalities" class="d-block">اختر الجنسيات للتصدير</label>
                            <select required name="nationalities[]" multiple data-live-search="true"
                                    data-style="btn-secondary" data-actions-box="true"
                                    data-title="اختر الجنسيات" id="nationalities" class="selectpicker show-tick">
                                @foreach($nationalities as $nationality)
                                    <option value="{{$nationality->id}}">{{$nationality->nationality}}</option>
                                @endforeach
                            </select>
                        </div>
                        <button style="font-size: 10px!important;" type="submit"
                                class="btn btn-md btn-secondary pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير EXCEL
                        </button>
                    </form>
                    <form method="POST" class="col-lg-3 pull-right d-inline"
                          action="{{route('export.orders.by.disability.excel')}}">
                        @csrf
                        @method('POST')
                        <div class="form-group pull-right d-inline">
                            <label for="disabilities" class="d-block">اختر نوع الاعاقة للتصدير</label>
                            <select required name="disabilities[]" multiple data-live-search="true"
                                    data-style="btn-danger" data-actions-box="true"
                                    data-title="اختر نوع الاعاقة" id="disabilities" class="selectpicker show-tick">
                                @foreach($disabilities as $disability)
                                    <option value="{{$disability->id}}">{{$disability->disability}}</option>
                                @endforeach
                            </select>
                        </div>
                        <button style="font-size: 10px!important;" type="submit"
                                class="btn btn-md btn-danger pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير EXCEL
                        </button>
                    </form>
                    <form method="POST" class="col-lg-3 pull-right d-inline"
                          action="{{route('export.orders.by.order_type.excel')}}">
                        @csrf
                        @method('POST')
                        <div class="form-group pull-right d-inline">
                            <label for="order_types" class="d-block">اختر نوع الطلب للتصدير</label>
                            <select required name="order_types[]" multiple data-live-search="true"
                                    data-style="btn-info" data-actions-box="true"
                                    data-title="اختر نوع الطلب" id="order_types" class="selectpicker show-tick">
                                @foreach($order_types as $order_type)
                                    <option value="{{$order_type->id}}">{{$order_type->order_type}}</option>
                                @endforeach
                            </select>
                        </div>
                        <button style="font-size: 10px!important;" type="submit"
                                class="btn btn-md btn-info pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير EXCEL
                        </button>
                    </form>
                    <form method="POST" class="col-lg-3 pull-right d-inline"
                          action="{{route('export.orders.by.status.excel')}}">
                        @csrf
                        @method('POST')
                        <div class="form-group pull-right d-inline">
                            <label for="statuses" class="d-block">اختر الحالات للتصدير</label>
                            <select required name="statuses[]" multiple data-live-search="true"
                                    data-style="btn-warning" data-actions-box="true"
                                    data-title="اختر الحالات" id="statuses" class="selectpicker show-tick">
                                <option value="قيد المراجعة">قيد المراجعة</option>
                                <option value="تمت الموافقة">تمت الموافقة</option>
                                <option value="مرفوض">مرفوض</option>
                            </select>
                        </div>
                        <button style="font-size: 10px!important;" type="submit"
                                class="btn btn-md btn-warning pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير EXCEL
                        </button>
                    </form>
                </div>
                <div class="card-body p-1 m-1">
                    <div class="table-responsive hoverable-table">
                        <table class="table table-striped table-condensed text-nowrap table-hover display table-bordered"
                               id="example-table"
                               style="text-align: center;width: 100%!important;">
                            <thead>
                            <tr>
                                <th class="border-bottom-0 text-center">
                                    <input type="checkbox" id="check_all"/>
                                </th>
                                <th class="border-bottom-0 text-center">#</th>
                                <th class="border-bottom-0 text-center"> الاسم</th>
                                <th class="border-bottom-0 text-center">رقم الجوال</th>
                                <th class="border-bottom-0 text-center"> الجنسية</th>
                                <th class="border-bottom-0 text-center"> نوع الاعاقة</th>
                                <th class="border-bottom-0 text-center"> نوع الطلب</th>
                                <th class="border-bottom-0 text-center"> الكمية</th>
                                <th class="border-bottom-0 text-center"> حالة الطلب</th>
                                <th style="width: 5%!important;" class="border-bottom-0 text-center">تحكم</th>
                            </tr>
                            </thead>
                            <tbody>
                            @php
                                $i = 0;
                            @endphp

                            @foreach ($data as $key => $order)
                                <tr>
                                    <td>
                                        <input class="check" name="orders[]" form="myForm"
                                               value="{{$order->id}}"
                                               type="checkbox">
                                    </td>
                                    <td>{{ ++$i }}</td>
                                    <td>{{ $order->first_name." ".$order->second_name." ".$order->third_name." ".$order->fourth_name }}</td>
                                    <td>{{ $order->phone_number }}</td>
                                    <td>{{ $order->nationality->nationality }}</td>
                                    <td>{{ $order->disability->disability }}</td>
                                    <td>{{ $order->orderType->order_type }}</td>
                                    <td>{{ $order->quantity }}</td>
                                    <td>
                                        @if($order->Status == "قيد المراجعة")
                                            <span class="badge badge-warning">
                                                قيد المراجعة
                                            </span>
                                        @elseif($order->Status == "تمت الموافقة")
                                            <span class="badge badge-success">
                                                تمت الموافقة
                                            </span>
                                        @elseif($order->Status == "مرفوض")
                                            <span class="badge badge-danger">
                                                مرفوض
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
                                                @can('عرض طلب')
                                                    <a href="{{ route('supervisor.orders.show', $order->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-eye"></i>
                                                        عرض
                                                    </a>
                                                    <a href="{{ route('supervisor.orders.allow', $order->id) }}"
                                                       class="dropdown-item text-success">
                                                        <i class="fa fa-check"></i>
                                                        موافقة
                                                    </a>
                                                    <a href="{{ route('supervisor.orders.deny', $order->id) }}"
                                                       class="dropdown-item text-danger">
                                                        <i class="fa fa-times"></i>
                                                        رفض
                                                    </a>
                                                    <a href="{{ route('supervisor.orders.waiting', $order->id) }}"
                                                       class="dropdown-item text-warning">
                                                        <i class="fa fa-clock"></i>
                                                        قيد المراجعة
                                                    </a>
                                                @endcan
                                                @can('تعديل طلب')
                                                    <a href="{{ route('supervisor.orders.edit', $order->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-edit"></i>
                                                        تعديل
                                                    </a>
                                                @endcan
                                                @can('حذف طلب')
                                                    <a class="dropdown-item delete_order"
                                                       order_id="{{ $order->id }}"
                                                       email="{{ $order->email }}" data-toggle="modal"
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
                        <h6 class="modal-title w-100" style="font-family: 'Cairo'; ">حذف طلب</h6>
                        <button aria-label="Close" class="close"
                                data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <form action="{{ route('supervisor.orders.destroy', 'test') }}" method="post">
                        {{ method_field('delete') }}
                        {{ csrf_field() }}
                        <div class="modal-body">
                            <p>هل انت متأكد انك تريد الحذف ؟</p><br>
                            <input type="hidden" name="order_id" id="order_id" value="">
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
        $('.delete_order').on('click', function () {
            var order_id = $(this).attr('order_id');
            var email = $(this).attr('email');
            $('.modal-body #order_id').val(order_id);
            $('.modal-body #email').val(email);
        });
        $('.remove_selected').on('click', function (e) {
            e.preventDefault();
            let orders = [];
            $("input:checkbox[name*='orders']:checked").each(function () {
                orders.push($(this).val());
            });
            if (orders.length == 0) {
                alert('اختر بعض السجلات للحذف');
            } else {
                $('#myForm').submit();
            }
        });
        $('#example-table tfoot tr th:nth-child(3)').html('<input class="form-control" type="text" placeholder="الاسم" />');
        $('#example-table tfoot tr th:nth-child(4)').html('<input class="form-control" type="text" placeholder="رقم الجوال" />');
        $('#example-table tfoot tr th:nth-child(6)').html('<select name="disability_id" required class="form-control"><option value="">اختر نوع الاعاقة</option>@foreach($disabilities as $disability)<option value="{{$disability->disability}}">{{$disability->disability}}</option>@endforeach</select>');
        $('#example-table tfoot tr th:nth-child(5)').html('<select name="nationality_id" required class="form-control"><option value="">اختر الجنسية </option>@foreach($nationalities as $nationality)<option value="{{$nationality->nationality}}">{{$nationality->nationality}}</option>@endforeach</select>');
        $('#example-table tfoot tr th:nth-child(7)').html('<select name="order_type_id" required class="form-control"><option value="">اختر نوع الطلب </option>@foreach($order_types as $order_type)<option value="{{$order_type->order_type}}">{{$order_type->order_type}}</option>@endforeach</select>');
        $('#example-table tfoot tr th:nth-child(8)').html('<input class="form-control" type="text" placeholder="الكمية" />');
        $('#example-table tfoot tr th:nth-child(9)').html('<select name="Status" required class="form-control"><option value="">اختر الحالة </option><option value="قيد المراجعة"> قيد المراجعة </option><option value="تمت الموافقة"> تمت الموافقة </option><option value="مرفوض">مرفوض</option></select>');
        $('#example-table').DataTable({
            "columnDefs": [
                {"orderable": false, "targets": [0, 9]}
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
