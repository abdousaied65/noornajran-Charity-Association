<?php

use App\Models\Slider;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

Route::get('/', function () {
    $sliders = Slider::all();
    return view('site.index',compact('sliders'));
})->name('index');

Route::get('/about', function () {
    return view('site.about');
})->name('about');

Route::get('/contact', function () {
    return view('site.contact');
})->name('contact');
Route::post('/contact-store', 'ContactController@store')->name('contact.store');
Route::post('/subscribe', 'ContactController@subscribe')->name('subscribe');

// orders Routes
Route::resource('orders', 'OrderController')->names([
    'index' => 'orders.index',
    'create' => 'orders.create',
    'store' => 'orders.store',
]);
Route::post('/orders-search', 'OrderController@search')->name('orders.search');

// jobs Routes
Route::resource('jobs', 'JobController')->names([
    'index' => 'jobs.index',
    'create' => 'jobs.create',
    'store' => 'jobs.store',
]);
Route::post('/jobs-search', 'JobController@search')->name('jobs.search');

Route::get('/show-offers','OfferController@show_offers')->name('show.offers');
Route::get('/submit-offer/{id?}','OfferController@submit_offer')->name('submit.offer');
Route::post('/submit-offer','OfferController@submit')->name('submit.offer.post');



// *********  Supervisor Routes ******** //
Route::group(
    [
        'namespace' => 'Supervisor'
    ], function () {
    Auth::routes(
        [
            'verify' => false,
            'register' => false,
        ]
    );
    Route::GET('supervisor/login', 'Auth\LoginController@showLoginForm')->name('supervisor.login');
    Route::POST('supervisor/login', 'Auth\LoginController@login');
    Route::POST('supervisor/logout', 'Auth\LoginController@logout')->name('supervisor.logout');
    Route::GET('supervisor/password/confirm', 'Auth\ConfirmPasswordController@showConfirmForm')->name('supervisor.password.confirm');
    Route::POST('supervisor/password/confirm', 'Auth\ConfirmPasswordController@confirm');
    Route::POST('supervisor/password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('supervisor.password.email');
    Route::GET('supervisor/password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('supervisor.password.request');
    Route::POST('supervisor/password/reset', 'Auth\ResetPasswordController@reset')->name('supervisor.password.update');
    Route::GET('supervisor/password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('supervisor.password.reset');
    });

Route::group(
    ['middleware' => ['auth:supervisor-web'],
        'prefix' => 'supervisor',
        'namespace' => 'Supervisor'
    ], function () {
    Route::get('/', 'Auth\LoginController@showLoginForm');
    Route::get('/home', 'HomeController@index')->name('supervisor.home');
    Route::get('/lock-screen', 'HomeController@lock_screen')->name('supervisor.lock.screen');

    Route::get('/settings', 'SettingController@index')->name('supervisor.settings.index');
    Route::post('/settings-update', 'SettingController@update')->name('supervisor.settings.update');

    Route::get('/informations', 'SettingController@info')->name('supervisor.informations.index');
    Route::post('/informations-update', 'SettingController@update_info')->name('supervisor.informations.update');

    Route::get('/index-content', 'SettingController@index_content')->name('supervisor.index_content.index');
    Route::post('/index-content-update', 'SettingController@index_content_update')->name('supervisor.index_content.update');

    Route::get('/about-content', 'SettingController@about_content')->name('supervisor.about_content.index');
    Route::post('/about-content-update', 'SettingController@about_content_update')->name('supervisor.about_content.update');

    Route::get('/experience-certificate', 'SettingController@experience_certificate')->name('supervisor.experience_certificate.index');
    Route::post('/experience-certificate-update', 'SettingController@experience_certificate_update')->name('supervisor.experience_certificate.update');

    // Supervisors Routes
    Route::resource('supervisors', 'SupervisorController')->names([
        'index' => 'supervisor.supervisors.index',
        'create' => 'supervisor.supervisors.create',
        'update' => 'supervisor.supervisors.update',
        'destroy' => 'supervisor.supervisors.destroy',
        'edit' => 'supervisor.supervisors.edit',
        'store' => 'supervisor.supervisors.store',
        'show' => 'supervisor.supervisors.show',
    ]);
    Route::post('/remove-selected-supervisors','SupervisorController@remove_selected')->name('remove.selected.supervisors');
    Route::get('/print-selected-supervisors','SupervisorController@print_selected')->name('print.selected.supervisors');

    Route::post('/export-supervisors-excel', 'SupervisorController@export_supervisors_excel')->name('export.supervisors.excel');

    // SupervisorProfile Routes
    Route::get('profile/edit/{id}', 'SupervisorController@edit_profile')->name('supervisor.profile.edit');
    Route::patch('profile/update/{id}', 'SupervisorController@update_profile')->name('supervisor.profile.update');

    // Roles Routes
    Route::resource('roles', 'RoleController')->names([
        'index' => 'supervisor.roles.index',
        'create' => 'supervisor.roles.create',
        'update' => 'supervisor.roles.update',
        'destroy' => 'supervisor.roles.destroy',
        'edit' => 'supervisor.roles.edit',
        'store' => 'supervisor.roles.store',
    ]);

    // nationalities Routes
    Route::resource('nationalities', 'NationalityController')->names([
        'index' => 'supervisor.nationalities.index',
        'create' => 'supervisor.nationalities.create',
        'update' => 'supervisor.nationalities.update',
        'destroy' => 'supervisor.nationalities.destroy',
        'edit' => 'supervisor.nationalities.edit',
        'store' => 'supervisor.nationalities.store',
        'show' => 'supervisor.nationalities.show',
    ]);
    Route::post('/remove-selected-nationalities','NationalityController@remove_selected')->name('remove.selected.nationalities');
    Route::get('/print-selected-nationalities','NationalityController@print_selected')->name('print.selected.nationalities');
    Route::post('/export-nationalities-excel', 'NationalityController@export_nationalities_excel')->name('export.nationalities.excel');

    // qualifications Routes
    Route::resource('qualifications', 'QualificationController')->names([
        'index' => 'supervisor.qualifications.index',
        'create' => 'supervisor.qualifications.create',
        'update' => 'supervisor.qualifications.update',
        'destroy' => 'supervisor.qualifications.destroy',
        'edit' => 'supervisor.qualifications.edit',
        'store' => 'supervisor.qualifications.store',
        'show' => 'supervisor.qualifications.show',
    ]);
    Route::post('/remove-selected-qualifications','QualificationController@remove_selected')->name('remove.selected.qualifications');
    Route::get('/print-selected-qualifications','QualificationController@print_selected')->name('print.selected.qualifications');
    Route::post('/export-qualifications-excel', 'QualificationController@export_qualifications_excel')->name('export.qualifications.excel');

    // disabilities Routes
    Route::resource('disabilities', 'DisabilityController')->names([
        'index' => 'supervisor.disabilities.index',
        'create' => 'supervisor.disabilities.create',
        'update' => 'supervisor.disabilities.update',
        'destroy' => 'supervisor.disabilities.destroy',
        'edit' => 'supervisor.disabilities.edit',
        'store' => 'supervisor.disabilities.store',
        'show' => 'supervisor.disabilities.show',
    ]);
    Route::post('/remove-selected-disabilities','DisabilityController@remove_selected')->name('remove.selected.disabilities');
    Route::get('/print-selected-disabilities','DisabilityController@print_selected')->name('print.selected.disabilities');
    Route::post('/export-disabilities-excel', 'DisabilityController@export_disabilities_excel')->name('export.disabilities.excel');


    // order_types Routes
    Route::resource('order_types', 'OrderTypeController')->names([
        'index' => 'supervisor.order_types.index',
        'create' => 'supervisor.order_types.create',
        'update' => 'supervisor.order_types.update',
        'destroy' => 'supervisor.order_types.destroy',
        'edit' => 'supervisor.order_types.edit',
        'store' => 'supervisor.order_types.store',
        'show' => 'supervisor.order_types.show',
    ]);
    Route::post('/remove-selected-order-types','OrderTypeController@remove_selected')->name('remove.selected.order_types');
    Route::get('/print-selected-order-types','OrderTypeController@print_selected')->name('print.selected.order_types');
    Route::post('/export-order-types-excel', 'OrderTypeController@export_order_types_excel')->name('export.order_types.excel');

    // fields Routes
    Route::resource('fields', 'FieldController')->names([
        'index' => 'supervisor.fields.index',
        'create' => 'supervisor.fields.create',
        'update' => 'supervisor.fields.update',
        'destroy' => 'supervisor.fields.destroy',
        'edit' => 'supervisor.fields.edit',
        'store' => 'supervisor.fields.store',
        'show' => 'supervisor.fields.show',
    ]);
    Route::post('/remove-selected-fields','FieldController@remove_selected')->name('remove.selected.fields');
    Route::get('/print-selected-fields','FieldController@print_selected')->name('print.selected.fields');
    Route::post('/export-fields-excel', 'FieldController@export_fields_excel')->name('export.fields.excel');

    // jobs Routes
    Route::resource('jobs', 'JobController')->names([
        'index' => 'supervisor.jobs.index',
        'create' => 'supervisor.jobs.create',
        'update' => 'supervisor.jobs.update',
        'destroy' => 'supervisor.jobs.destroy',
        'edit' => 'supervisor.jobs.edit',
        'store' => 'supervisor.jobs.store',
        'show' => 'supervisor.jobs.show',
    ]);
    Route::post('/remove-selected-jobs','JobController@remove_selected')->name('remove.selected.jobs');
    Route::get('/print-selected-jobs','JobController@print_selected')->name('print.selected.jobs');
    Route::post('/export-jobs-excel', 'JobController@export_jobs_excel')->name('export.jobs.excel');
    Route::post('/export-jobs-by-field-excel', 'JobController@export_jobs_by_field_excel')->name('export.jobs.by.field.excel');
    Route::post('/export-jobs-by-qualification-excel', 'JobController@export_jobs_by_qualification_excel')->name('export.jobs.by.qualification.excel');

    // beneficiaries Routes
    Route::resource('beneficiaries', 'BeneficiaryController')->names([
        'index' => 'supervisor.beneficiaries.index',
        'create' => 'supervisor.beneficiaries.create',
        'update' => 'supervisor.beneficiaries.update',
        'destroy' => 'supervisor.beneficiaries.destroy',
        'edit' => 'supervisor.beneficiaries.edit',
        'store' => 'supervisor.beneficiaries.store',
        'show' => 'supervisor.beneficiaries.show',
    ]);

    Route::post('/remove-selected-beneficiaries','BeneficiaryController@remove_selected')->name('remove.selected.beneficiaries');
    Route::get('/print-selected-beneficiaries','BeneficiaryController@print_selected')->name('print.selected.beneficiaries');

    Route::post('/export-beneficiaries-excel', 'BeneficiaryController@export_beneficiaries_excel')->name('export.beneficiaries.excel');

    Route::post('/export-beneficiaries-by-nationality-excel', 'BeneficiaryController@export_beneficiaries_by_nationality_excel')
        ->name('export.beneficiaries.by.nationality.excel');

    Route::post('/export-beneficiaries-by-disability-excel', 'BeneficiaryController@export_beneficiaries_by_disability_excel')
        ->name('export.beneficiaries.by.disability.excel');

    Route::post('/export-beneficiaries-by-status-excel', 'BeneficiaryController@export_beneficiaries_by_status_excel')
        ->name('export.beneficiaries.by.status.excel');


    Route::get('/allow-beneficiary/{id?}','BeneficiaryController@allow')->name('supervisor.beneficiaries.allow');
    Route::get('/deny-beneficiary/{id?}','BeneficiaryController@deny')->name('supervisor.beneficiaries.deny');
    Route::get('/waiting-beneficiary/{id?}','BeneficiaryController@waiting')->name('supervisor.beneficiaries.waiting');


    // orders Routes
    Route::resource('orders', 'OrderController')->names([
        'index' => 'supervisor.orders.index',
        'create' => 'supervisor.orders.create',
        'update' => 'supervisor.orders.update',
        'destroy' => 'supervisor.orders.destroy',
        'edit' => 'supervisor.orders.edit',
        'store' => 'supervisor.orders.store',
        'show' => 'supervisor.orders.show',
    ]);
    Route::post('/remove-selected-orders','OrderController@remove_selected')->name('remove.selected.orders');
    Route::get('/print-selected-orders','OrderController@print_selected')->name('print.selected.orders');
    Route::post('/export-orders-excel', 'OrderController@export_orders_excel')->name('export.orders.excel');

    Route::post('/export-orders-by-nationality-excel', 'OrderController@export_orders_by_nationality_excel')
        ->name('export.orders.by.nationality.excel');

    Route::post('/export-orders-by-disability-excel', 'OrderController@export_orders_by_disability_excel')
        ->name('export.orders.by.disability.excel');

    Route::post('/export-orders-by-status-excel', 'OrderController@export_orders_by_status_excel')
        ->name('export.orders.by.status.excel');

    Route::post('/export-orders-by-ordertype-excel', 'OrderController@export_orders_by_order_type_excel')
        ->name('export.orders.by.order_type.excel');


    Route::get('/allow-order/{id?}','OrderController@allow')->name('supervisor.orders.allow');
    Route::get('/deny-order/{id?}','OrderController@deny')->name('supervisor.orders.deny');
    Route::get('/waiting-order/{id?}','OrderController@waiting')->name('supervisor.orders.waiting');

    // volunteers Routes
    Route::resource('volunteers', 'VolunteerController')->names([
        'index' => 'supervisor.volunteers.index',
        'create' => 'supervisor.volunteers.create',
        'update' => 'supervisor.volunteers.update',
        'destroy' => 'supervisor.volunteers.destroy',
        'edit' => 'supervisor.volunteers.edit',
        'store' => 'supervisor.volunteers.store',
        'show' => 'supervisor.volunteers.show',
    ]);
    Route::post('/remove-selected-volunteers','VolunteerController@remove_selected')->name('remove.selected.volunteers');
    Route::get('/print-selected-volunteers','VolunteerController@print_selected')->name('print.selected.volunteers');
    Route::post('/export-volunteers-excel', 'VolunteerController@export_volunteers_excel')->name('export.volunteers.excel');
    Route::post('/export-volunteers-by-field-excel', 'VolunteerController@export_volunteers_by_field_excel')
        ->name('export.volunteers.by.field.excel');
    Route::post('/export-volunteers-by-status-excel', 'VolunteerController@export_volunteers_by_status_excel')
        ->name('export.volunteers.by.status.excel');

    Route::post('/export-volunteers-by-end-excel', 'VolunteerController@export_volunteers_by_end_excel')
        ->name('export.volunteers.by.end.excel');

    Route::get('/allow-volunteer/{id?}','VolunteerController@allow')->name('supervisor.volunteers.allow');
    Route::get('/deny-volunteer/{id?}','VolunteerController@deny')->name('supervisor.volunteers.deny');
    Route::get('/waiting-volunteer/{id?}','VolunteerController@waiting')->name('supervisor.volunteers.waiting');

    Route::get('/renew-one-volunteer/{id?}','VolunteerController@renew_one')->name('supervisor.volunteers.renew.one');
    Route::get('/renew-two-volunteer/{id?}','VolunteerController@renew_two')->name('supervisor.volunteers.renew.two');
    Route::get('/renew-three-volunteer/{id?}','VolunteerController@renew_three')->name('supervisor.volunteers.renew.three');

    Route::get('/renewal-requests','VolunteerController@renewal_requests')->name('supervisor.renewal.requests');
    Route::get('/print-renewal-requests','VolunteerController@print_renewal_requests')->name('print.renewal.requests');
    Route::post('/remove-renewal-requests','VolunteerController@remove_renewal_requests')->name('remove.renewal.requests');
    Route::post('/export-requests-excel', 'VolunteerController@export_requests_excel')->name('export.requests.excel');

    Route::get('/allow-request/{id?}','VolunteerController@allow_request')->name('supervisor.request.allow');
    Route::get('/deny-request/{id?}','VolunteerController@deny_request')->name('supervisor.request.deny');
    Route::delete('/destroy-request/','VolunteerController@destroy_request')->name('supervisor.request.destroy');


    // Contacts Routes
    Route::resource('contacts', 'ContactController')->names([
        'index' => 'supervisor.contacts.index',
        'show' => 'supervisor.contacts.show',
        'destroy' => 'supervisor.contacts.destroy'
    ]);
    Route::patch('contacts-make-as-read', 'ContactController@makeAsRead')->name('supervisor.contacts.make.as.read');
    Route::patch('contacts-make-as-important', 'ContactController@makeAsImportant')->name('supervisor.contacts.make.as.important');
    Route::patch('contacts-make-as-destroy', 'ContactController@makeAsDestroy')->name('supervisor.contacts.make.as.destroy');
    Route::patch('contacts-print', 'ContactController@print')->name('supervisor.contacts.print');
    Route::get('contacts-important', 'ContactController@showImportant')->name('supervisor.contacts.important');
    Route::post('contacts-reply', 'ContactController@reply')->name('supervisor.contacts.reply');

    // slider Routes
    Route::resource('slider', 'SliderController')->names([
        'index' => 'supervisor.slider.index',
        'create' => 'supervisor.slider.create',
        'destroy' => 'supervisor.slider.destroy',
        'edit' => 'supervisor.slider.edit',
        'update' => 'supervisor.slider.update',
        'store' => 'supervisor.slider.store',
    ]);
    Route::post('/remove-selected-slider','SliderController@remove_selected')->name('remove.selected.slider');

    // offers Routes
    Route::resource('offers', 'OfferController')->names([
        'index' => 'supervisor.offers.index',
        'create' => 'supervisor.offers.create',
        'update' => 'supervisor.offers.update',
        'destroy' => 'supervisor.offers.destroy',
        'edit' => 'supervisor.offers.edit',
        'store' => 'supervisor.offers.store',
        'show' => 'supervisor.offers.show',
    ]);
    Route::post('/remove-selected-offers','OfferController@remove_selected')->name('remove.selected.offers');
    Route::get('/print-selected-offers','OfferController@print_selected')->name('print.selected.offers');
    Route::post('/export-offers-excel', 'OfferController@export_offers_excel')->name('export.offers.excel');
    Route::post('/export-submits-by-offer-excel', 'OfferController@export_submits_by_offer_excel')->name('export.submits.by.offer.excel');

    Route::get('/allow-offer/{id?}','OfferController@allow')->name('supervisor.offers.allow');
    Route::get('/deny-offer/{id?}','OfferController@deny')->name('supervisor.offers.deny');

    // specialists Routes
    Route::resource('specialists', 'SpecialistController')->names([
        'index' => 'supervisor.specialists.index',
        'create' => 'supervisor.specialists.create',
        'update' => 'supervisor.specialists.update',
        'destroy' => 'supervisor.specialists.destroy',
        'edit' => 'supervisor.specialists.edit',
        'store' => 'supervisor.specialists.store',
        'show' => 'supervisor.specialists.show',
    ]);
    Route::post('/remove-selected-specialists','SpecialistController@remove_selected')->name('remove.selected.specialists');
    Route::get('/print-selected-specialists','SpecialistController@print_selected')->name('print.selected.specialists');

    Route::post('/export-specialists-excel', 'SpecialistController@export_specialists_excel')->name('export.specialists.excel');

    // maillists Routes
    Route::resource('maillists', 'MailListController')->names([
        'index' => 'supervisor.maillists.index',
        'create' => 'supervisor.maillists.create',
        'update' => 'supervisor.maillists.update',
        'destroy' => 'supervisor.maillists.destroy',
        'edit' => 'supervisor.maillists.edit',
        'store' => 'supervisor.maillists.store',
        'show' => 'supervisor.maillists.show',
    ]);
    Route::post('/remove-selected-maillists','MailListController@remove_selected')->name('remove.selected.maillists');
    Route::get('/print-selected-maillists','MailListController@print_selected')->name('print.selected.maillists');

    Route::post('/export-maillists-excel', 'MailListController@export_maillists_excel')->name('export.maillists.excel');

    Route::get('/maillists-mail','MailListController@maillist_mail')->name('maillists.mail');
    Route::post('/maillists-send','MailListController@maillist_send')->name('maillists.send');

    // reports Routes
    Route::resource('reports', 'ReportController')->names([
        'index' => 'supervisor.reports.index',
        'create' => 'supervisor.reports.create',
        'update' => 'supervisor.reports.update',
        'destroy' => 'supervisor.reports.destroy',
        'edit' => 'supervisor.reports.edit',
        'store' => 'supervisor.reports.store',
        'show' => 'supervisor.reports.show',
    ]);

    Route::post('/remove-selected-reports','ReportController@remove_selected')->name('remove.selected.reports');
    Route::get('/print-selected-reports','ReportController@print_selected')->name('print.selected.reports');

    Route::post('/export-reports-excel', 'ReportController@export_reports_excel')->name('export.reports.excel');

    Route::post('/export-reports-by-beneficiary-excel', 'ReportController@export_reports_by_beneficiary_excel')
        ->name('export.reports.by.beneficiary.excel');

    Route::post('/export-reports-by-specialist-excel', 'ReportController@export_reports_by_specialist_excel')
        ->name('export.reports.by.specialist.excel');
    Route::post('/supervisor-show-report-details','ReportController@show_report_details')->name('supervisor.show.report.details');

    Route::get('/supervisor-download-report/{id?}','ReportController@download_report')->name('supervisor.download.report');


});
// *********  User Routes ******** //

// *********  Volunteer Routes ******** //
Route::group(
    [
        'namespace' => 'Volunteer'
    ], function () {
    Auth::routes(
        [
            'verify' => false,
            'register' => true,
        ]
    );
    Route::GET('volunteer/login', 'Auth\LoginController@showLoginForm')->name('volunteer.login');
    Route::POST('volunteer/login', 'Auth\LoginController@login');
    Route::POST('volunteer/logout', 'Auth\LoginController@logout')->name('volunteer.logout');
    Route::GET('volunteer/register', 'Auth\RegisterController@showRegistrationForm')->name('volunteer.register');
    Route::POST('volunteer/register', 'Auth\RegisterController@register');
    Route::GET('volunteer/password/confirm', 'Auth\ConfirmPasswordController@showConfirmForm')->name('volunteer.password.confirm');
    Route::POST('volunteer/password/confirm', 'Auth\ConfirmPasswordController@confirm');
    Route::POST('volunteer/password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('volunteer.password.email');
    Route::GET('volunteer/password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('volunteer.password.request');
    Route::POST('volunteer/password/reset', 'Auth\ResetPasswordController@reset')->name('volunteer.password.update');
    Route::GET('volunteer/password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('volunteer.password.reset');
});


// *********  Specialist Routes ******** //
Route::group(
    [
        'namespace' => 'Specialist'
    ], function () {
    Auth::routes(
        [
            'verify' => false,
            'register' => false,
        ]
    );
    Route::GET('specialist/login', 'Auth\LoginController@showLoginForm')->name('specialist.login');
    Route::POST('specialist/login', 'Auth\LoginController@login');
    Route::POST('specialist/logout', 'Auth\LoginController@logout')->name('specialist.logout');
    Route::GET('specialist/password/confirm', 'Auth\ConfirmPasswordController@showConfirmForm')->name('specialist.password.confirm');
    Route::POST('specialist/password/confirm', 'Auth\ConfirmPasswordController@confirm');
    Route::POST('specialist/password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('specialist.password.email');
    Route::GET('specialist/password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('specialist.password.request');
    Route::POST('specialist/password/reset', 'Auth\ResetPasswordController@reset')->name('specialist.password.update');
    Route::GET('specialist/password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('specialist.password.reset');
});



// *********  Beneficiary Routes ******** //
Route::group(
    [
        'namespace' => 'Beneficiary'
    ], function () {
    Auth::routes(
        [
            'verify' => false,
            'register' => true,
        ]
    );
    Route::GET('beneficiary/login', 'Auth\LoginController@showLoginForm')->name('beneficiary.login');
    Route::POST('beneficiary/login', 'Auth\LoginController@login');
    Route::POST('beneficiary/logout', 'Auth\LoginController@logout')->name('beneficiary.logout');
    Route::GET('beneficiary/register', 'Auth\RegisterController@showRegistrationForm')->name('beneficiary.register');
    Route::POST('beneficiary/register', 'Auth\RegisterController@register');
    Route::GET('beneficiary/password/confirm', 'Auth\ConfirmPasswordController@showConfirmForm')->name('beneficiary.password.confirm');
    Route::POST('beneficiary/password/confirm', 'Auth\ConfirmPasswordController@confirm');
    Route::POST('beneficiary/password/email', 'Auth\ForgotPasswordController@sendResetLinkEmail')->name('beneficiary.password.email');
    Route::GET('beneficiary/password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('beneficiary.password.request');
    Route::POST('beneficiary/password/reset', 'Auth\ResetPasswordController@reset')->name('beneficiary.password.update');
    Route::GET('beneficiary/password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('beneficiary.password.reset');
});

Route::group(
    ['middleware' => ['auth:volunteer-web'],
        'prefix' => 'volunteer',
        'namespace' => 'Volunteer'
    ], function () {
    Route::get('/', 'HomeController@index')->name('volunteer.home');
    Route::get('/home', 'HomeController@index')->name('volunteer.home');
    Route::get('/download-pdf','HomeController@DownloadPdf')->name('volunteer.download.pdf');

    Route::post('/renewal-request','HomeController@renewal_request')->name('renewal.request');
    Route::get('/renewal-requests','HomeController@renewal_requests')->name('renewal.requests');

    // SupervisorProfile Routes
    Route::get('profile/edit/{id}', 'HomeController@edit_profile')->name('volunteer.profile.edit');
    Route::patch('profile/update/{id}', 'HomeController@update_profile')->name('volunteer.profile.update');

    Route::get('/download-certificate/{id?}','HomeController@download_certificate')->name('volunteer.download.certificate');
    Route::post('/increase-counter-cert','HomeController@increase_counter_cert')->name('increase.counter.cert');

});

Route::group(
    ['middleware' => ['auth:specialist-web'],
        'prefix' => 'specialist',
        'namespace' => 'Specialist'
    ], function () {
    Route::get('/', 'HomeController@index')->name('specialist.home');
    Route::get('/home', 'HomeController@index')->name('specialist.home');

    // specialists profiles Routes
    Route::get('profile/edit/{id}', 'HomeController@edit_profile')->name('specialist.profile.edit');
    Route::patch('profile/update/{id}', 'HomeController@update_profile')->name('specialist.profile.update');

    // beneficiaries Routes
    Route::resource('beneficiaries', 'BeneficiaryController')->names([
        'index' => 'specialist.beneficiaries.index',
        'show' => 'specialist.beneficiaries.show',
    ]);

    // reports Routes

    Route::get('create-report/{id?}','ReportController@create')->name('specialist.reports.create');
    Route::post('store-report/','ReportController@store')->name('specialist.reports.store');
    Route::get('edit-report/{id?}','ReportController@edit')->name('specialist.reports.edit');
    Route::patch('update-report/{id?}','ReportController@update')->name('specialist.reports.update');
    Route::delete('destroy-report/','ReportController@destroy')->name('specialist.reports.destroy');
    Route::post('show-report-details','ReportController@show_report_details')->name('show.report.details');

    // specialist_reports Routes
    Route::resource('specialist_reports', 'SpecialistReportController')->names([
        'index' => 'specialist.specialist_reports.index',
        'create' => 'specialist.specialist_reports.create',
        'update' => 'specialist.specialist_reports.update',
        'destroy' => 'specialist.specialist_reports.destroy',
        'edit' => 'specialist.specialist_reports.edit',
        'store' => 'specialist.specialist_reports.store',
        'show' => 'specialist.specialist_reports.show',
    ]);

    Route::post('/remove-selected-specialists-reports','SpecialistReportController@remove_selected')->name('remove.selected.specialist_reports');
    Route::get('/print-selected-specialists-reports','SpecialistReportController@print_selected')->name('print.selected.specialist_reports');
    Route::post('/export-specialists-reports-excel', 'SpecialistReportController@export_specialist_reports_excel')->name('export.specialist_reports.excel');
    Route::post('/export-specialists-reports-by-beneficiary-excel', 'SpecialistReportController@export_specialist_reports_by_beneficiary_excel')
        ->name('export.specialist_reports.by.beneficiary.excel');

});

Route::group(
    ['middleware' => ['auth:beneficiary-web'],
        'prefix' => 'beneficiary',
        'namespace' => 'Beneficiary'
    ], function () {
    Route::get('/', 'HomeController@index')->name('beneficiary.home');
    Route::get('/home', 'HomeController@index')->name('beneficiary.home');
    Route::get('/download-pdf','HomeController@DownloadPdf')->name('beneficiary.download.pdf');
    Route::get('/download-report/{id?}','HomeController@download_report')->name('beneficiary.download.report');

    Route::get('/reports', 'HomeController@display_reports')->name('beneficiary.reports');
    // SupervisorProfile Routes
    Route::get('profile/edit/{id}', 'HomeController@edit_profile')->name('beneficiary.profile.edit');
    Route::patch('profile/update/{id}', 'HomeController@update_profile')->name('beneficiary.profile.update');
    Route::post('beneficiary-show-report-details','HomeController@show_report_details')->name('beneficiary.show.report.details');

});



?>
