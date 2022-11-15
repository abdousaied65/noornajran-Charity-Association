<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\FieldsExport;
use App\Models\Field;
use App\Http\Controllers\Controller;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;

class FieldController extends Controller
{
    public function index(Request $request)
    {
        $data = Field::all();
        return view('supervisor.fields.index', compact('data'));
    }

    public function create()
    {
        return view('supervisor.fields.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'field' => 'required',
        ]);
        $input = $request->all();
        $field = Field::create($input);
        return redirect()->route('supervisor.fields.index')
            ->with('success', 'تم اضافة مجال بنجاح');
    }

    public function edit($id)
    {
        $field = Field::findOrFail($id);
        return view('supervisor.fields.edit', compact('field'));
    }

    public function show($id)
    {
        $field = Field::findorfail($id);
        return view('supervisor.fields.show', compact('field'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'field' => 'required',
        ]);
        $input = $request->all();
        $field = Field::findOrFail($id);
        $field->update($input);
        return redirect()->route('supervisor.fields.index')
            ->with('success', 'تم تعديل بيانات المجال بنجاح');
    }

    public function destroy(Request $request)
    {
        Field::findOrFail($request->field_id)->delete();
        return redirect()->route('supervisor.fields.index')
            ->with('success', 'تم حذف المجال بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $fields_id = $request->fields;
        foreach ($fields_id as $field_id) {
            $field = Field::FindOrFail($field_id);
            $field->delete();
        }
        return redirect()->route('supervisor.fields.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $fields = Field::all();
        return view('supervisor.fields.print', compact('fields'));
    }

    public function export_fields_excel()
    {
        return Excel::download(new FieldsExport(), 'مجالات التطوع.xlsx');
    }
}
