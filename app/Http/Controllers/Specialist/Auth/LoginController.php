<?php

namespace App\Http\Controllers\Specialist\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Response;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::SPECIALIST_HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public function __construct()
    {
        $this->middleware('guest:specialist-web')->except('logout');
    }

    protected function loggedOut(Request $request)
    {
        return $request->wantsJson()
            ? new Response('', 204)
            : redirect('/specialist');
    }

    protected function guard()
    {
        return Auth::guard('specialist-web');
    }

    protected function credentials(Request $request)
    {
        return $request->only($this->username(), 'password');
    }

    protected function validateLogin(Request $request)
    {
        $request->validate([
            $this->username() => 'required|string',
            'password' => 'required|string',
        ]);
    }
    public function showLoginForm() {
        if (Auth::guard('supervisor-web')->check()) {
            Auth::guard('supervisor-web')->logout();
            return view('specialist.auth.login');
        }
        elseif (Auth::guard('volunteer-web')->check()) {
            Auth::guard('volunteer-web')->logout();
            return view('specialist.auth.login');
        }
        elseif (Auth::guard('specialist-web')->check()) {
            return view('beneficiary.home');
        }
        elseif (Auth::guard('beneficiary-web')->check()) {
            Auth::guard('beneficiary-web')->logout();
            return view('specialist.auth.login');
        }
        else{
            return view('specialist.auth.login');
        }
    }
}
