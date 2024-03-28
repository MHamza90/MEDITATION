<x-default-layout>

    @section('title')
        Support Management
    @endsection
    @section('breadcrumbs')
        {{ Breadcrumbs::render('support-management.index') }}
    @endsection

    <div class="post d-flex flex-column-fluid" id="kt_post">
        <!--begin::Container-->
        <div id="kt_content_container" class="container-xxl">
            <!--begin::Layout-->
            <div class="d-flex flex-column flex-lg-row">
                <!--begin::Sidebar-->
                <div class="flex-column flex-lg-row-auto w-100 w-lg-300px w-xl-400px mb-10 mb-lg-0">
                    <!--begin::Contacts-->
                    <div class="card card-flush">
                        <!--begin::Card header-->
                        <div class="card-header pt-7" id="kt_chat_contacts_header">
                            <!--begin::Form-->
                            <form class="w-100 position-relative" autocomplete="off">
                                <!--begin::Icon-->
                                <!--begin::Svg Icon | path: icons/duotune/general/gen021.svg-->
                                <span
                                    class="svg-icon svg-icon-2 svg-icon-lg-1 svg-icon-gray-500 position-absolute top-50 ms-5 translate-middle-y">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none">
                                        <rect opacity="0.5" x="17.0365" y="15.1223" width="8.15546" height="2"
                                            rx="1" transform="rotate(45 17.0365 15.1223)" fill="black" />
                                        <path
                                            d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                            fill="black" />
                                    </svg>
                                </span>
                                <!--end::Svg Icon-->
                                <!--end::Icon-->
                                <!--begin::Input-->
                                <input type="text" class="form-control form-control-solid px-15" name="search"
                                    value="" placeholder="Search by username or email..." />
                                <!--end::Input-->
                            </form>
                            <!--end::Form-->
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body pt-5" id="kt_chat_contacts_body">
                            <!--begin::List-->
                            <div class="scroll-y me-n5 pe-5 h-200px h-lg-auto user-list-data d-none"
                                data-kt-scroll="true" data-kt-scroll-activate="{default: false, lg: true}"
                                data-kt-scroll-max-height="auto"
                                data-kt-scroll-dependencies="#kt_header, #kt_toolbar, #kt_footer, #kt_chat_contacts_header"
                                data-kt-scroll-wrappers="#kt_content, #kt_chat_contacts_body"
                                data-kt-scroll-offset="0px">

                                @include('pages.apps.admin.support.includes.users_list')

                            </div>
                            <!--end::List-->
                        </div>
                        <!--end::Card body-->
                    </div>
                    <!--end::Contacts-->
                </div>
                <!--end::Sidebar-->
                <!--begin::Content-->
                <div class="flex-lg-row-fluid ms-lg-7 ms-xl-10" id="messages-div">
                    <!--begin::Messenger-->
                    <div class="card" id="kt_chat_messenger">
                        <!--begin::Card header-->
                        <div class="card-header" id="kt_chat_messenger_header">
                            <!--begin::Title-->
                            <div class="card-title">
                                <!--begin::User-->
                                <div class="d-flex justify-content-center flex-column me-3">
                                    <a href="#" id="user-name-message-title"
                                        class="fs-4 fw-bolder text-gray-900 text-hover-primary me-1 mb-2 lh-1">Brian
                                        Cox</a>
                                    <!--begin::Info-->
                                    <div class="mb-0 lh-1">
                                        {{-- <span class="badge badge-success badge-circle w-10px h-10px me-1"></span>
                                        <span class="fs-7 fw-bold text-muted">Active</span> --}}
                                    </div>
                                    <!--end::Info-->
                                </div>
                                <!--end::User-->
                            </div>
                            <!--end::Title-->
                            <!--begin::Card toolbar-->
                            <div class="card-toolbar">

                            </div>
                            <!--end::Card toolbar-->
                        </div>
                        <!--end::Card header-->
                        <!--begin::Card body-->
                        <div class="card-body" id="kt_chat_messenger_body">
                            <!--begin::Messages-->
                            <div class="scroll-y me-n5 pe-5 h-300px h-lg-auto messages-list" data-kt-element="messages"
                                data-kt-scroll="true" data-kt-scroll-activate="{default: false, lg: true}"
                                data-kt-scroll-max-height="auto"
                                data-kt-scroll-dependencies="#kt_header, #kt_toolbar, #kt_footer, #kt_chat_messenger_header, #kt_chat_messenger_footer"
                                data-kt-scroll-wrappers="#kt_content, #kt_chat_messenger_body"
                                data-kt-scroll-offset="-2px">


                            </div>
                            <!--end::Messages-->
                        </div>
                        <!--end::Card body-->
                        <!--begin::Card footer-->
                        <div class="card-footer pt-4" id="kt_chat_messenger_footer">
                            <!--begin::Input-->
                            <textarea class="form-control form-control-flush mb-3" rows="1" data-kt-element="input" id="message-field"
                                placeholder="Type a message"></textarea>
                            <!--end::Input-->
                            <!--begin:Toolbar-->
                            <div class="d-flex flex-stack">
                                <!--begin::Actions-->
                                <div class="d-flex align-items-center me-2">

                                </div>
                                <!--end::Actions-->
                                <!--begin::Send-->
                                <button class="btn btn-primary" id="send-btn" type="button">Send</button>
                                <!--end::Send-->
                            </div>
                            <!--end::Toolbar-->
                        </div>
                        <!--end::Card footer-->
                    </div>
                    <!--end::Messenger-->
                </div>
                <!--end::Content-->
            </div>
            <!--end::Layout-->

        </div>
        <!--end::Container-->
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script>
        $(document).ready(function() {
            window.onload = function() {
                getUserList();

                setInterval(function() {
                    getUserList();
                }, 60000);
            };

            function scrollDown() {
                $(".messages-list").animate({
                    scrollTop: $(".messages-list")[0].scrollHeight
                }, 500);
            }

            function getUserList() {
                $.ajax({
                    type: "POST",
                    url: "{{ route('support-management.users') }}",
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function(response) {
                        $(".user-list-data").html("");
                        $(".user-list-data").html(response);
                        $(".user-list-data").removeClass('d-none')
                    },
                    complete: function() {
                        let user_name = $("#user-active-name").val();
                        let user_id = $("#user-active-id").val();
                        $("#user-name-message-title").text(user_name);

                        getUserConversation()
                    }
                });
            }

            function getUserConversation() {
                let id = $("#user-active-id").val();
                if (id > 0) {

                    $.ajax({
                        type: "POST",
                        url: "{{ route('support-management.conversation') }}",
                        data: {
                            id: id,
                            _token: $('meta[name="csrf-token"]').attr('content')
                        },
                        success: function(response) {

                            $(".messages-list").html("");
                            $(".messages-list").html(response);
                            scrollDown()
                        }
                    });
                }
            }



            $(document).on('click', '.user-click', function() {
                var id = $(this).attr('data-id');
                var name = $(this).attr('data-name');
                $("#user-active-id").val(id);
                $("#user-active-name").val(name);
                $("#user-name-message-title").text(name);
                getUserConversation()

            });
            $('#send-btn').click(function(e) {
                var id = $("#user-active-id").val();
                var message = $("#message-field").val();
                console.log(id);
                console.log(message);
                e.preventDefault();
                $.ajax({
                    type: "POST",
                    url: "{{ route('support-management.send.message') }}",
                    data: {
                        id: id,
                        message: message,
                        _token: $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function(response) {

                        if (response.type === "error") {
                            toastr.error(response.message);
                        }
                    },
                    complete: function() {
                        $("#message-field").val("")
                        getUserConversation()
                    },
                    error: function(error) {
                        toastr.error("Some error occured!");
                    }
                });
            });
        });
    </script>

</x-default-layout>
