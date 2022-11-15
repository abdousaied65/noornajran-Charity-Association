<?php

namespace App\Http\Controllers\Beneficiary\Auth;

use App\Http\Controllers\Controller;
use App\Mail\sendingEmail;
use App\Mail\SystemEmail;
use App\Models\Beneficiary;
use App\Models\Disability;
use App\Models\Nationality;
use App\Models\Setting;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Malath_SMS;

class RegisterController extends Controller
{
    use RegistersUsers;

    protected $redirectTo = RouteServiceProvider::BENEFICIARY_HOME;

    public function __construct()
    {
        $this->middleware('guest:beneficiary-web');
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'first_name' => ['required', 'string', 'max:255'],
            'second_name' => ['required', 'string', 'max:255'],
            'third_name' => ['required', 'string', 'max:255'],
            'fourth_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'confirmed', 'unique:beneficiaries'],
            'phone_number' => ['required', 'string', 'max:255', 'unique:beneficiaries', 'regex:/^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$/'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'record' => ['required', 'min:10'],
        ]);
    }

    public function register(Request $request)
    {
        $this->validator($request->all())->validate();

        event(new Registered($user = $this->create($request->all())));

        if ($response = $this->registered($request, $user)) {
            return $response;
        }
        // sending email
        $email = $request->email;
        $subject = "تسجيل حساب مستفيد جديد";
        $message = '
        مرحبا/ (' . $request->first_name . ')
تم تسجيل حسابكم في جمعية نور نجران بنجاح.
سيتم تفعيل حسابكم قريبآ من قبل الإدارة.
ستصلكم رسالة على البريد والجوال في حال التفعيل.
        ';
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


        return redirect()->route('beneficiary.register')
            ->with('success', '
            تم انشاء حسابك بنجاح وهو الان قيد المراجعة من قبل الادارة
            ..
            سيتم التواصل معك بمجرد تفعيل الحساب
            ');
    }

    protected function create($data)
    {
        $data['password'] = Hash::make($data['password']);
        $beneficiary = Beneficiary::create($data);
        if (request()->hasFile('id_pic')) {
            $image = request()->file('id_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/id_pics/' . $beneficiary->id;
            $image->move($uploadDir, $fileName);
            $beneficiary->id_pic = $uploadDir . '/' . $fileName;
            $beneficiary->save();
        }
        if (request()->hasFile('medical_report_pic')) {
            $image = request()->file('medical_report_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/medical_report_pics/' . $beneficiary->id;
            $image->move($uploadDir, $fileName);
            $beneficiary->medical_report_pic = $uploadDir . '/' . $fileName;
            $beneficiary->save();
        }
        return $beneficiary;
    }

    public function showRegistrationForm()
    {
        $disabilities = Disability::all();
        $nationalities = Nationality::all();
        return view('beneficiary.auth.register', compact('nationalities', 'disabilities'));
    }

    protected function guard()
    {
        return Auth::guard('beneficiary-web');
    }
}
