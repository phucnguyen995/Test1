<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class FlightBooking extends Model {

	protected $table = 'flight_booking';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['id','fb_user_id','fb_fl_to_id' ,'fb_fl_return_id', 'fb_class_id', 'fb_total_person', 'fb_total_cost_to', 'fb_total_cost_return', 'fb_time_book'];

    public function user()
    {
        return $this->hasOne('App\User', 'id', 'fb_user_id');
    }

    public function flight_to()
    {
        return $this->hasOne('App\FlightList', 'id', 'fb_fl_to_id');
    }

    public function flight_return()
    {
        return $this->hasOne('App\FlightList', 'id', 'fb_fl_return_id');
    }

    public static function getFlightBook_List($user_id)
    {
        return FlightBooking::where('fb_user_id', $user_id)->get();
    }

    public static function getFlightBook_Detail($book_id)
    {
        return FlightBooking::where('id', $book_id)->first();
    }
}
