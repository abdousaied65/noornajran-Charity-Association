<?php

namespace App\Exports;
use App\Models\Disability;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class DisabilitiesExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        return Disability::select('id','disability')->get();
    }
    public function headings(): array
    {
        return [
            '#',
            'نوع الاعاقة'
        ];
    }

}
