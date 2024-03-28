<table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_table_users">
    <thead>
        <tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
            <th class="w-10px pe-2">

            </th>
            <th class="min-w-125px">User</th>
            <th class="min-w-125px"></th>
            <th class="min-w-125px"></th>
            <th class="min-w-125px">Date</th>
            <th class="min-w-125px">Status</th>
            @can('write payment management')
                <th class="text-end min-w-100px">Actions</th>
            @endcan
        </tr>
    </thead>
    <tbody class="text-gray-600 fw-semibold users-table">


        @isset($data)

            @foreach ($data as $item)
                @php
                    $name = $item->user->first_name ?? ($item->user->name . ' ' . $item->user->last_name ?? '');

                @endphp
                <tr>
                    <td>

                    </td>
                    <td class="d-flex align-items-center">
                        <!--begin:: Avatar -->
                        <div class="symbol symbol-circle symbol-50px overflow-hidden me-3">
                            <a href="{{ route('user-management.customer.show', $item->id) }}">
                                <div class="symbol-label fs-3 bg-light-danger text-danger">
                                    {{ \Str::upper(substr($name, 0, 1)) }} </div>
                            </a>
                        </div>
                        <!--end::Avatar-->
                        <!--begin::User details-->
                        <div class="d-flex flex-column">
                            <a href="{{ route('user-management.customer.show', $item->user->id) }}"
                                class="text-gray-800 text-hover-primary mb-1">
                                {{ $name }}</a>
                            <span>{{ $item->user->email ?? '' }}</span>
                        </div>
                        <!--begin::User details-->
                    </td>
                    <td class="align-middle">
                        <div class="form-group">
                            <div
                                class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success bg-light p-3 rounded">
                                <p class="mb-2 h5 font-weight-bold text-info">Transaction Details</p>
                                <hr class="my-1 bg-primary">
                                <p class="mb-2 text-sucess"><strong>Amount:</strong> {{ $item->amount }}</p>
                                <p class="mb-2 text-danger"><strong>Service Charges:</strong> {{ $item->service_charges }}
                                </p>
                                <p class="mb-2 text-info"><strong>Total Amount:</strong> {{ $item->total_amount }}</p>
                            </div>
                        </div>
                    </td>

                    <td class="align-middle text-center">
                        <div class="form-group">
                            <div
                                class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success bg-light p-3 rounded">
                                <p class="mb-2 h5 font-weight-bold text-info">
                                    {{ $item->order_id != null ? 'Order Id' : 'Payment Prof' }}</p>
                                <hr class="my-1 bg-primary">
                                @if (isset($item->order_id))
                                    <p class="mb-2 font-weight-bold"> {{ $item->order_id }}</p>
                                @endif

                                @if (isset($item->payment_prof))
                                    <div class="text-gray-600 symbol symbol-200px mb-7">
                                        <article class='gallery'>

                                            <a href="{{ asset("$item->payment_prof") }}" data-caption=' ' class='item'
                                                title='Image'>

                                                <img src="{{ asset("$item->payment_prof") }}" alt="first image">
                                            </a>
                                        </article>
                                    </div>
                                @endif

                            </div>
                        </div>
                    </td>

                    <td>
                        <div class="badge badge-light fw-bold">
                            {{ \Carbon\Carbon::parse($item->created_at)->format('Y-m-d') }}
                        </div>
                    </td>
                    <td class=" align-items-center">
                        <div class="form-group">
                            <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">

                                @php
                                    $statusClass = $item->payment_status == 0 ? 'badge-warning' : ($item->payment_status == 1 ? 'badge-success' : 'badge-danger');
                                    $statusText = $item->payment_status == 0 ? 'PENDING' : ($item->payment_status == 1 ? 'SUCCESS' : 'REJECT');
                                @endphp

                                <div class="badge-tag badge {{ $statusClass }} fw-bold">{{ $statusText }}</div>
                            </div>
                        </div>
                    </td>
                    @can('write payment management')
                        <td class="text-end">
                            <select data-kt-user-table-filter="filter" data-id="{{ $item->id }}"
                                class="form-select form-select-solid w-200px ps-13 change_status">
                                @php
                                    $statuses = [
                                        0 => 'Pending',
                                        1 => 'Success',
                                        2 => 'Reject',
                                    ];
                                @endphp
                                @foreach ($statuses as $statusKey => $statusValue)
                                    @if ($item->payment_status == $statusKey)
                                        <option selected value="{{ $statusKey }}">{{ $statusValue }}</option>
                                    @else
                                        <option value="{{ $statusKey }}">{{ $statusValue }}</option>
                                    @endif
                                @endforeach
                                {{-- @if ($item->payment_status == 0)
                                    <option @if ($item->payment_status == 0) selected @endif>Pending</option>
                                    <option @if ($item->payment_status == 1) selected @endif value="1">Success</option>
                                    <option @if ($item->payment_status == 2) selected @endif value="2">Reject</option>
                                @endif
                                @if ($item->payment_status == 1)
                                    <option @if ($item->payment_status == 1) selected @endif>Success</option>
                                    <option @if ($item->payment_status == 2) selected @endif value="2">Reject</option>
                                @endif
                                @if ($item->payment_status == 2)
                                    <option @if ($item->payment_status == 0) selected @endif value="0">Pending</option>
                                    <option @if ($item->payment_status == 1) selected @endif value="1">Success</option>
                                    <option @if ($item->payment_status == 2) selected @endif value="2">Reject</option>
                                @endif --}}
                                <!-- Add more options as needed -->
                            </select>
                        </td>
                    @endcan
                </tr>
            @endforeach
        @endisset

    </tbody>
</table>
{!! $data->links() !!}
