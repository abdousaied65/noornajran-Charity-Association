<?php

namespace App\Exports;
use App\Models\Qualification;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class QualificationsExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        return Qualification::select('id','qualification')->get();
    }
    public function headings(): array
    {
        return [
            '#',
            'المؤهل'
        ];
    }
}
