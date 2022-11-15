<?php

namespace App\Providers;

use App\Http\Controllers\Site\DeptController;
use App\Http\Controllers\Supervisor\SettingController;
use App\Models\AboutContent;
use App\Models\Admin;
use App\Models\City;
use App\Models\Customer;
use App\Models\Dept;
use App\Models\Governorate;
use App\Models\IndexContent;
use App\Models\Information;
use App\Models\Message;
use App\Models\Notification;
use App\Models\Room;
use App\Models\Setting;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     *
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $settings = Setting::First();
        View::share('settings', $settings);

        $informations = Information::First();
        View::share('informations', $informations);

        $index_content = IndexContent::First();
        View::share('index_content', $index_content);

        $about_content = AboutContent::First();
        View::share('about_content', $about_content);

    }

}
