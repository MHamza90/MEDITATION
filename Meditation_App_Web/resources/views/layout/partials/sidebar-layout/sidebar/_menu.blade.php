<!--begin::sidebar menu-->
<div class="app-sidebar-menu overflow-hidden flex-column-fluid">
    <!--begin::Menu wrapper-->
    <div id="kt_app_sidebar_menu_wrapper" class="app-sidebar-wrapper hover-scroll-overlay-y my-5" data-kt-scroll="true"
        data-kt-scroll-activate="true" data-kt-scroll-height="auto"
        data-kt-scroll-dependencies="#kt_app_sidebar_logo, #kt_app_sidebar_footer"
        data-kt-scroll-wrappers="#kt_app_sidebar_menu" data-kt-scroll-offset="5px" data-kt-scroll-save-state="true">
        <!--begin::Menu-->
        <div class="menu menu-column menu-rounded menu-sub-indention px-3 fw-semibold fs-6" id="#kt_app_sidebar_menu"
            data-kt-menu="true" data-kt-menu-expand="false">
            <!--begin:Menu item-->
            <div class="menu-item">
                <!--begin:Menu link-->
                <a class="menu-link {{ request()->routeIs('dashboard') ? 'active' : '' }}"
                    href="{{ route('dashboard') }}">
                    <span class="menu-icon">{!! getIcon('home', 'fs-2hx') !!}</span>
                    <span class="menu-title"> Dashboard</span>
                </a>
                <!--end:Menu link-->
            </div>

            <!--begin:Menu item-->
            <div class="menu-item pt-5">
                <!--begin:Menu content-->
                <div class="menu-content">
                    <span class="menu-heading fw-bold text-uppercase fs-7">App Modules</span>
                </div>
                <!--end:Menu content-->
            </div>
            <!--end:Menu item-->

            <div data-kt-menu-trigger="click"
                class="menu-item menu-accordion {{ request()->routeIs('app-management.*') ? 'here show' : '' }}">
                <!--begin:Menu link-->
                <span class="menu-link">
                    <span class="menu-icon">{!! getIcon('abstract-30', 'fs-2hx') !!}</span>
                    <span class="menu-title">App Management</span>
                    <span class="menu-arrow"></span>
                </span>
                <!--end:Menu link-->
                <!--begin:Menu sub-->

                <div class="menu-sub menu-sub-accordion">
                    <!--begin:Menu item-->
                    <div class="menu-item">
                        <!--begin:Menu link-->
                        <a class="menu-link {{ request()->routeIs('app-management.user.*') ? 'active' : '' }}"
                            href="{{ route('app-management.user.index') }}">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">User Management</span>
                        </a>
                        <!--end:Menu link-->
                    </div>
                    <!--end:Menu item-->
                </div>

                <div class="menu-sub menu-sub-accordion">
                    <!--begin:Menu item-->
                    <div class="menu-item">
                        <!--begin:Menu link-->
                        <a class="menu-link {{ request()->routeIs('app-management.category.*') ? 'active' : '' }}"
                            href="{{ route('app-management.category.index') }}">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Category</span>
                        </a>
                        <!--end:Menu link-->
                    </div>
                    <!--end:Menu item-->
                </div>
                <div class="menu-sub menu-sub-accordion">
                    <!--begin:Menu item-->
                    <div class="menu-item">
                        <!--begin:Menu link-->
                        <a class="menu-link {{ request()->routeIs('app-management.meditation-audio.*') ? 'active' : '' }}"
                            href="{{ route('app-management.meditation-audio.index') }}">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Meditation Audio</span>
                        </a>
                        <!--end:Menu link-->
                    </div>
                    <!--end:Menu item-->
                </div>
                <div class="menu-sub menu-sub-accordion">
                    <!--begin:Menu item-->
                    <div class="menu-item">
                        <!--begin:Menu link-->
                        <a class="menu-link {{ request()->routeIs('app-management.mood.*') ? 'active' : '' }}"
                            href="{{ route('app-management.mood.index') }}">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Emotions</span>
                        </a>
                        <!--end:Menu link-->
                    </div>
                    <!--end:Menu item-->
                    <!--begin:Menu item-->

                    <!--end:Menu item-->
                </div>

                <div class="menu-sub menu-sub-accordion">
                    <!--begin:Menu item-->
                    <div class="menu-item">
                        <!--begin:Menu link-->
                        <a class="menu-link {{ request()->routeIs('app-management.meditation-cards.*') ? 'active' : '' }}"
                            href="{{ route('app-management.meditation-cards.index') }}">
                            <span class="menu-bullet">
                                <span class="bullet bullet-dot"></span>
                            </span>
                            <span class="menu-title">Cards</span>
                        </a>
                        <!--end:Menu link-->
                    </div>
                    <!--end:Menu item-->
                    <!--begin:Menu item-->

                    <!--end:Menu item-->
                </div>


            </div>


            <!--begin:Menu item-->
            {{-- <div class="menu-item">
                <!--begin:Menu link-->
                <a class="menu-link {{ request()->routeIs('slider.*') ? 'active' : '' }}" href="{{ route('slider.index') }}">
                    <span class="menu-icon">{!! getIcon('rocket', 'fs-2') !!}</span>
                    <span class="menu-title">Sliders</span>
                </a>
                <!--end:Menu link-->
            </div> --}}
            <!--end:Menu item-->
            <!--begin:Menu item-->

        </div>
        <!--end::Menu-->
    </div>
    <!--end::Menu wrapper-->
</div>
<!--end::sidebar menu-->
