<x-default-layout>

    @section('title')
        Dashboard
    @endsection

    @section('breadcrumbs')
        {{ Breadcrumbs::render('dashboard') }}
    @endsection

    <!--begin::Row-->
    <div class="row g-5 g-xl-10 mb-5 mb-xl-10">
        <!--begin::Col-->
        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-3 mb-md-5 mb-xl-10">
            @include('partials/widgets/cards/_widget-20')

            @include('partials/widgets/cards/_widget-7')
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-md-6 col-lg-6 col-xl-6 col-xxl-3 mb-md-5 mb-xl-10">
            @include('partials/widgets/cards/_widget-17')

            @include('partials/widgets/lists/_widget-26')
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-xxl-6">
            @include('partials/widgets/engage/_widget-10')
        </div>
        <!--end::Col-->
    </div>
    <!--end::Row-->

    <!--begin::Row-->
    <div class="row gx-5 gx-xl-10">
        <!--begin::Col-->
        <div class="col-xxl-6 mb-5 mb-xl-10">
            @include('partials/widgets/charts/_widget-8')
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-xl-6 mb-5 mb-xl-10">
            @include('partials/widgets/tables/_widget-16')
        </div>
        <!--end::Col-->
    </div>
    <!--end::Row-->

    <!--begin::Row-->
    <div class="row g-5 g-xl-10 mb-5 mb-xl-10">
        <!--begin::Col-->
        <div class="col-xxl-6">
            @include('partials/widgets/cards/_widget-18')
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-xl-6">
            @include('partials/widgets/charts/_widget-36')
        </div>
        <!--end::Col-->
    </div>
    <!--end::Row-->

    <!--begin::Row-->
    <div class="row g-5 g-xl-10 mb-5 mb-xl-10">
        <!--begin::Col-->
        <div class="col-xl-4">
            @include('partials/widgets/charts/_widget-35')
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-xl-8">
            @include('partials/widgets/tables/_widget-14')
        </div>
        <!--end::Col-->
    </div>
    <!--end::Row-->

    <!--begin::Row-->
    <div class="row gx-5 gx-xl-10">
        <!--begin::Col-->
        <div class="col-xl-4">
            @include('partials/widgets/charts/_widget-31')
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-xl-8">
            @include('partials/widgets/charts/_widget-24')
        </div>
        <!--end::Col-->
    </div>
    <!--end::Row-->
</x-default-layout>
<script src="https://www.gstatic.com/firebasejs/8.3.2/firebase.js"></script>
<script>
    var firebaseConfig = {
        apiKey: 'AIzaSyDDa2V2y5fDW_-bjarIwJ5FgqD0kPJJHkY',
        authDomain: 'peb-express.firebaseapp.com',
        databaseURL: 'https://338411804824.firebaseio.com',
        projectId: 'peb-express',
        storageBucket: 'peb-express.appspot.com',
        messagingSenderId: '338411804824',
        appId: '1:338411804824:web:8906d1b4c8c1db9b45d8ed',
        measurementId: 'G-P2VMRCV9LT',
    };
    firebase.initializeApp(firebaseConfig);
    const messaging = firebase.messaging();
    startFCM()
    function startFCM() {
        messaging
            .requestPermission()
            .then(function () {
                console.log(messaging.getToken());
                return messaging.getToken()
            })
            .then(function (response) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: '{{ route("store.token") }}',
                    type: 'POST',
                    data: {
                        token: response
                    },
                    dataType: 'JSON',
                    success: function (response) {
                        // alert('Token stored.');
                        console.log('Token stored.');
                    },
                    error: function (error) {
                        console.log('Error');
                    },
                });
            }).catch(function (error) {
                console.log(error);
                // alert(error);
            });
    }
    messaging.onMessage(function (payload) {
        const title = payload.notification.title;
        const options = {
            body: payload.notification.body,
            icon: payload.notification.icon,
        };
        new Notification(title, options);
    });
</script>
