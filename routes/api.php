<?php

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Validator;

/**login
 * @param String email
 * @param String password
 * @return JobSeeker /or/ company
 */
Route::post('/login', function (Request $request) {
    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'email' => 'required|email',
        'type' => 'required',
        'password' => 'required|min:8'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $type = $request->type;

    if ($type == '2' && auth('company')->attempt(['email' => $input['email'],
            'password' => $input['password']], false)) {


        $user = \App\Models\Company::where([
            'email' => $input['email']
        ])->first();


        $user->type = 1;

        return Response::json([
            'message' => 'User founded!',
            'data' => $user
        ], 200);
    }

    if ($type == '1' && auth('job_seeker')->attempt(['email' => $input['email'],
            'password' => $input['password']], false)) {


        $user = \App\Models\JobSeeker::where([
            'email' => $input['email']
        ])->first();

        $user->type = 0;

        return Response::json([
            'message' => 'User founded!',
            'data' => $user
        ], 200);
    }


    return Response::json([
        'message' => 'User not found!',
        'data' => ''
    ], 200);


});


/**register_company
 *
 * @param String name
 * @param String email
 * @param String phone
 * @param String password
 * @param String education
 * @param String work_experience
 * @param String language
 * @param String summary
 * @param String skill_id
 * @param String cv
 *
 * @return job_seeker
 */
Route::post('/register_job_seeker', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'name' => 'required',
        'email' => 'required|email|unique:job_seekers,email',
        'phone' => 'required',
        'password' => 'required',
        'education' => 'required',
        'work_experience' => 'required',
        'language' => 'required',
        'summary' => 'required',
        'skill_id' => 'required',
        'cv' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }


    $cv = '';
    $file_param = 'cv';
    if ($request->hasFile($file_param)) {
        $file_name = md5(time()) . '.' . $request->file($file_param)->getClientOriginalExtension();
        $request->file($file_param)->move(public_path('upload'), $file_name);
        $cv = 'upload/' . $file_name;
    }


    $data = new \App\Models\JobSeeker();
    $data->password = bcrypt($request->password);
    $data->email = $request->input('email');
    $data->name = $request->input('name');
    $data->phone = $request->input('phone');
    $data->education = $request->input('education');
    $data->work_experience = $request->input('work_experience');
    $data->language = $request->input('language');
    $data->summary = $request->input('summary');
    $data->skill_id = $request->input('skill_id');
    $data->status = rand(111111, 999999);
    $data->cv = $cv;
    $data->save();

    try {
        $email = $data->email;
        Mail::send('code', [
            'code' => $data->status
        ], function ($message) use ($email) {
            $message->to($email, 'Code')->subject
            ('Code');
            $message->from('std@scit.co', 'Code');
        });


        $msg = "Your Code is : " . $data->status;
        $msg = wordwrap($msg, 70);
        mail($email, "My Code", $msg);

    } catch (\Exception $ex) {
        \Log::info($ex->getMessage());
    }

    return Response::json([
        'message' => 'User Saved!',
        'data' => $data
    ], 200);

});

/**
 * update_job_seeker
 * @param int user_id /required
 * @param String name /optional
 * @param String nick_name /optional
 * @param String user_name /optional
 * @param String phone /optional
 * @param String study_type / optional
 * @param String study_place /optional
 * @param String end_study /optional
 * @param file cv /optional
 *
 * @return Student + boolean study_is_going :if end_study is not existed
 */


Route::post('/update_job_seeker', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'user_id' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }


    $cv = '';
    $file_param = 'cv';
    if ($request->hasFile($file_param)) {
        $file_name = md5(time()) . '.' . $request->file($file_param)->getClientOriginalExtension();
        $request->file($file_param)->move(public_path('upload'), $file_name);
        $cv = 'upload/' . $file_name;
    }


    $data = \App\Models\JobSeeker::where('id', $request->user_id)->first();
    $data->password = ($request->password && strlen($request->password) > 0) ? bcrypt($request->password) : $data->password;
    $data->email = $request->has('email') ? $request->input('email') : $data->email;
    $data->name = $request->has('name') ? $request->input('name') : $data->name;
    $data->phone = $request->has('phone') ? $request->input('phone') : $data->phone;
    $data->education = $request->has('education') ? $request->input('education') : $data->education;
    $data->work_experience = $request->has('work_experience') ? $request->input('work_experience') : $data->work_experience;
    $data->language = $request->has('language') ? $request->input('language') : $data->language;
    $data->summary = $request->has('summary') ? $request->input('summary') : $data->summary;
    $data->skill_id = $request->has('skill_id') ? $request->input('skill_id') : $data->skill_id;
    $data->cv = $request->has('cv') ? $cv : $data->cv;
    $data->update();

    return Response::json([
        'message' => 'User Saved!',
        'data' => $data
    ], 200);

});


/**register_company
 *
 * @param String email
 * @param String password
 * @param String name
 * @param String address
 * @param String details
 *
 * @return company
 */
