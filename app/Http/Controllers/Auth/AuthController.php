<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AuthController extends Controller
{
     /**
     * user login api
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function login(Request $request)
    {
        // return response([$request->all()],200);
        $validator = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 404);
        } else {
            $user = User::where('email', $request->email)->first();
            // return response($user->password);
            if (!$user || !Hash::check($request->password, $user->password)) {
                return response()->json(['message' => ['The credentials do not match.']], 404);
            }

            $token = $user->createToken($request->email)->plainTextToken;

            $response = [
                'message' => "login sucsses",
                'user' => $user,
                'token' => ''
            ];
            return response()->json([
                'message' => 'SUCCESS',
                'token' => $token,
            ], 200);
            // return response([
            //     'status'=> 200,
            //     'message'=> "login sucsses",
            //     'token' => $token
            // ], 200);
        }
    }
    /**
     * User logout.
     *delete user tokens
     */
    public function logout(Request $request)
    { 
        // return response($request->all());
        // return response($request->bearerToken());
        if ($request->User()) { 
            $request->User()->tokens()->delete();
            return response([
                'status' => '200',
                'message' => 'logout successfully',
                'text'=> $request->user()
            ]);
        } else {
            return response([
                'status' => '404',
                'message' => 'user tokens not macth'
            ]);
        }
    }
}
