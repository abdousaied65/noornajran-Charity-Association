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

    span.badge{
        padding: 10px!important;
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
                            عرض كل الوظائف المطروحة
                        </h5>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row mt-1 mb-1 text-center justify-content-center align-content-center">
                    <form method="GET" action="{{route('print.selected.offers')}}">
                        <button type="submit" class="btn btn-md btn-warning m-1 print_selected">
                            <i class="fa fa-print"></i>
                            طباعة
                        </button>
                    </form>
                    <form method="POST" action="{{route('export.offers.excel')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-success m-1">
                            <i class="fa fa-file-excel-o"></i>
                            تصدير الكل EXCEL
                        </button>
                    </form>
                    <form method="POST" class="" id="myForm" action="{{route('remove.selected.offers')}}">
                        @csrf
                        @method('POST')
                        <button type="submit" class="btn btn-md btn-danger m-1 remove_selected">
                            <i class="fa fa-trash"></i>
                            حذف
                        </button>
                    </form>

                    <a href="{{route('supervisor.offers.create')}}" role="button"
                       class="btn btn-md btn-info m-1">
                        <i class="fa fa-plus"></i>
                        اضافة
                    </a>
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
                                <th class="border-bottom-0 text-center"> عنوان الوظيفة</th>
                                <th class="border-bottom-0 text-center"> الوصف</th>
                                <th class="border-bottom-0 text-center"> بروشور الوظيفة </th>
                                <th style="width: 10%!important;"  class="border-bottom-0 text-center"> الحالة </th>
                                <th style="width: 10%!important;" class="border-bottom-0 text-center">تحكم</th>
                            </tr>
                            </thead>
                            <tbody>
                            @php
                                $i = 0;
                            @endphp

                            @foreach ($data as $offer)
                                <tr>
                                    <td>
                                        <input class="check" name="offers[]" form="myForm"
                                               value="{{$offer->id}}"
                                               type="checkbox">
                                    </td>
                                    <td>{{ ++$i }}</td>
                                    <td>{{ $offer->title }}</td>
                                    <td>{{ mb_substr($offer->description,0,50) }} ..</td>
                                    <td>
                                        <img data-toggle="modal" href="#modaldemo9"
                                             src="{{asset($offer->brochure)}}"
                                             style="width: 70px;cursor: pointer; height: 70px;border-radius: 100%; padding: 3px; border: 1px solid #aaa;">
                                    </td>
                                    <td>
                                        @if($offer->status == "مفعل")
                                            <span class="badge badge-success">
                                                مفعل
                                            </span>
                                        @elseif($offer->status == "معطل")
                                            <span class="badge badge-danger">
                                                معطل
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
                                                @can('عرض وظيفة')
                                                    <a href="{{ route('supervisor.offers.show', $offer->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-eye"></i>
                                                        عرض
                                                    </a>
                                                    <a href="{{ route('supervisor.offers.allow', $offer->id) }}"
                                                       class="dropdown-item text-success">
                                                        <i class="fa fa-check"></i>
                                                        تفعيل
                                                    </a>
                                                    <a href="{{ route('supervisor.offers.deny', $offer->id) }}"
                                                       class="dropdown-item text-danger">
                                                        <i class="fa fa-times"></i>
                                                        تعطيل
                                                    </a>
                                                @endcan
                                                @can('تعديل وظيفة')
                                                    <a href="{{ route('supervisor.offers.edit', $offer->id) }}"
                                                       class="dropdown-item">
                                                        <i class="fa fa-edit"></i>
                                                        تعديل
                                                    </a>
                                                @endcan
                                                @can('حذف وظيفة')
                                                    <a class="dropdown-item delete_offer"
                                                       offer_id="{{ $offer->id }}"
                                                       title="{{ $offer->title }}" data-toggle="modal"
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
                    <form action="{{ route('supervisor.offers.destroy', 'test') }}" method="post">
                        {{ method_field('delete') }}
                        {{ csrf_field() }}
                        <div class="modal-body">
                            <p>هل انت متأكد انك تريد الحذف ؟</p><br>
                            <input type="hidden" name="offer_id" id="offer_id" value="">
                            <input class="form-control" name="title" id="title" type="text" readonly>
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

    <!-- Modal effects -->
    <div class="modal" id="modaldemo9">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content modal-content-demo">
                <div class="modal-header text-center">
                    <h6 class="modal-title w-100"
                        style="font-family: 'Cairo'; ">عرض صورة بروشور الوظيفة المطروحة</h6>
                    <button aria-label="Close" class="close"
                            data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <img id="image_larger" alt="image" style="width: 100%;height: 400px!important;  "/>
                </div>
                <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-md btn-danger"><i class="fa fa-colse"></i> اغلاق
                    </button>
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
        $('.delete_offer').on('click', function () {
            var offer_id = $(this).attr('offer_id');
            var title = $(this).attr('title');
            $('.modal-body #offer_id').val(offer_id);
            $('.modal-body #title').val(title);
        });
        $('img').on('click', function () {
            var image_larger = $('#image_larger');
            var path = $(this).attr('src');
            $(image_larger).prop('src', path);
        });
        $('.remove_selected').on('click', function (e) {
            e.preventDefault();
            let offers = [];
            $("input:checkbox[name*='offers']:checked").each(function () {
                offers.push($(this).val());
            });
            if (offers.length == 0) {
                alert('اختر بعض السجلات للحذف');
            } else {
                $('#myForm').submit();
            }
        });
        $('#example-table tfoot tr th:nth-child(3)').html('<input class="form-control" type="text" placeholder="عنوان الوظيفة" />');
        $('#example-table').DataTable({
            "columnDefs": [
                {"orderable": false, "targets": [0,3,4,5,6]}
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
