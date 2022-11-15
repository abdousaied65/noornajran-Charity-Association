@extends('supervisor.layouts.master')
<style>
    .mailbox i.fa {
        font-size: 15px !important;
        margin-left: 10px;
        margin-right: 10px;
    }

    .mailbox a {
        color: #333;
    }

    .tooltip {
        font-family: 'Cairo' !important;
    }
</style>
@section('content')
    <div class="row mailbox">
        <div class="col-lg-3 col-md-4">
            <h6 class="m-t-10 m-b-10">مجلدات الرسائل</h6>
            <ul class="list-group list-group-divider inbox-list">
                <li class="list-group-item">
                    <a href="{{route('supervisor.contacts.index')}}"><i class="fa fa-inbox"></i> صندوق الوارد <i
                            class="fa fa-circle text-warning"></i>
                    </a>
                </li>
                <li class="list-group-item">
                    <a href="{{route('supervisor.contacts.important')}}"><i
                            class="fa fa-star"></i> الرسائل المهمة <i
                            class="fa fa-circle text-success"></i>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-lg-9 col-md-8">
            <div class="ibox p-3" id="mailbox-container">
                <form class="d-inline" method="post">
                    @csrf
                    @method('PATCH')
                    <div class="mailbox-header d-flex justify-content-between"
                         style="border-bottom: 1px solid #e8e8e8;">
                        <div class="p-3">
                            <h5 class="inbox-title mt-3">{{$message->subject}}</h5>
                            <div class="mt-3 font-13">
                                <span class="font-strong">{{$message->name}}</span>
                                ( <a href="#">{{$message->phone}}</a> )
                                <br>
                                <span class="text-danger">
                                    {{$message->email}}
                                </span>
                            </div>
                            <div class="pr-3 mt-3 font-13">{{$message->created_at->diffForHumans()}}</div>
                        </div>
                        <input type="hidden" value="{{$message->id}}" name="messages[]"/>
                        <div class="inbox-toolbar m-l-20">
                            <button class="btn btn-default btn-md" data-toggle="tooltip"
                                    formaction="{{route('supervisor.contacts.make.as.destroy')}}" type="submit"
                                    data-original-title="حذف"><i class="fa fa-trash"></i>
                            </button>
                            <button class="btn btn-default btn-md" data-toggle="tooltip"
                                    formaction="{{route('supervisor.contacts.make.as.important')}}" type="submit"
                                    data-original-title="تمييزها كمهمة"><i
                                    class="fa fa-star"></i></button>
                            <button class="btn btn-default btn-md" data-toggle="tooltip"
                                    formaction="{{route('supervisor.contacts.print')}}" type="submit"
                                    data-original-title="طباعة"><i class="fa fa-print"></i></button>
                        </div>
                    </div>
                    <div class="mailbox-body p-3">
                        <p>{{$message->message}}</p></p>
                    </div>
                </form>
                <div class="clearfix"></div>
                @if (session('success'))
                    <div class="alert alert-success  fade show">
                        <button class="close" data-dismiss="alert" aria-label="Close">×</button>
                        {{ session('success') }}
                    </div>
                @endif
                <form action="{{route('supervisor.contacts.reply')}}" method="post">
                    @csrf
                    @method('POST')
                    <input type="hidden" value="{{$message->id}}" name="contact_id"/>
                    <div class="row">
                        <p class="alert alert-sm alert-success w-100 text-center">
                            <i class="fa fa-reply"></i>
                            أضف رد على هذه الرسالة
                        </p>
                    </div>
                    <div class="row mt-2 mb-2 justify-content-center">
                        <div class="col-lg-8">
                            <div class="form-group">
                                <label for="subject" class="d-block">
                                    موضوع الرسالة
                                </label>
                                <input value="ردا على رسالتكم" type="text" required class="form-control" name="subject" />
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="form-group">
                                <label for="subject" class="d-block">
                                    نص الرسالة
                                </label>
                                <textarea required name="message" style="resize: none; width:100%; height: 150px;" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="col-lg-8 text-center">
                            <div class="form-group">
                                <button type="submit" class="btn btn-md btn-success">
                                    <i class="fa fa-paper-plane"></i>
                                    ارسال الرد
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection
