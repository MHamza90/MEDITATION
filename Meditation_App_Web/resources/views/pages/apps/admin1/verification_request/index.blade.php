<x-default-layout>

    @section('title')
        Verification Request
    @endsection
    @section('breadcrumbs')
        {{ Breadcrumbs::render('user-management.customers.verification.request') }}
    @endsection
    <!--begin::Content-->
    <div id="kt_app_content" class="app-content  flex-column-fluid ">
        <div class="card">
            <!--begin::Card header-->
            <div class="card-header border-0 pt-6">
                <!--begin::Card title-->
                <div class="card-title">
                    <!--begin::Search-->

                    <div class="d-flex align-items-center position-relative my-1">
                        {!! getIcon('magnifier', 'fs-3 position-absolute ms-5') !!}
                        <input type="text" data-kt-user-table-filter="search"
                            class="form-control form-control-solid w-250px ps-13" placeholder="Search user"
                            id="mySearchInput" />
                    </div>
                    <!--end::Search-->
                </div>
                <!--begin::Card title-->

                <!--begin::Card toolbar-->
                {{-- <div class="card-toolbar">
                    <!--begin::Toolbar-->
                    <div class="d-flex justify-content-end" data-kt-user-table-toolbar="base">
                        <!--begin::Add user-->
                        @can('create user management')

                            <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#kt_modal_add_user">
                                {!! getIcon('plus', 'fs-2', '', 'i') !!}
                                Add User
                            </button>
                        @endcan
                        <!--end::Add user-->
                    </div>
                    <!--end::Toolbar-->

                    <!--begin::Modal-->
                    <livewire:user.add-user-modal></livewire:user.add-user-modal>
                    <!--end::Modal-->
                </div> --}}
                <!--end::Card toolbar-->
            </div>
            <!--end::Card header-->

            <!--begin::Card body-->
            <div class="card-body py-4">
                <!--begin::Table-->
                <div class="table-responsive">
                    @include('pages.apps.admin.verification_request.table.list')


                </div>
                <!--end::Table-->
            </div>
            <!--end::Card body-->
        </div>




        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function() {
                // Function to filter the table based on the search input
                function filterTable() {
                    var searchText = $('#mySearchInput').val().toLowerCase();

                    $('#kt_table_users tbody tr').each(function() {
                        var titleText = $(this).find('td:eq(2)').text().toLowerCase();

                        if (titleText.includes(searchText)) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                }

                function searchUser() {
                    var searchText = $('#mySearchInput').val().toLowerCase();

                    $.ajax({
                        type: "get",
                        url: "{{ route('user-management.customer.search') }}",
                        data: {
                            'search': searchText,
                        },

                        success: function (response) {
                            if (response.type == "error") {

                            }else{

                                $("#kt_table_users").html('');
                                $("#kt_table_users").html(response);
                            }

                        }
                    });
                 }

                // Trigger the filter function when the search input changes
                $('#mySearchInput').on('input', function() {
                    var searchText = $('#mySearchInput').val().toLowerCase();
                    searchUser()

                    // filterTable();
                });
            });
        </script>

        <script type="text/javascript">
            var APP_URL = {!! json_encode(url('/')) !!}

            $(".switch-input").change(function() {
                var currentElement = $(this);
                if (this.checked){

                    var status = 1;
                    $(this).siblings(".badge-tag").removeClass("badge-light-danger");
                    $(this).siblings(".badge-tag").addClass("badge-light-success");
                    $(this).siblings(".badge-tag").text("VERIFIED");


                }
                else{
                    var status = 0;
                    $(this).siblings(".badge-tag").addClass("badge-light-danger");
                    $(this).siblings(".badge-tag").removeClass("badge-light-success");
                    $(this).siblings(".badge-tag").text("UNVERIFIED");
                }
                $.ajax({
                    url: "{{ route('user-management.customer.change.status') }}",
                    type: 'GET',
                    /*dataType: 'json',*/
                    data: {
                        'id': this.id,
                        'status': status
                    },
                    success: function(response) {
                        if (response) {
                            toastr.success(response.message);
                            currentElement.closest('tr').remove();
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
