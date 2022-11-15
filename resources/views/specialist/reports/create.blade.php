@extends('specialist.layouts.master')
<style>

</style>
@section('content')
    <!-- main-content closed -->
    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <strong>Errors :</strong>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <!-- row opened -->
    <div class="row row-sm">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-header pb-0">
                    <h5 class="alert alert-md alert-success">
                        اضافة تقرير جديد لهذا المستفيد
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('specialist.reports.store')}}" method="post" enctype="multipart/form-data">
                        {{csrf_field()}}
                        <input type="hidden" required value="{{$specialist->id}}" name="specialist_id"/>
                        <input type="hidden" required value="{{$beneficiary->id}}" name="beneficiary_id"/>

                        <div class="row m-t-3 mb-3">
                            <div class="col-md-6 pull-right">
                                <label> الاخصائى <span class="text-danger">*</span></label>
                                <input class="form-control" readonly value="{{$specialist->first_name." ".$specialist->second_name." ".$specialist->third_name." ".$specialist->fourth_name}}" />
                            </div>
                            <div class="col-md-6 pull-right">
                                <label> المستفيد <span class="text-danger">*</span></label>
                                <input class="form-control" readonly value="{{$beneficiary->first_name." ".$beneficiary->second_name." ".$beneficiary->third_name." ".$beneficiary->fourth_name}}" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row m-t-3 mb-3">
                            <div class="col-md-12 pull-right">
                                <label> التقرير
                                    <span class="text-danger">*
                                     ( مسموح لك فقط ب 700 حرف )
                                    </span>
                                </label>
                                <textarea maxlength="700" oninput="this.value=this.value.slice(0,this.maxLength)"
                                          class="form-control" required name="report"
                                          style="resize: none;font-size: 16px!important;; width: 100%; height: 250px;"></textarea>
                                <span class="text-danger" dir="rtl" id="length"></span>

                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">تأكيد</button>
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
        $('textarea').on('keyup', function () {
            let content = $(this).val();
            let length = content.length;
            let rest = 700 - length;

            $('#length').html("عدد الحروف المسموح لك كتابتها فى التقرير : " + rest);
        })
    });
</script>


