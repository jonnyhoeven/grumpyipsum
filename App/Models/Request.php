<?php


namespace App\Models;


class Request
{
    public $action = '';

    public $count = 1;
    public $sentenceID =0;
    public $authEmail ='';
    public $password = '';
    public $username = '';
    public $rating =0;
    public $settings = ['name'=>'','email'=>'','text'=>''];


    public function __construct($postData)
    {
        $req = json_decode(json_encode($postData));

        foreach($req as $key=>$prop) {
            if(property_exists('Request', $key)){

            };
        }
    }


    public function getClientRequestIP($encoding = 'UTF-8')
    {
        // find user ip
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $dirty_ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $dirty_ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $dirty_ip = $_SERVER['REMOTE_ADDR'];
        }

        return htmlspecialchars(trim($dirty_ip), ENT_QUOTES | ENT_HTML401, $encoding);
    }


}