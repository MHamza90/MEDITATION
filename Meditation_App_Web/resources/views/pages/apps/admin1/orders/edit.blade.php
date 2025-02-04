<!-- resources/views/audios/edit.blade.php -->

<x-default-layout>

    @section('title')
        Edit BOT
    @endsection

    @section('breadcrumbs')
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">App Management</li>
                <li class="breadcrumb-item"><a href="{{ route('app-management.bot.index') }}">Postion Management</a></li>
                <li class="breadcrumb-item " aria-current="page">Edit Postion</li>
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
                        <h2 class="fw-bold">Edit Postion</h2>
                    </div>
                </div>
                <!--end::Card header-->

                <!--begin::Content-->
                <div class="card-body py-4 mx-20">
                    <!--begin::Form-->
                    <form action="{{ route('app-management.bot.update', $data->id??'') }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        @method('PUT')



                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="name">Name</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="text" name="name" class="form-control form-control-solid mb-3 mb-lg-0"
                                placeholder="Enter Title" value="{{ $data->name??'' }}" />
                            <!--end::Input-->
                        </div>
                        <!--end::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="amount">Amount</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="text" name="amount" id="amount"
                                class="form-control form-control-solid mb-3 mb-lg-0" placeholder="Enter Amount"
                                step="0.01" value="{{ $data->amount??'' }}" />

                            <!--end::Input-->
                        </div>

                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="amount">Mininum Amount</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="number" name="min_amount" id="amount"
                                class="form-control form-control-solid mb-3 mb-lg-0"
                                placeholder="Enter Mininum Amount" step="0.01" />
                            <!--end::Input-->
                        </div>
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="amount">Maximum Amount</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="number" name="max_amount" id="amount"
                                class="form-control form-control-solid mb-3 mb-lg-0"
                                placeholder="Enter Maximum Amount" step="0.01" />
                            <!--end::Input-->
                        </div>
                        <div class="fv-row mb-7">
                            <label class="form-label fs-6 fw-bolder text-gray-700">Tooltip</label>
                            <textarea name="description" class="form-control form-control-solid" rows="3" placeholder="Enter Requirement For Positions"></textarea>
                        </div>


                        <!--begin::Actions-->
                        <div class="text-center pt-10 mb-5">
                            <button type="submit" class="btn btn-primary">
                                <span class="indicator-label">Update</span>
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
                <!--end::Content-->
            </div>
            <!--end::Card-->
        </div>
        <!--end::Content container-->
    </div>
    <!--end::Content-->
</x-default-layout>
