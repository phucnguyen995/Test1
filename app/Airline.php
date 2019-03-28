<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Airline extends Model {

	protected $table = 'airlines';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['id','airline_name', 'airline_code'];

    public static function getAirline(){
    	return DB::table('airlines')->get();
    }

}
