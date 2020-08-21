<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
class Mensaje2 extends Model
{
  protected $primaryKey = 'mensaje';
  protected $table = "mensajes";
  public $incrementing = false;
  public $timestamps=false;
}
