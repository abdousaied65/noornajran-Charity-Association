<?php

namespace App\Exports;
use App\Models\Beneficiary;
use App\Models\Report;
use App\Models\Specialist;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class SupervisorReportsExportByBeneficiary implements FromCollection,WithHeadings
{
    protected $beneficiaries;

    public function __construct(array $beneficiaries)
    {
        $this->beneficiaries = $beneficiaries;
    }

    public function array(): array
    {
        return $this->beneficiaries;
    }

    public function collection()
    {
        $reports = Report::select('specialist_id','beneficiary_id','report','created_at')
            ->whereIn('beneficiary_id',$this->beneficiaries)
            ->get();
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
