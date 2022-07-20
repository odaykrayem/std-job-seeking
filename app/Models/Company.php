<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * Class Company
 *
 * @property int $id
 * @property string|null $email
 * @property string|null $password
 * @property string|null $company_name
 * @property string|null $company_address
 * @property string|null $company_details
 * @property int $status
 *
 * @package App\Models
 */
class Company extends Authenticatable
{
    protected $table = 'companies';
    public $timestamps = false;

    protected $casts = [
        'status' => 'int'
    ];

    protected $hidden = [
        'password'
    ];

    protected $fillable = [
        'email',
        'password',
        'company_name',
        'company_address',
        'company_details',
        'status'
    ];
}
