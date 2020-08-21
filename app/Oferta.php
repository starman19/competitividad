<?php

namespace App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Oferta extends Model
{
protected $primaryKey = 'oferta';
protected $table = "ofertas";
public $incrementing = false;
public $timestamps=false;
//protected $spatial = ['ubicacion'];
protected static function boot()
    {
            parent::boot();
            $id=auth()->user()->id;
            if (!auth()->user()->hasRole('admin')) {
                    static::addGlobalScope('agricultor', function (Builder $builder) {
                            $builder->where('agricultor', '=', auth()->user()->id);
                    });
            }
    }

}
