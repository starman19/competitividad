<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
class Agricultor extends Model
{
protected $primaryKey = 'id';
protected $table = "users";
public $incrementing = false;
public $timestamps=false;
protected static function boot()
    {
            parent::boot();
            if (!auth()->user()->hasRole('admin')) {
                    static::addGlobalScope('id', function (Builder $builder) {
                            $builder->where('id', '=', auth()->user()->id);
                    });
            }
    }

    //
}
