<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\NationalitiesExport;
use App\Models\Nationality;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;

class NationalityController extends Controller
{
    public function index(Request $request)
    {
        $data = Nationality::all();
        return view('supervisor.nationalities.index', compact('data'));
    }

    public function create()
    {
        return view('supervisor.nationalities.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'nationality' => 'required',
        ]);
        $input = $request->all();
        $nationality = Nationality::create($input);
        return redirect()->route('supervisor.nationalities.index')
            ->with('success', 'تم اضافة جنسية بنجاح');
    }

    public function edit($id)
    {
        $nationality = Nationality::findOrFail($id);
        return view('supervisor.nationalities.edit', compact('nationality'));
    }

    public function show($id)
    {
        $nationality = Nationality::findorfail($id);
        return view('supervisor.nationalities.show', compact('nationality'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'nationality' => 'required',
        ]);
        $input = $request->all();
        $nationality = Nationality::findOrFail($id);
        $nationality->update($input);
        return redirect()->route('supervisor.nationalities.index')
            ->with('success', 'تم تعديل بيانات الجنسية بنجاح');
    }

    public function destroy(Request $request)
    {
        Nationality::findOrFail($request->nationality_id)->delete();
        return redirect()->route('supervisor.nationalities.index')
            ->with('success', 'تم حذف الجنسية بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $nationalities_id = $request->nationalities;
        foreach ($nationalities_id as $nationality_id) {
            $nationality = Nationality::FindOrFail($nationality_id);
            $nationality->delete();
        }
        return redirect()->route('supervisor.nationalities.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $nationalities = Nationality::all();
        return view('supervisor.nationalities.print', compact('nationalities'));
    }

    public function export_nationalities_excel()
    {
        return Excel::download(new NationalitiesExport(), 'كل الجنسيات.xlsx');
    }
}
