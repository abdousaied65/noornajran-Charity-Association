@extends('supervisor.layouts.master')
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
                @if (session('success'))
                    <div class="alert alert-success  fade show">
                        <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                        {{ session('success') }}
                    </div>
                @endif
                <div class="card-header pb-0">
                    <h5 class="alert alert-md alert-success">
                        ارسال رسالة الى القائمة البريدية
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('maillists.send')}}" method="post"
                          enctype="multipart/form-data">
                        @csrf
                        @method('POST')
                        <div class="row m-t-3 mb-3">
                            <div class="parsley-input col-md-6" id="fnWrapper">
                                <label> البريد الالكترونى <span class="text-danger">*</span></label>
                                <select data-actions-box="true" required data-live-search="true" data-title="اختر البريد الالكترونى"
                                        data-style="btn-secondary"
                                        name="emails[]" multiple class="form-control selectpicker show-tick">
                                    @foreach($maillists as $maillist)
                                        <option value="{{$maillist->id}}">{{$maillist->email}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="parsley-input col-md-6" id="fnWrapper">
                                <label> موضوع الرسالة <span class="text-danger">*</span></label>
                                <input required type="text" class="form-control" dir="rtl" name="subject" />
                            </div>
                        </div>
                        <div class="row mt-3 mb-3">
                            <div class="parsley-input col-md-12" id="fnWrapper">
                                <label> نص الرسالة  <span class="text-danger">*</span></label>
                                <textarea class="form-control" name="message" style="resize: none; width: 100%; height: 250px;"></textarea>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">
                                ارسال الرسالة
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
