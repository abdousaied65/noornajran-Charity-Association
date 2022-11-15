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
            <p class="alert alert-info alert-md text-center"> عرض بيانات المتطوع </p>
        </div>
        <div class="table-responsive hoverable-table">
            <table class="table table-striped table-condensed table-bordered text-center">
                <thead>
                <tr>
                    <th class="border-bottom-0 text-center">اسم المتطوع</th>
                    <th class="border-bottom-0 text-center"> رقم السجل المدنى</th>
                    <th class="border-bottom-0 text-center">رقم الجوال</th>
                    <th class="border-bottom-0 text-center"> البريد الالكترونى</th>
                    <th class="border-bottom-0 text-center"> مجال التطوع</th>
                    <th class="border-bottom-0 text-center"> تاريخ التفعيل</th>
                    <th class="border-bottom-0 text-center"> تاريخ انتهاء العضوية</th>
                    <th class="border-bottom-0 text-center"> حالة الاشتراك</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>{{ $volunteer->first_name." ".$volunteer->second_name." ".$volunteer->third_name." ".$volunteer->fourth_name }}</td>
                    <td>{{ $volunteer->record }}</td>
                    <td>{{ $volunteer->phone_number }}</td>
                    <td>{{ $volunteer->email }}</td>
                    <td>{{ $volunteer->field->field }}</td>
                    <td>
                        @if($volunteer->Status == "سارى")
                            {{ $volunteer->start_date }}
                        @endif
                    </td>
                    <td>
                        @if($volunteer->Status == "سارى")
                            {{ $volunteer->end_date }}
                        @endif
                    </td>
                    <td>{{ $volunteer->Status }}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row mt-3 mb-3 text-center justify-content-center">
        <div class="col-lg-6 pull-right">
            <h3>سند التحويل</h3>
            <img class="transfer_pic" data-toggle="modal" href="#modaldemo9"
                 src="{{asset($volunteer->transfer_pic)}}"
                 style="width: 100px;cursor: pointer; height: 100px;border-radius: 100%; padding: 3px; border: 1px solid #aaa;">
        </div>
        <div class="col-lg-6 pull-right">
            <h3>السيرة الذاتيه</h3>
            <a href="{{asset($volunteer->cv)}}" class="btn btn-md btn-link">
                <i class="fa fa-download"></i>
                تحميل
            </a>
        </div>
    </div>

    <div class="row mt-3 mb-3">
        <div class="col-lg-12 text-center justify-content-center">
            @can('عرض متطوع')
{{--                @if($volunteer->Status != "سارى")--}}
{{--                    <a href="{{ route('supervisor.volunteers.allow', $volunteer->id) }}"--}}
{{--                       class="btn btn-md btn-success">--}}
{{--                        <i class="fa fa-check"></i>--}}
{{--                        تفعيل--}}
{{--                    </a>--}}
{{--                @endif--}}

                @if($volunteer->Status != "منتهى")
                    <a href="{{ route('supervisor.volunteers.deny', $volunteer->id) }}"
                       class="btn btn-md btn-danger">
                        <i class="fa fa-times"></i>
                        منتهى
                    </a>
                @endif

                @if($volunteer->Status != "قيد المراجعة")
                    <a href="{{ route('supervisor.volunteers.waiting', $volunteer->id) }}"
                       class="btn btn-md btn-warning">
                        <i class="fa fa-clock"></i>
                        قيد المراجعة
                    </a>
                @endif
            @endcan
            @can('تعديل متطوع')
                <a href="{{ route('supervisor.volunteers.edit', $volunteer->id) }}"
                   class="btn btn-md btn-info">
                    <i class="fa fa-edit"></i>
                    تعديل
                </a>
            @endcan
            @can('حذف متطوع')
                <a class="btn btn-md btn-danger delete_volunteer"
                   volunteer_id="{{ $volunteer->id }}"
                   email="{{ $volunteer->email }}" data-toggle="modal"
                   href="#modaldemo8">
                    <i class="fa fa-trash"></i>
                    حذف
                </a>
            @endcan
        </div>
    </div>
    <div class="row mt-3 mb-3">
        <div class="col-lg-12 text-center justify-content-center">
            @can('عرض متطوع')
                <a href="{{ route('supervisor.volunteers.renew.one', $volunteer->id) }}"
                   class="btn btn-md btn-info">
                    <i class="fa fa-recycle"></i>
                    تجديد العضوية سنة
                </a>

                <a href="{{ route('supervisor.volunteers.renew.two', $volunteer->id) }}"
                   class="btn btn-md btn-info">
                    <i class="fa fa-recycle"></i>
                    تجديد العضوية سنتين
                </a>

                <a href="{{ route('supervisor.volunteers.renew.three', $volunteer->id) }}"
                   class="btn btn-md btn-info">
                    <i class="fa fa-recycle"></i>
                    تجديد العضوية 3 سنين
                </a>
            @endcan
        </div>
    </div>

    <!-- Modal effects -->
    <div class="modal" id="modaldemo9">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content modal-content-demo">
                <div class="modal-header text-center">
                    <h6 class="modal-title w-100"
                        style="font-family: 'Cairo'; ">عرض صورة سند التحويل</h6>
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
        $('img.transfer_pic').on('click', function () {
            var image_larger = $('#image_larger');
            var path = $(this).attr('src');
            $(image_larger).prop('src', path);
        });
    });
</script>

