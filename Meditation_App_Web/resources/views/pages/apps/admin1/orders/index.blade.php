<x-default-layout>

    @section('title')
        Orders Management
    @endsection
    @section('breadcrumbs')
        {{ Breadcrumbs::render('profit-management.index') }}
    @endsection
    <div id="kt_app_content" class="app-content  flex-column-fluid ">

        <div class="card main-card">
            <!--begin::Card header-->
            <div class="card-header border-0 pt-6">
                <!--begin::Card title-->
                <div class="card-title">
                    <!--begin::Search-->
                    <div class="d-flex align-items-center position-relative my-1">
                        <div class="d-flex align-items-center position-relative my-1">
                            {!! getIcon('rocket', 'fs-3 position-absolute ms-5') !!}
                            <select data-kt-user-table-filter="filter" class="form-select form-select-solid w-250px ps-13"
                                name="" id="give-all">
                                <option value="">Select All</option>
                                <option value="0">Pending All</option>
                                <option value="1">Approve All</option>
                                <option value="2">Reject All</option>
                                <!-- Add more options as needed -->
                            </select>
                        </div>
                        {{-- <button type="button" class="btn btn-sm btn-bg-dark btn-active-color-warning me-3"
                            id="pending_all">
                            {!! getIcon('arrow-up-down', 'fs-2', '', 'i') !!}
                            Pending All
                        </button>

                        <button type="submit" class="btn btn-sm btn-bg-light btn-active-color-primary me-3 "
                            id="approve_all">
                            {!! getIcon('check', 'fs-2', '', 'i') !!}
                            Approve All
                        </button>


                        <button type="button" class="btn btn-sm btn-danger me-3  " id="reject_all">
                            {!! getIcon('cross', 'fs-2', '', 'i') !!}
                            Reject All
                        </button> --}}


                    </div>
                    <!--end::Search-->


                </div>
                <!--begin::Card title-->

                <!--begin::Card toolbar-->
                {{-- <div class="card-toolbar">
                    <!--begin::Toolbar-->
                    <div class="d-flex justify-content-end">
                        <!--begin::Search-->
                        <div class="d-flex align-items-center position-relative my-1">
                            {!! getIcon('magnifier', 'fs-3 position-absolute ms-5') !!}
                            <input type="text" data-kt-user-table-filter="search"
                                class="form-control form-control-solid w-250px ps-13" placeholder="Search user"
                                id="mySearchInput" />
                        </div>
                        <!--end::Search-->
                    </div>
                    <!--end::Toolbar-->

                    <div class="d-flex justify-content-end">
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
                        <!--begin::Search-->
                        <!--end::Search-->
                    </div>
                    <div class="d-flex justify-content-end">
                        <div class="d-flex align-items-center position-relative my-1">
                            {!! getIcon('calendar-search', 'fs-3 position-absolute ms-5') !!}


                            <input class="form-control form-control-solid w-250px ps-13" placeholder="Pick date rage"
                                id="kt_daterangepicker_4" />
                        </div>
                        <!--begin::Search-->
                        <!--end::Search-->
                    </div>


                </div> --}}
                <div class="card-toolbar">
                    <div class="row gx-2 gy-2">
                        <!-- Search Input -->
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-text" id="basic-addon1">
                                    {!! getIcon('magnifier', 'fs-3') !!}
                                </span>
                                <input type="text" class="form-control" placeholder="Search user" id="mySearchInput">
                            </div>
                        </div>

                        <!-- Status Filter -->
                        <div class="col-md-4">
                            <div class="input-group">
                                <span class="input-group-text" id="basic-addon2">
                                    {!! getIcon('filter', 'fs-3') !!}
                                </span>
                                <select class="form-select" id="status_search">
                                    <option value="" selected>Select Status</option>
                                    <option value="pend">Pending</option>
                                    <option value="suc">Success</option>
                                    <option value="rej">Reject</option>
                                </select>
                            </div>
                        </div>

                        <!-- Date Range Picker -->
                        <div class="col-md-3">
                            <div class="input-group">
                                <span class="input-group-text" id="basic-addon3">
                                    {!! getIcon('calendar-search', 'fs-3') !!}
                                </span>
                                <input type="text" class="form-control" placeholder="Pick date range"
                                    id="kt_daterangepicker_4">
                            </div>
                        </div>

                        <!-- Search Button -->
                        <div class="col-md-1">
                            <div class="input-group">
                                <span class="input-group-text" id="advance-search">
                                    {!! getIcon('magnifier', 'fs-3') !!}
                                </span>
                            </div>

                        </div>
                    </div>
                </div>
                <!--end::Card toolbar-->
            </div>
            <input type="hidden" value="" id="start_data">
            <input type="hidden" value="" id="end_data">
            <!--end::Card header-->
            <div class="card mt-15" id="orders-list">
                @include('pages.apps.admin.orders.table.list')
            </div>
        </div>


    </div>



    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        let keyword = null;
        $(document).ready(function() {

            // Time Picker
            var start = moment();
            var end = moment();

            function cb(start, end) {
                $("#end_data").val(end.format("YYYY-MM-DD"));
                $("#start_data").val(start.format("YYYY-MM-DD"));

                $("#kt_daterangepicker_4").html(start.format("MMMM D, YYYY") + " - " + end.format("MMMM D, YYYY"));

            }


            $("#kt_daterangepicker_4").daterangepicker({
                startDate: start,
                endDate: end,
                ranges: {
                    "Today": [moment(), moment()],
                    "Yesterday": [moment().subtract(1, "days"), moment().subtract(1, "days")],
                    "Last 7 Days": [moment().subtract(6, "days"), moment()],
                    "Last 30 Days": [moment().subtract(29, "days"), moment()],
                    "This Month": [moment().startOf("month"), moment().endOf("month")],
                    "Last Month": [moment().subtract(1, "month").startOf("month"), moment().subtract(1,
                        "month").endOf("month")]
                }
            }, cb);

            cb(start, end);



        });
    </script>

    <script type="text/javascript">
        var APP_URL = {!! json_encode(url('/')) !!}

        function changeAllStatus(ids, status) {
            $.ajax({
                type: "POST",
                url: "{{ route('profit-management.all.change.status') }}",
                data: {
                    id: ids,
                    status: status,
                    _token: $('meta[name="csrf-token"]').attr(
                        'content') // Pass the CSRF token as a separate parameter
                },
                success: function(response) {

                    if (response.type == 'success') {
                        toastr.success(response.message);
                        location.reload();
                    }
                    if (response.type == 'error') {
                        toastr.error(response.message);
                    }
                },
                error: function(error) {

                    toastr.error(response.message);
                }

            });
        }
        $("#advance-search").click(function(e) {
            e.preventDefault();
            getProductData1()

        });

        function getProductData1() {
            var startDate = $('#start_data').val();
            var endDate = $('#end_data').val();
            var selected_status = $("#status_search").val();
            var keyword = $("#mySearchInput").val();

            $.ajax({
                type: "get",
                url: "{{ route('profit-management.advance.search') }}",
                data: {
                    startDate: startDate,
                    endDate: endDate,
                    selected_status: selected_status,
                    keyword: keyword,
                },
                success: function(response) {
                    $('#orders-list').html('');
                    $('#orders-list').html(response);
                }
            });
        }

        function getProductData() {


            $.ajax({
                type: "get",
                url: "{{ route('profit-management.index') }}",

                success: function(response) {
                    console.log(response);
                    $('#orders-list').html('');
                    $('#orders-list').html(response);
                }
            });
        }


        document.getElementById('give-all').addEventListener('change', function() {
            var idInputs = document.querySelectorAll('.id-input');
            var ids = Array.from(idInputs).map(function(input) {
                return input.value;
            });
            var selectedValue = this.value;
            Swal.fire({
                title: 'Are you sure?',
                text: 'You are about to change the status for all Item.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, change status!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Make the AJAX request
                    changeAllStatus(ids, selectedValue);
                }
            });


        });



        mySearchInput.addEventListener('input', function() {
            keyword = mySearchInput.value;


        });
        $(document).on('click', '.action-btn', function(e) {
            Swal.fire({
                title: 'Are you sure?',
                text: 'You are about to change the status.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, change status!'
            }).then((result) => {
                if (result.isConfirmed) {
                    var order_item_id= $(this).attr('data-id');
                    var order_item_status= $(this).attr('data-status');

                    $.ajax({
                        type: "POST",
                        url: "{{ route('profit-management.change.status') }}",
                        data: {
                            id: order_item_id,
                            status: order_item_status,
                            _token: $('meta[name="csrf-token"]').attr('content')
                        },
                        success: function(response) {
                            if (response.type == 'success') {
                                toastr.success(response.message);
                                getProductData1()
                            }
                            if (response.type == 'error') {
                                toastr.error(response.message);
                            }
                        },
                        error: function(error) {
                            toastr.error('An error occurred during the request.');
                        }
                    });
                }
            });
        });
    </script>
</x-default-layout>