Route::post('/register_company', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'name' => 'required',
        'email' => 'required|email|unique:companies,email',
        'address' => 'required',
        'details' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }


    $data = new \App\Models\Company();
    $data->password = bcrypt($request->password);
    $data->email = $request->input('email');
    $data->company_name = $request->input('name');
    $data->company_address = $request->input('address');
    $data->company_details = $request->input('details');
    $data->status = rand(111111, 999999);
    $data->save();

    try {
        $email = $data->email;
        Mail::send('code', [
            'code' => $data->status
        ], function ($message) use ($email) {
            $message->to($email, 'Code')->subject
            ('Code');
            $message->from('std@scit.co', 'Code');
        });


        $msg = "Your Code is : " . $data->status;
        $msg = wordwrap($msg, 70);
        mail($email, "My Code", $msg);

    } catch (\Exception $ex) {
        \Log::info($ex->getMessage());
    }

    return Response::json([
        'message' => 'User Saved!',
        'data' => $data
    ], 200);

});

/**update_company
 *
 * @param String name /optional/
 * @param String address /optional/
 * @param String details /optional/
 * @param String password /optional/
 *
 * @return company
 */

Route::post('/update_company', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'user_id' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $data = \App\Models\Company::where('id', $request->user_id)->first();
    $data->password = ($request->password && strlen($request->password) > 0) ? bcrypt($request->password) : $data->password;
    $data->email = $request->has('email') ? $request->input('email') : $data->email;
    $data->company_name = $request->has('name') ? $request->input('name') : $data->company_name;
    $data->company_address = $request->has('address') ? $request->input('address') : $data->company_address;
    $data->company_details = $request->has('details') ? $request->input('details') : $data->company_details;
    $data->update();

    return Response::json([
        'message' => 'User Saved!',
        'data' => $data
    ], 200);

});


/**get_jobs
 * no params
 *
 * @return list of job vacancies
 * each item has these info
 * -int id;
 * -String company_name //form companies table using company_id
 * -String job_position_title;
 * -String required_skill; //form skills table using skill_id
 * -String required_experience;
 * -String work_type;
 * -String work_time;
 * -String salary_range;
 */

Route::get('/get_job_opportunities', function (Request $request) {


    $data = \App\Models\JobVacancy::get();

    return Response::json([
        'message' => 'Found!',
        'data' => $data
    ], 200);

});

/**apply_job
 *
 * @param int job_seeker_id
 * @param int job_id
 *
 * @return status of api request
 */
Route::post('/apply_job', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'job_seeker_id' => 'required',
        'job_id' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }


    $data = new \App\Models\JobRequest();
    $data->job_seeker_id = $request->input('job_seeker_id');
    $data->job_id = $request->input('job_id');
    $data->save();

    return Response::json([
        'message' => 'Saved!',
        'data' => $data
    ], 200);

});


/**get_job_applications
 *note: Job Request which were requested by job_seeker:
 * @param int job_seeker_id
 *
 * @return list of job_requests
 * each item has these info:
 *- int id;
 *- String company_name; //company which posted the job
 *- String job_title; //form job_vacancies table using job_id
 *- int status;
 *- String created_at;
 */


Route::get('/get_job_applications', function (Request $request) {


    $data = \App\Models\JobRequest::query();

    if ($request->has('job_seeker_id')) {
        $data = $data->where('job_seeker_id', $request->get('job_seeker_id'));
    }


    if ($request->has('job_id')) {
        $data = $data->where('job_id', $request->get('job_id'));
    }

    $data = $data->get();

    return Response::json([
        'message' => 'Found!',
        'data' => $data
    ], 200);

});


/**get_my_jobs
 * note: list of jobs which were posted by this company
 * @param int company_id
 *
 * @return list of job_vacancies
 * each item has these info
 * -int id;
 * -String job_position_title;
 * -String required_skill; using skill_id
 * -String required_experience;
 * -String work_type;
 * -String work_time;
 * -String salary_range;
 */


Route::get('/get_my_jobs', function (Request $request) {


    $data = \App\Models\JobVacancy::query();

    if ($request->has('company_id')) {
        $data = $data->where('company_id', $request->get('company_id'));
    }
    $data = $data->get();

    return Response::json([
        'message' => 'Found!',
        'data' => $data
    ], 200);

});


/**get_job_requests
 * note: list of job_requests for jobs were posted by this company
 * @param int company_id
 *
 * @return list of job_requests
 * each item has these info:
 * -int id;
 * -String job_title; //form job_vacancies table using job_id
 * -String job_seeker_name; //from job_seekers table using his id
 * -int status;
 * -String created_at;
 */

Route::get('/get_job_requests', function (Request $request) {


    $data = \App\Models\JobRequest::select('job_requests.id')->
    join('job_vacancies', 'job_requests.job_id', '=', 'job_vacancies.id')->
    where('job_vacancies.company_id', $request->get('company_id'))->pluck('id');

    $data = \App\Models\JobRequest::whereIn('id', $data)->get();

    return Response::json([
        'message' => 'Found!',
        'data' => $data
    ], 200);

});


