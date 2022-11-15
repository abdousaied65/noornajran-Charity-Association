<?php

namespace App\Http\Controllers\Specialist;
use App\Exports\ReportsExportByBeneficiary;
use App\Exports\ReportsExportBySpecialist;
use App\Http\Controllers\Controller;
use App\Models\Beneficiary;
use App\Models\Report;
use App\Models\Specialist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;

class SpecialistReportController extends Controller
{
    public function index(){
        $auth_id = Auth::user()->id;
        $reports = Report::where('specialist_id',$auth_id)->get();
        $beneficiaries = Beneficiary::all();
        return view('specialist.specialist_reports.index',compact('reports','beneficiaries'));
    }
    public function create(){
        $beneficiaries = Beneficiary::all();
        return view('specialist.specialist_reports.create',compact('beneficiaries'));
    }
    public function store(Request $request){
        $this->validate($request, [
            'beneficiary_id' => 'required',
            'specialist_id' => 'required',
            'report' => ['required', 'string', 'max:700'],
        ]);
        $data = $request->all();
        $report = Report::create($data);
        return redirect()->route('specialist.specialist_reports.index')->with('success','تم اضافة تقرير جديد بنجاح');
    }
    public function edit($id){
        $report = Report::FindOrFail($id);
        $beneficiaries = Beneficiary::all();
        return view('specialist.specialist_reports.edit',compact('report','beneficiaries'));
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
        return redirect()->route('specialist.specialist_reports.index')->with('success','تم تعديل التقرير بنجاح');
    }
    public function destroy(Request $request){
        $report_id = $request->report_id;
        $report = Report::FindOrFail($report_id);
        $report->delete();
        return redirect()->route('specialist.specialist_reports.index')->with('success','تم حذف التقرير بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $reports_id = $request->reports;
        foreach ($reports_id as $report_id) {
            $report = Report::FindOrFail($report_id);
            $report->delete();
        }
        return redirect()->route('specialist.specialist_reports.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $reports = Report::all();
        return view('specialist.specialist_reports.print', compact('reports'));
    }

    public function export_specialist_reports_excel(Request $request)
    {
        $specialist_id = Auth::user()->id;
        $specialist = Specialist::FindOrFail($specialist_id);
        $specialist_name = $specialist->first_name." ".$specialist->second_name." ".$specialist->third_name." ".$specialist->fourth_name;
        $reports = Report::where('specialist_id', $specialist_id)
            ->get();
        if ($reports->isEmpty()) {
            return redirect()->route('specialist.specialist_reports.index')->with('error', 'لا يوجد تقارير تخصك');
        } else {
            $filename = "تقارير الاخصائى " . $specialist_name . ".xlsx";
            return Excel::download(new ReportsExportBySpecialist(), $filename);
        }
    }
    public function export_specialist_reports_by_beneficiary_excel(Request $request)
    {
        $beneficiaries = $request->beneficiaries;
        $reports = Report::whereIn('beneficiary_id',$beneficiaries)
            ->where('specialist_id',Auth::user()->id)
            ->get();
        if($reports->isEmpty()){
            return redirect()->route('specialist.specialist_reports.index')->with('error','لا يوجد تقارير تخص المستفيدين ');
        }
        else{
            return Excel::download(new ReportsExportByBeneficiary($beneficiaries), 'تقارير حسب المستفيدين.xlsx');
        }
    }
}
