<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Corregimiento extends Model
{
protected $primaryKey = 'corregimiento';
protected $table = "corregimientos";
public $incrementing = false;
public $timestamps=false;
}
