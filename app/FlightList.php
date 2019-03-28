<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class FlightList extends Model {

	protected $table = 'flight_lists';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['id','fl_city_from_id', 'fl_city_to_id', 'fl_departure_date', 'fl_landing_date' , 'fl_airline_id', 'fl_class_id', 'fl_type', 'fl_return_date', 'fl_seat_limit', 'fl_total_seat' , 'fl_cost'];

	public function airline()
    {
        return $this->hasOne('App\airline', 'id','fl_airline_id');
    }

    public function flight_class()
    {
        return $this->hasMany('App\FlightClass');
    }

    public function transit()
    {
        return $this->belongsTo('App\Transit');
    }

    public function city_to()
    {
        return $this->hasOne('App\City', 'id', 'fl_city_to_id');
    }

    public function city_from()
    {
        return $this->hasOne('App\City', 'id', 'fl_city_from_id');
    }

    public static function getFlightList($from, $to)
    {
        return FlightList::where('fl_city_from_id', $from)
          ->where('fl_city_to_id', $to)->get();
    }

    public static function getFlightDetail($id)
    {
        return FlightList::where('id', $id)->first();
    }

    public static function update_price($date_book, $date_departure, $cost)
    {
        if ($date_departure - $date_book > (30*24*60*60))
        {
            $cost = $cost - ($cost * 0.05);
        }
        elseif ($date_departure - $date_book > 2*(30*24*60*60))
        {
            $cost = $cost - ($cost * 0.1);
        }
        elseif ($date_departure - $date_book > (14*24*60*60))
        {
             $cost = $cost + ($cost * 0.1);
        }
        elseif ($date_departure - $date_book > (7*24*60*60))
        {
             $cost = $cost + ($cost * 0.2);
        }
        elseif ($date_departure - $date_book > (24*60*60))
        {
             $cost = $cost + ($cost * 0.5);
        }
        else
        {
           $cost = $cost; 
        }
        return $cost;
    }

}
