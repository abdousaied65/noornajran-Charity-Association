<?php

namespace App\Exports;
use App\Models\Offer;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class OffersExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        return Offer::select('id','title','description')->get();
    }
    public function headings(): array
    {
        return [
            '#',
            'عنوان الوظيفة',
            'الوصف',
        ];
    }

}
