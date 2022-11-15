<?php

namespace App\Http\Controllers\Supervisor;
use App\Exports\ReportsExport;
use App\Exports\SupervisorReportsExportByBeneficiary;
use App\Exports\SupervisorReportsExportBySpecialist;
use App\Http\Controllers\Controller;
use App\Models\Beneficiary;
use App\Models\Report;
use App\Models\Specialist;
use Elibyy\TCPDF\TCPDF;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class ReportController extends Controller
{
    public function index(){
        $reports = Report::all();
        $beneficiaries = Beneficiary::all();
        $specialists = Specialist::all();
        return view('supervisor.reports.index',compact('reports','specialists','beneficiaries'));
    }
    public function edit($id){
        $report = Report::FindOrFail($id);
        $beneficiaries = Beneficiary::all();
        $specialists = Specialist::all();
        return view('supervisor.reports.edit',compact('report','specialists','beneficiaries'));
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
        return redirect()->route('supervisor.reports.index')->with('success','تم تعديل التقرير بنجاح');
    }
    public function destroy(Request $request){
        $report_id = $request->report_id;
        $report = Report::FindOrFail($report_id);
        $report->delete();
        return redirect()->route('supervisor.reports.index')->with('success','تم حذف التقرير بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $reports_id = $request->reports;
        foreach ($reports_id as $report_id) {
            $report = Report::FindOrFail($report_id);
            $report->delete();
        }
        return redirect()->route('supervisor.reports.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $reports = Report::all();
        return view('supervisor.reports.print', compact('reports'));
    }

    public function export_reports_excel(Request $request)
    {
        $reports = Report::all();
        if($reports->isEmpty()){
            return redirect()->route('supervisor.reports.index')->with('error','لا يوجد تقارير');
        }
        else{
            return Excel::download(new ReportsExport(), 'كل التقارير.xlsx');
        }
    }

    public function export_reports_by_specialist_excel(Request $request)
    {
        $specialists = $request->specialists;
        $reports = Report::whereIn('specialist_id',$specialists)->get();
        if($reports->isEmpty()){
            return redirect()->route('supervisor.reports.index')->with('error','لا يوجد تقارير تخص الاخصائيين ');
        }
        else{
            return Excel::download(new SupervisorReportsExportBySpecialist($specialists), 'تقارير حسب الاخصائيين.xlsx');
        }
    }
    public function export_reports_by_beneficiary_excel(Request $request)
    {
        $beneficiaries = $request->beneficiaries;
        $reports = Report::whereIn('beneficiary_id',$beneficiaries)->get();
        if($reports->isEmpty()){
            return redirect()->route('supervisor.reports.index')->with('error','لا يوجد تقارير تخص المستفيدين ');
        }
        else{
            return Excel::download(new SupervisorReportsExportByBeneficiary($beneficiaries), 'تقارير حسب المستفيدين.xlsx');
        }
    }

    public function show_report_details(Request $request){
        $report_id = $request->report_id;
        $report = Report::FindOrFail($report_id);
        echo "<h1> الاخصائى : ".$report->specialist->first_name." ".$report->specialist->second_name." ".$report->specialist->third_name." ".$report->specialist->fourth_name."  </h1>";
        echo "<h3> المستفيد : ".$report->beneficiary->first_name." ".$report->beneficiary->second_name." ".$report->beneficiary->third_name." ".$report->beneficiary->fourth_name."  </h3>";
        echo "<h6> التاريخ -  الوقت : ".$report->created_at."  </h6>";
        echo "<p> نص التقرير كاملا : <hr/> ".$report->report."  </p>";
    }

    public function download_report($id)
    {
        $report = Report::FindOrFail($id);
        $pdf = new TCPDF("P", "px", "A4", true, "UTF-8");
        $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
        $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
        $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
        $lg = array();
        $lg['a_meta_charset'] = 'UTF-8';
        $lg['a_meta_dir'] = 'rtl';
        $lg['a_meta_language'] = 'fa';
        $lg['w_page'] = 'page';
        $pdf->setLanguageArray($lg);
        $pdf->AddPage();
        $pdf->setPageOrientation('P');
        $pdf->setPageUnit('px');
        $pdf->SetFontSize(24);
        $pdf->setRTL(true);
        $pdf->SetFont('almohanad', '', 24);
        $pdf->SetTextColor(48,48,48);
        $pdf->Image('assets/img/report.png', '0', '0', '', '', '', '', 'C', false, 300, '', false, false, 0, false, false, false);

        $pdf->SetFontSize(28);
        $pdf->writeHTMLCell(0, 0, 480, 20, $report->id, 0, 1, 0, true, 'D', true);
        $pdf->writeHTMLCell(0, 0, 450, 40, date('Y-m-d',strtotime($report->created_at)), 0, 1, 0, true, 'D', true);


        $pdf->writeHTMLCell(0, 0, 240, 125, "تقرير مستفيد", 0, 1, 0, true, 'D', true);


        $pdf->SetFontSize(18);
        $pdf->writeHTMLCell(0, 0, 40, 160, "اسم المستفيد : ", 0, 1, 0, true, 'D', true);
        $pdf->SetFontSize(16);
        $pdf->writeHTMLCell(0, 0, 140, 160,$report->beneficiary->first_name." ".$report->beneficiary->second_name." ".$report->beneficiary->third_name." ".$report->beneficiary->fourth_name, 0, 1, 0, true, 'D', true);

        $pdf->SetFontSize(18);
        $pdf->writeHTMLCell(0, 0, 400, 160, " الجنسية : ", 0, 1, 0, true, 'D', true);
        $pdf->SetFontSize(16);
        $pdf->writeHTMLCell(0, 0, 470, 160,$report->beneficiary->nationality->nationality, 0, 1, 0, true, 'D', true);

        $pdf->SetFontSize(18);
        $pdf->writeHTMLCell(0, 0, 40, 190, " السجل المدني : ", 0, 1, 0, true, 'D', true);
        $pdf->SetFontSize(26);
        $pdf->writeHTMLCell(0, 0, 140, 185,$report->beneficiary->record, 0, 1, 0, true, 'D', true);

        $pdf->SetFontSize(18);
        $pdf->writeHTMLCell(0, 0, 400, 190, " نوع الاعاقة : ", 0, 1, 0, true, 'D', true);
        $pdf->SetFontSize(16);
        $pdf->writeHTMLCell(0, 0, 480, 190,$report->beneficiary->disability->disability, 0, 1, 0, true, 'D', true);

        $pdf->SetFontSize(18);
        $pdf->writeHTMLCell(0, 0, 40, 220, " اسم الأخصائي / ة : ", 0, 1, 0, true, 'D', true);
        $pdf->SetFontSize(16);
        $pdf->writeHTMLCell(0, 0, 160, 220,$report->specialist->first_name." ".$report->specialist->second_name." ".$report->specialist->third_name." ".$report->specialist->fourth_name, 0, 1, 0, true, 'D', true);

        $pdf->SetFontSize(18);
        $pdf->writeHTMLCell(0, 0, 40, 260, "  رأي الأخصائي / ة : ", 0, 1, 0, true, 'D', true);

        $pdf->SetFont('almohanad', '', 16);
        $pdf->setCellHeightRatio(2);
        $pdf->writeHTMLCell(440, 0, 60, 300, $report->report, 0, 1, 0, true, 'D', true);


        $pdf->SetFontSize(14);
        $pdf->writeHTMLCell(0, 0, 40, 690, "تم طباعة هذا التقرير بناء على طلب المستفيد ولا تتحمل الجمعية اى مسئولية تجاه ذلك", 0, 1, 0, true, 'D', true);

        $full_path = public_path('uploads/reports/') . 'REPORT_' . $report->id . '.pdf';
        $pdf->Output($full_path,'F');
        $pdf->Output('Report.pdf');
        exit();
    }



}
