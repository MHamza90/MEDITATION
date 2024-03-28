<?php

use App\Models\User;
use Diglactic\Breadcrumbs\Breadcrumbs;
use Diglactic\Breadcrumbs\Generator as BreadcrumbTrail;
use Spatie\Permission\Models\Role;

// Home
Breadcrumbs::for('home', function (BreadcrumbTrail $trail) {
    $trail->push('Home', route('dashboard'));
});

// Home > Dashboard
Breadcrumbs::for('dashboard', function (BreadcrumbTrail $trail) {
    $trail->parent('home');
    $trail->push('Dashboard', route('dashboard'));
});

// Home > Dashboard > User Management
Breadcrumbs::for('user-management.index', function (BreadcrumbTrail $trail) {
    $trail->parent('dashboard');
    $trail->push('User Management', route('user-management.users.index'));
});

// Home > Dashboard > User Management > Users
Breadcrumbs::for('user-management.users.index', function (BreadcrumbTrail $trail) {
    $trail->parent('user-management.index');
    $trail->push('Users', route('user-management.users.index'));
});

// Home > Dashboard > User Management > Users > [User]
Breadcrumbs::for('user-management.users.show', function (BreadcrumbTrail $trail, User $user) {
    $trail->parent('user-management.users.index');
    $trail->push(ucwords($user->name), route('user-management.users.show', $user));
});




// Home > Dashboard > User Management > Roles
Breadcrumbs::for('user-management.roles.index', function (BreadcrumbTrail $trail) {
    $trail->parent('user-management.index');
    $trail->push('Roles', route('user-management.roles.index'));
});

// Home > Dashboard > User Management > Roles > [Role]
Breadcrumbs::for('user-management.roles.show', function (BreadcrumbTrail $trail, Role $role) {
    $trail->parent('user-management.roles.index');
    $trail->push(ucwords($role->name), route('user-management.roles.show', $role));
});

// Home > Dashboard > User Management > Permission
Breadcrumbs::for('user-management.permissions.index', function (BreadcrumbTrail $trail) {
    $trail->parent('user-management.index');
    $trail->push('Permissions', route('user-management.permissions.index'));
});

Breadcrumbs::for('app-management.category.index', function (BreadcrumbTrail $trail) {
    $trail->parent('dashboard');
    $trail->push('App Management');
    $trail->push('Meditations Categories ', route('app-management.category.index'));
});

Breadcrumbs::for('app-management.meditation-audio.index', function (BreadcrumbTrail $trail) {
    $trail->parent('dashboard');
    $trail->push('App Management');
    $trail->push('Meditations Audios ', route('app-management.meditation-audio.index'));
});

Breadcrumbs::for('app-management.mood.index', function (BreadcrumbTrail $trail) {
    $trail->parent('dashboard');
    $trail->push('App Management');
    $trail->push('Emotions ', route('app-management.mood.index'));
});

Breadcrumbs::for('app-management.meditation-cards.index', function (BreadcrumbTrail $trail) {
    $trail->parent('dashboard');
    $trail->push('App Management');
    $trail->push('Meditations Categories ', route('app-management.meditation-cards.index'));
});
Breadcrumbs::for('app-management.user.index', function (BreadcrumbTrail $trail) {
    $trail->parent('dashboard');
    $trail->push('App Management');
    $trail->push('Customer', route('app-management.user.index'));
});

Breadcrumbs::for('app-management.user.show', function (BreadcrumbTrail $trail, User $user) {
    $trail->parent('dashboard');
    $trail->push('App Management');
    $trail->push(ucwords($user->name), route('app-management.user.show', $user));
});
// Breadcrumbs::for('support-management.index', function (BreadcrumbTrail $trail) {
//     $trail->parent('dashboard');
//     $trail->push('Support Management', route('support-management.index'));
// });
