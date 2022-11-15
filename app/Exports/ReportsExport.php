<?php

namespace App\Exports;
use App\Models\Beneficiary;
use App\Models\Report;
use App\Models\Specialist;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ReportsExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        $reports = Report::select('specialist_id','beneficiary_id','report','created_at')->get();
        $reports->transform(function($i){
            $i->beneficiary_id = Beneficiary::FindOrFail($i->beneficiary_id)->first_name." ".Beneficiary::FindOrFail($i->beneficiary_id)->fourth_name;
            $i->specialist_id = Specialist::FindOrFail($i->specialist_id)->first_name." ".Specialist::FindOrFail($i->specialist_id)->fourth_name;
            return $i;
        });
        return $reports;
    }
    public function headings(): array
    {
        return [
            'اسم الاخصائى',
            'اسم المستفيد',
            'نص التقرير',
            'تاريخ الاضافة',
        ];
    }

}
