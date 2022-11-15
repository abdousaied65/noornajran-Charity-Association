<?php

namespace App\Exports;

use App\Models\Offer;
use App\Models\Qualification;
use App\Models\Submit;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class SubmitsExportByOffer implements FromCollection, WithHeadings
{
    protected $offer_id;

    public function __construct($offer_id)
    {
        $this->offer_id = $offer_id;
    }

    public function collection()
    {
        $submits = Submit::select('first_name','second_name','third_name','fourth_name', 'email', 'record', 'phone_number', 'offer_id', 'qualification_id', 'created_at')
            ->where('offer_id', $this->offer_id)->get();
        $submits->transform(function ($i) {
            $i->offer_id = Offer::FindOrFail($i->offer_id)->title;
            $i->qualification_id = Qualification::FindOrFail($i->qualification_id)->qualification;
            return $i;
        });
        return $submits;
    }

    public function headings(): array
    {
        return [
            'الاسم',
            'اسم الاب',
            'اسم الجد',
            'اسم العائلة',
            'البريد الالكترونى',
            'السجل المدنى',
            'رقم الجوال',
            'الوظيفة المطروحة', 'المؤهل',
            'تاريخ التقديم',
        ];
    }

}
