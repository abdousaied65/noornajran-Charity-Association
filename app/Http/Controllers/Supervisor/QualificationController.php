<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\QualificationsExport;
use App\Models\Qualification;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;

class QualificationController extends Controller
{
    public function index(Request $request)
    {
        $data = Qualification::all();
        return view('supervisor.qualifications.index', compact('data'));
    }

    public function create()
    {
        return view('supervisor.qualifications.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'qualification' => 'required',
        ]);
        $input = $request->all();
        $qualification = Qualification::create($input);
        return redirect()->route('supervisor.qualifications.index')
            ->with('success', 'تم اضافة مؤهل بنجاح');
    }

    public function edit($id)
    {
        $qualification = Qualification::findOrFail($id);
        return view('supervisor.qualifications.edit', compact('qualification'));
    }

    public function show($id)
    {
        $qualification = Qualification::findorfail($id);
        return view('supervisor.qualifications.show', compact('qualification'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'qualification' => 'required',
        ]);
        $input = $request->all();
        $qualification = Qualification::findOrFail($id);
        $qualification->update($input);
        return redirect()->route('supervisor.qualifications.index')
            ->with('success', 'تم تعديل بيانات المؤهل بنجاح');
    }

    public function destroy(Request $request)
    {
        Qualification::findOrFail($request->qualification_id)->delete();
        return redirect()->route('supervisor.qualifications.index')
            ->with('success', 'تم حذف المؤهل بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $qualifications_id = $request->qualifications;
        foreach ($qualifications_id as $qualification_id) {
            $qualification = Qualification::FindOrFail($qualification_id);
            $qualification->delete();
        }
        return redirect()->route('supervisor.qualifications.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $qualifications = Qualification::all();
        return view('supervisor.qualifications.print', compact('qualifications'));
    }

    public function export_qualifications_excel()
    {
        return Excel::download(new QualificationsExport(), 'كل المؤهلات.xlsx');
    }
}
