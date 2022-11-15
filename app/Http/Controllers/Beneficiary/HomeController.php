<?php

namespace App\Http\Controllers\Beneficiary;

use App\Http\Controllers\Controller;
use App\Models\Beneficiary;
use App\Models\Report;
use Elibyy\TCPDF\TCPDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;

Carbon::setLocale('ar');

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth:beneficiary-web','CheckStatus']);
    }
    public function index()
    {
        $auth_id = Auth::user()->id;
        $beneficiary = Beneficiary::findOrFail($auth_id);
        return view('beneficiary.home',compact('beneficiary'));
    }

    public function DownloadPdf(Request $request)
    {
        $auth_id = Auth::user()->id;
        $beneficiary = Beneficiary::findOrFail($auth_id);
        $beneficiary_id = $beneficiary->id;
        $name = $beneficiary->first_name . " ".$beneficiary->second_name . " ".$beneficiary->third_name . " ".$beneficiary->fourth_name . " ";
        $record = $beneficiary->record;

        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        $lg = array();
        $lg['a_meta_charset'] = 'UTF-8';
        $lg['a_meta_dir'] = 'rtl';
        $lg['a_meta_language'] = 'fa';
        $lg['w_page'] = 'page';
        $pdf->setLanguageArray($lg);
        $pdf->AddPage();
        $pdf->setPageOrientation('L');
        $bMargin = $pdf->getBreakMargin();
        $auto_page_break = $pdf->getAutoPageBreak();
        $pdf->SetAutoPageBreak(false, 0);
        $pdf->setRTL(true);
        $pdf->SetFont('almohanad', '', 42);
        $pdf->SetTextColor(48,48,48);
        $pdf->Image('assets/img/beneficiary.png',2, 2, '293', '205', '', '', '', false, 300, '', false, false, 0);
        $pdf->writeHTMLCell(0, 0, 120, 105, $name, 0, 1, 0, true, 'D', true);
        $pdf->writeHTMLCell(0, 0, 120, 130, $record, 0, 1, 0, true, 'D', true);
        $pdf->SetAutoPageBreak($auto_page_break, $bMargin);
        $pdf->setPageMark();
        $full_path = public_path('uploads/beneficiaries/cards/') . 'CARD_' . $beneficiary_id . '.pdf';
        $pdf->Output($full_path,'F');
        $pdf->Output('Beneficiary.pdf');
        exit();
    }

    public function edit_profile($id)
    {
        $beneficiary = Beneficiary::findOrFail($id);
        return view('beneficiary.home', compact('beneficiary'));
    }

    public function update_profile(Request $request, $id)
    {
        $this->validate($request, [
            'email' => ['required', 'email'],
            'phone_number' => ['required', 'string', 'max:255','regex:/^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$/'],
            'password' => ['required', 'string', 'min:8', 'same:confirm-password'],
        ]);

        $input = $request->all();
        if (!empty($input['password'])) {
            $input['password'] = Hash::make($input['password']);
        } else {
            $input = array_except($input, array('password'));
        }
        $beneficiary = Beneficiary::findOrFail($id);
        $beneficiary->update($input);
        return redirect()->back()->with('success', 'تم تحديث البيانات الشخصية بنجاح ');
    }
    public function display_reports(){
        $auth_id = Auth::user()->id;
        $beneficiary = Beneficiary::findOrFail($auth_id);
        $reports = Report::where('beneficiary_id',$beneficiary->id)
            ->orderBy('created_at','DESC')->get();
        return view('beneficiary.reports',compact('beneficiary','reports'));
    }
    public function show_report_details(Request $request){
        $report_id = $request->report_id;
        $report = Report::FindOrFail($report_id);
        echo "<h4 style='font-size:20px!important;'> الاخصائى : ".
            $report->specialist->first_name." ".
            $report->specialist->second_name." ".
            $report->specialist->third_name." ".
            $report->specialist->fourth_name." ".
            "  </h4>";
        echo "<h4 style='font-size:20px!important;'> المستفيد : ".
            $report->beneficiary->first_name." ".
            $report->beneficiary->second_name." ".
            $report->beneficiary->third_name." ".
            $report->beneficiary->fourth_name." ".
            "  </h4>";
        echo "<h6 style='font-size:15px!important;'> التاريخ -  الوقت : ".$report->created_at."  </h6>";
        echo "<p style='font-size:18px!important;'> نص التقرير كاملا : <hr/> ".$report->report."  </p>";
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
        $pdf->writeHTMLCell(0, 0, 140, 160,$report->beneficiary->first_name . " ".$report->beneficiary->second_name
            . " ".$report->beneficiary->third_name . " ".$report->beneficiary->fourth_name, 0, 1, 0, true, 'D', true);

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
        $pdf->writeHTMLCell(0, 0, 160, 220,$report->specialist->first_name." ".$report->specialist->second_name." ".
            $report->specialist->third_name." ".$report->specialist->fourth_name, 0, 1, 0, true, 'D', true);

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
