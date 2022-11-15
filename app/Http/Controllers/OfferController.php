<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Mail\sendingEmail;
use App\Mail\SystemEmail;
use App\Models\Offer;
use App\Models\Qualification;
use App\Models\Setting;
use App\Models\Submit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Malath_SMS;

class OfferController extends Controller
{
    public function show_offers()
    {
        $offers = Offer::where('status','مفعل')->orderBy('created_at','DESC')->get();
        return view('site.offers.show_offers',compact('offers'));
    }
    public function submit_offer($id){
        $offer = Offer::FindOrFail($id);
        $qualifications = Qualification::all();
        return view('site.offers.apply',compact('offer','qualifications'));
    }
    public function submit(Request $request)
    {
        $this->validate($request, [
            'first_name' => ['required', 'string', 'max:255'],
            'second_name' => ['required', 'string', 'max:255'],
            'third_name' => ['required', 'string', 'max:255'],
            'fourth_name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email'],
            'phone_number' => ['required', 'string', 'max:255', 'regex:/^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$/'],
            'record' => ['required', 'min:10'],
            'offer_id' => 'required',
            'qualification_id' => 'required',
            'cv' => 'required',
        ]);
        $input = $request->all();
        $submit = Submit::create($input);
        if ($request->hasFile('cv')) {
            $cv = $request->file('cv');
            $fileName = $cv->getClientOriginalName();
            $uploadDir = 'uploads/submits/cvs/' . $submit->id;
            $cv->move($uploadDir, $fileName);
            $submit->cv = $uploadDir . '/' . $fileName;
            $submit->save();
        }
        $offer = Offer::FindOrFail($request->offer_id);
        // sending email
        $email = $request->email;
        $subject = "تقديم على وظيفة";
        $message = "
        مرحبا/ (" . $request->first_name . ")
        تم التقديم على وظيفة ( ".$offer->title." ) في جمعية نور نجران بنجاح.
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
        return redirect()->route('submit.offer',$offer->id)
            ->with('success', 'تم ارسال طلب  على وظيفة مطروحة بنجاح');
    }
}
