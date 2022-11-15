@extends('site.layouts.app-main')
<style>
    input.form-control, select.form-control {
        height: 45px !important;
    }

    .section-title {
        margin-top: 40px !important;
    }
</style>
@section('content')
    <main id="main">
        <!-- ======= Contact Us Section ======= -->
        <section id="contact" class="contact">
            <div class="container" data-aos="fade-up" style="background: #fafafa; border: 1px solid #fafafa;
                box-shadow: 0 0 5px #fafafa;">
                <div class="section-title">
                    <h2>
                        التقديم على وظيفة مطروحة
                        ( {{$offer->title}} )
                    </h2>
                    <p></p>
                </div>

                @if (count($errors) > 0)
                    <div class="alert alert-danger" dir="rtl">
                        <strong>الاخطاء :</strong>
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                @if (session('success'))
                    <div class="alert alert-success text-center" style="margin-top: 30px;">
                        {{ session('success') }}
                    </div>
                @endif
                <form dir="rtl" action="{{route('submit.offer.post','test')}}" method="post"
                      enctype="multipart/form-data">
                    {{csrf_field()}}
                    <div class="row mb-5">
                        <div class="col-md-8 pull-right">
                            <label class="d-block"> وصف الوظيفة </label>
                            <textarea class="form-control disabled" readonly disabled
                                      style="resize: none;font-size: 13px!important;line-height: 2; width: 100%; height: 200px!important; border-radius: 0!important;">{{$offer->description}}</textarea>
                        </div>
                        <div class="col-md-4 pull-left">
                            <label class="d-block">بروشور الوظيفة</label>
                            <img data-bs-toggle="modal" href="javascript:;" data-bs-target="#exampleModal5"
                                 style="cursor: pointer;width: 200px!important; height: 200px!important;border: 1px solid #aaa;"
                                 class="img_full" src="{{asset($offer->brochure)}}" alt="">
                        </div>
                    </div>

                    <div class="row mb-3 mt-5">
                        <div class="col-md-4 pull-right">
                            <label> الاسم <span class="text-danger">*</span></label>
                            <input value="{{old('first_name')}}" required type="text" class="form-control"
                                   name="first_name"/>
                        </div>
                        <div class="col-md-4 pull-right">
                            <label> اسم الاب <span class="text-danger">*</span></label>
                            <input value="{{old('second_name')}}" required type="text" class="form-control"
                                   name="second_name"/>
                        </div>
                        <div class="col-md-4 pull-right">
                            <label> اسم الجد <span class="text-danger">*</span></label>
                            <input value="{{old('third_name')}}" required type="text" class="form-control"
                                   name="third_name"/>
                        </div>
                    </div>
                    <div class="row mb-3">

                        <div class="col-md-4 pull-right">
                            <label> اسم العائلة <span class="text-danger">*</span></label>
                            <input value="{{old('fourth_name')}}" required type="text" class="form-control"
                                   name="fourth_name"/>
                        </div>
                        <div class="col-md-4 pull-right">
                            <label> رقم الجوال
                                <span class="text-danger">( رقم الجوال لابد ان يكون 9665xxxxxx ) </span>
                            </label>
                            <input value="{{old('phone_number')}}" required dir="ltr" type="number" min="1"
                                   maxlength="12" oninput="this.value=this.value.slice(0,this.maxLength)"
                                   class="form-control" name="phone_number"/>
                        </div>
                        <div class="col-md-4 pull-right">
                            <label> رقم السجل المدنى
                                <span class="text-danger">( رقم السجل المدنى لابد ان يكون 10 خانات ) </span>
                            </label>
                            <input value="{{old('record')}}" required dir="ltr" type="text" name="record"
                                   maxlength="10" oninput="this.value=this.value.slice(0,this.maxLength)"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row m-t-3 mb-3">
                        <div class="col-md-3 pull-right">
                            <label> البريد الالكترونى <span class="text-danger">*</span></label>
                            <input value="{{old('email')}}" required dir="ltr" type="email" class="form-control"
                                   name="email"/>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label> المؤهل <span class="text-danger">*</span></label>
                            <select required name="qualification_id" class="w-100 js-example-basic-single">
                                @foreach($qualifications as $qualification)
                                    <option
                                        @if(old('qualification_id') == $qualification->id)
                                        selected
                                        @endif
                                        value="{{$qualification->id}}">{{$qualification->qualification}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label> الوظيفة المطروحة <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" readonly value="{{$offer->title}}"/>
                            <input type="hidden" name="offer_id" value="{{$offer->id}}"/>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label> السيرة الذاتية
                                <span class="text-danger">( لابد ان يكون الملف PDF ) </span>
                            </label>
                            <input required accept=".pdf" type="file" class="form-control" name="cv"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-check">
                            <p style="color: #222!important;">
                                <i class="bx bx-chevron-left"></i>
                                عند تقديم الطلب فإنك توافق على
                                <a data-bs-toggle="modal" href="javascript:;" data-bs-target="#exampleModal20">
                                    شروط الاستخدام
                                </a>
                                و
                                <a data-bs-toggle="modal" href="javascript:;" data-bs-target="#exampleModal30">
                                    سياسة الخصوصية
                                </a>
                            </p>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 text-center mt-5 mb-5">
                        <button class="btn btn-info pd-x-20" type="submit">
                            <i class="fa fa-arrow-right"></i>
                            تقديم الطلب
                        </button>
                    </div>
                </form>
            </div>
        </section><!-- End Contact Us Section -->
    </main><!-- End #main -->

    <!-- Modal -->
    <div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel5" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h5 class="modal-title w-100" id="exampleModalLabel5">
                        عرض صورة بروشور الوظيفة
                    </h5>
                    <button type="button" class="btn btn-default btn-md btn-close" data-bs-dismiss="modal"
                            aria-label="Close">
                        <i class="fa fa-close"></i>
                    </button>
                </div>
                <div class="modal-body text-center" dir="rtl">
                    <img id="image_larger" alt="image" style="width: 100%;height: auto!important;  "/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">اغلاق</button>
                </div>
            </div>
        </div>
    </div>
@endsection

<script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
<script>
    $(document).ready(function () {
        $('.img_full').on('click', function () {
            var image_larger = $('#image_larger');
            var path = $(this).attr('src');
            $(image_larger).prop('src', path);
        });
    });
</script>

