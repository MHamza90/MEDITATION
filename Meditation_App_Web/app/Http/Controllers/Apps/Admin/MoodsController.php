<?php

namespace App\Http\Controllers\Apps\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\Str;
use App\Models\Emotion;
class MoodsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Emotion::all();
        return view('pages.apps.admin.mood.index',compact('data'));
    }
    public function createSlug($slug){
        $slug = Str::slug($slug);
        $suffix = 1;
        while (Emotion::where('slug', $slug)->exists()) {
            $slug = Str::slug($slug . '-' . $suffix++);
        }
        return $slug;
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'lang' =>'required'
        ]);

        if($validator->fails()){
            return redirect()->back()->with(['type'=>'error','message'=>$validator->errors()->first()]);

        }

        try {
            $slug = $this->createSlug($request->name);
            Emotion::create([
                'name' => $request->name,
                'lang' => $request->lang,
                'slug' =>$slug
            ]);

            return redirect()->back()->with(['type' => 'success', 'message' => 'Data stored successfully']);
        } catch (\Throwable $e) {
            return redirect()->back()->with(['type' => 'error', 'message' => 'Something went wrong']);
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
        $data = Emotion::find($id);
        if (!isset($data)) {
            return redirect()->route('app-management.mood.index')->with(['message'=>'Data Not Found','type'=>'error']);
        }
        return view('pages.apps.admin.mood.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $data = Emotion::find($id);
                if (!isset($data)) {
                    return redirect()->route('app-management.mood.index')->with(['message'=>'Data Not Found','type'=>'error']);
                }
            if ($request->name) {
                $input['name']  = $request->name;
                $input['slug']  = $this->createSlug($request->name);
            }
            if ($request->lang) {
                $input['lang']  = $request->lang;

            }
            $data->update($input);

            return redirect()
            ->route('app-management.mood.index')
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
            $data = Emotion::find($id);
            if (!isset($data)) {
                return redirect()->route('app-management.mood.index')->with(['message'=>'Data Not Found','type'=>'error']);
            }
            $data->delete();
            return redirect()
                ->route('app-management.mood.index')
                ->with(['message'=>'Deleted Successfully','type'=>'success']);
        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
        }
    }

    public function change_status(Request $request)
    {
        try {
            //code...
            $statusChange = Emotion::where('id',$request->id)->update(['status'=>$request->status]);
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

