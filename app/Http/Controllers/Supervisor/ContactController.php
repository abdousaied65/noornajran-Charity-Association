<?php

namespace App\Http\Controllers\Supervisor;

use App\Http\Controllers\Controller;
use App\Mail\replyEmail;
use App\Models\Contact;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;

Carbon::setLocale('ar');
class ContactController extends Controller
{
    public function index(Request $request)
    {
        return view('supervisor.contacts.index', [
            'data' => Contact::query()
                ->when($request->query('search'), function ($query) use ($request) {
                    $query->where('name', 'like', '%' . $request->query('search') . '%');
                })
                ->latest()
                ->paginate(10)
        ]);
    }

    public function show($id)
    {
        $message = Contact::findorfail($id);
        return view('supervisor.contacts.show', compact('message'));
    }

    public function makeAsRead(Request $request)
    {
        $messages = $request->messages;
        if (!empty($messages)){
            foreach ($messages as $msg_id) {
                $message = Contact::findOrFail($msg_id);
                $message::where('status', '!=', '2')->where('id', '=', $msg_id)->update([
                    'status' => '1'
                ]);
            }
        }
        return redirect()->back();
    }

    public function makeAsImportant(Request $request)
    {
        $messages = $request->messages;
        if (!empty($messages)){
            foreach ($messages as $msg_id) {
                $message = Contact::findOrFail($msg_id);
                $message->update([
                    'status' => '2'
                ]);
            }
        }
        return redirect()->back();
    }

    public function makeAsDestroy(Request $request)
    {
        $messages = $request->messages;
        if (!empty($messages)){
            foreach ($messages as $msg_id) {
                $message = Contact::findOrFail($msg_id);
                $message->delete();
            }
        }
        return redirect()->route('supervisor.contacts.index');
    }

    public function print(Request $request)
    {
        $msg_id = $request->messages;
        $message = Contact::findOrFail($msg_id)->first();
        return view('supervisor.contacts.print', compact('message'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        Contact::findOrFail($request->id)->delete();
        return redirect()->route('supervisor.contacts.index')->with('success', trans('msgs.Contact Deleted Successfully'));
    }
    public function showImportant()
    {
        $data = Contact::query()
            ->where('status', '=', '2')
            ->latest()
            ->paginate(10);
        return view('supervisor.contacts.important', compact('data'));
    }
    public function reply(Request $request){
        $contact_id = $request->contact_id;
        $contact = Contact::FindOrFail($contact_id);
        $to_email = $contact->email;
        $message = nl2br($request->message);
        $subject = $request->subject;
        $data = array(
            'message' => $message,
            'subject' => $subject,
        );
        Mail::to($to_email)->send(new replyEmail($data));
        return redirect()->route('supervisor.contacts.show',$contact->id)
            ->with('success', 'تم ارسال الرد على الرسالة بنجاح');
    }

}
