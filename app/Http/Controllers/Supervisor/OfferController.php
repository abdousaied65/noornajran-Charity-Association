<?php

namespace App\Http\Controllers\Supervisor;

use App\Exports\OffersExport;
use App\Exports\SubmitsExportByOffer;
use App\Models\Offer;
use App\Http\Controllers\Controller;
use App\Models\Submit;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;

class OfferController extends Controller
{
    public function index(Request $request)
    {
        $data = Offer::all();
        return view('supervisor.offers.index', compact('data'));
    }

    public function create()
    {
        return view('supervisor.offers.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
            'status' => 'required',
            'description' => 'required',
            'brochure' => 'required',
        ]);
        $input = $request->all();
        $offer = Offer::create($input);
        if ($request->hasFile('brochure')) {
            $brochure = $request->file('brochure');
            $fileName = $brochure->getClientOriginalName();
            $uploadDir = 'uploads/brochures/' . $offer->id;
            $brochure->move($uploadDir, $fileName);
            $offer->brochure = $uploadDir . '/' . $fileName;
            $offer->save();
        }
        return redirect()->route('supervisor.offers.index')
            ->with('success', 'تم اضافة وظيفة مطروحة بنجاح');
    }

    public function edit($id)
    {
        $offer = Offer::findOrFail($id);
        return view('supervisor.offers.edit', compact('offer'));
    }

    public function show($id)
    {
        $offer = Offer::findorfail($id);
        return view('supervisor.offers.show', compact('offer'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required',
            'status' => 'required',
            'description' => 'required',
        ]);
        $input = $request->all();
        $offer = Offer::findOrFail($id);
        $offer->update($input);
        if ($request->hasFile('brochure')) {
            $brochure = $request->file('brochure');
            $fileName = $brochure->getClientOriginalName();
            $uploadDir = 'uploads/brochures/' . $offer->id;
            $brochure->move($uploadDir, $fileName);
            $offer->brochure = $uploadDir . '/' . $fileName;
            $offer->save();
        }
        return redirect()->route('supervisor.offers.index')
            ->with('success', 'تم تعديل بيانات الوظيفة المطروحة بنجاح');
    }

    public function destroy(Request $request)
    {
        Offer::findOrFail($request->offer_id)->delete();
        return redirect()->route('supervisor.offers.index')
            ->with('success', 'تم حذف الوظيفة المطروحة بنجاح');
    }

    public function remove_selected(Request $request)
    {
        $offers_id = $request->offers;
        foreach ($offers_id as $offer_id) {
            $offer = Offer::FindOrFail($offer_id);
            $offer->delete();
        }
        return redirect()->route('supervisor.offers.index')
            ->with('success', 'تم الحذف بنجاح');
    }

    public function print_selected()
    {
        $offers = Offer::all();
        return view('supervisor.offers.print', compact('offers'));
    }

    public function export_offers_excel()
    {
        return Excel::download(new OffersExport(), 'كل الوظائف المطروحة.xlsx');
    }

    public function export_submits_by_offer_excel(Request $request)
    {
        $offer_id = $request->offer_id;
        $offer = Offer::FindOrFail($offer_id);
        $offer_name = $offer->title;
        $submits = Submit::where('offer_id', $offer_id)
            ->get();
        if ($submits->isEmpty()) {
            return redirect()->route('supervisor.offers.index')->with('error', 'لا يوجد مقدمين على هذه الوظيفة');
        } else {
            $filename = "المقدمين على وظيفة " . $offer_name . ".xlsx";
            return Excel::download(new SubmitsExportByOffer($offer_id), $filename);
        }
    }

    public function allow($id){
        $offer = Offer::FindOrFail($id);
        $offer->update([
            'status' => 'مفعل'
        ]);
        return redirect()->route('supervisor.offers.index')
            ->with('success', 'تم تفعيل الوظيفة بنجاح');
    }
    public function deny($id){
        $offer = Offer::FindOrFail($id);
        $offer->update([
            'status' => 'معطل'
        ]);
        return redirect()->route('supervisor.offers.index')
            ->with('success', 'تم تعطيل الوظيفة بنجاح');
    }




}
