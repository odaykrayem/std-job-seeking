<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class JobVacancy
 *
 * @property int $id
 * @property int|null $company_id
 * @property string|null $job_position_title
 * @property int|null $skill_id
 * @property string|null $required_experience
 * @property string|null $work_type
 * @property string|null $work_time
 * @property string|null $salary_range
 *
 * @package App\Models
 */
class JobVacancy extends Model
{
    protected $table = 'job_vacancies';
    public $timestamps = false;

    protected $casts = [
        'company_id' => 'int',
        'skill_id' => 'int'
    ];

    protected $fillable = [
        'company_id',
        'job_position_title',
        'skill_id',
        'required_experience',
        'work_type',
        'work_time',
        'salary_range'
    ];


    protected $appends = ['skill', 'company'];


    public function getSkillAttribute()
    {
        return $this->belongsTo(Skill::class, 'skill_id')->first();
    }

    public function getCompanyAttribute()
    {
        return $this->belongsTo(Company::class, 'company_id')->first();
    }
}
