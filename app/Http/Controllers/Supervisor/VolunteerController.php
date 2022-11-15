<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\RequestsExport;
use App\Exports\VolunteersExport;
use App\Exports\VolunteersExportByEnd;
use App\Exports\VolunteersExportByField;
use App\Exports\VolunteersExportByStatus;
use App\Mail\sendingEmail;
use App\Mail\SystemEmail;
use App\Models\ExperienceCertificatePrintsNumber;
use App\Models\Field;
use App\Models\RenewalRequest;
use App\Models\Setting;
use App\Models\Volunteer;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Malath_SMS;

class VolunteerController extends Controller
{
    public function index(Request $request)
    {
        $data = Volunteer::all();
        $fields = Field::all();
        return view('supervisor.volunteers.index', compact('data', 'fields'));
    }

    public function create()
    {
        $fields = Field::all();
        return view('supervisor.volunteers.create', compact('fields'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'first_name' => 'required',
            'second_name' => 'required',
            'third_name' => 'required',
            'fourth_name' => 'required',
            'record' => 'required',
            'phone_number' => 'required',
            'email' => 'required|email',
            'field_id' => 'required',
            'transfer_pic' => 'required',
            'cv' => 'required',
            'password' => 'required|same:confirm-password',
            'role_name' => 'required',
            'start_date' => 'required',
            'end_date' => 'required',
            'Status' => 'required',
        ]);
        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $volunteer = Volunteer::create($input);
        if ($request->hasFile('transfer_pic')) {
            $image = $request->file('transfer_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/volunteers/transfer_pics/' . $volunteer->id;
            $image->move($uploadDir, $fileName);
            $volunteer->transfer_pic = $uploadDir . '/' . $fileName;
            $volunteer->save();
        }
        if ($request->hasFile('cv')) {
            $image = $request->file('cv');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/volunteers/cvs/' . $volunteer->id;
            $image->move($uploadDir, $fileName);
            $volunteer->cv = $uploadDir . '/' . $fileName;
            $volunteer->save();
        }
        ExperienceCertificatePrintsNumber::create([
            'volunteer_id' => $volunteer->id,
            'prints_number' => 0
        ]);
        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم اضافة متطوع بنجاح');
    }

    public function show($id)
    {
        $volunteer = Volunteer::findorfail($id);
        return view('supervisor.volunteers.show', compact('volunteer'));
    }


    public function edit($id)
    {
        $volunteer = Volunteer::findOrFail($id);
        $fields = Field::all();
        return view('supervisor.volunteers.edit', compact('volunteer', 'fields'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'first_name' => 'required',
            'second_name' => 'required',
            'third_name' => 'required',
            'fourth_name' => 'required',
            'record' => 'required',
            'phone_number' => 'required',
            'email' => 'required|email',
            'field_id' => 'required',
            'password' => 'same:confirm-password',
            'role_name' => 'required',
            'start_date' => 'required',
            'end_date' => 'required',
            'Status' => 'required',
        ]);
        $input = $request->all();
        if (!empty($input['password'])) {
            $input['password'] = Hash::make($input['password']);
        } else {
            $input = array_except($input, array('password'));
        }
        $volunteer = Volunteer::findOrFail($id);
        $volunteer->update($input);
        if ($request->hasFile('transfer_pic')) {
            $image = $request->file('transfer_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/volunteers/transfer_pics/' . $volunteer->id;
            $image->move($uploadDir, $fileName);
            $volunteer->transfer_pic = $uploadDir . '/' . $fileName;
            $volunteer->save();
        }
        if ($request->hasFile('cv')) {
            $image = $request->file('cv');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/volunteers/cvs/' . $volunteer->id;
            $image->move($uploadDir, $fileName);
            $volunteer->cv = $uploadDir . '/' . $fileName;
            $volunteer->save();
        }
        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم تعديل بيانات المتطوع بنجاح');
    }

    public function destroy(Request $request)
    {
        Volunteer::findOrFail($request->volunteer_id)->delete();
        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم حذف المتطوع بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $volunteers_id = $request->volunteers;
        foreach ($volunteers_id as $volunteer_id) {
            $volunteer = Volunteer::FindOrFail($volunteer_id);
            $volunteer->delete();
        }
        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function remove_renewal_requests(Request $request)
    {
        $requests_id = $request->requests;
        foreach ($requests_id as $request_id) {
            $request = RenewalRequest::FindOrFail($request_id);
            $request->delete();
        }
        return redirect()->route('supervisor.renewal.requests')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $volunteers = Volunteer::all();
        return view('supervisor.volunteers.print', compact('volunteers'));
    }

    public function print_renewal_requests()
    {
        $requests = RenewalRequest::all();
        return view('supervisor.volunteers.print_requests', compact('requests'));
    }

    public function export_volunteers_excel()
    {
        return Excel::download(new VolunteersExport(), 'كل المتطوعين.xlsx');
    }

    public function export_requests_excel()
    {
        return Excel::download(new RequestsExport(), 'كل طلبات التجديد.xlsx');
    }

    public function export_volunteers_by_field_excel(Request $request)
    {
        $fields = $request->fields;
        $volunteers = Volunteer::whereIn('field_id', $fields)
            ->get();
        if ($volunteers->isEmpty()) {
            return redirect()->route('supervisor.volunteers.index')->with('error', 'لا يوجد متطوعين تخص هذا المجال ');
        } else {
            return Excel::download(new VolunteersExportByField($fields), 'متطوعين حسب المجال التطوعى.xlsx');
        }
    }

    public function export_volunteers_by_status_excel(Request $request)
    {
        $statuses = $request->statuses;
        $volunteers = Volunteer::whereIn('Status', $statuses)
            ->get();
        if ($volunteers->isEmpty()) {
            return redirect()->route('supervisor.volunteers.index')->with('error', 'لا يوجد متطوعين تخص هذه الحالات ');
        } else {
            return Excel::download(new VolunteersExportByStatus($statuses), 'متطوعين حسب الحالة.xlsx');
        }
    }

    public function export_volunteers_by_end_excel(Request $request)
    {
        $today = date('Y-m-d');
        $volunteers = Volunteer::whereBetween('end_date', [$today, date('Y-m-d', strtotime($today . '+1 month'))])
            ->get();
        if ($volunteers->isEmpty()) {
            return redirect()->route('supervisor.volunteers.index')->with('error', 'لا يوجد متطوعين ينتهى اشتراكهم فى تلك الفترة ');
        } else {
            return Excel::download(new VolunteersExportByEnd(), 'متطوعين ينتهى اشتراكهم فى خلال شهر من اليوم.xlsx');
        }
    }

    public function allow($id)
    {
        $volunteer = Volunteer::FindOrFail($id);
        $start_date = date('Y-m-d');
        $end_date = date('Y-m-d', strtotime('+1 year'));
        $volunteer->update([
            'Status' => 'سارى',
            'start_date' => $start_date,
            'end_date' => $end_date,
        ]);
        // sending email
        $email = $volunteer->email;
        $subject = "تفعيل حساب متطوع";
        $message = "
        مرحبا/ (" . $volunteer->first_name . ")
        تم تفعيل حسابكم في جمعية نور نجران بنجاح.
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


        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم تعديل الحالة الى سارى بنجاح');
    }

    public function deny($id)
    {
        $volunteer = Volunteer::FindOrFail($id);
        $volunteer->update([
            'Status' => 'منتهى'
        ]);
        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم تعديل الحالة الى منتهى بنجاح');
    }

    public function waiting($id)
    {
        $volunteer = Volunteer::FindOrFail($id);
        $volunteer->update([
            'Status' => 'قيد المراجعة'
        ]);
        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم تعديل الحالة الى قيد المراجعة بنجاح');
    }

    public function renew_one($id)
    {
        $volunteer = Volunteer::FindOrFail($id);
        $start_date = date('Y-m-d');
        $end_date = date('Y-m-d', strtotime('+1 year'));

        $volunteer->update([
            'Status' => 'سارى',
            'start_date' => $start_date,
            'end_date' => $end_date,
        ]);
        // sending email
        $email = $volunteer->email;
        $subject = "تفعيل حساب متطوع";
        $message = "
        مرحبا/ (" . $volunteer->frist_name . ")
        تم تفعيل حسابكم في جمعية نور نجران بنجاح.
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

        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم تجديد العضوية سنة بنجاح');
    }

    public function renew_two($id)
    {
        $volunteer = Volunteer::FindOrFail($id);
        $start_date = date('Y-m-d');
        $end_date = date('Y-m-d', strtotime('+2 year'));

        $volunteer->update([
            'Status' => 'سارى',
            'start_date' => $start_date,
            'end_date' => $end_date,
        ]);
        // sending email
        $email = $volunteer->email;
        $subject = "تفعيل حساب متطوع";
        $message = "
        مرحبا/ (" . $volunteer->first_name . ")
        تم تفعيل حسابكم في جمعية نور نجران بنجاح.
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

        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم تجديد العضوية سنتين بنجاح');
    }

    public function renew_three($id)
    {
        $volunteer = Volunteer::FindOrFail($id);
        $start_date = date('Y-m-d');
        $end_date = date('Y-m-d', strtotime('+3 year'));

        $volunteer->update([
            'Status' => 'سارى',
            'start_date' => $start_date,
            'end_date' => $end_date,
        ]);
        // sending email
        $email = $volunteer->email;
        $subject = "تفعيل حساب متطوع";
        $message = "
        مرحبا/ (" . $volunteer->first_name . ")
        تم تفعيل حسابكم في جمعية نور نجران بنجاح.
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

        return redirect()->route('supervisor.volunteers.index')
            ->with('success', 'تم تجديد العضوية 3 سنوات بنجاح');
    }

    public function renewal_requests()
    {
        $requests = RenewalRequest::all();
        return view('supervisor.volunteers.requests', compact('requests'));
    }

    public function allow_request($id)
    {
        $request = RenewalRequest::FindOrFail($id);
        $period = $request->period;
        $start_date = date('Y-m-d');
        $end_date = date('Y-m-d', strtotime('+' . $period . ' year'));
        $volunteer = $request->volunteer;
        $volunteer->update([
            'Status' => 'سارى',
            'start_date' => $start_date,
            'end_date' => $end_date,
        ]);
        if ($period == 1) {
            $period_text = "سنة";
        } elseif ($period == 2) {
            $period_text = "سنتين";
        } elseif ($period == 3) {
            $period_text = "3 سنوات";
        }

        // sending email
        $email = $volunteer->email;
        $subject = "قبول طلب تجديد عضوية متطوع";
        $message = "
        مرحبا/ (" . $volunteer->first_name . ")
        تم قبول طلب تجديد عضويتك لمدة ( " . $period_text . " ) في جمعية نور نجران بنجاح.
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


        $request->update([
            'status' => 'تمت الموافقة',
        ]);
        return redirect()->route('supervisor.renewal.requests')
            ->with('success', 'تمت الموافقة على الطلب بنجاح');
    }

    public function deny_request($id)
    {
        $request = RenewalRequest::FindOrFail($id);
        $volunteer = $request->volunteer;
        $request->update([
            'status' => 'مرفوض',
        ]);
        return redirect()->route('supervisor.renewal.requests')
            ->with('success', 'تم رفض الطلب بنجاح');
    }

    public function destroy_request(Request $request)
    {
        $request = RenewalRequest::FindOrFail($request->request_id);
        $request->delete();
        return redirect()->route('supervisor.renewal.requests')
            ->with('success', 'تم حذف الطلب بنجاح');
    }


}
