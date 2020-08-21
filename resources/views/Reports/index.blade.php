@extends('voyager::master')
@section('head')
<!-- bootstrap & fontawesome -->
  <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}" />

  <!-- page specific plugin styles -->
  <link rel="stylesheet" href="{{ asset('assets/font-awesome/4.5.0/css/font-awesome.min.css') }}" />


  <!-- text fonts -->
  <link rel="stylesheet" href="{{ asset('assets/css/fonts.googleapis.com.css') }}" />

  <!-- ace styles -->
  <link rel="stylesheet" href="{{ asset('assets/css/ace.min.css') }}" class="ace-main-stylesheet" id="main-ace-style" />

  <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
  <![endif]-->
  <link rel="stylesheet" href="{{ asset('assets/css/ace-skins.min.css') }}" />
  <link rel="stylesheet" href="{{ asset('assets/css/ace-rtl.min.css') }}" />



  <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
  <![endif]-->

<!--[if lte IE 9]>
  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<link rel="stylesheet" href="{{ asset('assets/css/jquery.dataTables.css') }}" />
<link rel="stylesheet" href="{{ asset('assets/css/buttons.dataTables.css') }}" />
<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

@endsection

@section('content')

 <div class="row">

   <section class="content">

     <div class="col-md-8 col-md-offset-2">
         @if(Session::has('success'))
           <div class="alert alert-info">
             {{Session::get('success')}}
           </div>
       @endif

              @if ($step==1)
              <div class="panel panel-default">
                <div class="panel-heading">
                      <h3 class="panel-title">Generacion de Reportes</h3>
                </div>
              <div class="panel-body">
               <form method="POST" action="{{ route('parameters') }}"  role="form">
               {{ csrf_field() }}
               <div class="row">
                 <div class="col-xs-6 col-sm-6 col-md-6">
                   <div class="form-group">
                     Seleccionar Reporte
                   </div>
                 </div>
                 <div class="col-xs-6 col-sm-6 col-md-6">
                   <div class="form-group">
                     {!! Form::select('reporte', $reportes, null, ['class' => 'form-control']) !!}
                   </div>
                 </div>
               </div>

              <div class="row">

             <div class="col-xs-12 col-sm-12 col-md-12">
               <input type="submit"  value="Continuar" class="btn btn-success btn-block">
             </div>

              </div>
             </form>
              <div class="row">
              </div>

           </div>
         </div>

             @endif
             @if ($step==2)
             <div class="panel panel-default">
               <div class="panel-heading">
                     <h3 class="panel-title">Generacion de Reportes</h3>
               </div>
             <div class="panel-body">
            <form method="POST" action="{{ route('generate') }}"  role="form">
             {{ csrf_field() }}
            @foreach($parametros as $parametro)
             <div class="row">
               <div class="col-xs-6 col-sm-6 col-md-6">
                 <div class="form-group">
                   {{ $parametro["mostrar"] }}
                 </div>
               </div>
               <div class="col-xs-6 col-sm-6 col-md-6">
                 <div class="form-group">
                      @if ($parametro["tipo"] == "texto")
                      <input type="text" required name="{{$parametro["nombre"]}}" id="{{$parametro["nombre"]}}">
                      @endif
                      @if ($parametro["tipo"] == "fecha")
                      <input type="date" required name="{{$parametro["nombre"]}}" id="{{$parametro["nombre"]}}">
                      @endif
                      @if ($parametro["tipo"] == "combo")
                      <select name={{$parametro["nombre"]}}>
                        @foreach ($parametro["opciones"] as $opcion)
                        <option value={{$opcion["valor"]}}>{{$opcion["mostrar"]}}</option>
                        @endforeach
                      </select>
                      @endif
                      <input type="hidden" name="reporte" value={{$reporte}}>
                 </div>
               </div>
             </div>
            @endforeach
            <div class="row">
           <div class="col-xs-12 col-sm-12 col-md-12">
             <input type="submit"  value="Generar" class="btn btn-success btn-block">
           </div>

            </div>
           </form>
         </div>
       </div>

             @endif
             @if ($step==3)

             <div class="row">
									<div class="col-xs-12">
										<h3 class="header smaller lighter blue">{{$res->nombre}}<br> {{$params}}</h3>

										<div class="clearfix">
											<div class="pull-right tableTools-container"></div>
										</div>

                    <div class="tabbable" id="myTab">
                      <ul class="nav nav-tabs">
												<li class="active">
													<a data-toggle="tab" href="#datos" aria-expanded="false">
														<i class="green ace-icon fa fa-print bigger-120"></i>
														Resultados
													</a>
												</li>
                        @if ($stats>0)
												<li>
													<a data-toggle="tab" href="#grafica" aria-expanded="true">
														Graficas
													</a>
												</li>
                        @endif
                      </ul>
                   @if ($attributes)
                      <div class="tab-content">
                        <div id="datos" class="tab-pane fade active in">
                           <table  id="dynatable" class="table table-striped table-bordered table-hover">
                    				<thead>
                              <tr>
                              @foreach ($attributes as $k=>$v)
                              <th>{{$k}}</th>
                              @endforeach
                            </tr>
                              </thead>
                    <tbody>
                    @foreach ($data as $fila)
                     <tr>
                       @foreach ($attributes as $k=>$v)
                        <td>{{ $fila->$k }}</td>
                      @endforeach
                     </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
            </div>
            @else
            <div class="tab-content">
              <div id="datos" class="tab-pane fade active in">
             No hay datos
           </div>
         </div>
            @endif

            @if ($stats>0)
            @if ($attributes)

            <div class="tab-content">
              <div id="grafica" class="tab-pane fade active in">
                <div id="placeholder" style="width:800px;height:600px"></div>
              </div>
            </div>
            @else
            <div class="tab-content">
              <div id="grafica" class="tab-pane fade active in">
                No hay datos
              </div>
            </div>
            @endif

            @endif
              </div>
            </div>
          </div>
             @endif
           </div>
 </section>
         </div>

