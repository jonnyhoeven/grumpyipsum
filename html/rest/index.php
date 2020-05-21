<?php
/**
 * Created by PhpStorm.
 * User: Jonny
 * Date: 29/03/2019
 * Time: 20:57
 */

require_once '../../vendor/autoload.php';
$rest_json = file_get_contents('php://input');
$inputData = json_decode($rest_json, true);


$origin = $_SERVER['HTTP_ORIGIN'];
$allowed_domains = [
    'http://www.grumpyipsum.com',
    'https://www.grumpyipsum.com',
    'http://www.grumpyipsum.com:8080',
];

if (in_array($origin, $allowed_domains, true)) {
    header('Access-Control-Allow-Origin: ' . $origin);
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Allow-Method: POST');
    header('Access-Control-Allow-Headers: Content-Type, Upgrade-Insecure-Requests');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    header('Content-Type: application/json');
    $rest = new App\Services\Rest($inputData);
    echo json_encode($rest->retData());
}