<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * Class JobSeeker
 *
 * @property int $id
 * @property string|null $name
 * @property string|null $email
 * @property string|null $password
 * @property string|null $phone
 * @property string|null $education
 * @property string|null $work_experience
 * @property string|null $language
 * @property int|null $skill_id
 * @property string|null $summary
 * @property string|null $cv
 * @property int $status
 *
 * @package App\Models
 */
class JobSeeker extends Authenticatable
{
    protected $table = 'job_seekers';
    public $timestamps = false;

    protected $casts = [
        'skill_id' => 'int',
        'status' => 'int'
    ];

    protected $hidden = [
        'password'
    ];

    protected $fillable = [
        'name',
        'email',
        'password',
        'phone',
        'education',
        'work_experience',
        'language',
        'skill_id',
        'summary',
        'cv',
        'status'
    ];


    protected $appends = ['skill'];


    public function getSkillAttribute()
    {
        return $this->belongsTo(Skill::class, 'skill_id')->first();
    }
}
