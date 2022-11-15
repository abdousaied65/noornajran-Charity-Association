<style>
    .side-menu__icon {
        font-size: 15px !important;
    }
</style>
<!-- main-sidebar -->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar sidebar-scroll">
    <div class="main-sidebar-header active">
        <a class="desktop-logo logo-light active" href="{{ url('/specialist/' . $page='home') }}"><img
                src="{{URL::asset($settings->logo)}}" class="main-logo" alt="logo"></a>
        <a class="logo-icon mobile-logo icon-light active" href="{{ url('/specialist/' . $page='home') }}"><img
                src="{{URL::asset($settings->favicon)}}" class="logo-icon" alt="logo"></a>
    </div>
    <div class="main-sidemenu">
        <div class="app-sidebar__user clearfix">
            <div class="dropdown user-pro-body">
                <a href="{{route('specialist.home')}}">
                    <div class="">
                        <img alt="user-img" class="avatar avatar-xl brround"
                             src="{{URL::asset($settings->logo)}}">
                        <span class="avatar-status profile-status bg-green"></span>
                    </div>
                    <div class="user-info">
                        <h3 style="color: #000!important;" class="mt-3 mb-0">
                            {{$settings->arabic_name}}
                        </h3>
                    </div>
                </a>

            </div>
        </div>
        <ul class="side-menu" id="main-menu-navigation"
            data-menu="menu-navigation">
            <li class="slide {{ Request::is('home*') ? 'active' : '' }}">
                <a class="side-menu__item" href="{{ url('/specialist/' . $page='home') }}">
                    <i class="fa fa-home side-menu__icon"></i>
                    <span class="side-menu__label"> الرئيسية </span></a>
            </li>

            <li class="slide">
                <a class="side-menu__item" data-toggle="slide" href="#">
                    <i class="fa fa-users side-menu__icon"></i>
                    <span class="side-menu__label">
                        المستفيدين
                    </span><i class="angle fe fe-chevron-down"></i>
                </a>
                <ul class="slide-menu">
                    <li>
                        <a class="slide-item" href="{{ route('specialist.beneficiaries.index') }}">
                            قائمة المستفيدين
                        </a>
                    </li>
                </ul>
            </li>
            <li class="slide">
                <a class="side-menu__item" data-toggle="slide" href="#">
                    <i class="fa fa-id-card side-menu__icon"></i>
                    <span class="side-menu__label">
                        التقارير
                    </span><i class="angle fe fe-chevron-down"></i>
                </a>
                <ul class="slide-menu">
                    <li>
                        <a class="slide-item" href="{{ route('specialist.specialist_reports.create') }}">
                            اضافة تقرير جديد
                        </a>
                    </li>
                    <li>
                        <a class="slide-item" href="{{ route('specialist.specialist_reports.index') }}">
                            قائمة التقارير
                        </a>
                    </li>
                </ul>
            </li>

        </ul>
    </div>
</aside>
<!-- main-sidebar -->
