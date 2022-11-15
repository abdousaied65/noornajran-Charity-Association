@extends('site.layouts.app-main')
<style>

</style>
@section('content')
    <main id="main">
         <!-- ======= Contact Us Section ======= -->
        <section id="contact" class="contact">
            <div class="container" data-aos="fade-up">

                <div class="section-title">
                    <h2>تواصل معنا</h2>
                    <p></p>
                </div>
                @if (session('success'))
                    <div class="alert alert-success  text-center" style="margin-top: 30px;">
                        {{ session('success') }}
                    </div>
                @endif
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

                <div class="row text-right " dir="rtl">

                    <div class="col-lg-5">
                        <div class="info">
                            <div class="address">
                                <i class="bi bi-geo-alt"></i>
                                <h4>العنوان:</h4>
                                <p>{{$informations->address}}</p>
                            </div>
                            <div class="email">
                                <i class="bi bi-envelope"></i>
                                <h4>البريد الالكترونى:</h4>
                                <p>{{$informations->email}}</p>
                            </div>
                            <div class="phone">
                                <i class="bi bi-phone"></i>
                                <h4>التواصل :</h4>
                                <p>{{$informations->phone_number}}</p>
                            </div>

                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15218.400537745669!2d44.1862623!3d17.5265914!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x4c359300c351e80!2z2KzZhdi52YrYqSDZhtmI2LEg2YbYrNix2KfZhiDYp9mE2YbYs9in2KbZitip!5e0!3m2!1sar!2seg!4v1646865712079!5m2!1sar!2seg"
                                style="border:0; width: 100%; height: 280px;" allowfullscreen></iframe>
                        </div>

                    </div>

                    <div class="col-lg-7">
                        <form action="{{route('contact.store')}}" id="myForm" method="post">
                            @csrf
                            @method('POST')
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="name"> الاسم
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input value="{{old('name')}}" type="text" name="name" class="form-control" id="name"
                                           placeholder="اكتب اسمك"
                                           required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="phone">رقم الجوال
                                        <span class="text-danger">( رقم الجوال لابد ان يكون 9665xxxxxx ) </span>
                                    </label>
                                    <input value="{{old('phone')}}" placeholder="رقم الجوال"
                                           maxlength="12" oninput="this.value=this.value.slice(0,this.maxLength)"
                                           required dir="ltr" id="phone" type="number" min="1" class="form-control" name="phone"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="email">البريد الالكترونى
                                        <span class="text-danger">*</span>
                                    </label>
                                    <input value="{{old('email')}}" type="email" class="form-control" name="email" id="email"
                                           placeholder="البريد الالكترونى" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="name">موضوع الرسالة
                                        <span class="text-danger">*</span>
                                    </label>
                                    <select name="subject" id="subject" required class="w-100 js-example-basic-single">
                                        <option @if(old('subject') == "شكوى") selected @endif value="شكوى">شكوى</option>
                                        <option @if(old('subject') == "اقتراح") selected @endif value="اقتراح">اقتراح</option>
                                        <option @if(old('subject') == "إستفسار") selected @endif value="إستفسار">إستفسار</option>
                                        <option @if(old('subject') == "طلب") selected @endif value="طلب">طلب</option>
                                        <option @if(old('subject') == "غير ذلك") selected @endif value="غير ذلك">غير ذلك</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name">نص الرسالة
                                    <span class="text-danger">*</span>
                                </label>
                                <textarea class="form-control" name="message" rows="10" style="resize: none;" required>{{old('message')}}</textarea>
                            </div>
                            <div class="text-center mb-3">
                                <button type="submit">ارسال الان</button>
                            </div>
                        </form>
                    </div>

                </div>

            </div>
        </section><!-- End Contact Us Section -->
    </main><!-- End #main -->
@endsection
