<?php

namespace App\Http\Controllers\Specialist;
use App\Http\Controllers\Controller;
use App\Models\Beneficiary;
use App\Models\Report;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReportController extends Controller
{
    public function show_report_details(Request $request){
        $report_id = $request->report_id;
        $report = Report::FindOrFail($report_id);
        echo "<h1> الاخصائى : ".
            $report->specialist->first_name." ".
            $report->specialist->second_name." ".
            $report->specialist->third_name." ".
            $report->specialist->fourth_name."  </h1>";
        echo "<h3> المستفيد : ".
            $report->beneficiary->first_name. " ".
            $report->beneficiary->second_name. " ".
            $report->beneficiary->third_name. " ".
            $report->beneficiary->fourth_name."  </h3>";
        echo "<h6> التاريخ -  الوقت : ".$report->created_at."  </h6>";
        echo "<p> نص التقرير كاملا : <hr/> ".$report->report."  </p>";
    }
    public function create($id){
        $beneficiary = Beneficiary::FindOrFail($id);
        $specialist = Auth::user();
        return view('specialist.reports.create',compact('specialist','beneficiary'));
    }
    public function store(Request $request){
        $this->validate($request, [
            'beneficiary_id' => 'required',
            'specialist_id' => 'required',
            'report' => ['required', 'string', 'max:700'],
        ]);
        $data = $request->all();
        $report = Report::create($data);
        $beneficiary_id = $request->beneficiary_id;
        return redirect()->route('specialist.beneficiaries.show',$beneficiary_id)->with('success','تم اضافة تقرير جديد لهذا المستفيد بنجاح');
    }
    public function edit($id){
        $report = Report::FindOrFail($id);
        return view('specialist.reports.edit',compact('report'));
    }
    public function update(Request $request ,$id){
        $this->validate($request, [
            'beneficiary_id' => 'required',
            'specialist_id' => 'required',
            'report' => ['required', 'string', 'max:700'],
        ]);
        $report = Report::FindOrFail($id);
        $data = $request->all();
        $report->update($data);
        $beneficiary_id = $request->beneficiary_id;
        return redirect()->route('specialist.beneficiaries.show',$beneficiary_id)->with('success','تم تعديل التقرير لهذا المستفيد بنجاح');
    }
    public function destroy(Request $request){
        $report_id = $request->report_id;
        $report = Report::FindOrFail($report_id);
        $report->delete();
        $beneficiary_id = $request->beneficiary_id;
        return redirect()->route('specialist.beneficiaries.show',$beneficiary_id)->with('success','تم حذف التقرير لهذا المستفيد بنجاح');

    }

}
