<?php

namespace App\Http\Controllers\Specialist;

use App\Models\Beneficiary;
use App\Http\Controllers\Controller;
use App\Models\Disability;
use App\Models\Nationality;
use App\Models\Report;
use App\Models\Specialist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BeneficiaryController extends Controller
{
    public function index(Request $request)
    {
        $data = Beneficiary::where('Status','تمت الموافقة')->get();
        $disabilities = Disability::all();
        $nationalities = Nationality::all();
        return view('specialist.beneficiaries.index', compact('data','nationalities','disabilities'));
    }

    public function show($id)
    {
        $auth_id = Auth::user()->id;
        $user = Specialist::FindOrFail($auth_id);
        $beneficiary = Beneficiary::findorfail($id);
        $reports = Report::where('beneficiary_id',$beneficiary->id)
            ->orderBy('created_at','DESC')->get();
        return view('specialist.beneficiaries.show', compact('beneficiary','user','reports'));
    }
}
