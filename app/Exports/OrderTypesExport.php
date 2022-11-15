<?php

namespace App\Exports;
use App\Models\OrderType;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class OrderTypesExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        return OrderType::select('id','order_type')->get();
    }
    public function headings(): array
    {
        return [
            '#',
            'نوع الطلب'
        ];
    }

}
