<?php

use App\Models\User;
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});


Route::get('chat', [App\Http\Controllers\HomeController::class, 'chat'])->name('chat');

Route::get('messages', [App\Http\Controllers\HomeController::class, 'messages'])
            ->name('messages');

Route::post('messages', [App\Http\Controllers\HomeController::class, 'messageStore'])
            ->name('messageStore');
// Route::post('/add', function(Request $request){


//     $user=  User::find(1);
//     $user->name = $request->name;
//     $user->save();
//      // return $request->name;
//  });
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