/**change_request_status
 *
 * @param int company_id
 * @param int job_id
 * @param int status
 *
 * @return status of api request
 */

Route::post('/change_request_status', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'id' => 'required',
        'status' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }


    $data = \App\Models\JobRequest::where('id', $request->get('id'))->first();
    $data->status = $request->input('status');
    $data->update();

    return Response::json([
        'message' => 'Saved!',
        'data' => $data
    ], 200);

});


Route::post('/verify_user', function (Request $request) {
    $input = $request->all();

    $validator = Validator::make($request->all(), [
        'type' => 'required',
        'code' => 'required',
        'email' => 'required'
    ]);


    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    if ((int)$input['type'] == 1) {

        $user = \App\Models\Company::where([
            'email' => $input['email']
        ])->first();


    } else {
        $user = \App\Models\JobSeeker::where([
            'email' => $input['email']
        ])->first();

    }

    if ($user->status . '' != $input['code']) {
        return Response::json([
            'message' => 'Code not Correct!',
            'data' => $user
        ], 200);
    }


    $user->status = 1;
    $user->update();

    return Response::json([
        'message' => 'User founded!',
        'data' => $user
    ], 200);


});


Route::get('/get_skills', function (Request $request) {


    $data = \App\Models\Skill::get();

    return Response::json([
        'message' => 'Found!',
        'data' => $data
    ], 200);

});


Route::post('/post_skill', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'id' => 'required',
        'skill' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }


    $data = new \App\Models\Skill();
    $data->skill = $request->input('skill');
    $data->save();

    return Response::json([
        'message' => 'Saved!',
        'data' => $data
    ], 200);

});


/**add_job
 * @param  String jobPositionTitle;
 * @param  String requiredSkills;
 * @param  String requiredExperience;
 * @param  String workType;
 * @param  String workTime;
 * @param  String salaryRange;
 * @param  String companyName;
 * @return reuqest status
 */

Route::post('/add_job', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'company_id' => 'required',
        'job_position_title' => 'required',
        'skill_id' => 'required',
        'required_experience' => 'required',
        'workType' => 'required',
        'workTime' => 'required',
        'salaryRange' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }


    $data = new \App\Models\JobVacancy();
    $data->company_id = $request->input('company_id');
    $data->job_position_title = $request->input('job_position_title');
    $data->skill_id = $request->input('skill_id');
    $data->required_experience = $request->input('required_experience');
    $data->work_type = $request->input('workTime');
    $data->work_time = $request->input('workTime');
    $data->salary_range = $request->input('salaryRange');
    $data->save();

    return Response::json([
        'message' => 'User Saved!',
        'data' => $data
    ], 200);

});


Route::post('/reset_password_request', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'email' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $input = $request->all();

    $user = \App\Models\Company::where([
        'email' => $input['email']
    ])->first();


    if (!$user) {
        $user = \App\Models\JobSeeker::where([
            'email' => $input['email']
        ])->first();
    }

    if ($user) {
        try {
            $code = rand(111111, 999999);
            $user->password = $code;
            $user->update();
            $email = $user->email;
            Mail::send('code', [
                'code' => $code
            ], function ($message) use ($email) {
                $message->to($email, 'Code')->subject
                ('Code');
                $message->from('std@scit.co', 'Code');
            });


//            $msg = "Your Code is : " . $code;
//            $msg = wordwrap($msg, 70);
//            mail($email, "My Code", $msg);

        } catch (\Exception $ex) {
            \Log::info($ex->getMessage());
        }
    }


    return Response::json([
        'message' => 'User Saved!',
        'data' => $code
    ], 200);

});


Route::post('/set_new_password', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'email' => 'required',
        'password' => 'required',
        'code' => 'required',
        'type' => 'required'
    ]);

    if ($validator->fails()) {
        return Response::json([
            'message' => 'Error Input Data',
            'data' => $validator->getMessageBag()
        ], 400);
    }

    $input = $request->all();


    if ($input['type'] == 2) {
        $user = \App\Models\Company::where([
            'email' => $input['email']
        ])->first();
    } else {
        $user = \App\Models\JobSeeker::where([
            'email' => $input['email']
        ])->first();
    }

    if ($user && $user->password == $input['code']) {
        $user->password = bcrypt($request->password);
        $user->update();
    }


    return Response::json([
        'message' => 'User Saved!',
        'data' => $user
    ], 200);

});


Route::post('/delete_job', function (Request $request) {

    $validator = Validator::make($request->all(), [
        'company_id' => 'required',
        'job_id' => 'required'
    ]);

    $data = \App\Models\JobVacancy::where('id', $request->job_id)->delete();


    return Response::json([
        'message' => 'User Saved!',
        'data' => $data
    ], 200);

});
