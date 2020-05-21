<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class Sentence extends Model
{

    protected $hidden = ['accepted', 'ip', 'updated_at', 'deleted_at'];

    public function votes()
    {
        return $this->hasMany('App\Models\Vote');
    }

    public function rating()
    {
        return $this->hasOne('App\Models\Vote')
                    ->selectRaw('FLOOR(AVG(rating)) as avg, COUNT(*) as count');
    }

    public function getEmailAttribute($email)
    {
        $atSplit = explode('@', $email);

        if (count($atSplit) > 1) {
            return 'hidden@' . $atSplit[1];
        }

        return 'unknown@GrumpyIpsum.com';
    }

    public function getTextAttribute($text)
    {
        return trim($text);
    }


}