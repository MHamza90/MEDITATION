<!-- resources/views/audios/edit.blade.php -->

<x-default-layout>
    @php
            $data_type = $data['type']??'';
            $type = str_replace('_', ' ', $data_type);
            $text = strtoupper($type);


    @endphp
    @section('title')
        {{$text??''}}
    @endsection

    @section('breadcrumbs')
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">App Management</li>
                <li class="breadcrumb-item"><a
                        href="{{ route('app-management.document.view', $data['type']) }}">{{ $text }}</a></li>

            </ol>
        </nav>
    @endsection

    <div id="kt_app_content" class="app-content flex-column-fluid">

        <!--begin::Content container-->
        <div id="kt_app_content_container" class="app-container container-xxl">

            <!--begin::Card-->
            <div class="card">
                <!--begin::Card header-->
                <div class="card-header border-0 pt-6">
                    <!--begin::Card title-->
                    <div class="card-title">
                        <h2 class="fw-bold">

                            {{ $text }}

                        </h2>
                    </div>
                    @can('write policies management')
                    <button type="button" class=" btn btn-hover-danger btn-icon" id="toggle-edit"
                        onclick="toggleEdit()">
                        <span class="menu-icon">{!! getIcon('notepad-edit', 'fs-2tx') !!}</span>
                    </button>
                    @endcan

                    <button type="button" class="btn btn-hover-danger d-none m-5" id="toggle-cancel"
                        onclick="toggleCancel()">
                        <span class="menu-icon">{!! getIcon('cross', 'fs-2tx') !!}</span>
                    </button>
                </div>
                <!--end::Card header-->
                {{-- $data['type'] --}}
                <!--begin::Content-->
                <div class="card-body py-4 mx-20">
                    <!--begin::Form-->
                    <form action="{{ route('app-management.document.edit', $data['type']) }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        @method('PUT')

                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->

                            <!--end::Label-->
                            <div class="pra_view_div">
                                {!! $data['content']?? '' !!}
                            </div>
                            <div class="d-none ck_edtor_div">
                                <textarea name="content" id="editor" class="editor form-control form-control-solid mb-3 mb-lg-0"
                                    placeholder="Enter Paragraph">{{ $data['content']?? '' }}</textarea>

                            </div>
                            <div class="input-group-append mt-10">

                                <button type="submit" class="btn btn-primary d-none" id="update-btn">
                                    <span class="indicator-label">Update</span>
                                    <span class="indicator-progress">
                                        Please wait... <span
                                            class="spinner-border spinner-border-sm align-middle ms-2"></span>
                                    </span>
                                </button>
                            </div>
                        </div>
                        <!--end::Input group-->
                    </form>
                    <!--end::Form-->
                </div>
                <!--end::Content-->
            </div>
            <!--end::Card-->
        </div>
        <!--end::Content container-->
    </div>
    <!--end::Content-->
    <script>
        function toggleEdit() {
            $('.ck_edtor_div').removeClass('d-none');
            $('.pra_view_div').addClass('d-none');

            // Show the cancel and update buttons
            $('#toggle-cancel, #update-btn').removeClass('d-none');

            // Hide the edit button and disable it
            $('#toggle-edit').addClass('d-none').prop('disabled', true);
        }

        function toggleCancel() {
            $('.ck_edtor_div').addClass('d-none');
            $('.pra_view_div').removeClass('d-none');

            // Show the edit button and hide the cancel and update buttons
            $('#toggle-edit').removeClass('d-none').prop('disabled', false);
            $('#toggle-cancel, #update-btn').addClass('d-none');
        }
    </script>

</x-default-layout>
