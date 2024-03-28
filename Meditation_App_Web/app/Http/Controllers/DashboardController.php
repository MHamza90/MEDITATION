<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\User;
class DashboardController extends Controller
{
    public function index()
    {
        addVendors(['amcharts', 'amcharts-maps', 'amcharts-stock']);

        return view('pages.dashboards.index');
    }


    public function storeToken(Request $request)
    {
        auth()->user()->update(['device_token'=>$request->token]);
        return response()->json(['Token successfully stored.']);
    }

    public function webPush()
    {
        $url = 'https://fcm.googleapis.com/fcm/send';
        // $FcmToken = 'dvf14AsCSijPTpC4ec_U7-:APA91bEvYZ_9fXk_XEbW4_SuhC951ag7T2lJVodLs_EtoJhjS1K5OyUIw-5Qsvws5Pli8967b1CNcSk3QByPIjyyMM-egBajx3AgvClRO6kSlYMklBd5Fkl2J25ZtXaimuTYZLJOS2FT';
        $user =
        $FcmToken = User::where("id", auth()->id())->pluck('device_token');
        $serverKey = 'AAAATsrqWJg:APA91bELsHMM-fZm5kbkQiSw5kJMG8Iwzf-duitxNe7XPV0F3q5tUUIhzkojEA6bkqz6mfHuBnhYFlMEoZwYmVNz_J5d_1DKlpa4IkuYSlkC3lXictU-qF-5IWy79r4hafX7SejXLWCy';

        $data = [
            "registration_ids" => $FcmToken,
            "notification" => [
                "title" => "Hello",
                "body" => "Welcome",
            ]
        ];
        $encodedData = json_encode($data);

        $headers = [
            'Authorization:key=' . $serverKey,
            'Content-Type: application/json',
        ];

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
        // Disabling SSL Certificate support temporarly
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $encodedData);
        // Execute post
        $result = curl_exec($ch);

        if ($result === FALSE) {
            die('Curl failed: ' . curl_error($ch));
        }
        // Close connection
        curl_close($ch);
        // FCM response
        return redirect()->route('dashboard');
    }
}
