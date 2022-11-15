<?php

return [

    'defaults' => [
        'guard' => 'supervisor-web',
        'passwords' => 'supervisors',
    ],

    'guards' => [
        'supervisor-web' => [
            'driver' => 'session',
            'provider' => 'supervisors',
        ],
        'specialist-web' => [
            'driver' => 'session',
            'provider' => 'specialists',
        ],
        'volunteer-web' => [
            'driver' => 'session',
            'provider' => 'volunteers',
        ],
        'beneficiary-web' => [
            'driver' => 'session',
            'provider' => 'beneficiaries',
        ],
    ],

    'providers' => [
        'supervisors' => [
            'driver' => 'eloquent',
            'model' => App\Models\Supervisor::class,
        ],
        'specialists' => [
            'driver' => 'eloquent',
            'model' => App\Models\Specialist::class,
        ],
        'beneficiaries' => [
            'driver' => 'eloquent',
            'model' => App\Models\Beneficiary::class,
        ],
        'volunteers' => [
            'driver' => 'eloquent',
            'model' => App\Models\Volunteer::class,
        ],

    ],

    'passwords' => [

        'supervisors' => [
            'provider' => 'supervisors',
            'table' => 'supervisor_password_resets',
            'expire' => 60,
            'throttle' => 60,
        ],

        'specialists' => [
            'provider' => 'specialists',
            'table' => 'specialist_password_resets',
            'expire' => 60,
            'throttle' => 60,
        ],

        'beneficiaries' => [
            'provider' => 'beneficiaries',
            'table' => 'beneficiary_password_resets',
            'expire' => 60,
            'throttle' => 60,
        ],

        'volunteers' => [
            'provider' => 'volunteers',
            'table' => 'volunteer_password_resets',
            'expire' => 60,
            'throttle' => 60,
        ],

    ],

    'password_timeout' => 10800,

];
