<?php

namespace App\Http\Controllers\API;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Emotion;
use App\Models\TrackerFlow;

use Illuminate\Support\Str;
use Hash;
use Validator;
use Carbon\Carbon;
class DiaryTrackerFlowController extends BaseController
{
    public function emotionList()
    {
        try{
            $user = auth()->user();
            $data = Emotion::where('lang',$user->lang)->active()->get();
            return $this->sendResponse($data , 'Emotions List');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try{
            $user = auth()->user();
            $data = TrackerFlow::where('user_id',$user->id)->get();
            return $this->sendResponse($data , 'Emotions List');
        } catch (\Throwable $th) {
            return $this->sendError('Something went wrong');
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mood_scale' => ['required'],
            'emotion_ids' => 'required|array|size:3',
            'tell_more' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError($validator->errors()->first());
        }
        try{

            $user = auth()->user();
            $item['user_id'] =$user->id;
            $item['mood_scale'] =$request->mood_scale;
            $item['emotion_ids'] =$request->emotion_ids;
            $item['tell_more'] =$request->tell_more;
            TrackerFlow::create($item);
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
            $data = TrackerFlow::find($id);
            if (!$data) {
                return $this->sendError('Entry not found.');
            }
            $emotions_user_list =json_decode($data['emotion_ids'], true);
            $data['emotions']= Emotion::whereIn('id',$emotions_user_list)->get();
            return $this->sendResponse($data , 'New Entry ');
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
            $data = TrackerFlow::find($id);
            if (!$data) {
                return $this->sendError('Data not found.');
            }
            $item['mood_scale'] =$request->mood_scale??$data->mood_scale;
            $item['emotion_ids'] =$request->emotion_ids??$data->emotion_ids;
            $item['tell_more'] =$request->tell_more??$data->tell_more;
            $data->update($item);
            return $this->sendResponse($data , 'Update Successfully');
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
            $data = TrackerFlow::find($id);
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
