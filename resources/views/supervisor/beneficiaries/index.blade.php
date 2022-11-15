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
        width: 50% !important;
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
                            عرض كل المستفيدين
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
                    <form method="GET" action="{{route('print.selected.beneficiaries')}}">
                        <button type="submit" class="btn btn-md btn-warning m-1 print_selected">
                            <i class="fa fa-print"></i>
                            طباعة
                        </button>
                    </form>
                    <form method="POST" action="{{route('export.beneficiaries.excel')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-success m-1">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير الكل EXCEL
                        </button>
                    </form>

                    <form method="POST" class="" id="myForm" action="{{route('remove.selected.beneficiaries')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-danger m-1 remove_selected">
                            <i class="fa fa-trash"></i>
                            حذف
                        </button>
                    </form>

                    <a href="{{route('supervisor.beneficiaries.create')}}" role="button"
                       class="btn btn-md btn-info m-1">
                        <i class="fa fa-plus"></i>
                        اضافة
                    </a>
                </div>
                <div class="row p-4">
                    <form method="POST" class="col-lg-4 pull-right d-inline"
                          action="{{route('export.beneficiaries.by.nationality.excel')}}">
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
                            تصدير بالجنسية EXCEL
                        </button>
                    </form>
                    <form method="POST" class="col-lg-4 pull-right d-inline"
                          action="{{route('export.beneficiaries.by.disability.excel')}}">
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
                            تصدير بنوع الاعاقة EXCEL
                        </button>
                    </form>
                    <form method="POST" class="col-lg-4 pull-right d-inline"
                          action="{{route('export.beneficiaries.by.status.excel')}}">
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
                            تصدير بالحالة EXCEL
                        </button>
                    </form>
                </div>
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
                                <th class="border-bottom-0 text-center">اسم المستفيد</th>
                                <th class="border-bottom-0 text-center">رقم الجوال</th>
                                <th class="border-bottom-0 text-center"> رقم السجل المدنى</th>
                                <th class="border-bottom-0 text-center"> نوع الاعاقة</th>
                                <th class="border-bottom-0 text-center"> الجنسية</th>
                                <th class="border-bottom-0 text-center"> الحالة</th>
                                <th style="width: 5%!important;" class="border-bottom-0 text-center">تحكم</th>
                            </tr>
                            </thead>
                            <tbody>
                            @php
                                $i = 0;
                            @endphp

                            @foreach ($data as $key => $beneficiary)
                                <tr>
                                    <td>
                                        <input class="check" name="beneficiaries[]" form="myForm"
                                               value="{{$beneficiary->id}}"
                                               type="checkbox">
                                    </td>
                                    <td>{{ ++$i }}</td>
                                    <td>{{ $beneficiary->first_name." ".$beneficiary->second_name." ".$beneficiary->third_name." ".$beneficiary->fourth_name }}</td>
                                    <td>{{ $beneficiary->phone_number }}</td>
                                    <td>{{ $beneficiary->record }}</td>
                                    <td>{{ $beneficiary->disability->disability }}</td>
                                    <td>{{ $beneficiary->nationality->nationality }}</td>
                                    <td>
                                        @if($beneficiary->Status == "قيد المراجعة")
                                            <span class="badge badge-warning">
                                                قيد المراجعة
                                            </span>
                                        @elseif($beneficiary->Status == "تمت الموافقة")
                                            <span class="badge badge-success">
                                                تمت الموافقة
                                            </span>
                                        @elseif($beneficiary->Status == "مرفوض")
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
                                                @can('عرض مستفيد')
                                                    <a href="{{ route('supervisor.beneficiaries.show', $beneficiary->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-eye"></i>
                                                        عرض
                                                    </a>
                                                    <a href="{{ route('supervisor.beneficiaries.allow', $beneficiary->id) }}"
                                                       class="dropdown-item text-success">
                                                        <i class="fa fa-check"></i>
                                                        موافقة
                                                    </a>
                                                    <a href="{{ route('supervisor.beneficiaries.deny', $beneficiary->id) }}"
                                                       class="dropdown-item text-danger">
                                                        <i class="fa fa-times"></i>
                                                        رفض
                                                    </a>
                                                    <a href="{{ route('supervisor.beneficiaries.waiting', $beneficiary->id) }}"
                                                       class="dropdown-item text-warning">
                                                        <i class="fa fa-clock"></i>
                                                        قيد المراجعة
                                                    </a>
                                                @endcan
                                                @can('تعديل مستفيد')
                                                    <a href="{{ route('supervisor.beneficiaries.edit', $beneficiary->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-edit"></i>
                                                        تعديل
                                                    </a>
                                                @endcan
                                                @can('حذف مستفيد')
                                                    <a class="dropdown-item delete_beneficiary"
                                                       beneficiary_id="{{ $beneficiary->id }}"
                                                       email="{{ $beneficiary->email }}" data-toggle="modal"
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
                        <h6 class="modal-title w-100" style="font-family: 'Cairo'; ">حذف مستفيد</h6>
                        <button aria-label="Close" class="close"
                                data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <form action="{{ route('supervisor.beneficiaries.destroy', 'test') }}" method="post">
                        {{ method_field('delete') }}
                        {{ csrf_field() }}
                        <div class="modal-body">
                            <p>هل انت متأكد انك تريد الحذف ؟</p><br>
                            <input type="hidden" name="beneficiary_id" id="beneficiary_id" value="">
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
        $('.delete_beneficiary').on('click', function () {
            var beneficiary_id = $(this).attr('beneficiary_id');
            var email = $(this).attr('email');
            $('.modal-body #beneficiary_id').val(beneficiary_id);
            $('.modal-body #email').val(email);
        });
        $('.remove_selected').on('click', function (e) {
            e.preventDefault();
            let beneficiaries = [];
            $("input:checkbox[name*='beneficiaries']:checked").each(function () {
                beneficiaries.push($(this).val());
            });
            if (beneficiaries.length == 0) {
                alert('اختر بعض السجلات للحذف');
            } else {
                $('#myForm').submit();
            }
        });
        $('#example-table tfoot tr th:nth-child(3)').html('<input class="form-control" type="text" placeholder="اسم المستفيد" />');
        $('#example-table tfoot tr th:nth-child(4)').html('<input class="form-control" type="text" placeholder="رقم الجوال" />');
        $('#example-table tfoot tr th:nth-child(5)').html('<input class="form-control" type="text" placeholder="رقم السجل المدنى" />');

        $('#example-table tfoot tr th:nth-child(6)').html('<select name="disability_id" required class="form-control"><option value="">اختر نوع الاعاقة</option>@foreach($disabilities as $disability)<option value="{{$disability->disability}}">{{$disability->disability}}</option>@endforeach</select>');
        $('#example-table tfoot tr th:nth-child(7)').html('<select name="nationality_id" required class="form-control"><option value="">اختر الجنسية </option>@foreach($nationalities as $nationality)<option value="{{$nationality->nationality}}">{{$nationality->nationality}}</option>@endforeach</select>');
        $('#example-table tfoot tr th:nth-child(8)').html('<select name="Status" required class="form-control"><option value="">اختر الحالة </option><option value="قيد المراجعة"> قيد المراجعة </option><option value="تمت الموافقة"> تمت الموافقة </option><option value="مرفوض"> مرفوض </option></select>');

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
