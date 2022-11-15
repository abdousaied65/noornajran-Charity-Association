<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\MailListsExport;
use App\Mail\sendingEmail;
use App\Models\MailList;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;

class MailListController extends Controller
{
    public function index(Request $request)
    {
        $data = MailList::all();
        return view('supervisor.maillists.index', compact('data'));
    }

    public function create()
    {
        return view('supervisor.maillists.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'email' => 'required',
        ]);
        $input = $request->all();
        $maillist = MailList::create($input);
        return redirect()->route('supervisor.maillists.index')
            ->with('success', 'تم اضافة بريد الكترونى بنجاح');
    }

    public function edit($id)
    {
        $maillist = MailList::findOrFail($id);
        return view('supervisor.maillists.edit', compact('maillist'));
    }

    public function show($id)
    {
        $maillist = MailList::findorfail($id);
        return view('supervisor.maillists.show', compact('maillist'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'email' => 'required',
        ]);
        $input = $request->all();
        $maillist = MailList::findOrFail($id);
        $maillist->update($input);
        return redirect()->route('supervisor.maillists.index')
            ->with('success', 'تم تعديل بيانات البريد الالكترونى بنجاح');
    }

    public function destroy(Request $request)
    {
        MailList::findOrFail($request->maillist_id)->delete();
        return redirect()->route('supervisor.maillists.index')
            ->with('success', 'تم حذف البريد الالكترونى بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $maillists_id = $request->maillists;
        foreach ($maillists_id as $maillist_id) {
            $maillist = MailList::FindOrFail($maillist_id);
            $maillist->delete();
        }
        return redirect()->route('supervisor.maillists.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $maillists = MailList::all();
        return view('supervisor.maillists.print', compact('maillists'));
    }

    public function export_maillists_excel()
    {
        return Excel::download(new MailListsExport(), 'القائمة البريدية.xlsx');
    }

    public function maillist_mail(){
        $maillists = MailList::all();
        return view('supervisor.maillists.mail',compact('maillists'));
    }

    public function maillist_send(Request $request){
        $emails = $request->emails;
        $message = nl2br($request->message);
        $subject = $request->subject;
        $data = array(
            'emails' => $emails,
            'message' => $message,
            'subject' => $subject,
        );
        foreach ($emails as $email){
            $maillist = MailList::FindOrFail($email);
            $email = $maillist->email;
            Mail::to($email)->send(new sendingEmail($data));
        }

        return redirect()->route('maillists.mail')
            ->with('success', 'تم ارسال الرسالة بنجاح');
    }
}
