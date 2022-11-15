<?php

namespace App\Exports;
use App\Models\Beneficiary;
use App\Models\Disability;
use App\Models\Nationality;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class BeneficiariesExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        $beneficiaries = Beneficiary::select('first_name','second_name','third_name','fourth_name','email','role_name','phone_number','record','Status','disability_id','nationality_id','created_at')->get();
        $beneficiaries->transform(function($i){
            $i->disability_id = Disability::FindOrFail($i->disability_id)->disability;
            $i->nationality_id = Nationality::FindOrFail($i->nationality_id)->nationality;
            return $i;
        });
        return $beneficiaries;
    }
    public function headings(): array
    {
        return [
            'الاسم',
            'اسم الاب',
            'اسم الجد',
            'اسم العائلة',
            'البريد الالكترونى',
            'الصلاحية',
            'رقم الجوال',
            'السجل المدنى',
            'الحالة',
            'نوع الاعاقة',
            'الجنسية',
            'تاريخ الاضافة'
        ];
    }

}
