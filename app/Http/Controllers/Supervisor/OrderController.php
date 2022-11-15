<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\OrdersExport;
use App\Exports\OrdersExportByDisability;
use App\Exports\OrdersExportByNationality;
use App\Exports\OrdersExportByOrderType;
use App\Exports\OrdersExportByStatus;
use App\Models\Order;
use App\Http\Controllers\Controller;
use App\Models\Disability;
use App\Models\Nationality;
use App\Models\OrderType;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index(Request $request)
    {
        $data = Order::all();
        $disabilities = Disability::all();
        $nationalities = Nationality::all();
        $order_types = OrderType::all();
        return view('supervisor.orders.index', compact('data','order_types', 'nationalities','disabilities'));
    }

    public function create()
    {
        $disabilities = Disability::all();
        $nationalities = Nationality::all();
        $order_types = OrderType::all();
        return view('supervisor.orders.create', compact('disabilities','order_types','nationalities'));

    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'first_name' => 'required',
            'second_name' => 'required',
            'third_name' => 'required',
            'fourth_name' => 'required',
            'email' => 'required|email',
            'order_type_id' => 'required',
            'quantity' => 'required',
            'phone_number' => 'required',
            'disability_id' => 'required',
            'nationality_id' => 'required',
            'Status' => 'required',
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
        return redirect()->route('supervisor.orders.index')
            ->with('success', 'تم اضافة طلب بنجاح');
    }

    public function show($id)
    {
        $order = Order::findorfail($id);
        return view('supervisor.orders.show', compact('order'));
    }


    public function edit($id)
    {
        $order = Order::findOrFail($id);
        $nationalities = Nationality::all();
        $disabilities = Disability::all();
        $order_types = OrderType::all();
        return view('supervisor.orders.edit', compact('order','order_types', 'nationalities', 'disabilities'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'first_name' => 'required',
            'second_name' => 'required',
            'third_name' => 'required',
            'fourth_name' => 'required',
            'email' => 'required|email',
            'order_type_id' => 'required',
            'quantity' => 'required',
            'phone_number' => 'required',
            'disability_id' => 'required',
            'nationality_id' => 'required',
            'Status' => 'required',
        ]);
        $input = $request->all();
        $order = Order::findOrFail($id);
        $order->update($input);
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
        return redirect()->route('supervisor.orders.index')
            ->with('success', 'تم تعديل بيانات الطلب بنجاح');
    }

    public function destroy(Request $request)
    {
        Order::findOrFail($request->order_id)->delete();
        return redirect()->route('supervisor.orders.index')
            ->with('success', 'تم حذف الطلب بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $orders_id = $request->orders;
        foreach ($orders_id as $order_id) {
            $order = Order::FindOrFail($order_id);
            $order->delete();
        }
        return redirect()->route('supervisor.orders.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $orders = Order::all();
        return view('supervisor.orders.print', compact('orders'));
    }

    public function export_orders_excel()
    {
        return Excel::download(new OrdersExport(), 'كل الطلبات.xlsx');
    }

    public function export_orders_by_nationality_excel(Request $request)
    {
        $nationalities = $request->nationalities;
        $orders = Order::whereIn('nationality_id',$nationalities)
            ->get();
        if($orders->isEmpty()){
            return redirect()->route('supervisor.orders.index')->with('error','لا يوجد طلبات تخص هذه الجنسية ');
        }
        else{
            return Excel::download(new OrdersExportByNationality($nationalities), 'طلبات حسب الجنسية.xlsx');
        }
    }
    public function export_orders_by_disability_excel(Request $request)
    {
        $disabilities = $request->disabilities;
        $orders = Order::whereIn('disability_id',$disabilities)
            ->get();
        if($orders->isEmpty()){
            return redirect()->route('supervisor.orders.index')->with('error','لا يوجد طلبات تخص نوع الاعاقة هذه ');
        }
        else{
            return Excel::download(new OrdersExportByDisability($disabilities), 'طلبات حسب نوع الاعاقة.xlsx');
        }
    }
    public function export_orders_by_order_type_excel(Request $request)
    {
        $order_types = $request->order_types;
        $orders = Order::whereIn('order_type_id',$order_types)
            ->get();
        if($orders->isEmpty()){
            return redirect()->route('supervisor.orders.index')->with('error','لا يوجد طلبات تخص نوع الطلب هذا ');
        }
        else{
            return Excel::download(new OrdersExportByOrderType($order_types), 'طلبات حسب نوع الطلب.xlsx');
        }
    }

    public function export_orders_by_status_excel(Request $request)
    {
        $statuses = $request->statuses;
        $orders = Order::whereIn('Status',$statuses)
            ->get();
        if($orders->isEmpty()){
            return redirect()->route('supervisor.orders.index')->with('error','لا يوجد طلبات تخص هذه الحالات ');
        }
        else{
            return Excel::download(new OrdersExportByStatus($statuses), 'طلبات حسب الحالة.xlsx');
        }
    }




    public function allow($id){
        $order = Order::FindOrFail($id);
        $order->update([
            'Status' => 'تمت الموافقة'
        ]);
        return redirect()->route('supervisor.orders.index')
            ->with('success', 'تم الموافقة على الطلب بنجاح');
    }
    public function deny($id){
        $order = Order::FindOrFail($id);
        $order->update([
            'Status' => 'مرفوض'
        ]);
        return redirect()->route('supervisor.orders.index')
            ->with('success', 'تم رفض الطلب بنجاح');
    }
    public function waiting($id){
        $order = Order::FindOrFail($id);
        $order->update([
            'Status' => 'قيد المراجعة'
        ]);
        return redirect()->route('supervisor.orders.index')
            ->with('success', 'تم تعديل الحالة الى قيد المراجعة بنجاح');
    }

}
