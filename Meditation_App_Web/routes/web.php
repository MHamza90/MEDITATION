<?php

use App\Http\Controllers\Apps\PermissionManagementController;
use App\Http\Controllers\Apps\RoleManagementController;
use App\Http\Controllers\Apps\UserManagementController;
use App\Http\Controllers\Apps\WebsiteSettingController;
use App\Http\Controllers\Auth\SocialiteController;
use App\Http\Controllers\DashboardController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Apps\Admin\CategoriesController;
use App\Http\Controllers\Apps\Admin\MoodsController;
use App\Http\Controllers\Apps\Admin\MeditationAudioController;
use App\Http\Controllers\Apps\Admin\CardController;
use App\Http\Controllers\Apps\Admin\UserController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware(['auth'])->group(function () {

    Route::get('/', [DashboardController::class, 'index']);

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::post('/store-token', [DashboardController::class, 'storeToken'])->name('store.token');
    Route::get('/web-push', [DashboardController::class, 'webPush']);
    Route::get('/my-profile', [UserManagementController::class,'myProfile'])->name('myprofile');
    Route::get('/my-profile-update-email', [UserManagementController::class,'myProfileUpdateEmail'])->name('myprofileUpdateEmail');
    Route::get('/my-profile-update-name', [UserManagementController::class,'myProfileUpdateName'])->name('myprofileUpdateName');
    Route::get('/my-profile-update-password', [UserManagementController::class,'myProfileUpdatePassword'])->name('myprofileUpdatePassword');
    Route::resource('/website/setting',WebsiteSettingController::class);
    Route::name('app-management.')->group(function () {
        Route::resource('/category', CategoriesController::class);
        Route::get('categories-change-status', [CategoriesController::class,'change_status'])->name('category.change.status');
        Route::resource('/mood', MoodsController::class);
        Route::get('mood-change-status', [MoodsController::class,'change_status'])->name('mood.change.status');

        Route::resource('/meditation-audio', MeditationAudioController::class);
        Route::get('meditation-audio-change-status', [MeditationAudioController::class,'change_status'])->name('meditation-audio.change.status');
        Route::post('videos', [MeditationAudioController::class, 'storeAudio'])->name('audio.store');

        Route::resource('/meditation-cards', CardController::class);
        Route::get('meditation-cards-change-status', [CardController::class,'change_status'])->name('meditation-cards.change.status');

        Route::resource('/user', UserController::class);
        Route::get('user-change-status', [UserController::class,'change_status'])->name('user.change.status');
        Route::get('user-search', [UserController::class,'customerSearch'])->name('user.search');
        Route::post('send-card', [UserController::class,'sendCard'])->name('user.send_cart');
    });


});

Route::get('/error', function () {
    abort(500);
});

Route::get('/auth/redirect/{provider}', [SocialiteController::class, 'redirect']);

require __DIR__ . '/auth.php';
