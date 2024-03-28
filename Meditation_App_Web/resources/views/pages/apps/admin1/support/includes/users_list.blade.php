@if (isset($data[0]))

    <input type="hidden" id="user-active-id" value="{{ $data[0]->id }}">
    <input type="hidden" id="user-active-name"
        value="{{ isset($data[0]->first_name) ? $data[0]->first_name : $data[0]->name }}">
    @foreach ($data as $item)
        <!--begin::User-->
        <div class="d-flex flex-stack py-4 user-click" data-id="{{ $item->id }}"
            data-name="{{ isset($item->first_name) ? $item->first_name : $item->name }}">
            <!--begin::Details-->
            <div class="d-flex align-items-center">
                <!--begin::Avatar-->
                <div class="symbol symbol-45px symbol-circle">

                    <img alt="Pic" src="{{ asset($item->avatar) }}" />
                </div>
                <!--end::Avatar-->
                <!--begin::Details-->

                <div class="ms-5">
                    <a href="{{ route('user-management.customer.show', $item->id) }}" target="blank"
                        class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">{{ isset($item->first_name) ? $item->first_name : $item->name }}</a>
                    <div class="fw-bold text-muted">{{ $item->email ?? $item->phone_number }}</div>
                </div>
                <!--end::Details-->
            </div>
            <!--end::Details-->
            <!--begin::Lat seen-->
            <div class="d-flex flex-column align-items-end ms-2">
                <span
                    class="text-muted fs-7 mb-1">{{ \Carbon\Carbon::parse($item->sender()->latest()->first()->created_at)->diffForHumans() }}</span>
                @if (isset($item->count) && $item->count > 0)
                    <span class="badge badge-sm badge-circle badge-light-success">{{ $item->count }}</span>
                @endif
            </div>
            <!--end::Lat seen-->
        </div>
        <!--end::User-->
        <!--begin::Separator-->
        <div class="separator separator-dashed d-none"></div>
        <!--end::Separator-->
    @endforeach
@endif
{{-- <!--begin::User-->
<div class="d-flex flex-stack py-4">
    <!--begin::Details-->
    <div class="d-flex align-items-center">
        <!--begin::Avatar-->
        <div class="symbol symbol-45px symbol-circle">
            <img alt="Pic" src="{{ asset('assets/media/avatars/300-12.jpg') }}" />
        </div>
        <!--end::Avatar-->
        <!--begin::Details-->
        <div class="ms-5">
            <a href="#"
                class="fs-5 fw-bolder text-gray-900 text-hover-primary mb-2">Max
                Smith</a>
            <div class="fw-bold text-muted">max@kt.com</div>
        </div>
        <!--end::Details-->
    </div>
    <!--end::Details-->
    <!--begin::Lat seen-->
    <div class="d-flex flex-column align-items-end ms-2">
        <span class="text-muted fs-7 mb-1">20 hrs</span>
    </div>
    <!--end::Lat seen-->
</div>
<!--end::User-->
<!--begin::Separator-->
<div class="separator separator-dashed d-none"></div>
<!--end::Separator--> --}}
