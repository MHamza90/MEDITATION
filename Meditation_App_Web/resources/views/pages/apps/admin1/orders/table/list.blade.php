

    @if (isset($data[0]))
        @foreach ($data as $key => $item)
            {{-- @dd($item['user']['id']) --}}
            <!--begin::Card body-->
            <div class="card-body py-4 mx-20">
                <!--begin::Details-->
                <input type="hidden" class="id-input" name="ids[]" value="{{ $item['id'] }}">
                <div class="d-flex flex-wrap flex-sm-nowrap mb-6">
                    <!--begin::Image-->
                    @php
                        $img = $item['product']['image'] ?? 'documents/default.png';
                    @endphp
                    <div
                        class="d-flex flex-center flex-shrink-0 bg-light rounded w-100px h-100px w-lg-150px h-lg-150px me-7 mb-4">
                        <img class="mw-50px mw-lg-75px" src='{{ asset("$img") }}' alt="image" />
                    </div>
                    <!--end::Image-->

                    <!--begin::Wrapper-->
                    <div class="flex-grow-1">
                        <!--begin::Head-->
                        <div class="d-flex justify-content-between align-items-start flex-wrap mb-2">
                            <!--begin::Details-->
                            <div class="d-flex flex-column">
                                <!--begin::Status-->
                                @php
                                        $statusClass = $item['status'] == 0 ? 'warning' : ($item['status'] == 1 ? 'success' : 'danger');
                                        $statusText = $item['status'] == 0 ? 'In Progress' : ($item['status'] == 1 ? 'SUCCESS' : 'REJECT');
                                    @endphp
                                <div class="d-flex align-items-center mb-1">
                                    <a href="{{ route('app-management.products.edit',$item['product']['id']) }}"
                                        target="_blank"
                                        class="text-gray-800 text-hover-primary fs-2 fw-bold me-3">{{ $item['product']['name'] ?? '' }}</a>
                                    <span class="badge badge-light-{{ $statusClass  }} me-auto">{{ $statusText  }}</span>
                                </div>
                                <!--end::Status-->
                                <!--begin::Status-->
                                <div class="d-flex align-items-center mb-1">
                                    <a target="blank"
                                        href="{{ route('user-management.customer.show', $item['user']['id']) }}"
                                        target="_blank" rel="noopener noreferrer">
                                        <span
                                            class="me-auto fw-bold text-hover-primary">{{ \Str::upper($item['user']['email'] ?? '') }}</span>
                                    </a>

                                </div>

                                <!--end::Status-->
                            </div>



                            <!--end::Details-->
                            {{-- data-bs-toggle="modal"
                            data-bs-target="#kt_modal_3" --}}
                            <!--begin::Actions-->
                            <div class="d-flex mb-4">

                                <button type="button" class="btn btn-sm btn-bg-light btn-active-color-primary me-3 action-btn"
                                    data-status="1"
                                    data-id = {{ $item['id'] }}
                                    data-text="Approve">
                                    {!! getIcon('check', 'fs-2', '', 'i') !!}
                                    Approve
                                </button>
                                {{-- <a href="javascript:void(0);"
                                    class="btn btn-sm btn-bg-light btn-active-color-primary me-3 approve">Approve
                                </a> --}}
                                <button type="button" class="btn btn-sm btn-danger me-3 action-btn"
                                    data-status="2"
                                    data-id = {{ $item['id'] }} data-text="Reject">
                                    {!! getIcon('cross', 'fs-2', '', 'i') !!}
                                    Reject
                                </button>

                                <button type="button" class="btn btn-sm btn-bg-dark btn-active-color-warning me-3 action-btn"
                                    data-status="0"
                                    data-id = {{ $item['id'] }} data-text="Pending">
                                    {!! getIcon('arrow-up-down', 'fs-2', '', 'i') !!}
                                    Pending
                                </button>
                                {{-- <a href="javascript:void(0);" class="btn btn-sm btn-danger me-3 reject">Reject</a> --}}
                            </div>
                            <!--end::Actions-->
                        </div>
                        <!--end::Head-->

                        <!--begin::Info-->
                        <div class="d-flex flex-wrap justify-content-start">
                            <!--begin::Stats-->
                            <div class="d-flex flex-wrap">
                                <!--begin::Stat-->
                                <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                                    <!--begin::Number-->
                                    <div class="d-flex align-items-center">
                                        {!! getIcon('bitcoin', 'fs-1 text-info me-2') !!}
                                        <div class="fs-4 fw-bold"  >
                                            {{ $item['total_price'] ?? 0 }}
                                        </div>
                                    </div>
                                    <!--end::Number-->

                                    <!--begin::Label-->
                                    <div class="fw-semibold fs-6 text-gray-400">
                                        Invest
                                    </div>
                                    <!--end::Label-->
                                </div>
                                <!--end::Stat-->

                                <!--begin::Stat-->
                                <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                                    <!--begin::Number-->
                                    <div class="d-flex align-items-center">
                                        {!! getIcon('percentage', 'fs-1 text-success me-2') !!}
                                        <div class="fs-4 fw-bold"  >
                                            {{ $item['profit_per'] ?? 0 }}
                                        </div>
                                    </div>
                                    <!--end::Number-->

                                    <!--begin::Label-->
                                    <div class="fw-semibold fs-6 text-gray-400">
                                        Profit Percentage
                                    </div>
                                    <!--end::Label-->
                                </div>
                                <!--end::Stat-->

                                <!--begin::Stat-->
                                <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                                    <!--begin::Number-->

                                    <div class="d-flex align-items-center">
                                        {!! getIcon('graph-up', 'fs-3 text-success me-2') !!}
                                        <div class="fs-4 fw-bold" >
                                            {{ $item['total_profit'] ?? 0 }}
                                        </div>
                                    </div>
                                    <!--end::Number-->

                                    <!--begin::Label-->
                                    <div class="fw-semibold fs-6 text-gray-400">
                                        Total Profit
                                    </div>
                                    <!--end::Label-->
                                </div>
                                <!--end::Stat-->
                                <!--begin::Stat-->
                                <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                                    <!--begin::Number-->
                                    <div class="d-flex align-items-center">
                                        {!! getIcon('text-number', 'fs-3 text-success me-2') !!}
                                        <div class="fs-4 fw-bold"  >
                                             {{ $item['qty'] ?? 0 }}
                                        </div>
                                    </div>
                                    <!--end::Number-->

                                    <!--begin::Label-->
                                    <div class="fw-semibold fs-6 text-gray-400">
                                        Product Qty
                                    </div>
                                    <!--end::Label-->
                                </div>
                                <!--end::Stat-->
                                <!--begin::Stat-->
                                <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                                    <!--begin::Number-->
                                    <div class="d-flex align-items-center">
                                        {!! getIcon('arrow-up', 'fs-3 text-success me-2') !!}
                                        <div class="fs-4 fw-bold"  >
                                            {{ $item['product_unit_price'] ?? 0 }}
                                        </div>
                                    </div>
                                    <!--end::Number-->

                                    <!--begin::Label-->
                                    <div class="fw-semibold fs-6 text-gray-400">
                                        Unit Profit
                                    </div>
                                    <!--end::Label-->
                                </div>
                                <!--end::Stat-->
                                <!--begin::Stat-->
                                <div class="border border-gray-300 border-dashed rounded min-w-125px py-3 px-4 me-6 mb-3">
                                    <!--begin::Number-->
                                    <div class="d-flex align-items-center">
                                        {!! getIcon('profile-user', 'fs-3 text-success me-2') !!}
                                        <div class="fs-4 fw-bold"  >
                                            {{ $item['commission']['result'] ?? 0 }}
                                        </div>
                                    </div>
                                    <!--end::Number-->

                                    <!--begin::Label-->
                                    <div class="fw-semibold fs-6 text-gray-400">
                                        Commission
                                    </div>
                                    <!--end::Label-->
                                </div>
                                <!--end::Stat-->
                            </div>
                            <!--end::Stats-->
                        </div>
                        <!--end::Info-->
                    </div>
                    <!--end::Wrapper-->
                </div>
                <!--end::Details-->

                <div class="separator"></div>


            </div>


            <!--end::Card body-->
        @endforeach

        {{ $orders->links() }}
    @endif

