<?php 

namespace App\Http\Controllers;
use DB;
use App\Http\Controllers\Controller;
use App\User;
use App\City;
use App\Airline;
use App\Airport;
use App\FlightClass;
use App\FlightList;
use App\FlightBooking;
use App\Transit;
use Validator;
use Request;
use Auth;

class UserController extends Controller {

	/**
	 * Display a listing of the resource.
	 *
	 * @return Response
	 */
	public function __construct()
	{
		$this->middleware('auth');
	}

	public function profile()
	{
		$user = Auth::user();

		$data['get_profile_fl'] = FlightBooking::getFlightBook_List($user->id);

		return view('/profile', ['data'=>$data]);
	}
	
	
	/**
	 * Update the specified resource in storage.
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function update_user()
	{
		$data = Request::all();
		$validatedData = Validator::make($data,[
			'first_name' => 'required|max:50',
			'last_name' => 'required|max:50',
			'email' => 'email|max:100|unique:users',
			'password' => 'confirmed|max:100|min:6',
			'phone' => 'required|regex:/(0)[0-9]/|max:11|min:10',
			'birthdate' => 'before:today',
			'address' => 'required|max:255',
		]);

		if ($validatedData->fails()) {
			return redirect()->back()->withInput()->withErrors($validatedData);
		}
		else
		{
			$user = Auth::user();
	        $user->first_name = $data['first_name'];
	        $user->last_name =  $data['last_name'];
			$user->gender = $data['gender'];
			$user->phone =  $data['phone'];
			$user->birthdate =  $data['birthdate'];
			$user->address =  $data['address'];

			if(!$data['password'] == ''){
				 $user->password = bcrypt($data['user_password']);
			}

			$user->save();
			return redirect('/profile')->with('success','Update successfully!');
		}
	}

	public function getLogin()
    {
    	return view('auth/login');;
    }


	public function checkLogin()
    {
    	$request = Request::all();

    	$email = $request['email'];
    	$password = $request['password'];
    	

    	if(Auth::attempt(['email'=>$email, 'password'=>$password ]))
    	{

    		return redirect()->route('/');
    	}
        else
        {
    		return redirect()->back()->withErrors('Login Fails');;
    	}
    }

}
