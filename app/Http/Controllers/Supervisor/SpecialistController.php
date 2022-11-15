<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\SpecialistsExport;
use App\Models\Specialist;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class SpecialistController extends Controller
{
    public function index(Request $request)
    {
        $data = Specialist::all();
        return view('supervisor.specialists.index', compact('data'));
    }

    public function create()
    {
        return view('supervisor.specialists.create');
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
            'role_name' => 'required'
        ]);
        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $specialist = Specialist::create($input);
        return redirect()->route('supervisor.specialists.index')
            ->with('success', 'تم اضافة اخصائى بنجاح');
    }

    public function show($id)
    {
        $specialist = Specialist::findorfail($id);
        return view('supervisor.specialists.show', compact('specialist'));
    }


    public function edit($id)
    {
        $specialist = Specialist::findOrFail($id);
        return view('supervisor.specialists.edit', compact('specialist'));
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
            'role_name' => 'required'
        ]);
        $input = $request->all();
        if (!empty($input['password'])) {
            $input['password'] = Hash::make($input['password']);
        } else {
            $input = array_except($input, array('password'));
        }
        $specialist = Specialist::findOrFail($id);
        $specialist->update($input);
        return redirect()->route('supervisor.specialists.index')
            ->with('success', 'تم تعديل بيانات الاخصائى بنجاح');
    }

    public function destroy(Request $request)
    {
        Specialist::findOrFail($request->specialist_id)->delete();
        return redirect()->route('supervisor.specialists.index')
            ->with('success', 'تم حذف الاخصائى بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $specialists_id = $request->specialists;
        foreach ($specialists_id as $specialist_id) {
            $specialist = Specialist::FindOrFail($specialist_id);
            $specialist->delete();
        }
        return redirect()->route('supervisor.specialists.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $specialists = Specialist::all();
        return view('supervisor.specialists.print', compact('specialists'));
    }

    public function export_specialists_excel()
    {
        return Excel::download(new SpecialistsExport(), 'كل الاخصائيين.xlsx');
    }
}
