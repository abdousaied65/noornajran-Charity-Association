<?php

namespace App\Listeners;

use App\Models\ExperienceCertificate;
use App\Models\ExperienceCertificatePrintsNumber;
use App\Models\Volunteer;
use Illuminate\Support\Facades\Auth;

class IncreaseCounter
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param
     * @return void
     */
    public function handle()
    {
        $this->updateCounter();
    }
    function updateCounter(){
        $volunteer = Volunteer::FindOrFail(Auth::user()->id);
        $experience_certificate_prints_number = ExperienceCertificatePrintsNumber::where('volunteer_id',$volunteer->id)
            ->First();
        $prints_number = $experience_certificate_prints_number->prints_number;
        $new_prints_number = $prints_number + 1;
        $experience_certificate_prints_number->update([
            'prints_number' => $new_prints_number,
        ]);
        $experience_certificate = ExperienceCertificate::create([
            'volunteer_id' => $volunteer->id
        ]);
    }
}
