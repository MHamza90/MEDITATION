<table class="table align-middle table-row-dashed fs-6 gy-5" id="kt_table_users">
    <thead>
        <tr class="text-start text-muted fw-bold fs-7 text-uppercase gs-0">
            <th class="w-10px pe-2">
                <div class="form-check form-check-sm form-check-custom form-check-solid me-3">
                    <input class="form-check-input" type="checkbox" data-kt-check="true"
                        data-kt-check-target="#kt_table_users .form-check-input" value="1" />
                </div>
            </th>
            <th class="min-w-125px">User</th>
            @can('write user management')
                <th class="min-w-125px">Verified</th>
            @endcan
            <th class="min-w-125px">Joined Date</th>
            @if (auth()->user()->can('write user management') ||
                            auth()->user()->can('delete user management'))
                <th class="text-end min-w-100px">Actions</th>
            @endif
        </tr>
    </thead>
    <tbody class="text-gray-600 fw-semibold users-table">


        @isset($data)

            @foreach ($data as $item)

                <tr>
                    <td>
                        <div class="form-check form-check-sm form-check-custom form-check-solid">
                            <input class="form-check-input" type="checkbox" value="1" />
                        </div>
                    </td>
                    <td class="d-flex align-items-center">
                        <!--begin:: Avatar -->
                        <div class="symbol symbol-circle symbol-50px overflow-hidden me-3">
                            <a href="{{ route('user-management.customer.show', $item->id) }}">
                                <div class="symbol-label fs-3 bg-light-danger text-danger">
                                    {{ \Str::upper(substr($item->name, 0, 1)) }} </div>
                            </a>
                        </div>
                        <!--end::Avatar-->
                        <!--begin::User details-->
                        <div class="d-flex flex-column">
                            <a href="{{ route('user-management.customer.show', $item->id) }}"
                                class="text-gray-800 text-hover-primary mb-1">
                                {{ \Str::upper($item->name ?? '' )}}</a>
                            <span>{{ $item->email ?? $item->phone_number }}</span>
                        </div>
                        <!--begin::User details-->
                    </td>
                    @can('write user management')
                        <td class=" align-items-center">
                            <div class="form-group">
                                <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                                    <input type="checkbox" class="custom-control-input switch-input" id="{{ $item->id }}"
                                        {{ $item->is_verified == 1 ? 'checked' : '' }}>
                                    <label class="custom-control-label" for="{{ $item->id }}"></label>
                                    <div
                                        class="badge-tag badge badge-light-{{ $item->is_verified == 1 ? 'success' : 'danger' }} fw-bold">
                                        {{ $item->is_verified == 1 ? 'VERIFIED' : 'UNVERIFIED' }}</div>
                                </div>
                            </div>
                        </td>
                    @endcan
                    <td>
                        <div class="badge badge-light fw-bold">
                            {{ \Carbon\Carbon::parse($item->created_at)->format('Y-m-d') }}
                        </div>
                    </td>


                    @if (auth()->user()->can('write user management') ||
                            auth()->user()->can('delete user management'))
                        <td class="text-end">
                            @can('write user management')
                                <a href="{{ route('user-management.customer.show', $item->id) }}" class="menu-link px-3">
                                    <span class="menu-icon">{!! getIcon('eye', 'fs-2tx') !!}</span>
                                </a>
                            @endcan
                        </td>
                    @endif
                </tr>
            @endforeach
        @endisset

    </tbody>
</table>
{!! $data->links() !!}
