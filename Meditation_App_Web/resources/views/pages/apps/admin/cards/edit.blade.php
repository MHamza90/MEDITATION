<!-- resources/views/audios/edit.blade.php -->

<x-default-layout>

    @section('title')
        Edit Meditations Card
    @endsection

    @section('breadcrumbs')
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">App Management</li>
                <li class="breadcrumb-item"><a href="{{ route('app-management.meditation-cards.index') }}">Meditations Card</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Edit Meditations Card</li>
            </ol>
        </nav>
    @endsection
    {{-- @dd($data) --}}
    <div id="kt_app_content" class="app-content flex-column-fluid">

        <!--begin::Content container-->
        <div id="kt_app_content_container" class="app-container container-xxl">

            <!--begin::Card-->
            <div class="card">
                <!--begin::Card header-->
                <div class="card-header border-0 pt-6">
                    <!--begin::Card title-->
                    <div class="card-title">
                        <h2 class="fw-bold">Edit Meditations Card</h2>
                    </div>
                </div>
                <!--end::Card header-->

                <!--begin::Content-->
                <div class="card-body py-4 mx-20">
                    <!--begin::Form-->
                    <form action="{{ route('app-management.meditation-cards.update', $data->id ?? '') }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        @method('PUT')



                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="name">Card Name</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="text" name="name" class="form-control form-control-solid mb-3 mb-lg-0"
                                placeholder="Enter Mediraion Card Name" value="{{ $data->name??'' }}"  />
                            <!--end::Input-->
                        </div>


                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="description">Description</label>
                            <!--end::Label-->

                            <!--begin::solid autosize textarea-->
                            <div class="rounded border d-flex flex-column p-10">

                                <textarea name="description" class="form-control form-control form-control-solid" data-kt-autosize="true" >{{ $data->description??'' }}</textarea>
                            </div>
                            <!--end::solid autosize textarea-->

                        </div>

                        <div class="fv-row mb-7">

                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="task">CARD TASK</label>
                            <!--end::Label-->
                            <!--begin::solid autosize textarea-->
                            <div class="rounded border d-flex flex-column p-10">

                                <textarea name="task" class="form-control form-control form-control-solid" data-kt-autosize="true">{{ $data->task??'' }}</textarea>
                            </div>
                            <!--end::solid autosize textarea-->

                        </div>


                        {{-- <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" for="lang">Language</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <select name="lang" class="form-control form-control-solid mb-3 mb-lg-0">
                                <option value="en">English</option>
                                <option value="ru">Russian</option>
                                <!-- Add more options as needed -->
                            </select>
                            <!--end::Input-->
                        </div> --}}

                </div>

                <!--begin::Actions-->
                <div class="text-center pt-10 mb-5">
                    <button type="submit" class="btn btn-primary">
                        <span class="indicator-label">Update</span>
                        <span class="indicator-progress">
                            Please wait... <span class="spinner-border spinner-border-sm align-middle ms-2"></span>
                        </span>
                    </button>
                </div>
                <!--end::Actions-->
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
</x-default-layout>
