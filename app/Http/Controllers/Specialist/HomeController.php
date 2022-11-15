<?php

namespace App\Http\Controllers\Specialist;

use App\Http\Controllers\Controller;
use App\Models\Specialist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:specialist-web');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable|\Illuminate\Http\RedirectResponse
     */
    public function index()
    {
        $auth_id = Auth::user()->id;
        $user = Specialist::findOrFail($auth_id);
        return view('specialist.home', compact('user'));
    }
    public function edit_profile($id)
    {
        $user = Specialist::findOrFail($id);
        return view('specialist.profiles.edit', compact('user'));
    }

    public function update_profile(Request $request, $id)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'same:confirm-password'
        ]);
        $input = $request->all();
        if (!empty($input['password'])) {
            $input['password'] = Hash::make($input['password']);
        } else {
            $input = array_except($input, array('password'));
        }
        $user = Specialist::findOrFail($id);
        $user->update($input);
        return redirect()->back()->with('success', 'تم تحديث البيانات الشخصية بنجاح ');
    }

}
