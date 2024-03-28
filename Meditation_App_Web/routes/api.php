<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\Auth\AuthController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\DiaryTrackerFlowController;
use App\Http\Controllers\API\TrackerController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::controller(AuthController::class)->group(function () {
    Route::POST('register', 'register');
    Route::POST('login', 'login');
    Route::post('google-login','googleLogin');
    Route::POST('verify-email', 'VerifyEmail');
    Route::POST('verify-email-code', 'VerifyEmailCode');
    Route::POST('update-password', 'updatePassword');
    Route::POST('verify-email-phone', 'checkEmailAndPhone');
    Route::POST('verify-otp', 'verifyOtp');
    Route::POST('send-code', 'sendCode');
    Route::POST('verify-invitation-code', 'verifyInvitationCode');

});


Route::middleware('auth:api')->group( function () {
    Route::controller(AuthController::class)->group(function () {
        Route::POST('update-profile', 'updateProfile');
    });

    Route::controller(UserController::class)->group(function () {

        Route::GET('ip', 'getIpAddressInfo');
        Route::GET('audios', 'getAudios');
        Route::GET('avatar-list', 'avatar');
        Route::GET('category-list', 'categories');
        Route::GET('execution', 'execution');
        Route::GET('habits', 'habits');
        Route::GET('del-account', 'accountDel');
        Route::GET('profile', 'profile');
        Route::POST('upload-profile-image', 'uploadProfileImage');
        Route::POST('change-password', 'changePassword');
    });

    Route::controller(DiaryTrackerFlowController::class)->group(function () {
        Route::GET('emotion-list', 'emotionList');
        Route::GET('entry-list', 'index');
        Route::POST('create-new-entry','store');
        Route::GET('show-new-entry/{id}','show');
        Route::POST('update-entry','update');
        Route::Delete('destroy-entry/{id}','destroy');
    });

    Route::controller(TrackerController::class)->group(function () {
        Route::GET('tracker-list', 'index');
        Route::POST('create-tracker','store');
        Route::GET('show-tracker/{id}','show');
        Route::POST('update-tracker','update');
        Route::Delete('destroy-tracker/{id}','destroy');
    });




});
// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
