<?php

namespace App\Exports;
use App\Models\Specialist;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class SpecialistsExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        return Specialist::select('first_name','second_name','third_name','fourth_name','email','role_name','phone_number','Status')->get();
    }
    public function headings(): array
    {
        return [
            'الاسم',
            'اسم الاب',
            'اسم الجد',
            'اسم العائلة',
            'البريد الالكترونى',
            'الصلاحية','رقم الجوال','الحالة'
        ];
    }

}
