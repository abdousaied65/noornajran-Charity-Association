<?php

namespace App\Exports;
use App\Models\MailList;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class MailListsExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        return MailList::select('email','created_at')->get();
    }
    public function headings(): array
    {
        return [
            'البريد الالكترونى','تاريخ الاضافة'
        ];
    }

}
