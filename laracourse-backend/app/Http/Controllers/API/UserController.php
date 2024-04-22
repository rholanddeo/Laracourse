<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\ResetsPasswords;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $users = User::latest();

        // filter
        if (@$request['search']) {
            $users->where(function ($query) use ($request) {
                $query->where('name', 'like', '%' . $request['search'] . '%')
                ->orWhere('email', 'like', '%' . $request['search'] . '%');
            });
        }

        $users = $users->paginate($request['ordering'] ?? 10);

        // dd($users);

        return response()->json($users);
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
        // validation
        $validation = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);

        // if validation is fail
        if ($validation->fails()) {

            // return error response
            return response()->json([
                'errors' => $validation->errors(),
            ], 422);
        }

        // store to user
        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => $request->password,
        ]);

        // return response
        return response()->json([
            'message' => 'Successfully created user',
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // define query user by id
        $user = User::whereId($id)->first();

        // return if user not found
        if (!$user) {
            return response()->json([
                'message' => 'user not found'
            ], 404);
        }

        return response()->json($user);
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
    public function update(Request $request, $id)
    {
        // define query user by id
        $user = User::find($id);

        // return if user not found
        if (!$user) {
            return response()->json([
                'message' => 'user not found'
            ], 404);
        }

        // validation
        $validation = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
        ]);

        // if validation is fail
        if ($validation->fails()) {

            // return error response
            return response()->json([
                'errors' => $validation->errors(),
            ], 422);
        }

        // update user
        $user->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);

        return response()->json([
            'message' => 'Successfully updated user'
        ]);
    }

    public function updatePassword(Request $request, $id) {
        $user = User::find($id);

        // return if user not found
        if (!$user) {
            return response()->json([
                'message' => 'user not found'
            ], 404);
        }
        // validation
        $validation = Validator::make($request->all(), [
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);

        // if validation is fail
        if ($validation->fails()) {

            // return error response
            return response()->json([
                'errors' => $validation->errors(),
            ], 422);
        }

        // update user
        $user->update([
            'password' => $request->password,
        ]);

        return response()->json([
            'message' => 'Successfully updated user'
        ]);



    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        // define query user by id
        $user = User::find($id);

        // return if user not found
        if (!$user) {
            return response()->json([
                'message' => 'user not found'
            ], 404);
        }

        // delete user
        $user->delete();

        return response()->json([
            'message' => 'Successfully deleted user'
        ]);
    }
}
