<?php

namespace App\Http\Controllers\Volunteer;

use App\Events\ExperienceCertificates;
use App\Http\Controllers\Controller;
use App\Mail\sendingEmail;
use App\Mail\SystemEmail;
use App\Models\ExperienceCertificatePrintsNumber;
use App\Models\ExperienceCertificateSettings;
use App\Models\RenewalRequest;
use App\Models\Setting;
use App\Models\Volunteer;
use Elibyy\TCPDF\TCPDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Malath_SMS;

Carbon::setLocale('ar');

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth:volunteer-web', 'CheckStatus']);
    }

    public function index()
    {
        $auth_id = Auth::user()->id;
        $volunteer = Volunteer::findOrFail($auth_id);
        return view('volunteer.home', compact('volunteer'));
    }

    public function DownloadPdf(Request $request)
    {
        $auth_id = Auth::user()->id;
        $volunteer = Volunteer::findOrFail($auth_id);
        $volunteer_id = $volunteer->id;
        $name = $volunteer->first_name . " " . $volunteer->second_name . " " . $volunteer->third_name . " " . $volunteer->fourth_name;
        $record = $volunteer->record;
        $start_date = $volunteer->start_date;
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
        $pdf->SetFont('almohanad', '', 40);
        $pdf->SetTextColor(48, 48, 48);
        $pdf->Image('assets/img/volunteer.png', 2, 2, '293', '205', '', '', '', false, 300, '', false, false, 0);
        $pdf->writeHTMLCell(0, 0, 85, 94, $name, 0, 1, 0, true, 'D', true);
        $pdf->writeHTMLCell(0, 0, 85, 118, $record, 0, 1, 0, true, 'D', true);
        $pdf->writeHTMLCell(0, 0, 85, 143, $start_date, 0, 1, 0, true, 'D', true);
        $pdf->SetAutoPageBreak($auto_page_break, $bMargin);
        $pdf->setPageMark();
        $full_path = public_path('uploads/cards/') . 'CARD_' . $volunteer_id . '.pdf';
        $pdf->Output($full_path, 'F');
        $pdf->Output('Volunteer.pdf');
        exit();
    }

    public function edit_profile($id)
    {
        $volunteer = Volunteer::findOrFail($id);
        return view('volunteer.home', compact('volunteer'));
    }

    public function update_profile(Request $request, $id)
    {
        $this->validate($request, [
            'email' => ['required', 'email'],
            'phone_number' => ['required', 'string', 'max:255', 'regex:/^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$/'],
            'password' => ['required', 'string', 'min:8', 'same:confirm-password'],
        ]);
        $input = $request->all();
        if (!empty($input['password'])) {
            $input['password'] = Hash::make($input['password']);
        } else {
            $input = array_except($input, array('password'));
        }
        $volunteer = Volunteer::findOrFail($id);
        $volunteer->update($input);
        return redirect()->back()->with('success', 'تم تحديث البيانات الشخصية بنجاح ');
    }

    public function renewal_request(Request $request)
    {
        $auth_id = Auth::user()->id;
        $volunteer = Volunteer::findOrFail($auth_id);
        $period = $request->period;
        $renewal_request = RenewalRequest::create([
            'volunteer_id' => $volunteer->id,
            'period' => $period,
            'status' => 'قيد المراجعة',
        ]);
        if ($request->hasFile('payment_pic')) {
            $payment_pic = $request->file('payment_pic');
            $fileName = $payment_pic->getClientOriginalName();
            $uploadDir = 'uploads/payment_pics/' . $renewal_request->id;
            $payment_pic->move($uploadDir, $fileName);
            $renewal_request->payment_pic = $uploadDir . '/' . $fileName;
            $renewal_request->save();
        }
        if ($period == 1) {
            $period_text = "سنة";
        } elseif ($period == 2) {
            $period_text = "سنتين";
        } elseif ($period == 3) {
            $period_text = "3 سنوات";
        }
        // sending email
        $email = $volunteer->email;
        $subject = "تقديم طلب تجديد عضوية متطوع";
        $message = "
        مرحبا/ (" . $volunteer->first_name . ")
        تم تقديم طلب تجديد عضويتك لمدة ( " . $period_text . " ) في جمعية نور نجران بنجاح.
         سيتم تفعيل حسابكم قريبآ من قبل الإدارة.
        ستصلكم رسالة على البريد والجوال في حال التفعيل.
        ";
        $data = array(
            'message' => $message,
            'subject' => $subject,
            'from_email' => $email
        );
        Mail::to($email)->send(new sendingEmail($data));
        $settings = Setting::First();
        Mail::to($settings->email)->send(new SystemEmail($data));
        include(app_path() . '/Functions/sms.class.php');
        $DTT_SMS = new Malath_SMS(env('SMS_UserName'), env('SMS_Password'), 'UTF-8');
        $Originator = env('SMS_Originator');
        $CheckUser = $DTT_SMS->CheckUserPassword();
        // data to send SMS
        $SmS_Msg = $message;
        $Mobiles = $volunteer->phone_number;
        // Code to Send SMS
        $Send = $DTT_SMS->Send_SMS($Mobiles, $Originator, $SmS_Msg, $CheckUser);

        return redirect()->route('volunteer.home')->with('success', 'تم ارسال طلب تجديد العضوية بنجاح');
    }

    public function renewal_requests(Request $request)
    {
        $auth_id = Auth::user()->id;
        $volunteer = Volunteer::findOrFail($auth_id);
        $requests = RenewalRequest::where('volunteer_id', $volunteer->id)->get();
        return view('volunteer.requests', compact('requests', 'volunteer'));
    }

    public function download_certificate($id)
    {
        $volunteer = Volunteer::FindOrFail($id);
        $experience_certificate_settings = ExperienceCertificateSettings::FindOrFail(1);
        $experience_certificate_prints_number = ExperienceCertificatePrintsNumber::where('volunteer_id', $volunteer->id)
            ->First();
        $print_after_period = $experience_certificate_settings->print_after_period;
        $settings_prints_number = $experience_certificate_settings->prints_number;
        $prints_number = $experience_certificate_prints_number->prints_number;
        $start_date = $volunteer->start_date;
        $start_date = strtotime($start_date);
        $now = date('Y-m-d');
        $now = strtotime($now);
        $datediff = $now - $start_date;
        $all_days = round($datediff / (60 * 60 * 24));
        if ($all_days < $print_after_period) {
            $rest = $print_after_period - $all_days;
            $message = "غير مسموح لك بطباعة مشهد الخبرة الا بعد " . $rest . " يوم ";
            return redirect()->route('volunteer.home')->with('error', $message);
        } else {
            if ($prints_number >= $settings_prints_number) {
                $message = "غير مسموح لك بطباعة مشهد الخبرة لقد تجاوزت الحد المسموح به لطباعتها";
                return redirect()->route('volunteer.home')->with('error', $message);
            } else {
                // print certificate
                $last_experience_certificate = DB::table('experience_certificate')->latest()->first();
                if (empty($last_experience_certificate)) {
                    $experience_certificate = 1;
                } else {
                    $experience_certificate = $last_experience_certificate->id;
                }
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
                $pdf->SetTextColor(48, 48, 48);
                $pdf->Image('assets/img/report.png', '0', '0', '', '', '', '', 'C', false, 300, '', false, false, 0, false, false, false);

                $pdf->SetFontSize(28);
                $pdf->writeHTMLCell(0, 0, 480, 20, $experience_certificate, 0, 1, 0, true, 'D', true);
                $pdf->writeHTMLCell(0, 0, 450, 40, date('Y-m-d'), 0, 1, 0, true, 'D', true);

                $pdf->SetFontSize(24);
                $pdf->writeHTMLCell(0, 0, 240, 125, "مشهد", 0, 1, 0, true, 'D', true);

                $pdf->SetFontSize(18);
                $pdf->writeHTMLCell(0, 0, 40, 185, "تشهد جمعية نور نجران النسائية لخدمة ذوي الإعاقة بأن", 0, 1, 0, true, 'D', true);

                $pdf->writeHTMLCell(0, 0, 40, 215, "الأستاذ/ة / ", 0, 1, 0, true, 'D', true);
                $pdf->writeHTMLCell(0, 0, 120, 215,$volunteer->first_name." ".$volunteer->second_name." ".$volunteer->third_name." ".$volunteer->fourth_name, 0, 1, 0, true, 'D', true);

                $pdf->writeHTMLCell(0, 0, 40, 255, "برقم هوية / ", 0, 1, 0, true, 'D', true);
                $pdf->SetFontSize(28);
                $pdf->writeHTMLCell(0, 0, 140, 245,$volunteer->record, 0, 1, 0, true, 'D', true);
                $pdf->SetFontSize(18);
                $pdf->writeHTMLCell(0, 0, 40, 310, " عمل/ت لدى الجمعية بشكل تطوعي خلال الفترة من ", 0, 1, 0, true, 'D', true);
                $pdf->SetFontSize(28);
                $pdf->writeHTMLCell(0, 0, 345, 300,$volunteer->start_date, 0, 1, 0, true, 'D', true);

                $pdf->SetFontSize(18);
                $pdf->writeHTMLCell(0, 0, 430, 310, " الى ", 0, 1, 0, true, 'D', true);
                $pdf->SetFontSize(28);
                $pdf->writeHTMLCell(0, 0, 460, 300,date('Y-m-d'), 0, 1, 0, true, 'D', true);

                $pdf->SetFontSize(18);
                $pdf->setCellHeightRatio(2);

                $pdf->writeHTMLCell(500, 0, 40, 340,"وبناءً على ذلك تم منحها هذه الشهادة سائلين الله لها دوام التوفيق والسداد.", 0, 1, 0, true, 'D', true);

                $full_path = public_path('uploads/certs/') . 'CERT_' . $experience_certificate . '.pdf';
                $pdf->Output($full_path, 'F');
                $pdf->Output('CERT.pdf');
                exit();
            }
        }
    }

    public function increase_counter_cert(Request $request)
    {
        ExperienceCertificates::dispatch();
    }
}
