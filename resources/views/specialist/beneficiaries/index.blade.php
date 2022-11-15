@extends('specialist.layouts.master')
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
</style>
@section('content')
    @if (session('success'))
        <div class="alert alert-success  fade show">
            <button class="close" data-dismiss="alert" aria-label="Close">×</button>
            {{ session('success') }}
        </div>
    @endif
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
                <div class="card-body p-1 m-1">
                    <div class="table-responsive hoverable-table">
                        <table class=" display w-100 table-bordered" id="example-table"
                               style="text-align: center;">
                            <thead>
                            <tr>
                                <th class="border-bottom-0 text-center">#</th>
                                <th class="border-bottom-0 text-center">اسم المستفيد</th>
                                <th class="border-bottom-0 text-center">رقم الجوال</th>
                                <th class="border-bottom-0 text-center"> رقم السجل المدنى</th>
                                <th class="border-bottom-0 text-center"> نوع الاعاقة</th>
                                <th class="border-bottom-0 text-center"> الجنسية</th>
                                <th style="width: 10%!important;" class="border-bottom-0 text-center">عرض</th>
                            </tr>
                            </thead>
                            <tbody>
                            @php
                                $i = 0;
                            @endphp

                            @foreach ($data as $key => $beneficiary)
                                <tr>
                                    <td>{{ ++$i }}</td>
                                    <td>{{ $beneficiary->first_name." ".$beneficiary->second_name." ".$beneficiary->third_name." ".$beneficiary->fourth_name }}</td>
                                    <td>{{ $beneficiary->phone_number }}</td>
                                    <td>{{ $beneficiary->record }}</td>
                                    <td>{{ $beneficiary->disability->disability }}</td>
                                    <td>{{ $beneficiary->nationality->nationality }}</td>
                                    <td>
                                        <a href="{{ route('specialist.beneficiaries.show', $beneficiary->id) }}"
                                           class="btn btn-md btn-info">
                                            <i class="fa fa-eye"></i>
                                            عرض
                                        </a>
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
    </div>
@endsection
<script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
<script>
    $(document).ready(function () {
        $('#example-table tfoot tr th:nth-child(2)').html('<input class="form-control" type="text" placeholder="اسم المستفيد" />');
        $('#example-table tfoot tr th:nth-child(3)').html('<input class="form-control" type="text" placeholder="رقم الجوال" />');
        $('#example-table tfoot tr th:nth-child(4)').html('<input class="form-control" type="text" placeholder="رقم السجل المدنى" />');
        $('#example-table tfoot tr th:nth-child(5)').html('<select name="disability_id" required class="form-control"><option value="">اختر نوع الاعاقة</option>@foreach($disabilities as $disability)<option value="{{$disability->disability}}">{{$disability->disability}}</option>@endforeach</select>');
        $('#example-table tfoot tr th:nth-child(6)').html('<select name="nationality_id" required class="form-control"><option value="">اختر الجنسية </option>@foreach($nationalities as $nationality)<option value="{{$nationality->nationality}}">{{$nationality->nationality}}</option>@endforeach</select>');

        $('#example-table').DataTable({
            "columnDefs": [
                {"orderable": false, "targets": [0, 6]}
            ],
            "order": [[0, "desc"]],
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
