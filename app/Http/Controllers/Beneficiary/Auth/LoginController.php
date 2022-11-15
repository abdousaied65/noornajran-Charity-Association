<?php

namespace App\Http\Controllers\Beneficiary\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Response;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

class LoginController extends Controller
{
    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::BENEFICIARY_HOME;

    public function __construct()
    {
        $this->middleware('guest:beneficiary-web')->except('logout');
    }
    protected function loggedOut(Request $request)
    {
        return $request->wantsJson()
            ? new Response('', 204)
            : redirect('/beneficiary');
    }
    protected function guard()
    {
        return Auth::guard('beneficiary-web');
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
            return view('beneficiary.auth.login');
        }
        elseif (Auth::guard('volunteer-web')->check()) {
            Auth::guard('volunteer-web')->logout();
            return view('beneficiary.auth.login');
        }
        elseif (Auth::guard('specialist-web')->check()) {
            Auth::guard('specialist-web')->logout();
            return view('beneficiary.auth.login');
        }
        elseif (Auth::guard('beneficiary-web')->check()) {
            return redirect()->route('beneficiary.home');
        }
        else{
            return view('beneficiary.auth.login');
        }
    }
}
