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
            <p class="alert alert-info alert-md text-center"> عرض بيانات الوظيفة المطروحة </p>
        </div>
        <div class="table-responsive hoverable-table">
            <table class="table table-striped table-condensed table-bordered text-center">
                <thead>
                <tr>
                    <th class="border-bottom-0 text-center"> عنوان الوظيفة</th>
                    <th class="border-bottom-0 text-center"> وصف الوظيفة</th>
                    <th class="border-bottom-0 text-center"> بروشور الوظيفة</th>
                    <th class="border-bottom-0 text-center"> حالة الوظيفة</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>{{ $offer->title }}</td>
                    <td>{{ $offer->description }}</td>
                    <td>
                        <img data-toggle="modal" href="#modaldemo9"
                             src="{{asset($offer->brochure)}}"
                             style="width: 70px;cursor: pointer; height: 70px;border-radius: 100%; padding: 3px; border: 1px solid #aaa;">
                    </td>
                    <td>{{ $offer->status }}</td>
                </tr>
                </tbody>
            </table>
        </div>
        @if(!$offer->submits->isEmpty())
            <form method="POST"
                  action="{{route('export.submits.by.offer.excel')}}">
                @csrf
                @method('POST')
                <input type="hidden" name="offer_id" value="{{$offer->id}}"/>
                <button type="submit" class="btn btn-md btn-secondary">
                    <i class="fa fa-file-excel-o"></i>
                    تصدير المقدمين على هذه الوظيفة EXCEL
                </button>
            </form>
            <div class="col-lg-12 mt-2">
                <p class="alert alert-danger alert-md text-center"> العروض المقدمة على الوظيفة المطروحة </p>
            </div>
            <div class="table-responsive hoverable-table">
                <table class="table table-bordered" style="text-align: center;">
                    <thead>
                    <tr>
                        <th class="border-bottom-0 text-center">#</th>
                        <th class="border-bottom-0 text-center"> الاسم</th>
                        <th class="border-bottom-0 text-center"> البريد الالكترونى</th>
                        <th class="border-bottom-0 text-center"> السجل المدنى</th>
                        <th class="border-bottom-0 text-center"> رقم الجوال</th>
                        <th class="border-bottom-0 text-center"> المؤهل</th>
                        <th class="border-bottom-0 text-center"> السيرة الذاتيه</th>
                        <th class="border-bottom-0 text-center"> تاريخ التقديم</th>
                    </tr>
                    </thead>
                    <tbody>
                    @php
                        $i = 0;
                    @endphp
                    @foreach ($offer->submits as $submit)
                        <tr>
                            <td>{{ ++$i }}</td>
                            <td>{{ $submit->first_name." ".$submit->second_name." ".$submit->third_name." ".$submit->fourth_name }}</td>
                            <td>{{ $submit->email }}</td>
                            <td>{{ $submit->record }}</td>
                            <td>{{ $submit->phone_number }}</td>
                            <td>{{ $submit->qualification->qualification }}</td>
                            <td>
                                <a href="{{asset($submit->cv)}}" class="btn bnt-md btn-link">
                                    <i class="fa fa-download"></i>
                                    تحميل
                                </a>
                            </td>
                            <td>{{date('Y-m-d',strtotime($submit->created_at))}}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        @else
            <div class="col-lg-12 mt-2">
                <p class="alert alert-danger alert-md text-center">
                    لا يوجد عروض مقدمة على هذه الوظيفة المطروحة
                </p>
            </div>
        @endif
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
        $('img').on('click', function () {
            var image_larger = $('#image_larger');
            var path = $(this).attr('src');
            $(image_larger).prop('src', path);
        });
    });
</script>
