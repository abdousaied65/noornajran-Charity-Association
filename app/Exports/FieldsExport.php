<?php

namespace App\Exports;
use App\Models\Field;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class FieldsExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        return Field::select('id','field')->get();
    }
    public function headings(): array
    {
        return [
            '#',
            'المجال'
        ];
    }

}
