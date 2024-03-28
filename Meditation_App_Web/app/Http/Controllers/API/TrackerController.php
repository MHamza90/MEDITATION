<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\UserTracker;


use Illuminate\Support\Str;
use Hash;
use Validator;
use Carbon\Carbon;

use App\Http\Controllers\API\BaseController as BaseController;
class TrackerController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try{
            $user = auth()->user();
            $data = UserTracker::with(['habit','execution'])->where('lang',$user->lang)->where('user_id',$user->id)->first();
            if(!isset($data)){
                return $this->sendResponse([] , 'Tracker List');
            }
            return $this->sendResponse($data , 'Tracker List');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
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
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'execution_id' => 'required',
            'habit_id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first());
        }
        try{
            $user = auth()->user();
            $data = UserTracker::where('lang',$user->lang)->where('user_id',$user->id)->first();
            if(isset($data)){
                $item['name'] =$request->name;
                $item['execution_id'] =$request->execution_id;
                $item['habit_id'] =$request->habit_id;
                $data->update($item);
                return $this->sendResponse($data , 'Update Successfully');
            }
            $item['user_id'] =$user->id;
            $item['name'] =$request->name;
            $item['execution_id'] =$request->execution_id;
            $item['habit_id'] =$request->habit_id;
            UserTracker::create($item);
            return $this->sendResponse([] , 'Create Successfully');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try{
            $data = UserTracker::with(['habit','execution'])->find($id);
            if (!$data) {
                return $this->sendError('Tracker not found.');
            }

            return $this->sendResponse($data , 'Tracker');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
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
    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first());
        }
        try{
            $id = $request->id;
            $data = UserTracker::find($id);
            if (!$data) {
                return $this->sendError('Data not found.');
            }
            $item['name'] =$request->name??$data->name;
            $item['execution_id'] =$request->execution_id??$data->execution_id;
            $item['habit_id'] =$request->habit_id??$data->habit_id;
            $data->update($item);
            return $this->sendResponse([] , 'Update Successfully');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try{
            $data = UserTracker::find($id);
            if (!$data) {
                return $this->sendError('Data not found.');
            }
            $data->delete();
            return $this->sendResponse([] , 'Delete Successfully');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }
}
