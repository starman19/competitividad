<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
class Mensaje extends Model
{
  protected $primaryKey = 'mensaje';
  protected $table = "mensajes";
  public $incrementing = false;
  public $timestamps=false;
  protected static function boot()
      {
              parent::boot();
              if (!auth()->user()->hasRole('admin')) {
                      static::addGlobalScope('user', function (Builder $builder) {
                              $builder->where('user', '=', auth()->user()->id);
                      });
              }
      }
}
