<?php

namespace App\Http\Controllers;
use App\Mensaje2;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use TCG\Voyager\Facades\Voyager;
class WebServices extends Controller
{
     public function productos()
      {
$sql="select p.producto,p.nombre,p.imagen,count(o.*) as ofertas,
min(coalesce(o.valor,0)) as minimo,max(coalesce(o.valor,0)) as maximo 
FROM productos p 
left outer join ofertas o ON (p.producto=o.producto)
GROUP BY p.producto,p.nombre,p.imagen";
    $result=DB::Select($sql);

foreach($result as $r)
{
     $file = (json_decode($r->imagen))[0];
     $r->imagen= Voyager::image( $file );
}
	return $result;	  
      }

public function ofertas($id)
      {
$sql="
SELECT o.oferta,u.name as agricultor,c.nombre || ':'||v.nombre as vereda,
o.valor,o.valor_envio,cast(o.capacidad as text) || ' ' || ud.descripcion as capacidad,o.fotos
FROM users u,corregimientos c,veredas v,ofertas o,unidades ud
WHERE u.id=o.agricultor AND o.vereda=v.vereda AND v.corregimiento=c.corregimiento
AND ud.unidad=o.unidad AND o.producto=".$id;
$result=DB::Select($sql);

foreach($result as $r)
{
     $file = $r->fotos;
     $r->fotos= Voyager::image( $file );
}
        return $result;   
      }


public function getoferta($id)
{
$sql="
SELECT o.oferta,u.name as agricultor,u.id as idagricultor,c.nombre || ':'||v.nombre as vereda,
o.valor,o.valor_envio,cast(o.capacidad as text) || ' ' || ud.descripcion as capacidad,o.fotos,u.telefono,u.email,
o.ubicacion
FROM users u,corregimientos c,veredas v,ofertas o,unidades ud
WHERE u.id=o.agricultor AND o.vereda=v.vereda AND v.corregimiento=c.corregimiento
AND ud.unidad=o.unidad AND o.oferta=".$id;
$result=DB::Select($sql);

foreach($result as $r)
{
     $file = $r->fotos;
     $r->fotos= Voyager::image( $file );
}
        return $result;   
      }

function mensaje($id,$txt,$email,$cel)
{
            $msg = new Mensaje2();
            $msg->user =$id;
            $msg->texto = $txt;
	    $msg->email = $email;
            $msg->telefono=$cel;
	$msg->save();
return $msg;
}
}


