<?php

namespace App\Exports;
use App\Models\Nationality;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class NationalitiesExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        return Nationality::select('id','nationality')->get();
    }
    public function headings(): array
    {
        return [
            '#',
            'الجنسية'
        ];
    }

}
