<?php 

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class Airport extends Model {

	protected $table = 'airports';

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['id','airport_name'];

	public static function getAirport(){
    	return DB::table('airports')->get();
    }

}