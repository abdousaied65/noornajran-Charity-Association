<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\DisabilitiesExport;
use App\Models\Disability;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;

class DisabilityController extends Controller
{
    public function index(Request $request)
    {
        $data = Disability::all();
        return view('supervisor.disabilities.index', compact('data'));
    }

    public function create()
    {
        return view('supervisor.disabilities.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'disability' => 'required',
        ]);
        $input = $request->all();
        $disability = Disability::create($input);
        return redirect()->route('supervisor.disabilities.index')
            ->with('success', 'تم اضافة جنسية بنجاح');
    }

    public function edit($id)
    {
        $disability = Disability::findOrFail($id);
        return view('supervisor.disabilities.edit', compact('disability'));
    }

    public function show($id)
    {
        $disability = Disability::findorfail($id);
        return view('supervisor.disabilities.show', compact('disability'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'disability' => 'required',
        ]);
        $input = $request->all();
        $disability = Disability::findOrFail($id);
        $disability->update($input);
        return redirect()->route('supervisor.disabilities.index')
            ->with('success', 'تم تعديل بيانات الجنسية بنجاح');
    }

    public function destroy(Request $request)
    {
        Disability::findOrFail($request->disability_id)->delete();
        return redirect()->route('supervisor.disabilities.index')
            ->with('success', 'تم حذف الجنسية بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $disabilities_id = $request->disabilities;
        foreach ($disabilities_id as $disability_id) {
            $disability = Disability::FindOrFail($disability_id);
            $disability->delete();
        }
        return redirect()->route('supervisor.disabilities.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $disabilities = Disability::all();
        return view('supervisor.disabilities.print', compact('disabilities'));
    }

    public function export_disabilities_excel()
    {
        return Excel::download(new DisabilitiesExport(), 'انواع الاعاقات.xlsx');
    }
}
