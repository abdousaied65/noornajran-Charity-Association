<?php

namespace App\Http\Middleware;

use App\Models\Beneficiary;
use App\Models\Volunteer;
use Closure;
use Illuminate\Support\Facades\Auth;

class CheckStatus
{
    public function handle($request, Closure $next)
    {
        if (Auth::guard('beneficiary-web')->check()){
            $beneficiary_id = Auth::user()->id;
            $beneficiary = Beneficiary::FindOrFail($beneficiary_id);
            $status = $beneficiary->Status;
            if ($status == "قيد المراجعة" || $status == "مرفوض" || $status == "منتهى") {
                Auth::guard('beneficiary-web')->logout();
                return redirect()->route('beneficiary.login')
                    ->with('error','حسابك قيد التفعيل سيتم تفعيل الحساب قريبا');
            }
        }
        if (Auth::guard('volunteer-web')->check()){
            $volunteer_id = Auth::user()->id;
            $volunteer = Volunteer::FindOrFail($volunteer_id);
            $status = $volunteer->Status;
            $end_date = $volunteer->end_date;
            $today = date('Y-m-d');
            if ($status == "قيد المراجعة" || $status == "مرفوض" || $status == "منتهى") {
                Auth::guard('volunteer-web')->logout();
                return redirect()->route('volunteer.login')
                    ->with('error','حسابك قيد التفعيل سيتم تفعيل الحساب قريبا');
            }
        }
        return $next($request);
    }
}
