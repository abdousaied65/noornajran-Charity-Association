<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Mail\sendingEmail;
use App\Mail\SystemEmail;
use App\Models\Field;
use App\Models\Job;
use App\Models\Qualification;
use App\Models\Setting;
use App\Models\Submit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Malath_SMS;

class JobController extends Controller
{
    public function index()
    {
        return view('site.jobs.index');
    }

    public function search(Request $request)
    {
        $identify = $request->identify;
        $jobs = Job::where('email', $identify)
            ->orWhere('phone_number', $identify)
            ->get();
        $submits = Submit::where('email', $identify)
            ->orWhere('phone_number', $identify)
            ->get();
        if ($jobs->isEmpty() && $submits->isEmpty()) {
            return redirect()->route('jobs.index')->withInput()->with('error', 'لا يوجد طلبات وظائف مطابقة');
        } else {
            return view('site.jobs.index', compact('jobs', 'submits'));
        }
    }

    public function create()
    {
        $fields = Field::all();
        $qualifications = Qualification::all();
        return view('site.jobs.create', compact('fields', 'qualifications'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'first_name' => ['required', 'string', 'max:255'],
            'second_name' => ['required', 'string', 'max:255'],
            'third_name' => ['required', 'string', 'max:255'],
            'fourth_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email'],
            'phone_number' => ['required', 'string', 'max:255', 'regex:/^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$/'],
            'record' => ['required', 'min:10'],
            'field_id' => 'required',
            'qualification_id' => 'required',
            'cv' => 'required',
        ]);
        $input = $request->all();
        $job = Job::create($input);
        if ($request->hasFile('cv')) {
            $cv = $request->file('cv');
            $fileName = $cv->getClientOriginalName();
            $uploadDir = 'uploads/cvs/' . $job->id;
            $cv->move($uploadDir, $fileName);
            $job->cv = $uploadDir . '/' . $fileName;
            $job->save();
        }
        // sending email
        $email = $request->email;
        $subject = "تسجيل طلب توظيف";
        $message = "
        مرحبا/ (" . $request->first_name . ")
تم تسجيل طلب التوظيف في جمعية نور نجران بنجاح.
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
        $Mobiles = $request->phone_number;
        // Code to Send SMS
        $Send = $DTT_SMS->Send_SMS($Mobiles, $Originator, $SmS_Msg, $CheckUser);

        return redirect()->route('jobs.index')
            ->with('success', 'تم ارسال طلب وظيفة بنجاح');
    }
}
