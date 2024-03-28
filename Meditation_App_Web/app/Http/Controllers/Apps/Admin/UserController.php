<?php

namespace App\Http\Controllers\Apps\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserTracker;
use App\Models\MeditationCard;
use App\Models\UserCard;
use Carbon\Carbon;
use Validator;
class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            //code...
            $data = User::where('role_id','user')->orderBy('is_verified')->paginate(100);
            return view('pages.apps.admin.user.index',compact('data'));
        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
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
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {

            $user = User::find($id);
            if (!isset($user)) {
                return redirect()->route('user-management.customer.index')->with(['message'=>'User not Found','type'=>'error']);
            }
             
            $data['tracker'] = UserTracker::with(['habit','execution'])->where('lang',$user->lang)->where('user_id',$user->id)->first();
            $data['cards'] = MeditationCard::where('lang',$user->lang)->paginate(10);
            return view('pages.apps.admin.user.show', compact('user','data'));

        } catch (\Throwable $th) {
            return redirect()->back()->with(['message'=>'Something went wrong','type'=>'error']);
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
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function customerSearch(Request $request){
        try {
            $search = $request->search;
            $data = User::where(function ($query) use ($search) {
                $query->where('name', 'like', '%' . $search . '%')
                    ->orWhere('email', 'like', '%' . $search . '%');
            })
            ->where('role_id','user')
            ->paginate(100);

            return view('pages.apps.admin.user.table.list',compact('data'));
        } catch (\Throwable $th) {
            return array('message'=>'Something went wrong','type'=>'error');

        }
    }

    public function change_status(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id' => 'required',

        ]);

        if ($validator->fails()) {
            return array('message'=>$validator->errors()->first(),'type'=>'error');

        }
        $statusChange = User::where('id',$request->id)->update(['is_verified'=>$request->status]);

        if($statusChange)
        {
            if ($request->status == 1) {
                # code...
                return array('message'=>'User Verified successfully','type'=>'success');
            }
            if ($request->status == 0) {
                # code...
                return array('message'=>'User UnVerified successfully','type'=>'success');
            }
        }else{
            return array('message'=>'User status has not changed please try again','type'=>'error');
        }

    }
    public function sendCard(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'card_id' => 'required',
            'user_id' => 'required',
            'date' => 'required',

        ]);

        if ($validator->fails()) {
            return array('message'=>$validator->errors()->first(),'type'=>'error');

        }
        try {

            $input = $request->except(['_token','date'],$request->all());
            $input['display_date'] = Carbon::createFromFormat('Y-m-d', $request->date);
            $check_card = UserCard::whereDate('display_date',$input['display_date'])
            ->where('card_id',$request->card_id)
            ->where('user_id',$request->user_id)
            ->first();
            $check_card_count = UserCard::whereDate('display_date',$input['display_date'])
            ->where('user_id',$request->user_id)
            ->count();
            // dd($check_card_count);
            if ($check_card_count >= 12) {
                return array('message'=>'Daily Cards Limit Exceeds','type'=>'error');
            }
            if (isset($check_card)) {
                return array('message'=>'This Card is Already Send To User','type'=>'error');
            }
            $add_card = UserCard::create($input);
            if($add_card)
            {
                return array('message'=>'Send Card Successfully','type'=>'success');

            }else{
                return array('message'=>'Something went wrong','type'=>'error');
            }
            # code...
        } catch (\Throwable $e) {
            return array('message'=>'Something went wrong','type'=>'error');
        }

    }
}
