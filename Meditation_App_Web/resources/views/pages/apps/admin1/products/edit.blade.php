<!-- resources/views/audios/edit.blade.php -->

<x-default-layout>

    @section('title')
        Edit Products
    @endsection

    @section('breadcrumbs')
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">App Management</li>
                <li class="breadcrumb-item"><a href="{{ route('app-management.products.index') }}">Product Management</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit Product</li>
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
                        <h2 class="fw-bold">Edit Product</h2>
                    </div>
                </div>
                <!--end::Card header-->

                <!--begin::Content-->
                <div class="card-body py-4 mx-20">
                    <!--begin::Form-->
                    <form action="{{ route('app-management.products.update', $data->id??'') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')

                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2">Product File</label>
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
                            <input type="text" name="name" class="form-control form-control-solid mb-3 mb-lg-0" placeholder="Enter Title" value="{{ $data->name??'' }}" />
                            <!--end::Input-->
                        </div>
                        <!--end::Input group-->

                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" for="description">Description</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <textarea name="description" id="editor" class="editor form-control form-control-solid mb-3 mb-lg-0"
                                placeholder="Enter Description">{{ $data->description??'' }}</textarea><!--end::Input-->
                        </div>
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" for="price">Price</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="number" name="price" id="price" class="form-control form-control-solid mb-3 mb-lg-0" placeholder="Enter Price" value="{{ $data->price??'' }}" step="any" />
                            <!--end::Input-->
                        </div>

                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" for="profit_per">Profit Percentage</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="number" name="profit_per" id="profit_per" value="{{ $data->profit_per??'' }}" class="form-control form-control-solid mb-3 mb-lg-0" placeholder="Enter Profit Percentage" step="0.01" min="0" max="100" />
                            <!--end::Input-->
                        </div>
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="qty">QTY</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="number" name="qty" class="form-control form-control-solid mb-3 mb-lg-0" placeholder="Enter qty" value="{{ $data->qty??'' }}" />
                            <!--end::Input-->
                        </div>
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="date">Availability Date</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="date" name="date" class="form-control form-control-solid mb-3 mb-lg-0" placeholder="Enter Date" value="{{ $data->date??'' }}" />
                            <!--end::Input-->
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
