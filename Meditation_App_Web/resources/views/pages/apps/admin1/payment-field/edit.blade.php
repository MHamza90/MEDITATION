<!-- resources/views/audios/edit.blade.php -->

<x-default-layout>

    @section('title')
        Edit Payment Method
    @endsection

    @section('breadcrumbs')
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">App Management</li>
                <li class="breadcrumb-item"><a href="{{ route('app-management.payment-method-list.index') }}">Payment Methods</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Edit Payment Method</li>
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
                        <h2 class="fw-bold">Edit Payment Method</h2>
                    </div>
                </div>
                <!--end::Card header-->

                <!--begin::Content-->
                <div class="card-body py-4 mx-20">
                    <!--begin::Form-->
                    <form action="{{ route('app-management.payment-method-list.update', $data->id??'') }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        @method('PUT')

                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2">Image File</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="file" name="image" class="form-control form-control-solid mb-3 mb-lg-0" />
                            <!--end::Input-->
                        </div>
                        <!--end::Input group-->

                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="name">Name</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="text" name="name" class="form-control form-control-solid mb-3 mb-lg-0"
                                placeholder="Enter Name" value="{{ $data->name??'' }}" />
                            <!--end::Input-->
                        </div>
                        <!--end::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2">Payment Type</label>
                            <!--end::Label-->

                            <!--begin::Dropdown-->
                            <select name="payment_type" class="form-select form-select-solid mb-3 mb-lg-0">
                                <option value="crypto_currency"
                                    {{ $data->payment_type === 'crypto_currency' ? 'selected' : '' }}>Crypto Currency
                                </option>
                                <option value="e- " {{ $data->payment_type === 'e- ' ? 'selected' : '' }}>E
                                </option>
                            </select>
                            <!--end::Dropdown-->
                        </div>
                        <!--end::Input group-->

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
