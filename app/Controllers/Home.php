<?php

namespace App\Controllers;

class Home extends BaseController
{
    public function index()
    {
        $title = "Home page";
        return view('users/index');
    }

}