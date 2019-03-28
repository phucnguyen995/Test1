<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/home', 'FlightController@index');
Route::get('/', 'FlightController@index');

Route::get('/profile', 'UserController@profile');

Route::get('/flight-list', 'FlightController@searchFlightList');

Route::get('/flight-list-return', 'FlightController@searchFlightList_Return');

Route::get('/flight-detail', 'FlightController@flightDetail');

Route::get('/flight-detail-return', 'FlightController@flightDetail_Return');

Route::get('/index', 'FlightController@index');

Route::post('/flight-book', 'FlightBookController@getFlightBook');

Route::post('/postBooking', 'FlightBookController@postBooking');

Route::post('/detail-book-profile', 'FlightBookController@postDetail_book_profile');

Route::post('/update_user', 'UserController@update_user');

Route::get('/auth/login', 'LoginController@getLogin');

Route::post('/checkLogin', 'LoginController@checkLogin');

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);

