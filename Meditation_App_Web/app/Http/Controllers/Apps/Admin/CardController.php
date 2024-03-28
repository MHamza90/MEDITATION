<?php

namespace App\Http\Controllers\Apps\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Validator;
use Illuminate\Support\Str;
use App\Models\MeditationCard;
use App\Models\User;
class CardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = MeditationCard::all();
        return view('pages.apps.admin.cards.index',compact('data'));
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
            'description' =>'required',
            'lang' =>'required',
            'task' =>'required',
        ]);

        if($validator->fails()){
            return redirect()->back()->with(['type'=>'error','message'=>$validator->errors()->first()]);

        }
        try {
            MeditationCard::create([
                'name' => $request->name,
                'description' => $request->description,
                'task' => $request->task,
                'lang' => $request->lang,
            ]);

            return redirect()->back()->with(['type' => 'success', 'message' => 'Data stored successfully']);
        } catch (\Throwable $e) {
            return redirect()->back()->with(['type' => 'error', 'message' => 'Something went wrong']);
        }
        // MeditationCard
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
        $users = User::where('role_id','user')->get();
        if (!isset($data)) {
            return redirect()->route('app-management.meditation-cards.index')->with(['message'=>'Data Not Found','type'=>'error']);
        }
        return view('pages.apps.admin.cards.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $data = MeditationCard::find($id);
                if (!isset($data)) {
                    return redirect()->route('app-management.meditation-cards.index')->with(['message'=>'Data Not Found','type'=>'error']);
                }

            if ($request->name) {
                $input['name']  = $request->name;
            }
            if ($request->description) {
                $input['description']  = $request->description;

            }
            if ($request->task) {
                $input['task']  = $request->task;

            }
            if ($request->lang) {
                $input['lang']  = $request->lang;

            }
            $data->update($input);

            return redirect()
            ->route('app-management.meditation-cards.index')
            ->with(['message'=>'Updated Successfully','type'=>'success']);
        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $data = MeditationCard::find($id);
            if (!isset($data)) {
                return redirect()->route('app-management.meditation-cards.index')->with(['message'=>'Data Not Found','type'=>'error']);
            }
            $data->delete();
            return redirect()
                ->route('app-management.meditation-cards.index')
                ->with(['message'=>'Deleted Successfully','type'=>'success']);
        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
        }
    }

    public function change_status(Request $request)
    {
        try {
            //code...
            $statusChange = MeditationCard::where('id',$request->id)->update(['status'=>$request->status]);
            if($statusChange)
            {
                return array('message'=>'Status has been changed successfully','type'=>'success');
            }else{
                return array('message'=>'Status has not changed please try again','type'=>'error');
            }
        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
        }

    }
}
