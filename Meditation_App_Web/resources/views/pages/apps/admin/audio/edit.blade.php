<!-- resources/views/audios/edit.blade.php -->

<x-default-layout>

    @section('title')
        Edit Meditations Audio
    @endsection

    @section('breadcrumbs')
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">App Management</li>
                <li class="breadcrumb-item"><a href="{{ route('app-management.meditation-audio.index') }}">Meditations Audio</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Edit Meditations Audio</li>
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
                        <h2 class="fw-bold">Edit Meditations Audio</h2>
                    </div>
                </div>
                <!--end::Card header-->

                <!--begin::Content-->
                <div class="card-body py-4 mx-20">
                    <!--begin::Form-->
                    <form action="{{ route('app-management.meditation-audio.update', $data->id ?? '') }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        @method('PUT')


                        <input type="hidden" name="length" value="{{ $data->length }}" id="durationContainer">
                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="path">Audio
                                File</label>
                            <!--end::Label-->
                            <!--begin::Input-->
                            <input type="file" name="path" accept="audio/*"
                            class="form-control form-control-solid mb-3 mb-lg-0"
                            placeholder="Enter Audio Name" />
                            <!--end::Input-->
                        </div>
                        <audio controls>
                            <source src="{{ asset($data->path) }}" type="audio/mp3">
                            Your browser does not support the audio element.
                        </audio>

                        <!--begin::Input group-->
                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2" name="name">Name</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <input type="text" name="name" required
                                class="form-control form-control-solid mb-3 mb-lg-0"
                                placeholder="Enter Audio Name"  value="{{ $data->name }}"/>
                            <!--end::Input-->
                        </div>

                        <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2"
                                for="category_id">Category</label>
                            <!--end::Label-->

                            <!--begin::Input-->
                            <select name="category_id"
                                class="form-control form-control-solid mb-3 mb-lg-0">
                                @foreach ($category as $item)
                                    <option value="{{  $item->id }}" {{ $data->category_id == $item->id ? 'selected' : '' }}  value={{ $item->id ?? '' }}>{{ $item->name ?? '' }}</option>
                                @endforeach
                                <!-- Add more options as needed -->
                            </select>
                            <!--end::Input-->
                        </div>
                        {{-- <div class="fv-row mb-7">
                            <!--begin::Label-->
                            <label class="required fw-semibold fs-6 mb-2"
                                for="lang">Language</label>
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
                    <!--end::Input group-->
                </div>
                <!--end::Scroll-->

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
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var fileInput = document.querySelector('input[name="path"]');
            fileInput.addEventListener('change', function() {
                var selectedFile = fileInput.files[0];
                var audioElement = new Audio();
                audioElement.src = URL.createObjectURL(selectedFile);
                audioElement.addEventListener('loadedmetadata', function() {
                    var durationInSeconds = audioElement.duration;
                    document.getElementById('durationContainer').value = durationInSeconds.toFixed(2) ;
                });


                audioElement.preload = 'metadata';
            });
        });
    </script>
</x-default-layout>
