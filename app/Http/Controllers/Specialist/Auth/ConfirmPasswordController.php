<?php

namespace App\Http\Controllers\Specialist\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\ConfirmsPasswords;

class ConfirmPasswordController extends Controller
{
    use ConfirmsPasswords;
    protected $redirectTo = RouteServiceProvider::SPECIALIST_HOME;
    public function __construct()
    {
        $this->middleware('auth:specialist-web');
    }
    public function showConfirmForm()
    {
        return view('specialist.auth.passwords.confirm');
    }
}
