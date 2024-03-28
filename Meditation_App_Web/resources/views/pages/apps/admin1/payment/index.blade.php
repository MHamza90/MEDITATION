<x-default-layout>

    @section('title')
        Payment Management
    @endsection
    @section('breadcrumbs')
        {{ Breadcrumbs::render('payment-management.deposit.index') }}
    @endsection
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/baguettebox.js@1.11.0/dist/baguetteBox.min.css">
    <script src="https://cdn.jsdelivr.net/npm/baguettebox.js@1.11.0/dist/baguetteBox.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        .gallery {
            box-shadow: 0 0.1rem 0 0 rgba(0, 0, 0, 0.1);
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
                <div class="card-toolbar">
                    <!--begin::Toolbar-->
                    <div class="d-flex justify-content-end">
                        <!--begin::Search-->
                        <div class="d-flex align-items-center position-relative my-1">
                            {!! getIcon('filter', 'fs-3 position-absolute ms-5') !!}
                            <select data-kt-user-table-filter="filter"
                                class="form-select form-select-solid w-250px ps-13" id="status_search">
                                <option value="">Select Status</option>
                                <option value="0">Pending</option>
                                <option value="1">Success</option>
                                <option value="2">Reject</option>
                                <!-- Add more options as needed -->
                            </select>
                        </div>
                        <!--end::Search-->
                    </div>
                    <!--end::Toolbar-->

                    <!--begin::Modal-->
                    <livewire:user.add-user-modal></livewire:user.add-user-modal>
                    <!--end::Modal-->
                </div>
                <!--end::Card toolbar-->
            </div>
            <!--end::Card header-->

            <!--begin::Card body-->
            <div class="card-body py-4">
                <!--begin::Table-->
                <div class="table-responsive">
                    <input type="hidden" value="{{ $lastSegment }}" id="payment_type">
                    @include('pages.apps.admin.payment.table.list')


                </div>
                <!--end::Table-->
            </div>
            <!--end::Card body-->
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script>
        $(document).ready(function() {
            // Initialize BaguetteBox on page load
            baguetteBox.run('.gallery');

            // Initialize BaguetteBox with additional options on page load
            baguetteBox.run('.gallery', {
                captions: true,
                buttons: 'auto',
                animation: 'fadeIn',
            });

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
                var status = $('#status_search').val();
                var payment_type = $("#payment_type").val();
                console.log(payment_type);
                $.ajax({
                    type: "get",
                    url: "{{ route('payment-management.payment.search') }}",
                    data: {
                        'search': searchText,
                        'status': status,
                        'payment_type': payment_type
                    },

                    success: function(response) {
                        if (response.type == "error") {

                        } else {

                            $("#kt_table_users").html('');
                            $("#kt_table_users").html(response);
                            baguetteBox.run('.gallery');
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
            $('#status_search').on('change', function() {

                var selectedValue = $(this).val();
                searchUser()

            });


            $(document).on('change', '.change_status', function() {
                var paymentId = $(this).data('id');
                var newStatus = $(this).val();
                var payment_type = $("#payment_type").val();


                $.ajax({
                    url: "{{ route('payment-management.update.payment.status') }}",
                    method: 'POST',
                    data: {
                        id: paymentId,
                        status: newStatus,
                        payment_type: payment_type,
                        _token: $('meta[name="csrf-token"]').attr(
                            'content') // Pass the CSRF token as a separate parameter
                    },
                    success: function(response) {
                        if (response.type == 'success') {
                            toastr.success(response.message);
                            searchUser()
                        }
                        if (response.type == 'error') {
                            toastr.error(response.message);
                        }
                    },
                    error: function(error) {

                        toastr.error(response.message);
                    }
                });
            });
        });
    </script>

    <script type="text/javascript">
        var APP_URL = {!! json_encode(url('/')) !!}

        $(".switch-input").change(function() {

            if (this.checked) {

                var status = 1;
                $(this).siblings(".badge-tag").removeClass("badge-light-danger");
                $(this).siblings(".badge-tag").addClass("badge-light-success");
                $(this).siblings(".badge-tag").text("VERIFIED");


            } else {
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
