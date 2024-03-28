<!-- resources/views/audios/edit.blade.php -->

<x-default-layout>

    @section('title')
        Edit Review
    @endsection


    @section('breadcrumbs')
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="{{ route('app-management.products.index') }}">Product Management</a></li>
                <li class="breadcrumb-item"><a href="{{ route('app-management.review.index') }}">Review Management</a></li>
                <li class="breadcrumb-item " aria-current="page">Edit Review</li>
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
                        <h2 class="fw-bold">Edit Review</h2>
                    </div>
                </div>
                <!--end::Card header-->

                <!--begin::Content-->
                <div class="card-body py-4 mx-20">
                    <!--begin::Form-->
                    <form action="{{ route('app-management.review.update', $data['review']->id) }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        @method('PUT')


                        <input type="hidden" name="product_id" value="{{ $data['product']->id??null }}"/>
                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="name">Product Name</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="text" disabled class="form-control form-control-solid mb-3 mb-lg-0"
                                placeholder="Enter Product Name" value="{{ $data['product']->name??'' }}" />
                            <!--end::Input-->
                        </div>
                        <!--end::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="review">Review</label>
                            <!--end::Label-->
                            <textarea class="form-control form-control-solid mb-3 mb-lg-0" name="review" id="" cols="5" rows="5">{{ $data['review']->review }}</textarea>
                            <!--begin::Input-->


                            <!--end::Input-->
                        </div>
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="review">Review</label>
                            <!--end::Label-->
                            <select class="form-select form-select-solid"  data-kt-select2="true" data-close-on-select="true" data-placeholder="Select option" name="rating"  data-allow-clear="true">
                                @if (isset($data['review']->rating))

                                    <option @if ($data['review']->rating ==1) selected @endif value="1">1 Star</option>
                                    <option @if ($data['review']->rating ==2) selected @endif value="2">2 Star</option>
                                    <option @if ($data['review']->rating ==3) selected @endif value="3">3 Star</option>
                                    <option @if ($data['review']->rating ==4) selected @endif value="4">4 Star</option>
                                    <option @if ($data['review']->rating ==5) selected @endif value="5">5 Star</option>
                                @else
                                <option value="">Not Found</option>
                                @endif
                            </select>
                            <!--begin::Input-->


                            <!--end::Input-->
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
