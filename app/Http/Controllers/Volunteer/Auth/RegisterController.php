<?php

namespace App\Http\Controllers\Volunteer\Auth;

use App\Http\Controllers\Controller;
use App\Mail\sendingEmail;
use App\Mail\SystemEmail;
use App\Models\ExperienceCertificatePrintsNumber;
use App\Models\Field;
use App\Models\MailList;
use App\Models\Setting;
use App\Models\Volunteer;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Malath_SMS;

class RegisterController extends Controller
{
    use RegistersUsers;

    protected $redirectTo = RouteServiceProvider::VOLUNTEER_HOME;

    public function __construct()
    {
        $this->middleware('guest:volunteer-web');
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'first_name' => ['required', 'string', 'max:255'],
            'second_name' => ['required', 'string', 'max:255'],
            'third_name' => ['required', 'string', 'max:255'],
            'fourth_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email', 'unique:volunteers'],
            'phone_number' => ['required', 'string', 'max:255', 'unique:volunteers', 'regex:/^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$/'],
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
        $subject = "تسجيل حساب متطوع جديد";
        $message = "
        مرحبا/ (" . $request->first_name . ")
تم تسجيل حسابكم في جمعية نور نجران بنجاح.
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
        $Mobiles = $request->phone_number;
        // Code to Send SMS
        $Send = $DTT_SMS->Send_SMS($Mobiles, $Originator, $SmS_Msg, $CheckUser);

        return redirect()->route('volunteer.register')
            ->with('success', '
            تم انشاء حسابك بنجاح وهو الان قيد المراجعة من قبل الادارة
            ..
            سيتم التواصل معك بمجرد تفعيل الحساب
            ');
    }

    protected function create($data)
    {
        $data['password'] = Hash::make($data['password']);
        $volunteer = Volunteer::create($data);
        if (request()->hasFile('transfer_pic')) {
            $image = request()->file('transfer_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/volunteers/transfer_pics/' . $volunteer->id;
            $image->move($uploadDir, $fileName);
            $volunteer->transfer_pic = $uploadDir . '/' . $fileName;
            $volunteer->save();
        }
        if (request()->hasFile('cv')) {
            $image = request()->file('cv');
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
        return $volunteer;
    }

    public function showRegistrationForm()
    {
        $fields = Field::all();
        return view('volunteer.auth.register', compact('fields'));
    }

    protected function guard()
    {
        return Auth::guard('volunteer-web');
    }
}
