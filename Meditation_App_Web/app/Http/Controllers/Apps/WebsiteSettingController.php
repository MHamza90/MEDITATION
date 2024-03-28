<?php

namespace App\Http\Controllers\Apps;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\WebsiteSetting;
use Validator;

class WebsiteSettingController extends Controller
{
    function __construct()
    {
        //  $this->middleware('permission:read website management|create website management|write website management|delete website management', ['only' => ['index']]);
         $this->middleware('permission:read website management', ['only' => ['index']]);
         $this->middleware('permission:create website management', ['only' => ['store']]);
         $this->middleware('permission:write website management', ['only' => ['edit','update']]);
         $this->middleware('permission:delete website management', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'deposit_service_charges' => 'numeric|between:0,100',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->with(['type'=>'error','message'=>$validator->errors()->first()]);
            }
            $data = WebsiteSetting::first();
            if($request->hasFile('qr_code_image'))
            {

                if ($data->qr_code_image && $data->qr_code_image != "documents/qr/default.png") {
                    // Delete the existing image from the public folder
                    unlink(public_path($data->qr_code_image));
                }
                $img = time().$request->file('qr_code_image')->getClientOriginalName();
                $input['qr_code_image'] = "documents/qr/".$img;
                $request->qr_code_image->move(public_path("documents/qr/"), $img);
            }
            $input['binance_id'] = $request->binance_id??$data->binance_id;
            $input['payment_address'] = $request->payment_address??$data->payment_address;
            $input['deposit_service_charges'] = $request->deposit_service_charges??$data->deposit_service_charges;
            $data->update($input);

            return redirect()
            ->back()
            ->with(['message'=>'Setting Update Successfully','type'=>'success']);
        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

        $validator = Validator::make($request->all(), [
            'deposit_service_charges' => 'between:0,100',


        ]);

        if ($validator->fails()) {
            return redirect()->back()->with(['type'=>'error','message'=>$validator->errors()->first()]);
        }
        try {
            if($request->hasFile('qr_code_image'))
            {
                $img = time().$request->file('qr_code_image')->getClientOriginalName();
                $input['qr_code_image'] = "documents/qr/".$img;
                $request->qr_code_image->move(public_path("documents/qr/"), $img);
            }
            $data = WebsiteSetting::first();
            $input['binance_id'] = $request->binance_id??$data->binance_id;
            $input['payment_address'] = $request->payment_address??$data->payment_address;
            $data->update($input);

            return redirect()
            ->back()
            ->with(['message'=>'Setting Update Successfully','type'=>'success']);
        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
