<?php
/**
 * Created by PhpStorm.
 * User: Jonny
 * Date: 07/04/2019
 * Time: 22:01
 */

namespace App\models;

use Illuminate\Database\Eloquent\Model;



class Vote extends Model
{
    protected $fillable = ['sentence_id', 'ip'];

    public function sentence()
    {
        return $this->belongsTo('Sentence');
    }

}