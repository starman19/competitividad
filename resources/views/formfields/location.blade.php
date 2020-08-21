<script type="text/javascript" src='https://maps.google.com/maps/api/js?libraries=places&key=AIzaSyBLQkxYT2jbkDdJpBhETmlHlnA6uo8VNpc'></script>

<script src="{{asset('js/jquery-2.1.4.min.js')}}"></script>
<script src="{{asset('js/locationpicker.jquery.min.js')}}"></script>

     <table>
    		 <tr><th colspan=3>Asociar nueva Georeferencia</th></tr>
      <tr><td  rowspan=4><div id="us3" style="width: 400px; height: 300px;"></div></td></tr>
    	    <tr><td>Buscar</td><td>
    				<input type="text" class="form-control" id="us3-address" /></td></tr>
    	    <tr><td>Ubicacion</td><td>
            <input type="text"
              class="form-control"
              name="{{ $row->field }}"
              id="{{ $row->field }}"
              data-name="{{ $row->display_name }}"
              type="number"
              @if($row->required == 1)
               required
              @endif
       			  step="any"
              readonly
              placeholder="{{ isset($options->placeholder)? old($row->field, $options->placeholder): $row->display_name }}"
              value="@if(isset($dataTypeContent->{$row->field})){{ old($row->field, $dataTypeContent->{$row->field}) }}@else{{old($row->field)}}@endif">

            </td></tr>
    </table>
    @if(isset($dataTypeContent->{$row->field}))
      @php  ($arr=explode(",",$dataTypeContent->{$row->field}))
      @php ($lat=$arr[0])
      @php ($lon=$arr[1])
    @else
      @php ($lat='4.13126400')
      @php ($lon='-73.63796800')
    @endif

      <script>
                $('#us3').locationpicker({
                    location: {
                      latitude: {{$lat}},
                      longitude: {{$lon}}
                    },
                    radius: 10,
                    inputBinding: {
                        //latitudeInput: $('#us3-lat'),
                        //longitudeInput: $('#us3-lon'),
                        locationNameInput: $('#us3-address')
                    },
                    enableAutocomplete: true,
                    onchanged: function (currentLocation, radius, isMarkerDropped) {
                        $("#{{ $row->field }}").val(''+ currentLocation.latitude + ", " + currentLocation.longitude);
                        // Uncomment line below to show alert on each Location Changed event
                      //  alert("Location changed. New location (" + currentLocation.latitude + ", " + currentLocation.longitude + ")");
                    }
                });
                $('#us3-dialog').on('shown.bs.modal', function () {
                     $('#us3').locationpicker('autosize');
                     });
            </script>
