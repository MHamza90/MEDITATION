@foreach ($data['chat'] as $key => $item)

    @if ($item->sender_id == auth()->id())
        <!--begin::Message(out)-->
        <div class="d-flex justify-content-end mb-10">
            <!--begin::Wrapper-->
            <div class="d-flex flex-column align-items-end">
                <!--begin::User-->
                <div class="d-flex align-items-center mb-2">
                    <!--begin::Details-->
                    <div class="me-3">
                        <span class="text-muted fs-7 mb-1">{{ \Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</span>
                        <a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary ms-1">You</a>
                    </div>
                    <!--end::Details-->
                    <!--begin::Avatar-->
                    <div class="symbol symbol-35px symbol-circle">
                        <img alt="Pic" src="{{ asset($data['user']->avatar) }}" />
                    </div>
                    <!--end::Avatar-->
                </div>
                <!--end::User-->
                <!--begin::Text-->
                <div class="p-5 rounded bg-light-primary text-dark fw-bold mw-lg-400px text-end"
                    data-kt-element="message-text">{{ $item->message }}</div>
                <!--end::Text-->
            </div>
            <!--end::Wrapper-->
        </div>
        <!--end::Message(out)-->

    @else
        <!--begin::Message(in)-->
        <div class="d-flex justify-content-start mb-10">
            <!--begin::Wrapper-->
            <div class="d-flex flex-column align-items-start">
                <!--begin::User-->
                <div class="d-flex align-items-center mb-2">
                    <!--begin::Avatar-->
                    <div class="symbol symbol-35px symbol-circle">
                        <img alt="Pic" src="{{ asset($data['user']->avatar) }}" />
                    </div>
                    <!--end::Avatar-->
                    <!--begin::Details-->
                    <div class="ms-3">
                        <a href="#" class="fs-5 fw-bolder text-gray-900 text-hover-primary me-1">{{ isset($data['user']->first_name) ? $data['user']->first_name : $data['user']->name }}</a>
                        <span class="text-muted fs-7 mb-1">{{ \Carbon\Carbon::parse($item->created_at)->diffForHumans() }}</span>
                    </div>
                    <!--end::Details-->
                </div>
                <!--end::User-->
                <!--begin::Text-->
                <div class="p-5 rounded bg-light-info text-dark fw-bold mw-lg-400px text-start"
                    data-kt-element="message-text">{{ $item->message }}</div>
                <!--end::Text-->
            </div>
            <!--end::Wrapper-->
        </div>
        <!--end::Message(in)-->
    @endif
@endforeach
