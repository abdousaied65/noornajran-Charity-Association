<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\BeneficiariesExport;
use App\Exports\BeneficiariesExportByDisability;
use App\Exports\BeneficiariesExportByNationality;
use App\Exports\BeneficiariesExportByStatus;
use App\Mail\sendingEmail;
use App\Mail\SystemEmail;
use App\Models\Beneficiary;
use App\Http\Controllers\Controller;
use App\Models\Disability;
use App\Models\Nationality;
use App\Models\Setting;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Malath_SMS;

class BeneficiaryController extends Controller
{
    public function index(Request $request)
    {
        $data = Beneficiary::all();
        $disabilities = Disability::all();
        $nationalities = Nationality::all();
        return view('supervisor.beneficiaries.index', compact('data', 'nationalities','disabilities'));
    }

    public function create()
    {
        $disabilities = Disability::all();
        $nationalities = Nationality::all();
        return view('supervisor.beneficiaries.create', compact('disabilities','nationalities'));

    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'first_name' => 'required',
            'second_name' => 'required',
            'third_name' => 'required',
            'fourth_name' => 'required',
            'email' => 'required|email',
            'password' => 'required|same:confirm-password',
            'role_name' => 'required',
            'phone_number' => 'required',
            'record' => 'required',
            'disability_id' => 'required',
            'nationality_id' => 'required',
            'Status' => 'required',
        ]);
        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $beneficiary = Beneficiary::create($input);
        if ($request->hasFile('id_pic')) {
            $image = $request->file('id_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/id_pics/' . $beneficiary->id;
            $image->move($uploadDir, $fileName);
            $beneficiary->id_pic = $uploadDir . '/' . $fileName;
            $beneficiary->save();
        }
        if ($request->hasFile('medical_report_pic')) {
            $image = $request->file('medical_report_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/medical_report_pics/' . $beneficiary->id;
            $image->move($uploadDir, $fileName);
            $beneficiary->medical_report_pic = $uploadDir . '/' . $fileName;
            $beneficiary->save();
        }
        return redirect()->route('supervisor.beneficiaries.index')
            ->with('success', 'تم اضافة مستفيد بنجاح');
    }

    public function show($id)
    {
        $beneficiary = Beneficiary::findorfail($id);
        return view('supervisor.beneficiaries.show', compact('beneficiary'));
    }


    public function edit($id)
    {
        $beneficiary = Beneficiary::findOrFail($id);
        $nationalities = Nationality::all();
        $disabilities = Disability::all();
        return view('supervisor.beneficiaries.edit', compact('beneficiary', 'nationalities', 'disabilities'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'first_name' => 'required',
            'second_name' => 'required',
            'third_name' => 'required',
            'fourth_name' => 'required',
            'email' => 'required|email',
            'password' => 'same:confirm-password',
            'role_name' => 'required',
            'phone_number' => 'required',
            'record' => 'required',
            'disability_id' => 'required',
            'nationality_id' => 'required',
            'Status' => 'required',
        ]);
        $input = $request->all();
        if (!empty($input['password'])) {
            $input['password'] = Hash::make($input['password']);
        } else {
            $input = array_except($input, array('password'));
        }
        $beneficiary = Beneficiary::findOrFail($id);
        $beneficiary->update($input);
        if ($request->hasFile('id_pic')) {
            $image = $request->file('id_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/id_pics/' . $beneficiary->id;
            $image->move($uploadDir, $fileName);
            $beneficiary->id_pic = $uploadDir . '/' . $fileName;
            $beneficiary->save();
        }
        if ($request->hasFile('medical_report_pic')) {
            $image = $request->file('medical_report_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/medical_report_pics/' . $beneficiary->id;
            $image->move($uploadDir, $fileName);
            $beneficiary->medical_report_pic = $uploadDir . '/' . $fileName;
            $beneficiary->save();
        }
        return redirect()->route('supervisor.beneficiaries.index')
            ->with('success', 'تم تعديل بيانات المستفيد بنجاح');
    }

    public function destroy(Request $request)
    {
        Beneficiary::findOrFail($request->beneficiary_id)->delete();
        return redirect()->route('supervisor.beneficiaries.index')
            ->with('success', 'تم حذف المستفيد بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $beneficiaries_id = $request->beneficiaries;
        foreach ($beneficiaries_id as $beneficiary_id) {
            $beneficiary = Beneficiary::FindOrFail($beneficiary_id);
            $beneficiary->delete();
        }
        return redirect()->route('supervisor.beneficiaries.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $beneficiaries = Beneficiary::all();
        return view('supervisor.beneficiaries.print', compact('beneficiaries'));
    }

    public function export_beneficiaries_excel()
    {
        return Excel::download(new BeneficiariesExport(), 'كل المستفيدين.xlsx');
    }

    public function export_beneficiaries_by_nationality_excel(Request $request)
    {
        $nationalities = $request->nationalities;
        $beneficiaries = Beneficiary::whereIn('nationality_id',$nationalities)
            ->get();
        if($beneficiaries->isEmpty()){
            return redirect()->route('supervisor.beneficiaries.index')->with('error','لا يوجد مستفيدين تخص هذه الجنسية ');
        }
        else{
            return Excel::download(new BeneficiariesExportByNationality($nationalities), 'مستفيدين حسب الجنسية.xlsx');
        }
    }
    public function export_beneficiaries_by_disability_excel(Request $request)
    {
        $disabilities = $request->disabilities;
        $beneficiaries = Beneficiary::whereIn('disability_id',$disabilities)
            ->get();
        if($beneficiaries->isEmpty()){
            return redirect()->route('supervisor.beneficiaries.index')->with('error','لا يوجد مستفيدين تخص نوع الاعاقة هذه ');
        }
        else{
            return Excel::download(new BeneficiariesExportByDisability($disabilities), 'مستفيدين حسب نوع الاعاقة.xlsx');
        }
    }

    public function export_beneficiaries_by_status_excel(Request $request)
    {
        $statuses = $request->statuses;
        $beneficiaries = Beneficiary::whereIn('Status',$statuses)
            ->get();
        if($beneficiaries->isEmpty()){
            return redirect()->route('supervisor.beneficiaries.index')->with('error','لا يوجد مستفيدين تخص هذه الحالات ');
        }
        else{
            return Excel::download(new BeneficiariesExportByStatus($statuses), 'مستفيدين حسب الحالة.xlsx');
        }
    }

    public function allow($id){
        $beneficiary = Beneficiary::FindOrFail($id);
        $beneficiary->update([
            'Status' => 'تمت الموافقة'
        ]);
        // sending email
        $email = $beneficiary->email;
        $subject = "تفعيل حساب مستفيد";
        $message = "
        مرحبا/ (" . $beneficiary->first_name . ")
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
        $Mobiles = $beneficiary->phone_number;
        // Code to Send SMS
        $Send = $DTT_SMS->Send_SMS($Mobiles, $Originator, $SmS_Msg, $CheckUser);


        return redirect()->route('supervisor.beneficiaries.index')
            ->with('success', 'تم الموافقة على المستفيد بنجاح');
    }
    public function deny($id){
        $beneficiary = Beneficiary::FindOrFail($id);
        $beneficiary->update([
            'Status' => 'مرفوض'
        ]);
        return redirect()->route('supervisor.beneficiaries.index')
            ->with('success', 'تم رفض المستفيد بنجاح');
    }
    public function waiting($id){
        $beneficiary = Beneficiary::FindOrFail($id);
        $beneficiary->update([
            'Status' => 'قيد المراجعة'
        ]);
        return redirect()->route('supervisor.beneficiaries.index')
            ->with('success', 'تم تعديل الحالة الى قيد المراجعة بنجاح');
    }
}
