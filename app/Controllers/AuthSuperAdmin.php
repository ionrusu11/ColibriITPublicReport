<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Libraries\Hash;
use App\Models\AdminModel;

class AuthSuperAdmin extends BaseController
{
    public function __construct()
    {
        helper(['url','Form']);
    }
    public function index()
    {
        $title = "Login";

        return view('admin/auth',compact("title"));
    }

    // Login SuperAdmin
    public function login(): string
    {
        $title = "Login";
        return view("admin/auth",compact("title"));
    }

    function checkAdmin(){

        $validation = $this->validate([
            'username' => [
                'rules' =>'required|is_not_unique[admin.username]',
                'messages' => [
                    'required' => 'Enter a valid username',
                    'is_not_unique' => 'This username is not registered on admin Panel'
                ]
            ],
            'password' => [
                'rules' =>'required|min_length[5]|max_length[23]',
                'messages' => [
                    'required' => 'Password is required',
                    'min_length' => 'Passwords must be at least 5 characters',
                    'max_length' => 'You have exceeded the limit of 23 characters',
                ]
            ]
        ]);

        if(!$validation){
            return view('auth/login',['validation' => $this->validator]);
        }else{
            // Verify data to database
            $username = $this->request->getPost('username');
            $password = $this->request->getPost('password');

            $AdminModel = new AdminModel();
            $user_info = $AdminModel->where('username',$username)->first();
            $check_password = Hash::check($password,$user_info['password']);

            if(!$check_password){
                session()->setFlashdata('fail','Incorect password');
                return redirect()->to('/auth')->withInput();
            }else{
                $user_id = $user_info['id'];
                session()->set('loggedAdmin',$user_id);
                return redirect()->to('/admin');
            }
        }
    }

    public function logout(){
        if(session()->has('loggedAdmin')){
            session()->remove('loggedAdmin');
            return redirect()->to('auth?access=out')->with('fail','You are logged out!');
        }
    }
}
