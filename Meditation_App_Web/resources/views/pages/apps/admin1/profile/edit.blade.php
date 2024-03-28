<x-default-layout>

    @section('title')
        My Profile
    @endsection

    @section('breadcrumbs')
        {{ Breadcrumbs::render('myprofile') }}
    @endsection

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
                            @if ($user->profile_photo_url)
                                <img src="{{ $user->profile_photo_url }}" alt="image" />
                            @else
                                <div
                                    class="symbol-label fs-3 {{ app(\App\Actions\GetThemeType::class)->handle('bg-light-? text-?', $user->name) }}">
                                    {{ substr($user->name, 0, 1) }}
                                </div>
                            @endif
                        </div>
                        <!--end::Avatar-->
                        <!--begin::Name-->
                        <a href="#"
                            class="fs-3 text-gray-800 text-hover-primary fw-bold mb-3">{{ $user->name }}</a>
                        <!--end::Name-->
                        <!--begin::Position-->
                        {{-- <div class="mb-9">
                            @foreach ($user->roles as $role)
                                <!--begin::Badge-->
                                <div class="badge badge-lg badge-light-primary d-inline">{{ ucwords($role->name) }}</div>
                                <!--begin::Badge-->
                            @endforeach
                        </div> --}}
                        <!--end::Position-->
                        <!--begin::Info-->
                        <!--begin::Info heading-->

                        <!--end::Info heading-->

                        <!--end::Info-->
                    </div>
                    <!--end::User Info-->
                    <!--begin::Details toggle-->
                    @can('read website management')

                        <div class="d-flex flex-stack fs-4 py-3">
                            <div class="fw-bold rotate collapsible" data-bs-toggle="collapse" href="#kt_user_view_details"
                                role="button" aria-expanded="false" aria-controls="kt_user_view_details">Details
                                <span class="ms-2 rotate-180">
                                    <i class="ki-duotone ki-down fs-3"></i>
                                </span>
                            </div>
                            @can('write website management')

                                <span data-bs-toggle="tooltip" data-bs-trigger="hover" title="Edit Website details">
                                    <a href="#" class="btn btn-sm btn-light-primary" data-bs-toggle="modal"
                                        data-bs-target="#kt_modal_website_update_details">Edit</a>
                                </span>
                            @endcan
                        </div>
                        <!--end::Details toggle-->
                        <div class="separator"></div>
                        <!--begin::Details content-->
                        <div id="kt_user_view_details" class="collapse show">
                            <div class="pb-5 fs-6">
                                <!--begin::Details item-->
                                <div class="fw-bold mt-5">Binance ID</div>
                                <div class="text-gray-600">{{ $website_details->binance_id }}</div>
                                <!--begin::Details item-->
                                <!--begin::Details item-->
                                <div class="fw-bold mt-5">Payment Address</div>
                                <div class="text-gray-600">
                                    {{ $website_details->payment_address }}
                                </div>
                                <div class="fw-bold mt-5">Deposit Service Charges %</div>
                                <div class="text-gray-600">
                                    {{ $website_details->deposit_service_charges }}<span class="bold">%</span>
                                </div>

                                <!--begin::Details item-->
                                <!--begin::Details item-->
                                <div class="fw-bold mt-5">QR Code</div>
                                <div class="text-gray-600 symbol symbol-200px  mb-7">
                                    <img src='{{ asset("$website_details->qr_code_image") }}'>
                                </div>


                            </div>
                        </div>
                        <!--end::Details content-->
                    @endcan


                </div>
                <!--end::Card body-->
            </div>
            <!--end::Card-->

        </div>
        <!--end::Sidebar-->
        <!--begin::Content-->
        <div class="flex-lg-row-fluid ms-lg-15">

            <!--end:::Tabs-->
            <!--begin:::Tab content-->
            <div class="tab-content" id="myTabContent">

                <!--begin:::Tab pane-->
                <div class="tab-pane fade show active" id="kt_user_view_overview_security" role="tabpanel">
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
                            <!--begin::Table wrapper-->
                            <div class="table-responsive">
                                <!--begin::Table-->
                                <table class="table align-middle table-row-dashed gy-5"
                                    id="kt_table_users_login_session">
                                    <tbody class="fs-6 fw-semibold text-gray-600">
                                        <tr>
                                            <td>Email</td>
                                            <td>{{ $user->email }}</td>
                                            <td class="text-end">
                                                <button type="button"
                                                    class="btn btn-icon btn-active-light-primary w-30px h-30px ms-auto"
                                                    data-bs-toggle="modal" data-bs-target="#kt_modal_update_email">
                                                    <i class="ki-duotone ki-pencil fs-3">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                    </i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Password</td>
                                            <td>******</td>
                                            <td class="text-end">
                                                <button type="button"
                                                    class="btn btn-icon btn-active-light-primary w-30px h-30px ms-auto"
                                                    data-bs-toggle="modal" data-bs-target="#kt_modal_update_password">
                                                    <i class="ki-duotone ki-pencil fs-3">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                    </i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Name</td>
                                            <td>{{ $user->name }}</td>
                                            <td class="text-end">
                                                <button type="button"
                                                    class="btn btn-icon btn-active-light-primary w-30px h-30px ms-auto"
                                                    data-bs-toggle="modal" data-bs-target="#kt_modal_update_role">
                                                    <i class="ki-duotone ki-pencil fs-3">
                                                        <span class="path1"></span>
                                                        <span class="path2"></span>
                                                    </i>
                                                </button>
                                            </td>
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


                </div>
                <!--end:::Tab pane-->

            </div>
            <!--end:::Tab content-->
        </div>
        <!--end::Content-->
    </div>
    <!--end::Layout-->
    <!--begin::Modals-->
    <!--begin::Modal - Update user details-->
    @include('pages.apps/user-management/users/modals/_update-website-details')
    <!--end::Modal - Update user details-->
    <!--begin::Modal - Update user details-->
    @include('pages.apps/user-management/users/modals/_update-details')
    <!--end::Modal - Update user details-->
    <!--begin::Modal - Add schedule-->
    @include('pages.apps/user-management/users/modals/_add-schedule')
    <!--end::Modal - Add schedule-->
    <!--begin::Modal - Add one time password-->
    @include('pages.apps/user-management/users/modals/_add-one-time-password')
    <!--end::Modal - Add one time password-->
    <!--begin::Modal - Update email-->
    @include('pages.apps/user-management/users/modals/_update-email')
    <!--end::Modal - Update email-->
    <!--begin::Modal - Update password-->
    @include('pages.apps/user-management/users/modals/_update-password')
    <!--end::Modal - Update password-->
    <!--begin::Modal - Update role-->
    @include('pages.apps/user-management/users/modals/_update-role')
    <!--end::Modal - Update role-->
    <!--begin::Modal - Add auth app-->
    @include('pages.apps/user-management/users/modals/_add-auth-app')
    <!--end::Modal - Add auth app-->
    <!--begin::Modal - Add task-->
    @include('pages.apps/user-management/users/modals/_add-task')
    <!--end::Modal - Add task-->
    <!--end::Modals-->
    <script>
        document.addEventListener('DOMContentLoaded', function() {

            const kt_modal_website_update_details = document.getElementById('kt_modal_website_update_details');
            const form = kt_modal_website_update_details.querySelector('#kt_modal_update_user_form11');
            const modal = new bootstrap.Modal(kt_modal_website_update_details);
            const cancelButton = kt_modal_website_update_details.querySelector('.close-model');

            cancelButton.addEventListener('click', e => {
                // Prevent the default action (e.g., form submission)

                modal.hide();
                // Show an alert when the cancel button is clicked
                // alert('aaaa');
            });

        });
    </script>
</x-default-layout>
