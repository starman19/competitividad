<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
    //
    protected $table = "reportes";
    public $timestamps=false;
    protected $primaryKey = 'reporte'; // or null
    protected $fillable = ['reporte', 'nombre','sql','parametros','estadistica'];
    public $incrementing = false;

}
