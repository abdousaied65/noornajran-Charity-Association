<?php

namespace App\Http\Controllers\Supervisor;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use Illuminate\Http\Request;

class SliderController extends Controller
{
    public function index(Request $request)
    {
        $data = Slider::all();
        return view('supervisor.slider.index', compact('data'));
    }

    public function create()
    {
        return view('supervisor.slider.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
            'text' => 'required',
            'image_path' => 'required',
        ]);
        $input = $request->all();
        $slider = Slider::create($input);
        if ($request->hasFile('image_path')) {
            $image_path = $request->file('image_path');
            $fileName = $image_path->getClientOriginalName();
            $uploadDir = 'uploads/slider/' . $slider->id;
            $image_path->move($uploadDir, $fileName);
            $slider->image_path = $uploadDir . '/' . $fileName;
            $slider->save();
        }
        return redirect()->route('supervisor.slider.index')
            ->with('success', 'تم اضافة صورة بنجاح');
    }

    public function edit($id)
    {
        $slider = Slider::FindOrFail($id);
        return view('supervisor.slider.edit', compact('slider'));
    }

    public function show($id)
    {
        $slider = Slider::FindOrFail($id);
        return view('supervisor.slider.show', compact('slider'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required',
            'text' => 'required',
        ]);
        $input = $request->all();
        $slider = Slider::findOrFail($id);
        $slider->update($input);
        if ($request->hasFile('image_path')) {
            $image_path = $request->file('image_path');
            $fileName = $image_path->getClientOriginalName();
            $uploadDir = 'uploads/slider/' . $slider->id;
            $image_path->move($uploadDir, $fileName);
            $slider->image_path = $uploadDir . '/' . $fileName;
            $slider->save();
        }
        return redirect()->route('supervisor.slider.index')
            ->with('success', 'تم تعديل الصورة بنجاح');
    }

    public function destroy(Request $request)
    {
        Slider::findOrFail($request->slider_id)->delete();
        return redirect()->route('supervisor.slider.index')
            ->with('success', 'تم حذف الصورة بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $sliders_id = $request->sliders;
        foreach ($sliders_id as $slider_id) {
            $slider = Slider::FindOrFail($slider_id);
            $slider->delete();
        }
        return redirect()->route('supervisor.slider.index')
            ->with('success', 'تم الحذف بنجاح');
    }
}
