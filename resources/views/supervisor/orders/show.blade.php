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
            <p class="alert alert-info alert-md text-center"> عرض بيانات الطلب </p>
        </div>
        <div class="table-responsive hoverable-table">
            <table class="table table-striped table-condensed table-bordered text-center">
                <thead>
                <tr>
                    <th class="border-bottom-0 text-center"> الاسم</th>
                    <th class="border-bottom-0 text-center">رقم الجوال</th>
                    <th class="border-bottom-0 text-center"> الجنسية</th>
                    <th class="border-bottom-0 text-center"> نوع الاعاقة</th>
                    <th class="border-bottom-0 text-center"> نوع الطلب</th>
                    <th class="border-bottom-0 text-center"> الكمية</th>
                    <th class="border-bottom-0 text-center"> حالة الطلب</th>
                    <th class="border-bottom-0 text-center"> البريد الالكترونى</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>{{ $order->first_name." ".$order->second_name." ".$order->third_name." ".$order->fourth_name }}</td>
                    <td>{{ $order->phone_number }}</td>
                    <td>{{ $order->nationality->nationality }}</td>
                    <td>{{ $order->disability->disability }}</td>
                    <td>{{ $order->orderType->order_type }}</td>
                    <td>{{ $order->quantity }}</td>
                    <td>{{ $order->Status }}</td>
                    <td>{{ $order->email }}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row mt-3 mb-3 justify-content-center text-center">
        <div class="col-lg-6 pull-right">
            <h5>صورة الهوية</h5>
            <img class="id_pic" data-toggle="modal" href="#modaldemo9"
                 src="{{asset($order->id_pic)}}"
                 style="width: 100px;cursor: pointer; height: 100px;border-radius: 100%; padding: 3px; border: 1px solid #aaa;">
        </div>
        <div class="col-lg-6 pull-right">
            <h5>صورة التقرير الطبى</h5>
            <a href="{{asset($order->medical_report_pic)}}" class="btn bnt-md btn-link">
                <i class="fa fa-download"></i>
                تحميل
            </a>
        </div>
    </div>

    <div class="row mt-3 mb-3 text-center justify-content-center">
        <div class="col-lg-12">
            @can('عرض طلب')
                @if($order->Status !="تمت الموافقة")
                    <a href="{{ route('supervisor.orders.allow', $order->id) }}"
                       class="btn btn-md btn-success">
                        <i class="fa fa-check"></i>
                        تفعيل
                    </a>
                @endif
                @if($order->Status !="قيد المراجعة")
                    <a href="{{ route('supervisor.orders.waiting', $order->id) }}"
                       class="btn btn-md btn-warning">
                        <i class="fa fa-clock"></i>
                        قيد المراجعة
                    </a>
                @endif
                @if($order->Status !="مرفوض")
                    <a href="{{ route('supervisor.orders.deny', $order->id) }}"
                       class="btn btn-md btn-danger">
                        <i class="fa fa-times"></i>
                        رفض
                    </a>
                @endif
            @endcan
            @can('تعديل طلب')
                <a href="{{ route('supervisor.orders.edit', $order->id) }}"
                   class="btn btn-md btn-info">
                    <i class="fa fa-edit"></i>
                    تعديل
                </a>
            @endcan
            @can('حذف طلب')
                <a class="btn btn-md btn-danger delete_order"
                   order_id="{{ $order->id }}"
                   email="{{ $order->email }}" data-toggle="modal"
                   href="#modaldemo8">
                    <i class="fa fa-trash"></i>
                    حذف
                </a>
            @endcan


        </div>
    </div>

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

    <!-- Modal effects -->
    <div class="modal" id="modaldemo9">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content modal-content-demo">
                <div class="modal-header text-center">
                    <h6 class="modal-title w-100"
                        style="font-family: 'Cairo'; ">عرض صورة الهوية</h6>
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
    <!-- Modal effects -->
    <div class="modal" id="modaldemo10">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content modal-content-demo">
                <div class="modal-header text-center">
                    <h6 class="modal-title w-100"
                        style="font-family: 'Cairo'; ">عرض صورة التقرير الطبى</h6>
                    <button aria-label="Close" class="close"
                            data-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <img id="image_larger2" alt="image" style="width: 100%;height: 400px!important;  "/>
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
        $('img.id_pic').on('click', function () {
            var image_larger = $('#image_larger');
            var path = $(this).attr('src');
            $(image_larger).prop('src', path);
        });

        $('.delete_order').on('click', function () {
            var order_id = $(this).attr('order_id');
            var email = $(this).attr('email');
            $('.modal-body #order_id').val(order_id);
            $('.modal-body #email').val(email);
        });

        $('img.medical').on('click', function () {
            var image_larger2 = $('#image_larger2');
            var path = $(this).attr('src');
            $(image_larger2).prop('src', path);
        });
    });
</script>

