<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Mail\sendingOrderEmail;
use App\Mail\SystemEmail;
use App\Models\Disability;
use App\Models\Nationality;
use App\Models\Order;
use App\Models\OrderType;
use App\Models\Setting;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Malath_SMS;

class OrderController extends Controller
{
    public function index()
    {
        return view('site.orders.index');
    }

    public function search(Request $request)
    {
        $identify = $request->identify;
        $orders = Order::where('email', $identify)
            ->orWhere('phone_number', $identify)
            ->get();
        if ($orders->isEmpty()) {
            return redirect()->route('orders.index')->withInput()->with('error', 'لا يوجد طلبات مطابقة');
        } else {
            return view('site.orders.index', compact('orders'));
        }
    }

    public function create()
    {
        $disabilities = Disability::all();
        $nationalities = Nationality::all();
        $order_types = OrderType::all();
        return view('site.orders.create', compact('nationalities', 'disabilities', 'order_types'));
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
            'order_type_id' => 'required',
            'quantity' => 'required',
            'disability_id' => 'required',
            'nationality_id' => 'required',
            'medical_report_pic' => 'required',
            'id_pic' => 'required',
        ]);
        $input = $request->all();
        $order = Order::create($input);
        if ($request->hasFile('id_pic')) {
            $image = $request->file('id_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/orders/id_pics/' . $order->id;
            $image->move($uploadDir, $fileName);
            $order->id_pic = $uploadDir . '/' . $fileName;
            $order->save();
        }
        if ($request->hasFile('medical_report_pic')) {
            $image = $request->file('medical_report_pic');
            $fileName = $image->getClientOriginalName();
            $uploadDir = 'uploads/orders/medical_report_pics/' . $order->id;
            $image->move($uploadDir, $fileName);
            $order->medical_report_pic = $uploadDir . '/' . $fileName;
            $order->save();
        }
        $order_type = OrderType::FindOrFail($request->order_type_id);
        // sending email
        $email = $request->email;
        $subject = "تقديم طلب";
        $message = "
        مرحبا/ (" . $request->first_name . ")
        تم تسجيل طلب ( " . $order_type->order_type . " ) للمستفيد ( " . $request->first_name . " )
        بالكمية ( " . $request->quantity . " ) بنجاح. رقم الطلب ( " . $order->id . " )
        سيتم الرد على طلبك من قبل الإدارة في أسرع وقت.
        يمكنك استعراض الطلب بالضغط";
        $data = array(
            'message' => $message,
            'subject' => $subject,
            'from_email' => $email
        );
        Mail::to($email)->send(new sendingOrderEmail($data));
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

        return redirect()->route('orders.index')
            ->with('success', 'تم تقديم طلبك بنجاح');
    }
}
