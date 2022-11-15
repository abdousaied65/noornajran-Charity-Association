<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\OrderTypesExport;
use App\Models\OrderType;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;

class OrderTypeController extends Controller
{
    public function index(Request $request)
    {
        $data = OrderType::all();
        return view('supervisor.order_types.index', compact('data'));
    }

    public function create()
    {
        return view('supervisor.order_types.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'order_type' => 'required',
        ]);
        $input = $request->all();
        $order_type = OrderType::create($input);
        return redirect()->route('supervisor.order_types.index')
            ->with('success', 'تم اضافة نوع طلب بنجاح');
    }

    public function edit($id)
    {
        $order_type = OrderType::findOrFail($id);
        return view('supervisor.order_types.edit', compact('order_type'));
    }

    public function show($id)
    {
        $order_type = OrderType::findorfail($id);
        return view('supervisor.order_types.show', compact('order_type'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'order_type' => 'required',
        ]);
        $input = $request->all();
        $order_type = OrderType::findOrFail($id);
        $order_type->update($input);
        return redirect()->route('supervisor.order_types.index')
            ->with('success', 'تم تعديل بيانات نوع الطلب بنجاح');
    }

    public function destroy(Request $request)
    {
        OrderType::findOrFail($request->order_type_id)->delete();
        return redirect()->route('supervisor.order_types.index')
            ->with('success', 'تم حذف نوع الطلب بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $order_types_id = $request->order_types;
        foreach ($order_types_id as $order_type_id) {
            $order_type = OrderType::FindOrFail($order_type_id);
            $order_type->delete();
        }
        return redirect()->route('supervisor.order_types.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $order_types = OrderType::all();
        return view('supervisor.order_types.print', compact('order_types'));
    }

    public function export_order_types_excel()
    {
        return Excel::download(new OrderTypesExport(), 'كل انواع الطلبات.xlsx');
    }
}
