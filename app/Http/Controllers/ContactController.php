<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Mail\contactEmail;
use App\Models\Contact;
use App\Models\MailList;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function store(Request $request)
    {
        $this->validate($request, [
            'subject' => 'required',
            'message' => 'required',
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'email'],
            'phone' => ['required', 'string', 'max:255','regex:/^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$/'],
        ]);
        $contact = Contact::create([
            'name' => $request->name,
            'phone' => $request->phone,
            'email' => $request->email,
            'subject' => $request->subject,
            'message' => $request->message,
            'status' => 0
        ]);
        $settings = Setting::First();
        $to_email = $settings->email;

        $from_email = $contact->email;
        $message = $contact->message;
        $subject = $contact->subject;
        $data = array(
            'to_email' => $to_email,
            'from_email' => $from_email,
            'message' => $message,
            'subject' => $subject,
        );
        Mail::to($to_email)->send(new contactEmail($data));
        return redirect()->route('contact')->with('success','تم ارسال رسالتك بنجاح');
    }
    public function subscribe(Request $request)
    {
        $data = $request->all();
        $this->validate($request, [
            'email' => 'required'
        ]);
        $check = MailList::where('email',$data['email'])->first();
        if (!empty($check)){
            return redirect()->route('index',['#footer'])->with('error-subscribe','تم الاشتراك من قبل');
        }
        else{
            MailList::create([
               'email' => $request->email
            ]);
        }
        return redirect()->route('index',['#footer'])->with('success-subscribe','تم الاشتراك بنجاح');
    }
}
