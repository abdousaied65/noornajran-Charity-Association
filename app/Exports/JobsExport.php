<?php

namespace App\Exports;
use App\Models\Field;
use App\Models\Job;
use App\Models\Qualification;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class JobsExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        $jobs = Job::select('first_name','second_name','third_name','fourth_name','email','phone_number','record','field_id','qualification_id','created_at')->get();
        $jobs->transform(function($i){
            $i->field_id = Field::FindOrFail($i->field_id)->field;
            $i->qualification_id = Qualification::FindOrFail($i->qualification_id)->qualification;
            return $i;
        });
        return $jobs;
    }
    public function headings(): array
    {
        return [
            'الاسم',
            'اسم الاب',
            'اسم الجد',
            'اسم العائلة',
            'البريد الالكترونى',
            'رقم الجوال',
            'السجل المدنى',
            'المجال التطوعى',
            'المؤهل',
            'تاريخ الاضافة',
        ];
    }

}
