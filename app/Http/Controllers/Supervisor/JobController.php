<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\JobsExport;
use App\Exports\JobsExportByField;
use App\Exports\JobsExportByQualification;
use App\Models\Field;
use App\Models\Job;
use App\Http\Controllers\Controller;
use App\Models\Qualification;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;

class JobController extends Controller
{
    public function index(Request $request)
    {
        $data = Job::all();
        $fields = Field::all();
        $qualifications = Qualification::all();
        return view('supervisor.jobs.index', compact('data','qualifications','fields'));
    }

    public function create()
    {
        $fields = Field::all();
        $qualifications = Qualification::all();
        return view('supervisor.jobs.create',compact('fields','qualifications'));
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'field_id' => 'required',
            'qualification_id' => 'required',
            'first_name' => 'required',
            'second_name' => 'required',
            'third_name' => 'required',
            'fourth_name' => 'required',
            'email' => 'required',
            'record' => 'required',
            'phone_number' => 'required',
            'cv' => 'required',
        ]);
        $input = $request->all();
        $job = Job::create($input);
        if ($request->hasFile('cv')) {
            $cv = $request->file('cv');
            $fileName = $cv->getClientOriginalName();
            $uploadDir = 'uploads/cvs/' . $job->id;
            $cv->move($uploadDir, $fileName);
            $job->cv = $uploadDir . '/' . $fileName;
            $job->save();
        }
        return redirect()->route('supervisor.jobs.index')
            ->with('success', 'تم اضافة وظيفة بنجاح');
    }

    public function edit($id)
    {
        $job = Job::findOrFail($id);
        $fields = Field::all();
        $qualifications = Qualification::all();
        return view('supervisor.jobs.edit', compact('job','fields','qualifications'));
    }

    public function show($id)
    {
        $job = Job::findorfail($id);
        return view('supervisor.jobs.show', compact('job'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'field_id' => 'required',
            'qualification_id' => 'required',
            'first_name' => 'required',
            'second_name' => 'required',
            'third_name' => 'required',
            'fourth_name' => 'required',
            'email' => 'required',
            'record' => 'required',
            'phone_number' => 'required',
        ]);
        $input = $request->all();
        $job = Job::findOrFail($id);
        $job->update($input);
        if ($request->hasFile('cv')) {
            $cv = $request->file('cv');
            $fileName = $cv->getClientOriginalName();
            $uploadDir = 'uploads/cvs/' . $job->id;
            $cv->move($uploadDir, $fileName);
            $job->cv = $uploadDir . '/' . $fileName;
            $job->save();
        }
        return redirect()->route('supervisor.jobs.index')
            ->with('success', 'تم تعديل بيانات الوظيفة بنجاح');
    }

    public function destroy(Request $request)
    {
        Job::findOrFail($request->job_id)->delete();
        return redirect()->route('supervisor.jobs.index')
            ->with('success', 'تم حذف الوظيفة بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $jobs_id = $request->jobs;
        foreach ($jobs_id as $job_id) {
            $job = Job::FindOrFail($job_id);
            $job->delete();
        }
        return redirect()->route('supervisor.jobs.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $jobs = Job::all();
        return view('supervisor.jobs.print', compact('jobs'));
    }

    public function export_jobs_excel()
    {
        return Excel::download(new JobsExport(), 'كل الوظائف.xlsx');
    }
    public function export_jobs_by_field_excel(Request $request)
    {
        $fields = $request->fields;
        $jobs = Job::whereIn('field_id',$fields)
            ->get();
        if($jobs->isEmpty()){
            return redirect()->route('supervisor.jobs.index')->with('error','لا يوجد وظائف تخص هذا المجال ');
        }
        else{
            return Excel::download(new JobsExportByField($fields), 'وظائف حسب المجال التطوعى.xlsx');
        }
    }
    public function export_jobs_by_qualification_excel(Request $request)
    {
        $qualifications = $request->qualifications;
        $jobs = Job::whereIn('qualification_id',$qualifications)
            ->get();
        if($jobs->isEmpty()){
            return redirect()->route('supervisor.jobs.index')->with('error','لا يوجد وظائف تخص هذا المؤهل ');
        }
        else{
            return Excel::download(new JobsExportByQualification($qualifications), 'وظائف حسب المؤهل.xlsx');
        }
    }
}
