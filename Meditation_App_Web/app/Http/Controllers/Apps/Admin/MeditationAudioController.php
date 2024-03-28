<?php

namespace App\Http\Controllers\Apps\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Audio;
use Illuminate\Support\Str;
use Validator;
use Illuminate\Support\Facades\Storage;

use Pion\Laravel\ChunkUpload\Exceptions\UploadMissingFileException;
use Pion\Laravel\ChunkUpload\Handler\AbstractHandler;
use Pion\Laravel\ChunkUpload\Handler\HandlerFactory;
use Pion\Laravel\ChunkUpload\Receiver\FileReceiver;
use Illuminate\Http\UploadedFile;
use File;
class MeditationAudioController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $data = Audio::with('category')->get();

            $category = Category::all();
            return view('pages.apps.admin.audio.index',compact('data','category'));
        } catch (\Throwable $e) {
            return redirect()->back()->with(['type' => 'error', 'message' => 'Something went wrong']);
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
        $validator = \Validator::make($request->all(), [

            'name' => 'required',
            'category_id' =>'required',
            'file' =>'required',
            'length' =>'required',

        ]);

        try {
            if ($validator->fails()) {
                return response()->json(['status' => false, 'message' => $validator->errors()->first()]);
            }
            $receiver = new FileReceiver('file', $request, HandlerFactory::classFromRequest($request));
            if ($receiver->isUploaded() === false) {
                throw new UploadMissingFileException();
            }
            $save = $receiver->receive();
            if ($save->isFinished()) {
                $response =  $this->saveFile($save->getFile(),$request->input('name'), $request->input('category_id'), $request->input('length'));

                File::deleteDirectory(storage_path('app/chunks/'));

                //your data insert code

                return redirect()->back()->with(['type' => 'success', 'message' => 'Data stored successfully']);
            }
        $handler = $save->handler();
        } catch (PostTooLargeException $e) {
            // Handle the PostTooLargeException here
            return redirect()->back()->with(['type' => 'error', 'message' => 'File size exceeds the maximum allowed limit.']);
        } catch (\Throwable $e) {
            // Handle other exceptions
            return redirect()->back()->with(['type' => 'error', 'message' => 'Something went wrong']);
        }

    }

    /**
 * Saves the file
 *
 * @param UploadedFile $file
 *
 * @return \Illuminate\Http\JsonResponse
 */
    protected function saveFile(UploadedFile $file,$name,$category_id,$length)
    {
        $fileName = $this->createFilename($file);
        $mime = str_replace('/', '-', $file->getMimeType());
        $filePath = "public/uploads/audios/";
        $file->move(base_path($filePath), $fileName);
        Audio::create([
            "name"=>$name,
            "category_id"=>$category_id,
            "length"=>$length,
            "path"=>'uploads/audios/'.$fileName
        ]);
        return [
            'link' => $filePath . $fileName,
            'mime_type' => $mime,
            'name' => $name,
            'category_id' => $category_id,
        ];
    }
    /**
     * Create unique filename for uploaded file
     * @param UploadedFile $file
     * @return string
     */
    protected function createFilename(UploadedFile $file)
    {
        $extension = $file->getClientOriginalExtension();
        $filename =  rand() . time() . "." . $extension;
        return $filename;
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $data = Audio::find($id);
        $category = Category::all();
        if (!isset($data)) {
            return redirect()->route('app-management.audio.index')->with(['message'=>'Data Not Found','type'=>'error']);
        }
        return view('pages.apps.admin.audio.edit', compact('data','category'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = Audio::find($id);
        $input = $request->except(['path','_token','_method'],$request->all());
        if($request->hasFile('path'))
        {
            $oldAvatarPath = auth()->user()->avatar;
            $img = time().'-'.Str::random(5).'-'.$request->file('path')->getClientOriginalName();
            $data['path'] = 'documents/upload/audio/'.$img;
            $request->path->move(public_path("documents/upload/audio"), $img);
        }

        $data->update($input);

        return redirect()
        ->back()
        ->with(['message'=>'Updated Successfully','type'=>'success']);
        try {
        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $data = Audio::find($id);
        if (!isset($data)) {
            return redirect()->route('app-management.audio.index')->with(['message'=>'Data Not Found','type'=>'error']);
        }
        $data->delete();
        return redirect()
            ->back()
            ->with(['message'=>'Deleted Successfully','type'=>'success']);
        try {
        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
        }
    }

    public function change_status(Request $request)
    {
        try {
            //code...
            $statusChange = Audio::where('id',$request->id)->update(['status'=>$request->status]);
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