@endsection
@section('javascript')


    <script src="{{asset('assets/js/datatables.min.js')}}"></script>

<script src="{{asset('assets/js/jszip.min.js')}}"></script>
<script src="{{asset('assets/js/pdfmake.min.js')}}"></script>
<script src="{{asset('assets/js/vfs_fonts.js')}}"></script>
<script src="{{asset('assets/js/jquery-ui.min.js')}}"></script>
<script src="{{asset('assets/js/jquery.flot.min.js')}}"></script>
<script src="{{asset('assets/js/jquery.flot.pie.min.js')}}"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
         <script src="assets/js/jquery.dataTables.bootstrap.min.js"></script>
         <script src="assets/js/dataTables.buttons.min.js"></script>
         <script src="assets/js/buttons.flash.min.js"></script>
         <script src="assets/js/buttons.html5.min.js"></script>
         <script src="assets/js/buttons.print.min.js"></script>
         <script src="assets/js/buttons.colVis.min.js"></script>
         <script src="assets/js/dataTables.select.min.js"></script>

	<link rel="stylesheet" href="assets/css/jquery-ui.min.css" />

    <script>
    $(document).ready(function() {

      $( "#myTab" ).tabs();
      @if ($stats==1)
          <?php $i = 1;
           ?>
           var data = [
             @foreach ($data as $fila)
             <?php
                $arr=$fila->toArray();
                $keys=array_keys($arr);
               ?>
                 { label: "{{$arr[$keys[0]]}}",  data: [[{{$i}},{{$arr[$keys[1]]}}]] },
                 <?php $i++; ?>
            @endforeach
          ];

           var plot = $.plot(placeholder, data, {
    			bars: { show: true },
          yaxes: {
                min: 0
            },
            xaxis: {
                autoscaleMargin: .30,
            }
    		});
      @endif
      @if ($stats==2)
      <?php $i = 1;
       ?>
       var data = [
         @foreach ($data as $fila)
         <?php
            $arr=$fila->toArray();
            $keys=array_keys($arr);
           ?>
             { label: "{{$arr[$keys[0]]}}",  data: [[{{$i}},{{$arr[$keys[1]]}}]] },
             <?php $i++; ?>
        @endforeach
      ];
      function labelFormatter(label, series) {
      		return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
      	}
        $.plot($("#placeholder"), data,
      {
        series: {
        					pie: {
        						show: true,
                    label: {
                    show: true,
                    radius: 0.8,
                    formatter: function (label, series) {
                        return '<div style="font-size:8pt;text-align:center;padding:2px;color:black;">'+label+" : "+Math.round(series.percent)+"%<br/>Total: " + series.data[0][1] +'</div>';
                      },
                    background: {
                        opacity: 0.5,
                        color: "#000"
                        }

             }
        					}
        				},
            legend: {
            show: true
            }
        });
      @endif
        var table=$('#dynatable').DataTable({
           "bLengthChange": true,
          dom: 'Bfrltip',
          buttons: [
      {
      "extend": "csv",
      "text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>Export to CSV</span>",
      "className": "btn btn-white btn-primary btn-bold"
      },
      {
      "extend": "excel",
      "text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>Export to Excel</span>",
      "className": "btn btn-white btn-primary btn-bold"
      },
      {
      "extend": "pdf",
      "text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
      "className": "btn btn-white btn-primary btn-bold"
    },
    {
    "extend": "print",
    "text": "<i class='fa fa-print bigger-110 red'></i> <span class='hidden'>Export to PDF</span>",
    "className": "btn btn-white btn-primary btn-bold"
    }
                  ],
            "language": {
              "sProcessing":     "Procesando...",
               "sLengthMenu":     "Mostrar _MENU_ registros",
               "sZeroRecords":    "No se encontraron resultados",
               "sEmptyTable":     "Ningún dato disponible en esta tabla",
               "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
               "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
               "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
               "sInfoPostFix":    "",
               "sSearch":         "Buscar:",
               "sUrl":            "",
               "sInfoThousands":  ",",
               "sLoadingRecords": "Cargando...",
               "oPaginate": {
                   "sFirst":    "Primero",
                   "sLast":     "Último",
                   "sNext":     "Siguiente",
                   "sPrevious": "Anterior"
               },
               "oAria": {
                   "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                   "sSortDescending": ": Activar para ordenar la columna de manera descendente"
               }
             },

                            });
                          } );

    	</script>
      <script src="{{ asset('assets/js/ace-elements.min.js') }}"></script>
    		<script src="{{ asset('assets/js/ace.min.js') }}"></script>

@endsection
