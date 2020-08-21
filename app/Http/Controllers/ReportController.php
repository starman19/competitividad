<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Report;
use App\Generic;
use App\Consolidado;
use Illuminate\Support\Facades\DB;
class ReportController extends Controller
{
    //
    public function index()
    {
      $reportes = Report::pluck('nombre', 'reporte');
      $step=1;
      $stats=0;
      return view('Reports.index',compact('reportes','step','stats'));
    }
    public function consolidar(Request $request)
    {
      
      $reportes = Report::pluck('nombre', 'reporte');
      $step=1;
      $stats=0;
	$borrado=DB::delete("DELETE FROM consolidado");
      $sql="SELECT g.id as idgasto,g.descripcion ,g.servicio_id,g.fecha,g.valor as total_gasto,g.tercero_id,t.nombre as tercero,g.servicio_id,s.nombre as servicio,s.tipo as tipo_servicio
		FROM detalle_siembra g, terceros t,servicios s
		WHERE g.tercero_id=t.id
		AND g.servicio_id=s.id";
	$result=DB::Select($sql);
        $data=Generic::Hydrate($result)->all();
	
	foreach($data as $single)
	{
		$guardar=new Consolidado($single->getAttributes());
//		$guardar->fill($single->getAttributes());
//		$sqltodos="SELECT count(*) as total FROM control WHERE (siembras_id=1 OR fincas_id=0) AND detalle_siembra_id=".$guardar->idgasto;
//echo $sqltodos."<br>";
//		$restodos=DB::Select($sqltodos);
//print_r($restodos);
		
//		if ($restodos[0]->total>0)
//		{
//			$sqltotal="SELECT id,descripcion,area_sembrada FROM siembras WHERE id>1 AND activa=1";
			
//		}	
//		else
//		{
			$sqltotal="SELECT id,descripcion,area_sembrada FROM v_siembras_aplicar WHERE gastoid=".$guardar->idgasto;	
//		}
//echo $sqltotal."--{$guardar->idgasto}<br>";

		$res2=DB::Select($sqltotal);
		$sqlm="SELECT m.id,m.desc FROM maquinas m,control c
                      WHERE c.maquina_id=m.id AND c.detalle_siembra_id=".$guardar->idgasto." limit 1";
		$maq=DB::Select($sqlm);
		 foreach ($res2 as $r)
		 {
  			$guardar=new Consolidado($single->getAttributes());
  			$guardar->siembra_id=$r->id;
			if (count($maq)>0)
			{
				$guardar->maquina_id=$maq[0]->id;
				$guardar->descripcion_maquina=$maq[0]->desc;
			}
			$guardar->descripcion_siembra=$r->descripcion;
			$guardar->area_sembrada=$r->area_sembrada;
    			$guardar->save();       
		 }	


//dd($res2);
//		$guardar->save();	
         }
	$terminar="SELECT idgasto,total_gasto,total_gasto/sum(area_sembrada) as valor_ha FROM consolidado GROUP BY idgasto,total_gasto";	
	$resterminar=DB::Select($terminar);
	foreach($resterminar as $r)
	{
		$sqlu="UPDATE consolidado SET valor_ha=".$r->valor_ha.", valor=area_sembrada*".$r->valor_ha." WHERE idgasto=".$r->idgasto;
		DB::Update($sqlu);
	}
//die('a');
      return view('Reports.index',compact('reportes','step','stats','data'));

    }
    public function parameters(Request $request)
    {
      $res = Report::where("reporte",$request->reporte)->first();
      $step=2;
      $campos=explode(';',$res->parametros);
      $parametros=array();
      foreach($campos as $campo)
      {
      $arr=explode('|', $campo);
      if (substr($arr[2],0,5) == "combo")
      {
            $comboitems=explode(",",$arr[2]);
            $nomtabla=substr($comboitems[0],6);
            $result=DB::Select("SELECT ".$comboitems[1].",".$comboitems[2]." FROM ".$nomtabla);
            $lista=array();
            $mostrar=$comboitems[2];
            $valor=$comboitems[1];
            foreach ($result as $opcion) {
              $lista[]=array("mostrar"=>$opcion->$mostrar,"valor"=>$opcion->$valor);
            }
            $arr[2]="combo";
         }
         else {
           $lista=array();
         }
         $fila=array("mostrar"=>$arr[1],"nombre"=>$arr[0],"tipo"=>$arr[2],"opciones"=>$lista);
         $parametros[]=$fila;
      }
      $reporte= $request->reporte;
    //  print_r($parametros);
    $stats=0;
    return view('Reports.index',compact('res','step','parametros','reporte','stats'));
    }
    public function generate(Request $request)
    {


      $res = Report::where("reporte",$request->reporte)->first();
      $step=3;
      $campos=explode(';',$res->parametros);
      $sql=$res->sql;
      $params="";
      foreach($campos as $parametro)
      {
          $arr=explode('|', $parametro);
          $sql=str_replace("[".$arr[0]."]",$request[$arr[0]],$sql);
          $params.=$arr[1]." = ".$request[$arr[0]]." ; ";
      }
      $result=DB::Select($sql);
      $data=Generic::Hydrate($result);
      $reporte= $request->reporte;
      if ($data->first())
        $attributes=$data->first()->getAttributes();
      else {
        $attributes=null;
      }
      $stats=$res->estadistica;
      return view('Reports.index',compact('res','result','step','reporte','data','attributes','params','stats'));
    }
}
