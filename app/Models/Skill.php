<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Skill
 * 
 * @property int $id
 * @property string|null $skill
 *
 * @package App\Models
 */
class Skill extends Model
{
	protected $table = 'skills';
	public $timestamps = false;

	protected $fillable = [
		'skill'
	];
}
