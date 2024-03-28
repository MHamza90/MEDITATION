<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Validation\ValidationException;
use Illuminate\Validation\Rule;
use Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\File;
use Stevebauman\Location\Facades\Location;

use App\Models\User;
use App\Models\Category;
use App\Models\Habit;
use App\Models\Execution;
use App\Models\Audio;

use Illuminate\Support\Str;
use Hash;
use Carbon\Carbon;
class UserController extends BaseController
{


    public function categories()
    {
        try{
            $data = Category::where('lang','ru')->get();
            return $this->sendResponse($data , 'Category Data');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }
    public function getAudios()
    {
        try{
            $data = Audio::where('lang','ru')->get();
            return $this->sendResponse($data , 'Audio Data');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }
    public function execution()
    {
        try{
            $data = Execution::where('lang','ru')->get();
            return $this->sendResponse($data , 'Execution Data');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }
    public function habits()
    {
        try{
            $data = Habit::where('lang','ru')->get();
            return $this->sendResponse($data , 'Habit Data');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }
    public function getIpAddressInfo(Request $request)
    {

        $ipAddress = "127.0.0.11" === $request->ip() ? "103.11.220.0" : "109.168.128.0"	;
        $location = Location::get($ipAddress);

        $data['country'] = $location->countryName;
        $data['city'] = $location->cityName;
        $data['country_code'] = $location->countryCode;

         return $data;
    }
    public function avatarImages(){
        $data = [
            [
                'name'              => "image-1",
                'path'             => 'documents/avatars/image1.png',
            ],
            [
                'name'              => "image-2",
                'path'             => 'documents/avatars/image2.png',
            ],
            [
                'name'              => "image-3",
                'path'             => 'documents/avatars/image3.png',
            ],
            [
                'name'              => "image-4",
                'path'             => 'documents/avatars/image4.png',
            ],
            [
                'name'              => "image-5",
                'path'             => 'documents/avatars/image5.png',
            ],
            [
                'name'              => "image-6",
                'path'             => 'documents/avatars/image6.png',
            ],
            [
                'name'              => "image-7",
                'path'             => 'documents/avatars/image7.png',
            ],
            [
                'name'              => "image-8",
                'path'             => 'documents/avatars/image8.png',
            ],
            ];
        return $data;
    }

    public function avatar()
    {
        try{
            $data = $this->avatarImages();
            return $this->sendResponse($data , 'Avatar List');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }
    public function profile()
    {
        try{
            $user = auth()->user();
            return $this->sendResponse($user , 'Profile Data');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }
    public function uploadProfileImage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'avatar' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first());
        }
        try {
            if($request->hasFile('avatar'))
            {
                $oldAvatarPath = auth()->user()->avatar;
                $img = time().'-'.Str::random(5).'-'.$request->file('avatar')->getClientOriginalName();
                $data['avatar'] = 'documents/profile/'.$img;
                $request->avatar->move(public_path("documents/profile"), $img);
                auth()->user()->update(['avatar' => $data['avatar']]);


                // Remove Old Image From Path
                if ($oldAvatarPath && $oldAvatarPath !== 'documents/profile/default.png' && File::exists(public_path($oldAvatarPath))) {
                    File::delete(public_path($oldAvatarPath));
                }

            }
            return $this->sendResponse($data , 'Avatar Upload Successfully');
            // return $this->sendError('Failed to upload try again');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }

    public function accountDel(){

        $id =  auth()->id();
        try {
            $user = User::find($id);
            $user->delete();
            return $this->sendResponse($data =[],"Account Deleted Successfully");

        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }

    public function changePassword(Request $request){
        $user = auth()->user();
        $validator = Validator::make($request->all(), [
            'old_password' => [
                'required',
                function ($attribute, $value, $fail) use ($user) {
                    if (!Hash::check($value, $user->password)) {
                        $fail(__('The old password is incorrect.'));
                    }
                },
            ],
            'new_password' => 'required|different:old_password',
            'confirm_password' => 'required|same:new_password',
        ]);

        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first());
        }
        try {
            //code...
            $user->update([
                'password' => Hash::make($request->new_password),
            ]);

            return $this->sendResponse([],'Password updated successfully.');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }
}
