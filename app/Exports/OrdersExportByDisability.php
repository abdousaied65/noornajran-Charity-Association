<?php

namespace App\Exports;
use App\Models\Disability;
use App\Models\Nationality;
use App\Models\Order;
use App\Models\OrderType;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class OrdersExportByDisability implements FromCollection,WithHeadings
{
    protected $disabilities;

    public function __construct(array $disabilities)
    {
        $this->disabilities = $disabilities;
    }

    public function array(): array
    {
        return $this->disabilities;
    }

    public function collection()
    {
        $orders = Order::select('first_name','second_name','third_name','fourth_name','email','phone_number','quantity','Status','disability_id','nationality_id','order_type_id','created_at')
            ->whereIn('disability_id',$this->disabilities)->get();
        $orders->transform(function($i){
            $i->disability_id = Disability::FindOrFail($i->disability_id)->disability;
            $i->nationality_id = Nationality::FindOrFail($i->nationality_id)->nationality;
            $i->order_type_id = OrderType::FindOrFail($i->order_type_id)->order_type;
            return $i;
        });
        return $orders;
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
            'الكمية',
            'الحالة','نوع الاعاقة','الجنسية','نوع الطلب','تاريخ الطلب'
        ];
    }

}
