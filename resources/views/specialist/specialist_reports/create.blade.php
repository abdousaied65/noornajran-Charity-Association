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
                        اضافة تقرير جديد
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('specialist.specialist_reports.store','test')}}" method="post"
                          enctype="multipart/form-data">
                        {{csrf_field()}}
                        <input type="hidden" name="specialist_id" value="{{Auth::user()->id}}">
                        <div class="row m-t-3 mb-3">
                            <div class="parsley-input col-md-4" id="fnWrapper">
                                <label> اسم المستفيد <span class="text-danger">*</span></label>
                                <select required name="beneficiary_id"
                                        data-style="btn-info" data-title="اختر المستفيد"
                                        class="form-control selectpicker show-tick" data-live-search="true">
                                    @foreach($beneficiaries as $beneficiary)
                                        <option value="{{$beneficiary->id}}">
                                            {{$beneficiary->first_name." ".$beneficiary->second_name." ".$beneficiary->third_name." ".$beneficiary->fourth_name}}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="parsley-input col-md-8" id="fnWrapper">
                                <label> نص التقرير
                                    <span class="text-danger">*
                                     ( مسموح لك فقط ب 700 حرف )
                                    </span>
                                </label>
                                <textarea maxlength="700" oninput="this.value=this.value.slice(0,this.maxLength)"
                                          required name="report"
                                          style="resize: none; width: 100%; height: 250px!important;"
                                          class="form-control"></textarea>
                                <span class="text-danger" dir="rtl" id="length"></span>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">انشاء التقرير</button>
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

