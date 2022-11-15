<?php
namespace App\Http\Controllers\Specialist\Auth;
use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\VerifiesEmails;
use Illuminate\Http\Request;

class VerificationController extends Controller
{
    use VerifiesEmails;
    protected $redirectTo = RouteServiceProvider::SPECIALIST_HOME;
    public function __construct()
    {
        $this->middleware('auth:specialist-web');
        $this->middleware('signed')->only('verify');
        $this->middleware('throttle:6,1')->only('verify', 'resend');
    }
    public function show(Request $request)
    {
        return $request->user('specialist-web')->hasVerifiedEmail()
            ? redirect($this->redirectPath())
            : view('specialist.auth.verify');
    }
}
