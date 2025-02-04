<x-default-layout>

    @section('title')
        Bot Management
    @endsection
    @section('breadcrumbs')
        {{ Breadcrumbs::render('app-management.bot.index') }}
    @endsection
    <div id="kt_app_content" class="app-content  flex-column-fluid ">

        <div class="card">
            <!--begin::Card header-->
            <div class="card-header border-0 pt-6">
                <!--begin::Card title-->
                <div class="card-title">
                    <!--begin::Search-->
                    <div class="d-flex align-items-center position-relative my-1">
                        <i class="ki-duotone ki-magnifier fs-3 position-absolute ms-5">
                            <span class="path1"></span><span class="path2"></span>
                        </i>
                        <input type="text" id="userSearchInput" class="form-control form-control-solid w-250px ps-13"
                            placeholder="Search Position" />
                    </div>
                    <!--end::Search-->
                </div>


                <!--begin::Separator-->
                <div class="separator border-gray-200"></div>
                <!--end::Separator-->
                @can('create bot management')
                    @if (!isset($data[3]))
                        <div class="px-7 py-5" data-kt-user-table-filter="form">

                            <!--begin::Add user-->
                            <button type="button" class="btn btn-hover-danger btn-icon" data-bs-toggle="modal"
                                data-bs-target="#kt_modal_add_user">

                                <span class="menu-icon">{!! getIcon('add-item', 'fs-2tx') !!}</span>

                            </button>
                            <!--end::Add user-->
                        </div>
                    @endif
                @endcan
                <!--begin::Content-->
                <!--end::Toolbar-->

                <!--begin::Group actions-->
                <div class="d-flex justify-content-end align-items-center d-none" data-kt-user-table-toolbar="selected">
                    <div class="fw-bold me-5">
                        <span class="me-2" data-kt-user-table-select="selected_count"></span> Selected
                    </div>

                    <button type="button" class="btn btn-danger" data-kt-user-table-select="delete_selected">
                        Delete Selected
                    </button>
                </div>
                <!--end::Group actions-->

                <!--begin::Modal - Adjust Balance-->
                <div class="modal fade" id="kt_modal_export_users" tabindex="-1" aria-hidden="true">
                    <!--begin::Modal dialog-->
                    <div class="modal-dialog modal-dialog-centered mw-650px">
                        <!--begin::Modal content-->
                        <div class="modal-content">
                            <!--begin::Modal header-->
                            <div class="modal-header">
                                <!--begin::Modal title-->
                                <h2 class="fw-bold">Export Users</h2>
                                <!--end::Modal title-->

                                <!--begin::Close-->
                                <div class="btn btn-icon btn-sm btn-active-icon-primary"
                                    data-kt-users-modal-action="close">
                                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span
                                            class="path2"></span></i>
                                </div>
                                <!--end::Close-->
                            </div>
                            <!--end::Modal header-->

                            <!--begin::Modal body-->
                            <div class="modal-body scroll-y mx-5 mx-xl-15 my-7">
                                <!--begin::Form-->
                                <form id="kt_modal_export_users_form" class="form"
                                    action="{{ route('app-management.bot.store') }}" method="POST"
                                    enctype="multipart/form-data">

                                    <div class="text-center">


                                        <button type="submit" class="btn btn-primary"
                                            data-kt-users-modal-action="submit">
                                            <span class="indicator-label">
                                                Submit
                                            </span>
                                            <span class="indicator-progress">
                                                Please wait... <span
                                                    class="spinner-border spinner-border-sm align-middle ms-2"></span>
                                            </span>
                                        </button>
                                    </div>
                                    <!--end::Actions-->
                                </form>
                                <!--end::Form-->
                            </div>
                            <!--end::Modal body-->
                        </div>
                        <!--end::Modal content-->
                    </div>
                    <!--end::Modal dialog-->
                </div>
                <!--end::Modal - New Card-->

                <!--begin::Modal - Add task-->
                <div class="modal fade" id="kt_modal_add_user" tabindex="-1" aria-hidden="true">
                    <!--begin::Modal dialog-->
                    <div class="modal-dialog modal-dialog-centered mw-650px">
                        <!--begin::Modal content-->
                        <div class="modal-content">
                            <!--begin::Modal header-->
                            <div class="modal-header" id="kt_modal_add_user_header">
                                <!--begin::Modal title-->
                                <h2 class="fw-bold">Add Position</h2>
                                <!--end::Modal title-->

                                <!--begin::Close-->
                                <div class="btn btn-icon btn-sm btn-active-icon-primary"
                                    data-kt-users-modal-action="close">
                                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span
                                            class="path2"></span></i>
                                </div>
                                <!--end::Close-->
                            </div>
                            <!--end::Modal header-->

                            <!--begin::Modal body-->
                            <div class="modal-body px-5 my-7">
                                <!--begin::Form-->
                                <form id="kt_modal_add_user_form" class="form"
                                    action="{{ route('app-management.bot.store') }}" method="POST"
                                    enctype="multipart/form-data">
                                    @csrf

                                    <!--begin::Scroll-->
                                    <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="kt_modal_add_user_scroll"
                                        data-kt-scroll="true" data-kt-scroll-activate="true"
                                        data-kt-scroll-max-height="auto"
                                        data-kt-scroll-dependencies="#kt_modal_add_user_header"
                                        data-kt-scroll-wrappers="#kt_modal_add_user_scroll"
                                        data-kt-scroll-offset="300px">


                                        <!--begin::Input group-->
                                        <div class="fv-row mb-7">
                                            <!--begin::Label-->
                                            <label class="required fw-semibold fs-6 mb-2" name="name">Name</label>
                                            <!--end::Label-->

                                            <!--begin::Input-->
                                            <input type="text" name="name"
                                                class="form-control form-control-solid mb-3 mb-lg-0"
                                                placeholder="Enter Name" />
                                            <!--end::Input-->
                                        </div>
                                        <div class="fv-row mb-7">
                                            <!--begin::Label-->
                                            <label class="required fw-semibold fs-6 mb-2" name="amount">Price</label>
                                            <!--end::Label-->

                                            <!--begin::Input-->
                                            <input type="number" name="amount" id="amount"
                                                class="form-control form-control-solid mb-3 mb-lg-0"
                                                placeholder="Enter Amount" step="0.01" />
                                            <!--end::Input-->
                                        </div>

                                        <div class="fv-row mb-7">
                                            <!--begin::Label-->
                                            <label class="required fw-semibold fs-6 mb-2" name="amount">Mininum
                                                Amount</label>
                                            <!--end::Label-->

                                            <!--begin::Input-->
                                            <input type="number" name="min_amount" id="amount"
                                                class="form-control form-control-solid mb-3 mb-lg-0"
                                                placeholder="Enter Minimum Amount" step="0.01" />
                                            <!--end::Input-->
                                        </div>
                                        <div class="fv-row mb-7">
                                            <!--begin::Label-->
                                            <label class="required fw-semibold fs-6 mb-2" name="amount">Maximum
                                                Amount</label>
                                            <!--end::Label-->

                                            <!--begin::Input-->
                                            <input type="number" name="max_amount" id="amount"
                                                class="form-control form-control-solid mb-3 mb-lg-0"
                                                placeholder="Enter Max Amount" step="0.01" />
                                            <!--end::Input-->
                                        </div>
                                        <div class="fv-row mb-7">
                                            <label class="form-label fs-6 fw-bolder text-gray-700">Tooltip</label>
                                            <textarea name="description" class="form-control form-control-solid" rows="3"
                                                placeholder="Enter Requirement For Positions"></textarea>
                                        </div>

                                        <!--end::Roles-->
                                    </div>
                                    <!--end::Input group-->
                            </div>
                            <!--end::Scroll-->

                            <!--begin::Actions-->
                            <div class="text-center pt-10 mb-5">


                                <button type="submit" class="btn btn-primary" data-kt-users-modal-action="submit">
                                    <span class="indicator-label">
                                        Submit
                                    </span>
                                    <span class="indicator-progress">
                                        Please wait... <span
                                            class="spinner-border spinner-border-sm align-middle ms-2"></span>
                                    </span>
                                </button>
                            </div>
                            <!--end::Actions-->
                            </form>
                            <!--end::Form-->
                        </div>
                        <!--end::Modal body-->
                    </div>
                    <!--end::Modal content-->
                </div>
                <!--end::Modal dialog-->
            </div>
            <!--end::Modal - Add task-->
            <div class="card-body py-4 mx-20">


                <table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_customers_table">
                    <thead>
                        <tr class="text-start text-gray-400 fw-bold fs-7 text-uppercase gs-0">
                            <th class="w-10px pe-2">
                                <div class="form-check form-check-sm form-check-custom form-check-solid me-3">
                                    <input class="form-check-input" type="checkbox" data-kt-check="true"
                                        data-kt-check-target="#kt_customers_table .form-check-input" value="1" />
                                </div>
                            </th>

                            <th class="min-w-125px">Name</th>
                            <th class="min-w-125px"> Price</th>
                            <th class="min-w-125px">Min Limit</th>
                            <th class="min-w-125px">Max Limit</th>
                            @can('write bot management')
                                <th class="min-w-125px">Status</th>
                            @endcan
                            @canany(['write bot management', 'delete bot management'])
                                <th class="text-end min-w-70px">Actions</th>
                            @endcanany
                        </tr>
                    </thead>
                    <tbody class="fw-semibold text-gray-600">
                        @isset($data)

                            @foreach ($data as $key => $item)
                                <tr>
                                    <td>
                                        <div class="form-check form-check-sm form-check-custom form-check-solid">
                                            <input class="form-check-input" type="checkbox" value="1" />
                                        </div>
                                    </td>

                                    <td>{{ $item->name ?? '' }}</td>
                                    <td> <span class="menu-icon">{!! getIcon('dollar', 'fs-2') !!}</span>{{ $item->amount ?? '' }}</td>
                                    <td><span class="menu-icon">{!! getIcon('dollar', 'fs-2') !!}</span>{{ $item->min_amount ?? '' }}</td>
                                    <td><span class="menu-icon">{!! getIcon('dollar', 'fs-2') !!}</span>{{ $item->max_amount ?? '' }}</td>
                                    @can('write bot management')
                                        <td>
                                            <div class="form-group">
                                                <div
                                                    class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                                                    <input type="checkbox" class="custom-control-input switch-input"
                                                        id="{{ $item->id }}" {{ $item->status == 1 ? 'checked' : '' }}>
                                                    <label class="custom-control-label" for="{{ $item->id }}"></label>
                                                </div>
                                            </div>
                                        </td>
                                    @endcan

                                    <td class="text-end">
                                        @can('write bot management')
                                            <form action="{{ route('app-management.bot.edit', $item->id) }}" method="get"
                                                style="display:inline">
                                                @csrf
                                                @method('PUT')
                                                <button type="submit" class="btn btn-hover-danger btn-icon">
                                                    <span class="menu-icon">{!! getIcon('notepad-edit', 'fs-2tx') !!}</span>
                                                </button>
                                            </form>
                                        @endcan
                                        @if ($key >= 5)
                                            @can('delete bot management')
                                                <form action="{{ route('app-management.bot.destroy', $item->id) }}"
                                                    method="post" style="display:inline">
                                                    @method('DELETE')
                                                    @csrf

                                                    <button type="submit" class="btn btn-hover-danger btn-icon">
                                                        <span class="menu-icon">{!! getIcon('trash', 'fs-2tx') !!}</span>
                                                    </button>
                                                </form>
                                            @endcan
                                        @endif
                                    </td>



                                </tr>
                            @endforeach
                        @endisset


                    </tbody>
                    <!--end::Table body-->
                </table>
                <!--end::Table-->

            </div>
            <!--end::Table-->
        </div>
    </div>
    <!--end::Card toolbar-->
    </div>
    <!--end::Card header-->
    </div>
    <!--end::Card-->
    </div>
    <!--end::Content container-->
    </div>
    <!--end::Content-->
    </div>
    <!--end::Menu 1-->


    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function() {
            // Function to filter the table based on the search input
            function filterTable() {
                var searchText = $('#userSearchInput').val().toLowerCase();

                $('#kt_table_users tbody tr').each(function() {
                    var titleText = $(this).find('td:eq(2)').text().toLowerCase();

                    if (titleText.includes(searchText)) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            }

            // Trigger the filter function when the search input changes
            $('#userSearchInput').on('input', function() {
                filterTable();
            });
        });
    </script>

    <script type="text/javascript">
        var APP_URL = {!! json_encode(url('/')) !!}

        $(".switch-input").change(function() {

            if (this.checked)
                var status = 1;
            else
                var status = 0;
            $.ajax({
                url: "{{ route('app-management.bot.change.status') }}",
                type: 'GET',
                /*dataType: 'json',*/
                data: {
                    'id': this.id,
                    'status': status
                },
                success: function(response) {
                    if (response) {
                        toastr.success(response.message);
                    } else {
                        toastr.error(response.message);
                    }
                },
                error: function(error) {
                    toastr.error("Some error occured!");
                }
            });
        });
    </script>
</x-default-layout>
