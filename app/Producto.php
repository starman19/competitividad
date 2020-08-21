<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;
class Producto extends Model
{
  use Resizable;
    //
protected $primaryKey = 'producto';
protected $table = "productos";
public $incrementing = false;
public $timestamps=false;


}
