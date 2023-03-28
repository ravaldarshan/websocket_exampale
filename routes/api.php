<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Models\User;
use App\Http\Controllers\Auth\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    Route::post('/logout', [AuthController::class, 'logout']);
    return $request->user();
});

Route::post('/login', [AuthController::class, 'login']);

// Route::post('/add', function(Request $request){
//    $user=  User::find(1);
//    $user->name =$request->name;
//    $user->save();
//     // return $request->name;
// });
