@extends('site.layouts.app-main')
<style>
    .popup-social {
        float: left;
        width: 100%;
        /*margin-bottom: 100px;*/
    }

    .popup-social > a {
        display: inline-block;
        margin: 2.5px 0px;
        color: #fff;
        font-size: 14px;
        padding: 8px 28px;
        border-width: 2px;
        border-style: solid;
    }

    .popup-social > a i {
        font-size: 13px;
    }

    .popup-social > a:hover {
        background-color: transparent;
    }

    /*===== Social Media Offical Colors =====*/
    a.facebook,
    a.facebook-clr:hover {
        background: #3b5998;
        border-color: #3b5998;
    }

    a.facebook-clr,
    a.facebook:hover {
        border-color: #3b5998;
        color: #3b5998;
    }

    a.google,
    a.google-clr:hover {
        background: #dd4b39;
        border-color: #dd4b39;
    }

    a.google-clr,
    a.google:hover {
        border-color: #dd4b39;
        color: #dd4b39;
    }

    a.github,
    a.github-clr:hover {
        background: #1f76b6;
        border-color: #1f76b6;
    }

    a.github-clr,
    a.github:hover {
        border-color: #1f76b6;
        color: #1f76b6;
    }

</style>
@section('content')
    <div class="page-header" style="background: url({{asset('assets/img/banner1.jpg')}});">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-wrapper text-right" dir="rtl">
                        <h2 class="product-title"> انشاء حساب جديد المتطوعين </h2>
                        <ol class="breadcrumb">
                            <li><a href="{{route('index')}}"> الصفحة الرئيسية / </a></li>
                            <li class="current"> انشاء حساب جديد المتطوعين </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <button aria-label="Close" class="close" data-dismiss="alert" type="button">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>الاخطاء :</strong>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif
    @if (session('success'))
        <div class="alert alert-success" role="alert">
            {{ session('success') }}
        </div>
    @endif
    <section class="login section-padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-12 col-xs-12">
                    <div class="login-form login-area text-right" dir="rtl">
                        <h3 class="text-center">
                            تأكيد البريد الالكترونى
                        </h3>
                        <div class='content p-2'>
                            @if (session('resent'))
                                <div class="alert alert-success" role="alert">
                                    تم إرسال رابط تحقق جديد إلى عنوان بريدك الإلكتروني
                                </div>
                            @endif
                            <p>
                            قبل المتابعة ، يرجى التحقق من بريدك الإلكتروني للحصول على رابط التحقق
                            </p>
                            <p>
                                إذا لم تستلم البريد الإلكتروني
                            </p>
                            <br/>
                            <form role="form" class="login-form d-inline" method="POST" action="{{ route('verification.resend') }}">
                                @csrf
                                <button type="submit" class="btn btn-link p-0 m-0 align-baseline">
                                    انقر هنا لطلب رابط اخر
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
