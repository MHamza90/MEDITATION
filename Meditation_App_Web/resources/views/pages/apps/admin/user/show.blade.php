<x-default-layout>

    @section('title')
        Users Details
    @endsection
    @section('breadcrumbs')
        {{ Breadcrumbs::render('app-management.user.show', $user) }}
    @endsection
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/baguettebox.js@1.11.0/dist/baguetteBox.min.css">
    <script src="https://cdn.jsdelivr.net/npm/baguettebox.js@1.11.0/dist/baguetteBox.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/clipboard@2.0.11/dist/clipboard.min.js"></script>
    <style>
        .gallery {

            margin: 0 auto;
            display: grid;
            max-width: 780px;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            grid-auto-rows: 180px;
            grid-gap: 20px;

        }

        .gallery .item {
            max-width: 180px;
            height: 180px;
            margin: 0 auto;
            cursor: pointer;
            filter: grayscale(40%);
        }

        .gallery .item:hover {
            filter: none;
            transition: 0.3s ease-out;
            transform: scale(1.06);
        }

        img {
            max-width: 180px;
            height: 70%;
            box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 10px 0px,
                rgba(0, 0, 0, 0.5) 0px 2px 15px 0px;
        }
    </style>
    <link href="{{ asset('assets/plugins/global/plugins.bundle.css') }}" rel="stylesheet" type="text/css" />

    <!--begin::Layout-->
    <div class="d-flex flex-column flex-lg-row">
        <!--begin::Sidebar-->
        <div class="flex-column flex-lg-row-auto w-lg-250px w-xl-350px mb-10">
            <!--begin::Card-->
            <div class="card mb-5 mb-xl-8">
                <!--begin::Card body-->
                <div class="card-body">
                    <!--begin::Summary-->
                    <!--begin::User Info-->
                    <div class="d-flex flex-center flex-column py-5">
                        <!--begin::Avatar-->
                        <div class="symbol symbol-100px symbol-circle mb-7">
                            @if ($user->avatar && $user->avatar != 'documents/profile/default.png')
                                <img src="{{ asset($user->avatar) }}" alt="image" />
                            @else
                                <div
                                    class="symbol-label fs-3 {{ app(\App\Actions\GetThemeType::class)->handle('bg-light-? text-?', $user->name) }}">
                                    {{ $user->first_name ? \Str::upper(substr($user->first_name, 0, 1)) . ($user->last_name ? \Str::upper(substr($user->last_name, 0, 1)) : '') : substr($user->name, 0, 1) }}
                                </div>
                            @endif
                        </div>
                        <!--end::Avatar-->
                        {{-- <a class="ml-5" href="#"><i class="ki-duotone ki-verify fs-1 text-primary"><span class="path1"></span><span class="path2"></span></i></a> --}}
                        <!--begin::Name-->

                        <a href="#"
                            class="fs-3 text-gray-800 text-hover-primary fw-bold mb-3">{{ $user->name ?? '' }}

                            {{-- <i class="ki-duotone ki-verify fs-1 text-primary"><span class="path1"></span><span class="path2"></span></i> --}}
                        </a>

                        <!--end::Name-->
                        <div class="mb-9">
                            @foreach ($user->roles as $role)
                                <!--begin::Badge-->
                                <div class="badge badge-lg badge-light-primary d-inline">{{ ucwords($role->name) }}
                                </div>
                                <!--begin::Badge-->
                            @endforeach
                        </div>
                        <!--begin::Info-->

                    </div>
                    <!--end::User Info-->
                    <!--end::Summary-->
                    <!--begin::Details toggle-->
                    <div class="d-flex flex-stack fs-4 py-3">
                        <div class="fw-bold rotate collapsible" data-bs-toggle="collapse" href="#kt_user_view_details"
                            role="button" aria-expanded="false" aria-controls="kt_user_view_details">Details
                            <span class="ms-2 rotate-180">
                                {!! getIcon('down', 'fs-3 ', '', 'i') !!}

                            </span>
                        </div>

                    </div>
                    <!--end::Details toggle-->
                    <div class="separator"></div>
                    <!--begin::Details content-->
                    <div id="kt_user_view_details" class="collapse show">
                        <div class="pb-5 fs-6">

                            @if (isset($user->name))
                                <!--begin::Details item-->
                                <div class="fw-bold mt-5">Name</div>
                                <div class="text-gray-600">

                                    {{ \Str::upper($user->name ?? '') }}
                                </div>
                                <!--begin::Details item-->
                            @endif
                            @if (isset($user->email))
                                <!--begin::Details item-->
                                <div class="fw-bold mt-5">Email</div>
                                <div class="text-gray-600  ">
                                    {{ \Str::upper($user->email) }} </div>
                                {{-- id="kt_share_earn_link_copy_button" --}}


                                <!--begin::Details item-->
                            @endif


                            @if (isset($user->date_of_birth))
                                <!--begin::Details item-->
                                <div class="fw-bold mt-5">Date of Birth</div>
                                <div class="text-gray-600">{{ $user->date_of_birth }}</div>
                                <!--begin::Details item-->
                            @endif



                            <!--begin::Details item-->
                            <!--begin::Details item-->
                            <div class="fw-bold mt-5">Language</div>
                            @if ($user->lang == 'ru')
                                <div class="text-gray-600">Russian</div>
                            @else
                                <div class="text-gray-600">English</div>
                            @endif
                            <!--begin::Details item-->
                            <!--begin::Details item-->
                            <div class="fw-bold mt-5">Last Login</div>
                            <div class="text-gray-600">
                                @if ($user->last_login_at)
                                    {{ \Carbon\Carbon::parse($user->last_login_at)->format('d F Y, h:i a') }}
                                @else
                                    No login recorded
                                @endif
                            </div>
                            <!--begin::Details item-->
                            <!--begin::Details item-->
                            @if ($user->last_login_ip)
                                <div class="fw-bold mt-5">IP Address</div>
                                <div class="text-gray-600">
                                    {{ $user->last_login_ip }}
                                </div>
                            @endif


                        </div>
                    </div>
                    <!--end::Details content-->


                    <!--begin::Tracker toggle-->
                    <div class="d-flex flex-stack fs-4 py-3">
                        <div class="fw-bold rotate collapsible" data-bs-toggle="collapse" href="#kt_tracker"
                            role="button" aria-expanded="false" aria-controls="kt_tracker">Tracker
                            <span class="ms-2 rotate-180">
                                {!! getIcon('down', 'fs-3 ', '', 'i') !!}

                            </span>
                        </div>

                    </div>
                    <!--end::Tracker toggle-->
                    <div class="separator"></div>
                    <!--begin::Tracker content-->
                    <div id="kt_tracker" class="collapse">
                        <div class="pb-5 fs-6">

                            @if (isset($data['tracker']->name))
                                <!--begin::Tracker item-->
                                <div class="fw-bold mt-5">Name</div>
                                <div class="text-gray-600">

                                    {{ \Str::upper($data['tracker']->name ?? '') }}
                                </div>
                                <!--begin::Tracker item-->
                            @endif
                            @if (isset($data['tracker']->habit->image))
                                <!--begin::Tracker item-->
                                <div class="fw-bold mt-5">Habit</div>
                                <div class="symbol symbol-100px symbol-circle mb-7">
                                    @if ($data['tracker']->habit->image && $data['tracker']->habit->image != 'documents/profile/default.png')
                                        <img src="{{ asset($data['tracker']->habit->image) }}" alt="image" />
                                    @else
                                        <img src="{{ asset('documents/profile/default.png') }}" alt="image" />
                                    @endif
                                </div>


                                <!--begin::Tracker item-->
                            @endif


                            @if (isset($data['tracker']->execution->name))
                                <!--begin::Tracker item-->
                                <div class="fw-bold mt-5">Execution</div>
                                <div class="text-gray-600">{{ $data['tracker']->execution->name }}</div>
                                <!--begin::Tracker item-->
                            @endif



                            <!--begin::Tracker item-->




                        </div>
                    </div>
                    <!--end::Tracker content-->
                </div>
                <!--end::Card body-->
            </div>
            <!--end::Card-->
            <!--begin::Connected Accounts-->
            {{-- <div class="card mb-5 mb-xl-8">
                <!--begin::Card header-->
                <div class="card-header border-0">
                    <div class="card-title">
                        <h3 class="fw-bold m-0">Connected Accounts</h3>
                    </div>
                </div>
                <!--end::Card header-->
                <!--begin::Card body-->
                <div class="card-body pt-2">
                    <!--begin::Notice-->
                    <div class="notice d-flex bg-light-primary rounded border-primary border border-dashed mb-9 p-6">
                        <!--begin::Icon-->

                        <i class="ki-duotone ki-design-1 fs-2tx text-primary me-4"></i>
                        <!--end::Icon-->
                        <!--begin::Wrapper-->
                        <div class="d-flex flex-stack flex-grow-1">
                            <!--begin::Content-->
                            <div class="fw-semibold">
                                <div class="fs-6 text-gray-700">By connecting an account, you hereby agree to our
                                    <a href="#" class="me-1">privacy policy</a>and
                                    <a href="#">terms of use</a>.
                                </div>
                            </div>
                            <!--end::Content-->
                        </div>
                        <!--end::Wrapper-->
                    </div>
                    <!--end::Notice-->
                    <!--begin::Items-->
                    <div class="py-2">
                        <!--begin::Item-->
                        <div class="d-flex flex-stack">
                            <div class="d-flex">
                                <img src="{{ image('svg/brand-logos/google-icon.svg') }}" class="w-30px me-6"
                                    alt="" />
                                <div class="d-flex flex-column">
                                    <a href="#" class="fs-5 text-dark text-hover-primary fw-bold">Google</a>
                                    <div class="fs-6 fw-semibold text-muted">Plan properly your workflow</div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <!--begin::Switch-->
                                <label
                                    class="form-check form-switch form-switch-sm form-check-custom form-check-solid">
                                    <!--begin::Input-->
                                    <input class="form-check-input" name="google" type="checkbox" value="1"
                                        id="kt_modal_connected_accounts_google" checked="checked" />
                                    <!--end::Input-->
                                    <!--begin::Label-->
                                    <span class="form-check-label fw-semibold text-muted"
                                        for="kt_modal_connected_accounts_google"></span>
                                    <!--end::Label-->
                                </label>
                                <!--end::Switch-->
                            </div>
                        </div>
                        <!--end::Item-->
                        <div class="separator separator-dashed my-5"></div>
                        <!--begin::Item-->
                        <div class="d-flex flex-stack">
                            <div class="d-flex">
                                <img src="{{ image('svg/brand-logos/github.svg') }}" class="w-30px me-6"
                                    alt="" />
                                <div class="d-flex flex-column">
                                    <a href="#" class="fs-5 text-dark text-hover-primary fw-bold">Github</a>
                                    <div class="fs-6 fw-semibold text-muted">Keep eye on on your Repositories</div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <!--begin::Switch-->
                                <label
                                    class="form-check form-switch form-switch-sm form-check-custom form-check-solid">
                                    <!--begin::Input-->
                                    <input class="form-check-input" name="github" type="checkbox" value="1"
                                        id="kt_modal_connected_accounts_github" checked="checked" />
                                    <!--end::Input-->
                                    <!--begin::Label-->
                                    <span class="form-check-label fw-semibold text-muted"
                                        for="kt_modal_connected_accounts_github"></span>
                                    <!--end::Label-->
                                </label>
                                <!--end::Switch-->
                            </div>
                        </div>
                        <!--end::Item-->
                        <div class="separator separator-dashed my-5"></div>
                        <!--begin::Item-->
                        <div class="d-flex flex-stack">
                            <div class="d-flex">
                                <img src="{{ image('svg/brand-logos/slack-icon.svg') }}" class="w-30px me-6"
                                    alt="" />
                                <div class="d-flex flex-column">
                                    <a href="#" class="fs-5 text-dark text-hover-primary fw-bold">Slack</a>
                                    <div class="fs-6 fw-semibold text-muted">Integrate Projects Discussions</div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end">
                                <!--begin::Switch-->
                                <label
                                    class="form-check form-switch form-switch-sm form-check-custom form-check-solid">
                                    <!--begin::Input-->
                                    <input class="form-check-input" name="slack" type="checkbox" value="1"
                                        id="kt_modal_connected_accounts_slack" />
                                    <!--end::Input-->
                                    <!--begin::Label-->
                                    <span class="form-check-label fw-semibold text-muted"
                                        for="kt_modal_connected_accounts_slack"></span>
                                    <!--end::Label-->
                                </label>
                                <!--end::Switch-->
                            </div>
                        </div>
                        <!--end::Item-->
                    </div>
                    <!--end::Items-->
                </div>
                <!--end::Card body-->
                <!--begin::Card footer-->
                <div class="card-footer border-0 d-flex justify-content-center pt-0">
                    <button class="btn btn-sm btn-light-primary">Save Changes</button>
                </div>
                <!--end::Card footer-->
            </div> --}}
            <!--end::Connected Accounts-->
        </div>
        <!--end::Sidebar-->
        <!--begin::Content-->
        <div class="flex-lg-row-fluid ms-lg-15">
            <!--begin:::Tabs-->
            <ul class="nav nav-custom nav-tabs nav-line-tabs nav-line-tabs-2x border-0 fs-4 fw-semibold mb-8">
                <!--begin:::Tab item-->

                <!--end:::Tab item-->
                <!--begin:::Tab item-->
                <li class="nav-item">
                    <a class="nav-link text-active-primary pb-4 active" data-kt-countup-tabs="true" data-bs-toggle="tab"
                        href="#kt_user_view_overview_security">Cards</a>
                </li>
                <!--end:::Tab item-->
                <!--begin:::Tab item-->
                <li class="nav-item">
                    <a class="nav-link text-active-primary pb-4" data-bs-toggle="tab"
                        href="#kt_user_view_overview_events_and_logs_tab">New Entries</a>
                </li>
                <!--end:::Tab item-->
                <!--begin:::Tab item-->
                <li class="nav-item">
                    <a class="nav-link text-active-primary pb-4" data-bs-toggle="tab"
                        href="#kt_user_view_overview_tracker_tab">Tracker</a>
                </li>
                <!--end:::Tab item-->

            </ul>
            <!--end:::Tabs-->
            <!--begin:::Tab content-->
            <div class="tab-content" id="myTabContent">
                <!--begin:::Tab pane-->
                <div class="tab-pane fade active show" id="kt_user_view_overview_security" role="tabpanel">
                    <!--begin::Card-->
                    <div class="card pt-4 mb-6 mb-xl-9">
                        <!--begin::Card header-->
                        <div class="card-header border-0">
                            <!--begin::Card title-->
                            <div class="card-title">
                                <h2>Cards</h2>
                            </div>
                            <!--end::Card title-->

                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body pt-0 pb-5">
                            <!--begin::Table wrapper-->
                            <div class="table-responsive">
                                <!--begin::Table-->
                                <table class="table align-middle table-row-dashed gy-5"
                                    id="kt_table_users_login_session">
                                    <thead class="border-bottom border-gray-200 fs-7 fw-bold">
                                        <tr class="text-start text-muted text-uppercase gs-0">
                                            <th class="min-w-100px">Card Name</th>
                                            <th class="min-w-100px"></th>
                                            <th class="min-w-70px">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="fs-6 fw-semibold text-gray-600">
                                        @forelse ($data['cards'] as $item)
                                            <tr>
                                                <td>{{ $item->name }}</td>
                                                <td>
                                                    <div class="mb-0">

                                                        <input class="form-control form-control-solid kt_datepicker_2"
                                                            placeholder="Pick a date" />
                                                    </div>
                                                </td>
                                                <td>
                                                    <button type="button" data-card-id="{{ $item->id }}"
                                                        data-user-id="{{ $user->id }}"
                                                        class="btn btn-sm btn-flex btn-light-primary send-card">
                                                        <i class="ki-duotone ki-entrance-left fs-3">
                                                            <span class="path1"></span>
                                                            <span class="path2"></span>
                                                        </i>Send To User</button>
                                                </td>
                                            </tr>
                                        @empty
                                        @endforelse


                                    </tbody>
                                </table>
                                <!--end::Table-->
                            </div>
                            <!--end::Table wrapper-->
                        </div>
                        <!--end::Card body-->
                    </div>
                    <!--end::Card-->
                </div>
                <!--end:::Tab pane-->
                <!--begin:::Tab pane-->
                <div class="tab-pane fade " id="kt_user_view_overview_events_and_logs_tab" role="tabpanel">
                    <!--begin::Card-->
                    <div class="card pt-4 mb-6 mb-xl-9">
                        <!--begin::Card header-->
                        <div class="card-header border-0">
                            <!--begin::Card title-->
                            <div class="card-title">
                                <h2>Profile</h2>
                            </div>
                            <!--end::Card title-->
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body pt-0 pb-5">

                        </div>
                        <!--end::Card body-->
                    </div>
                    <!--end::Card-->

                </div>
                <!--end:::Tab pane-->
                <!--begin:::Tab pane-->
                <div class="tab-pane fade" id="kt_user_view_overview_tracker_tab" role="tabpanel">
                    <!--begin::Card-->
                    <div class="card pt-4 mb-6 mb-xl-9">
                        <!--begin::Card header-->
                        <div class="card-header border-0">
                            <!--begin::Card title-->
                            <div class="card-title">
                                <h2>Login Sessions</h2>
                            </div>
                            <!--end::Card title-->
                            <!--begin::Card toolbar-->
                            <div class="card-toolbar">
                                <!--begin::Filter-->
                                <button type="button" class="btn btn-sm btn-flex btn-light-primary"
                                    id="kt_modal_sign_out_sesions">
                                    <i class="ki-duotone ki-entrance-right fs-3">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                    </i>Sign out all sessions</button>
                                <!--end::Filter-->
                            </div>
                            <!--end::Card toolbar-->
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body pt-0 pb-5">
                            <!--begin::Table wrapper-->
                            <div class="table-responsive">
                                <!--begin::Table-->
                                <table class="table align-middle table-row-dashed gy-5"
                                    id="kt_table_users_login_session">
                                    <thead class="border-bottom border-gray-200 fs-7 fw-bold">
                                        <tr class="text-start text-muted text-uppercase gs-0">
                                            <th class="min-w-100px">Location</th>
                                            <th>Device</th>
                                            <th>IP Address</th>
                                            <th class="min-w-125px">Time</th>
                                            <th class="min-w-70px">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="fs-6 fw-semibold text-gray-600">
                                        <tr>
                                            <td>Australia</td>
                                            <td>Chome - Windows</td>
                                            <td>207.20.21.295</td>
                                            <td>23 seconds ago</td>
                                            <td>Current session</td>
                                        </tr>
                                        <tr>
                                            <td>Australia</td>
                                            <td>Safari - iOS</td>
                                            <td>207.15.21.72</td>
                                            <td>3 days ago</td>
                                            <td>
                                                <a href="#" data-kt-users-sign-out="single_user">Sign out</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Australia</td>
                                            <td>Chrome - Windows</td>
                                            <td>207.10.28.325</td>
                                            <td>last week</td>
                                            <td>Expired</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!--end::Table-->
                            </div>
                            <!--end::Table wrapper-->
                        </div>
                        <!--end::Card body-->
                    </div>
                    <!--end::Card-->
                    <!--begin::Card-->
                    <div class="card pt-4 mb-6 mb-xl-9">
                        <!--begin::Card header-->
                        <div class="card-header border-0">
                            <!--begin::Card title-->
                            <div class="card-title">
                                <h2>Logs</h2>
                            </div>
                            <!--end::Card title-->
                            <!--begin::Card toolbar-->
                            <div class="card-toolbar">
                                <!--begin::Button-->
                                <button type="button" class="btn btn-sm btn-light-primary">
                                    <i class="ki-duotone ki-cloud-download fs-3">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                    </i>Download Report</button>
                                <!--end::Button-->
                            </div>
                            <!--end::Card toolbar-->
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body py-0">
                            <!--begin::Table wrapper-->
                            <div class="table-responsive">
                                <!--begin::Table-->
                                <table class="table align-middle table-row-dashed fw-semibold text-gray-600 fs-6 gy-5"
                                    id="kt_table_users_logs">
                                    <tbody>
                                        <tr>
                                            <td class="min-w-70px">
                                                <div class="badge badge-light-danger">500 ERR</div>
                                            </td>
                                            <td>POST /v1/invoice/in_6877_1633/invalid</td>
                                            <td class="pe-0 text-end min-w-200px">22 Sep 2023, 6:05 pm</td>
                                        </tr>
                                        <tr>
                                            <td class="min-w-70px">
                                                <div class="badge badge-light-danger">500 ERR</div>
                                            </td>
                                            <td>POST /v1/invoice/in_6877_1633/invalid</td>
                                            <td class="pe-0 text-end min-w-200px">25 Oct 2023, 11:30 am</td>
                                        </tr>
                                        <tr>
                                            <td class="min-w-70px">
                                                <div class="badge badge-light-success">200 OK</div>
                                            </td>
                                            <td>POST /v1/invoices/in_5648_7203/payment</td>
                                            <td class="pe-0 text-end min-w-200px">15 Apr 2023, 6:43 am</td>
                                        </tr>
                                        <tr>
                                            <td class="min-w-70px">
                                                <div class="badge badge-light-danger">500 ERR</div>
                                            </td>
                                            <td>POST /v1/invoice/in_6877_1633/invalid</td>
                                            <td class="pe-0 text-end min-w-200px">25 Oct 2023, 8:43 pm</td>
                                        </tr>
                                        <tr>
                                            <td class="min-w-70px">
                                                <div class="badge badge-light-success">200 OK</div>
                                            </td>
                                            <td>POST /v1/invoices/in_1431_5657/payment</td>
                                            <td class="pe-0 text-end min-w-200px">21 Feb 2023, 11:05 am</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!--end::Table-->
                            </div>
                            <!--end::Table wrapper-->
                        </div>
                        <!--end::Card body-->
                    </div>
                    <!--end::Card-->
                    <!--begin::Card-->
                    <div class="card pt-4 mb-6 mb-xl-9">
                        <!--begin::Card header-->
                        <div class="card-header border-0">
                            <!--begin::Card title-->
                            <div class="card-title">
                                <h2>Events</h2>
                            </div>
                            <!--end::Card title-->
                            <!--begin::Card toolbar-->
                            <div class="card-toolbar">
                                <!--begin::Button-->
                                <button type="button" class="btn btn-sm btn-light-primary">
                                    <i class="ki-duotone ki-cloud-download fs-3">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                    </i>Download Report</button>
                                <!--end::Button-->
                            </div>
                            <!--end::Card toolbar-->
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body py-0">
                            <!--begin::Table-->
                            <table class="table align-middle table-row-dashed fs-6 text-gray-600 fw-semibold gy-5"
                                id="kt_table_customers_events">
                                <tbody>
                                    <tr>
                                        <td class="min-w-400px">
                                            <a href="#" class="text-gray-600 text-hover-primary me-1">Melody
                                                Macy</a>has made payment to
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary">#XRS-45670</a>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">10 Mar 2023, 5:30 pm</td>
                                    </tr>
                                    <tr>
                                        <td class="min-w-400px">Invoice
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary me-1">#SEP-45656</a>status
                                            has changed from
                                            <span class="badge badge-light-warning me-1">Pending</span>to
                                            <span class="badge badge-light-info">In Progress</span>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">10 Nov 2023, 5:30 pm</td>
                                    </tr>
                                    <tr>
                                        <td class="min-w-400px">
                                            <a href="#" class="text-gray-600 text-hover-primary me-1">Max
                                                Smith</a>has made payment to
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary">#SDK-45670</a>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">10 Mar 2023, 11:30 am</td>
                                    </tr>
                                    <tr>
                                        <td class="min-w-400px">
                                            <a href="#" class="text-gray-600 text-hover-primary me-1">Brian
                                                Cox</a>has made payment to
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary">#OLP-45690</a>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">10 Nov 2023, 11:05 am</td>
                                    </tr>
                                    <tr>
                                        <td class="min-w-400px">
                                            <a href="#" class="text-gray-600 text-hover-primary me-1">Melody
                                                Macy</a>has made payment to
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary">#XRS-45670</a>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">20 Jun 2023, 6:43 am</td>
                                    </tr>
                                    <tr>
                                        <td class="min-w-400px">Invoice
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary me-1">#LOP-45640</a>has
                                            been
                                            <span class="badge badge-light-danger">Declined</span>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">25 Jul 2023, 5:30 pm</td>
                                    </tr>
                                    <tr>
                                        <td class="min-w-400px">Invoice
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary me-1">#SEP-45656</a>status
                                            has changed from
                                            <span class="badge badge-light-warning me-1">Pending</span>to
                                            <span class="badge badge-light-info">In Progress</span>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">21 Feb 2023, 8:43 pm</td>
                                    </tr>
                                    <tr>
                                        <td class="min-w-400px">Invoice
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary me-1">#DER-45645</a>status
                                            has changed from
                                            <span class="badge badge-light-info me-1">In Progress</span>to
                                            <span class="badge badge-light-primary">In Transit</span>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">25 Jul 2023, 10:10 pm</td>
                                    </tr>
                                    <tr>
                                        <td class="min-w-400px">
                                            <a href="#" class="text-gray-600 text-hover-primary me-1">Brian
                                                Cox</a>has made payment to
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary">#OLP-45690</a>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">10 Nov 2023, 9:23 pm</td>
                                    </tr>
                                    <tr>
                                        <td class="min-w-400px">
                                            <a href="#" class="text-gray-600 text-hover-primary me-1">Melody
                                                Macy</a>has made payment to
                                            <a href="#"
                                                class="fw-bold text-gray-900 text-hover-primary">#XRS-45670</a>
                                        </td>
                                        <td class="pe-0 text-gray-600 text-end min-w-200px">25 Oct 2023, 11:30 am</td>
                                    </tr>
                                </tbody>
                            </table>
                            <!--end::Table-->
                        </div>
                        <!--end::Card body-->
                    </div>
                    <!--end::Card-->
                </div>
                <!--end:::Tab pane-->


            </div>
            <!--end:::Tab content-->
        </div>
        <!--end::Content-->
    </div>
    <!--end::Layout-->




    <!--begin::Modal - Add auth app-->
    @include('pages.apps/user-management/users/modals/_add-auth-app')
    <!--end::Modal - Add auth app-->
    <!--begin::Modal - Add task-->
    @include('pages.apps/user-management/users/modals/_add-task')
    <!--end::Modal - Add task-->
    <!--end::Modals-->
    <script src="{{ asset('assets/plugins/global/plugins.bundle.js') }}"></script>
    <script>
        // Initialize BaguetteBox on page load
        baguetteBox.run('.gallery');

        // Initialize BaguetteBox with additional options on page load
        baguetteBox.run('.gallery', {
            captions: true,
            buttons: 'auto',
            animation: 'fadeIn',
        });

        // $(".kt_datepicker_2").flatpickr();

        $(document).ready(function() {
            function sendCardsToUser(date, card_id, user_id) {
                $.ajax({
                    type: "POST",
                    url: "{{ route('app-management.user.send_cart') }}",
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        date: date,
                        card_id: card_id,
                        user_id: user_id,
                    },
                    success: function(response) {
                        if (response.type == 'error') {
                            toastr.error(response.message);
                        }else{
                            toastr.success(response.message);
                        }
                    }
                });
            }
            $(".kt_datepicker_2").flatpickr({
                defaultDate: "today",
                altInput: true,
                altFormat: "F j, Y",
                dateFormat: "Y-m-d",
            });
            $('.send-card').click(function(e) {
                let date = $(this).closest('tr').find('.kt_datepicker_2').val();
                let card_id = $(this).data('card-id');
                let user_id = $(this).data('user-id');
                // Check if any of the variables is null, empty, or undefined
                if (!date || !card_id || !user_id) {
                    toastr.error("Date Field is Requied");
                } else {

                    sendCardsToUser(date, card_id, user_id)
                }

                e.preventDefault();

            });
        });
    </script>
</x-default-layout>
