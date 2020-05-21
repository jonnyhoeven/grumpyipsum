<?php
/**
 * Created by PhpStorm.
 * User: Jonny
 * Date: 29/03/2019
 * Time: 20:36
 */

namespace App\Services;

class Helper
{

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

    public function xssafe($data, $encoding = 'UTF-8')
    {
        return htmlspecialchars($data, ENT_QUOTES | ENT_HTML401, $encoding);
    }


}