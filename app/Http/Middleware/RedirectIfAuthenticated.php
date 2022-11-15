<?php

namespace App\Http\Middleware;

use App\Providers\RouteServiceProvider;
use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    public function handle($request, Closure $next, $guard = null)
    {
        if (Auth::guard($guard)->check()) {
            switch ($guard) {
                case 'supervisor-web':
                    return redirect(RouteServiceProvider::SUPERVISOR_HOME);
                case 'specialist-web':
                    return redirect(RouteServiceProvider::SPECIALIST_HOME);
                case 'beneficiary-web':
                    return redirect(RouteServiceProvider::BENEFICIARY_HOME);
                case 'volunteer-web':
                    return redirect(RouteServiceProvider::VOLUNTEER_HOME);
            }
        }
        return $next($request);
    }
}
