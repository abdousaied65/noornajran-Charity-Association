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
                        اعدادات بيانات التواصل
                    </h5>
                </div>
                <div class="card-body p-1 m-1">
                    <form action="{{route('supervisor.informations.update')}}" method="post"
                          enctype="multipart/form-data">
                        @csrf
                        @method('POST')
                        <div class="row mb-5">
                            <div class="col-md-4 pull-right">
                                <label> العنوان <span class="text-danger">*</span></label>
                                <input type="text" value="{{$informations->address}}" class="form-control"
                                       name="address">
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> البريد الالكترونى <span class="text-danger">*</span></label>
                                <input dir="ltr" type="email" value="{{$informations->email}}" class="form-control"
                                       name="email">
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> رقم الجوال <span class="text-danger">*</span></label>
                                <input dir="ltr" type="number" value="{{$informations->phone_number}}"
                                       class="form-control" name="phone_number">
                            </div>
                        </div>

                        <div class="row mb-5">
                            <div class="col-md-4 pull-right">
                                <label> رابط فيسبوك <span class="text-danger">*</span></label>
                                <input type="text" dir="ltr" value="{{$informations->facebook}}" class="form-control"
                                       name="facebook">
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> رابط تويتر <span class="text-danger">*</span></label>
                                <input type="text" dir="ltr" value="{{$informations->twitter}}" class="form-control"
                                       name="twitter">
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> رابط انستجرام <span class="text-danger">*</span></label>
                                <input type="text" dir="ltr" value="{{$informations->instagram}}" class="form-control"
                                       name="instagram">
                            </div>
                        </div>
                        <div class="row mb-5">
                            <div class="col-md-4 pull-right">
                                <label> رابط سناب شات <span class="text-danger">*</span></label>
                                <input type="text" dir="ltr" value="{{$informations->snapchat}}" class="form-control"
                                       name="snapchat">
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> رابط تليجرام <span class="text-danger">*</span></label>
                                <input type="text" dir="ltr" value="{{$informations->telegram}}" class="form-control"
                                       name="telegram">
                            </div>
                            <div class="col-md-4 pull-right">
                                <label> رابط الموقع الالكترونى <span class="text-danger">*</span></label>
                                <input type="text" dir="ltr" value="{{$informations->website}}" class="form-control"
                                       name="website">
                            </div>
                        </div>

                        <div class="row mb-5">
                            <div class="col-md-6 pull-right">
                                <label> شروط الاستخدام <span class="text-danger">*</span></label>
                                <textarea name="terms" class="form-control"
                                          style="resize: none; width: 100%; height: 250px;">{{$informations->terms}}</textarea>
                            </div>
                            <div class="col-md-6 pull-right">
                                <label> سياسة الخصوصية <span class="text-danger">*</span></label>
                                <textarea name="policy" class="form-control"
                                          style="resize: none; width: 100%; height: 250px;">{{$informations->policy}}</textarea>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                            <button class="btn btn-info pd-x-20" type="submit">تحديث</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
