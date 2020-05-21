<?php

namespace App\Services;

use Illuminate\Database\Capsule\Manager as Capsule;

class Database
{
    public function __construct()
    {
        $capsule = new Capsule;
        $capsule->addConnection([
                                    'driver' => 'mysql',
                                    'host' => 'sql',
                                    'database' => 'grumpyipsum',
                                    'username' => 'apache',
                                    'password' => 'apache',
                                    'charset' => 'utf8',
                                    'collation' => 'utf8_unicode_ci',
                                    'prefix' => '',
                                ]);

        $capsule->setAsGlobal();

        // Setup the Eloquent ORM…
        $capsule->bootEloquent();
    }

}