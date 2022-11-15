<?php

namespace App\Exports;
use App\Models\Field;
use App\Models\Volunteer;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class VolunteersExportByStatus implements FromCollection,WithHeadings
{
    protected $statuses;

    public function __construct(array $statuses)
    {
        $this->statuses = $statuses;
    }

    public function array(): array
    {
        return $this->statuses;
    }

    public function collection()
    {
        $volunteers = Volunteer::select('first_name','second_name','third_name','fourth_name','email','role_name','phone_number','record','Status','field_id','created_at')
            ->whereIn('Status',$this->statuses)->get();
        $volunteers->transform(function($i){
            $i->field_id = Field::FindOrFail($i->field_id)->field;
            return $i;
        });
        return $volunteers;
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
            'المجال التطوعى',
            'تاريخ الاضافة'
        ];
    }

}
