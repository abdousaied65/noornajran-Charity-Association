<!-- main-header opened -->
<div class="main-header sticky side-header nav nav-item">
    <div class="container-fluid">
        <div class="main-header-left ">
            <div class="responsive-logo">
                <a href="{{ url('/supervisor/' . $page='home') }}">
                    <img src="{{URL::asset($settings->logo)}}"
                         class="logo-1" alt="logo"></a>
                <a href="{{ url('/supervisor/' . $page='home') }}">
                    <img src="{{URL::asset($settings->favicon)}}"
                         class="logo-2" alt="logo"></a>
            </div>
            <div class="app-sidebar__toggle" data-toggle="sidebar">
                <a class="open-toggle" href="#"><i class="header-icon fe fe-align-left"></i></a>
                <a class="close-toggle" href="#"><i class="header-icons fe fe-x"></i></a>
            </div>
        </div>
        <div class="main-header-right">

            <div class="nav nav-item  navbar-nav-right ml-auto">

                <div class="dropdown main-profile-menu nav nav-item nav-link">
                    <a class="profile-user d-flex" href="#">
                        @if (isset(Auth::user()->profile_pic) && !empty(Auth::user()->profile_pic) )
                            <img src="{{asset(Auth::user()->profile_pic)}}" alt="avatar"><i></i>
                        @else
                            <img src="{{asset('admin-assets/img/guest.png')}}" alt="avatar"><i></i>
                        @endif
                    </a>
                    <div class="dropdown-menu">
                        <div class="main-header-profile bg-primary p-3">
                            <div class="d-flex wd-100p">
                                <div class="main-img-user">
                                    @if (isset(Auth::user()->profile_pic) && !empty(Auth::user()->profile_pic) )
                                        <img src="{{asset(Auth::user()->profile_pic)}}" alt="avatar"><i></i>
                                    @else
                                        <img src="{{asset('admin-assets/img/guest.png')}}" alt="avatar"><i></i>
                                    @endif
                                </div>
                                <div class="mr-3 my-auto">
                                    <h6>{{Auth::user()->first_name." ".Auth::user()->second_name." ".Auth::user()->third_name." ".Auth::user()->fourth_name}}</h6><span>
                                        {{Auth::user()->role_name}}
                                    </span>
                                </div>
                            </div>
                        </div>
                        <a class="dropdown-item" href="{{route('supervisor.profile.edit',Auth::user()->id)}}"><i
                                class="bx bx-cog"></i> تعديل الملف الشخصى </a>
                        <a class="dropdown-item" href="{{route('supervisor.lock.screen')}}"><i
                                class="bx bx-lock"></i> اغلاق مؤقت للشاشة </a>
                        <a class="dropdown-item" href="{{ route('supervisor.logout') }}"
                           onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                            <i class="fa fa-power-off"></i> تسجيل الخروج
                        </a>
                        <form id="logout-form" action="{{ route('supervisor.logout') }}" method="POST"
                              style="display: none;">
                            @csrf
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- /main-header -->
