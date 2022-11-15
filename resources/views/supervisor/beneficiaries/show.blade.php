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
    </div>
    <div class="row mt-3 mb-3 text-center justify-content-center">
        <div class="col-6 pull-right">
            <h5>صورة الهوية</h5>
            <img class="id_pic" data-toggle="modal" href="#modaldemo9"
                 src="{{asset($beneficiary->id_pic)}}"
                 style="width: 100px;cursor: pointer; height: 100px;border-radius: 100%; padding: 3px; border: 1px solid #aaa;">
        </div>
        <div class="col-6 pull-right">
            <h5>صورة التقرير الطبى</h5>
            <a href="{{asset($beneficiary->medical_report_pic)}}" class="btn bnt-md btn-link">
                <i class="fa fa-download"></i>
                تحميل
            </a>
        </div>
    </div>
    <div class="row mt-3 mb-3 text-center justify-content-center">
        <div class="col-lg-12">
            @can('عرض مستفيد')
                @if($beneficiary->Status !="تمت الموافقة")
                    <a href="{{ route('supervisor.beneficiaries.allow', $beneficiary->id) }}"
                       class="btn btn-md btn-success">
                        <i class="fa fa-check"></i>
                        تفعيل
                    </a>
                @endif
                @if($beneficiary->Status !="قيد المراجعة")
                    <a href="{{ route('supervisor.beneficiaries.waiting', $beneficiary->id) }}"
                       class="btn btn-md btn-warning">
                        <i class="fa fa-clock"></i>
                        قيد المراجعة
                    </a>
                @endif
                @if($beneficiary->Status !="مرفوض")
                    <a href="{{ route('supervisor.beneficiaries.deny', $beneficiary->id) }}"
                       class="btn btn-md btn-danger">
                        <i class="fa fa-times"></i>
                        رفض
                    </a>
                @endif
            @endcan
                @can('تعديل مستفيد')
                    <a href="{{ route('supervisor.beneficiaries.edit', $beneficiary->id) }}"
                       class="btn btn-md btn-info">
                        <i class="fa fa-edit"></i>
                        تعديل
                    </a>
                @endcan
                @can('حذف مستفيد')
                    <a class="btn btn-md btn-danger delete_beneficiary"
                       beneficiary_id="{{ $beneficiary->id }}"
                       email="{{ $beneficiary->email }}" data-toggle="modal"
                       href="#modaldemo8">
                        <i class="fa fa-trash"></i>
                        حذف
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
        $('img.medical').on('click', function () {
            var image_larger2 = $('#image_larger2');
            var path = $(this).attr('src');
            $(image_larger2).prop('src', path);
        });
        $('.delete_beneficiary').on('click', function () {
            var beneficiary_id = $(this).attr('beneficiary_id');
            var email = $(this).attr('email');
            $('.modal-body #beneficiary_id').val(beneficiary_id);
            $('.modal-body #email').val(email);
        });
    });
</script>

