<?php
namespace App\Exports;
use App\Models\RenewalRequest;
use App\Models\Volunteer;
use Illuminate\Database\Eloquent\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class RequestsExport implements FromCollection,WithHeadings
{
    public function collection()
    {
        $requests = RenewalRequest::select('volunteer_id','period','status','created_at')->get();
        $requests->transform(function($i) {
            $i->volunteer_id = Volunteer::FindOrFail($i->volunteer_id)->first_name." ".Volunteer::FindOrFail($i->volunteer_id)->fourth_name;
            return $i;
        });
        return $requests;
    }
    public function headings(): array
    {
        return [
            'المتطوع',
            'مدة التجديد',
            'الحالة',
            'تاريخ الطلب',
        ];
    }
}
