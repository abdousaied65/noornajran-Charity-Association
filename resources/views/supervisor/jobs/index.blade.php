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
                            عرض كل الوظائف
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
                    <form method="GET" action="{{route('print.selected.jobs')}}">
                        <button type="submit" class="btn btn-md btn-warning m-1 print_selected">
                            <i class="fa fa-print"></i>
                            طباعة
                        </button>
                    </form>
                    <form method="POST" action="{{route('export.jobs.excel')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-success m-1">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير الكل EXCEL
                        </button>
                    </form>
                    <form method="POST" class="" id="myForm" action="{{route('remove.selected.jobs')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-danger m-1 remove_selected">
                            <i class="fa fa-trash"></i>
                            حذف
                        </button>
                    </form>

                    <a href="{{route('supervisor.jobs.create')}}" role="button"
                       class="btn btn-md btn-info m-1">
                        <i class="fa fa-plus"></i>
                        اضافة
                    </a>
                </div>
                <div class="row p-3">
                    <form method="POST" class="col-lg-6 pull-right d-inline"
                          action="{{route('export.jobs.by.field.excel')}}">
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
                        <button type="submit" class="btn btn-md btn-secondary pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير بالمجال EXCEL
                        </button>
                    </form>
                    <form method="POST" class="col-lg-6 pull-right d-inline"
                          action="{{route('export.jobs.by.qualification.excel')}}">
                        @csrf
                        @method('POST')
                        <div class="form-group pull-right d-inline">
                            <label for="qualifications" class="d-block">اختر المؤهلات للتصدير</label>
                            <select required name="qualifications[]" multiple data-live-search="true"
                                    data-style="btn-danger" data-actions-box="true"
                                    data-title="اختر المؤهلات" id="qualifications" class="selectpicker show-tick">
                                @foreach($qualifications as $qualification)
                                    <option
                                        value="{{$qualification->id}}">{{$qualification->qualification}}</option>
                                @endforeach
                            </select>
                        </div>
                        <button type="submit" class="btn btn-md btn-danger pull-right d-inline">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير بالمؤهل EXCEL
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
                                <th class="border-bottom-0 text-center"> المجال</th>
                                <th class="border-bottom-0 text-center"> المؤهل</th>
                                <th class="border-bottom-0 text-center"> الاسم</th>
                                <th class="border-bottom-0 text-center"> البريد الالكترونى</th>
                                <th class="border-bottom-0 text-center"> السجل المدنى</th>
                                <th class="border-bottom-0 text-center"> رقم الجوال</th>
                                <th class="border-bottom-0 text-center"> السيرة الذاتيه</th>
                                <th style="width: 5%!important;" class="border-bottom-0 text-center">تحكم</th>
                            </tr>
                            </thead>
                            <tbody>
                            @php
                                $i = 0;
                            @endphp

                            @foreach ($data as $job)
                                <tr>
                                    <td>
                                        <input class="check" name="jobs[]" form="myForm"
                                               value="{{$job->id}}"
                                               type="checkbox">
                                    </td>
                                    <td>{{ ++$i }}</td>
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
                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn btn-primary dropdown-toggle"
                                                    data-toggle="dropdown">
                                                <i class="fa fa-wrench"></i>
                                                ادارة
                                            </button>
                                            <div class="dropdown-menu">
                                                @can('عرض وظيفة')
                                                    <a href="{{ route('supervisor.jobs.show', $job->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-eye"></i>
                                                        عرض
                                                    </a>
                                                @endcan
                                                @can('تعديل وظيفة')
                                                    <a href="{{ route('supervisor.jobs.edit', $job->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-edit"></i>
                                                        تعديل
                                                    </a>
                                                @endcan
                                                @can('حذف وظيفة')
                                                    <a class="dropdown-item delete_job"
                                                       job_id="{{ $job->id }}"
                                                       name="{{ $job->first_name." ".$job->second_name." ".$job->third_name." ".$job->fourth_name }}" data-toggle="modal"
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
                        <h6 class="modal-title w-100" style="font-family: 'Cairo'; ">حذف وظيفة</h6>
                        <button aria-label="Close" class="close"
                                data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <form action="{{ route('supervisor.jobs.destroy', 'test') }}" method="post">
                        {{ method_field('delete') }}
                        {{ csrf_field() }}
                        <div class="modal-body">
                            <p>هل انت متأكد انك تريد الحذف ؟</p><br>
                            <input type="hidden" name="job_id" id="job_id" value="">
                            <input class="form-control" name="name" id="name" type="text" readonly>
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
        $('.delete_job').on('click', function () {
            var job_id = $(this).attr('job_id');
            var name = $(this).attr('name');
            $('.modal-body #job_id').val(job_id);
            $('.modal-body #name').val(name);
        });
        $('img').on('click', function () {
            var image_larger = $('#image_larger');
            var path = $(this).attr('src');
            $(image_larger).prop('src', path);
        });
        $('.remove_selected').on('click', function (e) {
            e.preventDefault();
            let jobs = [];
            $("input:checkbox[name*='jobs']:checked").each(function () {
                jobs.push($(this).val());
            });
            if (jobs.length == 0) {
                alert('اختر بعض السجلات للحذف');
            } else {
                $('#myForm').submit();
            }
        });
        $('#example-table tfoot tr th:nth-child(3)').html('<select class="form-control"><option value="">اختر المجال</option>@foreach($fields as $field)<option value="{{$field->field}}">{{$field->field}}</option>@endforeach</select>');
        $('#example-table tfoot tr th:nth-child(4)').html('<select class="form-control"><option value="">اختر المؤهل</option>@foreach($qualifications as $qualification)<option value="{{$qualification->qualification}}">{{$qualification->qualification}}</option>@endforeach</select>');
        $('#example-table tfoot tr th:nth-child(5)').html('<input class="form-control" type="text" placeholder="الاسم" />');
        $('#example-table tfoot tr th:nth-child(6)').html('<input class="form-control" type="text" placeholder="البريد الالكترونى" />');
        $('#example-table tfoot tr th:nth-child(7)').html('<input class="form-control" type="text" placeholder="السجل المدنى" />');
        $('#example-table tfoot tr th:nth-child(8)').html('<input class="form-control" type="text" placeholder="رقم الجوال" />');
        $('#example-table').DataTable({
            "columnDefs": [
                {"orderable": false, "targets": [0, 8, 9]}
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
