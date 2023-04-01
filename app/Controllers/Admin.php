<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\AdminModel;

class Admin extends BaseController
{
    public function index(): string
    {
        $title = "Admin Page";
        $AdminModel = new AdminModel();
        $loggedUserID = session()->get('loggedAdmin');
        $user = $AdminModel->find($loggedUserID);
        return view("admin/index",compact('title','user'));
    }




}