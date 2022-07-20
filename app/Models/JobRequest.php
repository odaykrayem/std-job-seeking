<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class JobRequest
 *
 * @property int $id
 * @property int|null $job_id
 * @property int|null $job_seeker_id
 * @property int|null $status
 * @property Carbon|null $created_at
 *
 * @package App\Models
 */
class JobRequest extends Model
{
    protected $table = 'job_requests';
    public $timestamps = false;

    protected $casts = [
        'job_id' => 'int',
        'job_seeker_id' => 'int',
        'status' => 'int'
    ];

    protected $fillable = [
        'job_id',
        'job_seeker_id',
        'status'
    ];

    protected $appends = ['job', 'seeker'];


    public function getJobAttribute()
    {
        return $this->belongsTo(JobVacancy::class, 'job_id')->first();
    }

    public function getSeekerAttribute()
    {
        return $this->belongsTo(JobSeeker::class, 'job_seeker_id')->first();
    }
}
