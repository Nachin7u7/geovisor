{literal}
<script>
    var snippet_general_form = function(){
        "use strict";
        /**
         * Datos del formulario y el boton
         */
        var form = $('#general_form');
        var btn_submit = $('#general_submit');
        var formv;
        /**
         * Antes de enviar el formulario se ejecuta la siguiente funcion
         */
        var showRequest= function(formData, jqForm, op)  {
            btn_submit.addClass('spinner spinner-white spinner-right').attr('disabled', true);
            return true;
        };

        var showResponse = function (res, statusText) {
            btn_submit.removeClass('spinner spinner-white spinner-right').attr('disabled', false);
            let url = "{/literal}{$path_url}{literal}";
            coreUyuni.generalShowResponse(res,url);

        };

        /**
         * Opciones para generar el objeto del formulario
         */
        var options = {
            beforeSubmit:showRequest
            , success:  showResponse
            , data: {type:'{/literal}{$type}{literal}'}
        };

        /**
         * Se da las propiedades de ajaxform al formulario
         */
        var handle_form_submit=function(){
            form.ajaxForm(options);
            formv = FormValidation.formValidation(
                document.getElementById('general_form'),
                {
                    plugins: {
                        declarative: new FormValidation.plugins.Declarative({html5Input: true,}),
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap: new FormValidation.plugins.Bootstrap(),
                        submitButton: new FormValidation.plugins.SubmitButton(),
                    }
                }
            );

        };
        /**
         * Se da las funcionalidades al boton enviar
         */
        var handle_btn_submit = function() {
            btn_submit.click(function(e) {
                e.preventDefault();
                /**
                 * Copiamos los datos de summerNote a una variable
                 */
                //$('#descripcion_input').val($('#descripcion').summernote('code'));

                formv.validate().then(function(status) {
                    if(status === 'Valid'){
                        form.submit();
                    }else{
                        Swal.fire({icon: 'error',title: lngUyuni.formFieldControlTitle, text: lngUyuni.formFieldControlMsg});
                    }
                });

            });
        };
        /**
         * Iniciamos los componentes necesarios como , summernote, select2 entre otros
         */
        var handle_components = function(){
            coreUyuni.setComponents();
        };



        return {
            init: function() {
                handle_form_submit();
                handle_btn_submit();
                handle_components();
            }
        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_general_form.init();
    });


    var snippet_geovisor = function () {


        var marker;
        var leaflet;
        var map;
        var punto = [{/literal}{$item.location_latitude_decimal|escape:"html"},{$item.location_longitude_decimal|escape:"html"}{literal}];
        var geoserver_mmaya = '/geoserver/wms';
        var layer_departamento,layer_municipio;
        var uh_nivel1,uh_nivel2,uh_nivel3,uh_nivel4,uh_nivel5, macroregion,cuencas_operativas;
        var getBaseLayers = function(){
            Grayscale =  L.tileLayer(
                'https://tiles.stadiamaps.com/tiles/alidade_smooth/{z}/{x}/{y}{r}.png?api_key={apikey}', {
                    maxZoom: 20,
                    attribution: '&copy; <a href="https://stadiamaps.com/">Stadia Maps</a>',
                    apikey:"{/literal}{$stadiamaps_key}{literal}",
                });


            mapLink = '<a href="https://openstreetmap.org">OpenStreetMap</a>';
            osmLayer = L.tileLayer(
                'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    attribution: '&copy; ' + mapLink + ' Contributors',
                    maxZoom: 19,
                    id: 'osm'
                }).addTo(map);
            OpenTopoMap = L.tileLayer('https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png', {
                maxZoom: 17,
                attribution: 'Map data: &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, <a href="https://viewfinderpanoramas.org">SRTM</a> | Map style: &copy; <a href="https://opentopomap.org">OpenTopoMap</a> (<a href="https://creativecommons.org/licenses/by-sa/3.0/">CC-BY-SA</a>)'
            });
            googleHybrid = L.gridLayer.googleMutant({
                maxZoom: 24,
                type: "hybrid", // valid values are 'roadmap', 'satellite', 'terrain' and 'hybrid'
            });
            var baseLayers = {
                "Grayscale":Grayscale,
                "OpenStreetMap": osmLayer,
                "OpenTopoMap": OpenTopoMap,
                "googleHybrid": googleHybrid
            };
            return baseLayers;
        };
        var getGroupedOverlays = function(){
            /**
             * Base
             */
            layer_departamento = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:departamento',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5,
                //styles:'siarh_geovisor_rojo'
            }).addTo(map);
            layer_municipio = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:municipio',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 1,
            });

            uh_nivel1 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:uh_nivel1',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });

            uh_nivel2 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:uh_nivel2',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            uh_nivel3 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:uh_nivel3',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            uh_nivel4 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:uh_nivel4',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            uh_nivel5 = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:uh_nivel5',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            macroregion = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:macroregion',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });

            cuencas_operativas = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:51_cuencas_operativas',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });
            var ecorregiones_ibish = L.tileLayer.wms(geoserver_mmaya+'?', {
                layers: 'sinb:ecorregiones_ibish',
                format: 'image/png',
                uppercase: true,
                transparent: true,
                continuousWorld : true,
                opacity: 0.5
            });

            var geoserver_mnhn = "http://sib.mnhn.gob.bo/geoserver/wms";
            var mnhn_geologia = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:geologia',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_ecoregiones = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:ecoregion',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_vegetacion = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:vegetacion',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_Apn = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:areas_prot_nal',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_Apm = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:areas_prot_mun',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_Apd = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:areas_prot_dep',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_sitiosramsar = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:sitios_ramsar',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_biogeografia = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:geologia',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_zonasvida = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:zonasvida',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_reservasforestales = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:reservasforestales',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var mnhn_tcos = L.tileLayer.wms(geoserver_mnhn+'?', {
                layers: 'bioadmin:tcos',
                format: 'image/png',
                transparent: true,
                opacity: 0.8
            });
            var overLayers = {
                "Administrativos": {
                    "Departamento": layer_departamento,
                    "Municipio": layer_municipio
                },
                "Unidad Hidrográfica": {
                    "51 Cuencas_Operativas": cuencas_operativas,
                    "Macroregion": macroregion,
                    "UH Nivel5": uh_nivel5,
                    "UH Nivel4": uh_nivel4,
                    "UH Nivel3": uh_nivel3,
                    "UH Nivel2": uh_nivel2,
                    "UH Nivel1": uh_nivel1,
                },
                "Biodiversidad": {
                    "Mapa Geológico": mnhn_geologia,
                    "Ecorregiones": mnhn_ecoregiones,
                    "Ecorregiónes Ibish": ecorregiones_ibish,
                    "Vegetación": mnhn_vegetacion,
                    "Áreas Protegidas Nacional": mnhn_Apn,
                    "Áreas Protegidas Departamental": mnhn_Apd,
                    "Áreas Protegidas Municipal": mnhn_Apm,
                    "Sitios Ramsar": mnhn_sitiosramsar,
                    "Provincias biogeográficas": mnhn_biogeografia,
                    "Zonas de vida": mnhn_zonasvida,
                    "Reservas forestales": mnhn_reservasforestales,
                    "TCOs": mnhn_tcos,
                }
            };

            return overLayers;
        };

        var initialiseMap = function(){
            var mapOptions = {
                center: punto
                , zoom: {/literal}{if $type == 'new'}8{else}10{/if}{literal}
                ,fullscreenControl: true
                ,scrollWheelZoom: true
            };
            var m = L.map('map',mapOptions);
            L.control.scale({metric: true, imperial: false}).addTo(m);
            return m;
        };

        var createMap = function(){
            map = initialiseMap();
            /**
             * Grupo de layers
             */
            var options = {
                // Make the "Landmarks" group exclusive (use radio inputs)
                exclusiveGroups: ["Overlays"],
                // Show a checkbox next to non-exclusive group labels for toggling all
                //groupCheckboxes: true
            };
            layerControl = L.control.groupedLayers(getBaseLayers(), getGroupedOverlays(), options).addTo(map);

            var leafletIcon = L.divIcon({
                html: `<span class="svg-icon svg-icon-danger svg-icon-3x"><svg xmlns="https://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="24" width="24" height="0"/><path d="M5,10.5 C5,6 8,3 12.5,3 C17,3 20,6.75 20,10.5 C20,12.8325623 17.8236613,16.03566 13.470984,20.1092932 C12.9154018,20.6292577 12.0585054,20.6508331 11.4774555,20.1594925 C7.15915182,16.5078313 5,13.2880005 5,10.5 Z M12.5,12 C13.8807119,12 15,10.8807119 15,9.5 C15,8.11928813 13.8807119,7 12.5,7 C11.1192881,7 10,8.11928813 10,9.5 C10,10.8807119 11.1192881,12 12.5,12 Z" fill="#000000" fill-rule="nonzero"/></g></svg></span>`,
                bgPos: [10, 10],
                iconAnchor: [20, 37],
                popupAnchor: [0, -37],
                className: 'leaflet-marker'
            });
            //marker = L.marker(map.getCenter(),{ icon: leafletIcon }).addTo(map);
            marker = L.marker(map.getCenter()).addTo(map);
            marker.setLatLng(punto).update();

            map.on('click', function (e) {
                const lat = e.latlng.lat;
                const lng = e.latlng.lng;
                //console.log(e);
                $('#verbatim_latitude').val(convertirDMS(lat));
                $('#verbatim_longitude').val(convertirDMS(lng));
                var utm = convertirUTM(lat,lng);
                $('#utm_latitude').val(utm.x);
                $('#utm_longitude').val(utm.y);
                $('#zone').val(utm.zone);
                $('#hemisferio').val(utm.hemisferio);
                refresh_option_dep_mun(lat, lng);
                $('#location_longitude_decimal').val(Math.round(lng * 100000) / 100000);
                $('#location_latitude_decimal').val(Math.round(lat * 100000) / 100000);
                marker.setLatLng([lat,lng]).update();
            });
        };

        function convertirDMS(valor) {
            var absValor = Math.abs(valor);
            var grados = Math.floor(absValor);
            var minutos = Math.round((absValor - grados) * 60);
            var direccion = valor < 0 ? 'S' : 'N';
            return grados + '°' + minutos + '\'' + direccion;
        }


        function convertirUTM(lat, lon) {
            // var hemisferio = 'S';
            var e = 0.006739497;
            var c_radio_polar = 6399593.626;
            var rad_lon = lon * Math.PI / 180;

            var rad_lat = lat * Math.PI / 180;
            var zone = Math.trunc((lon/6)+31);
            var zoneCH = 6*zone-183;
            var delta_lambda = + rad_lon - ((zoneCH*Math.PI)/180);
            var A = Math.cos(rad_lat) * Math.sin(delta_lambda);
            var Xi = (1/2) * Math.log((1 + A) / (1 - A));
            var eta = Math.atan(Math.tan(rad_lat) / Math.cos(delta_lambda)) - rad_lat;
            var Ni = (c_radio_polar / Math.pow((1 + e * Math.pow(Math.cos(rad_lat), 2)), 1/2)) * 0.9996;
            var zeta = (e/2)*Math.pow(Xi,2)*Math.pow(Math.cos(rad_lat),2);
            var A1 = Math.sin(2*rad_lat);
            var A2 = A1 * Math.pow(Math.cos(rad_lat), 2);
            var J2 = rad_lat + (A1/2);
            var J4 = j4 = ((3*J2)+A2)/4;
            var J6 = (5 * J4 + A2 * Math.pow(Math.cos(rad_lat), 2)) / 3;
            var alfa = (3/4)*e;
            var beta =  (5/3) * Math.pow(alfa, 2);
            var gamma = (35/27) * Math.pow(alfa, 3);
            var fi = 0.9996 * c_radio_polar * (rad_lat - (alfa * J2) + (beta * J4) - (gamma * J6));

            // Determinar el hemisferio
            var hemisferio = lat >= 0 ? 'N' : 'S';

            // Calcular las coordenadas UTM
            var X = Xi*Ni*(1+zeta/3)+500000;
            var Y = (hemisferio === 'S') ? eta*Ni*(1+zeta) + fi + 10000000 : eta*Ni*(1+zeta) + fi;

            // Devolver las coordenadas UTM
            return {
                x: X.toFixed(3),
                y: Y.toFixed(3),
                zone: zone,
                hemisferio: hemisferio
            };
        }

        var latitude=$('#location_latitude_decimal');
        var longitude= $('#location_longitude_decimal');

        var changeLngLat = function(){
            if (longitude.val() && latitude.val() && longitude != 0 && latitude.val() != 0) {
                var lat = latitude.val();
                var lng = longitude.val();
                changeLocation(lat, lng);
                //map.setView(new L.LatLng(lat, lng), 13);
                map.setView(new L.LatLng(lat, lng));
                $('#lng').val(Math.round(lng * 100000) / 100000);
                $('#lat').val(Math.round(lat * 100000) / 100000);
            }
        };

        var changeLocation = function (lat, lng) {
            marker.setLatLng({lat: lat, lng: lng});
            /*
            $.ajax({
                method: "GET",
                url: "json/json_intesect_municipality",
                data: {longitude: lng, latitude: lat}
            }).done(function (data) {
                if (data[0]) {
                    $('#department').val(data[0].nom_dep);
                    if (!($("#province option[value='" + data[0].nom_prov + "']").length > 0)) {
                        $('#province').empty();
                        $('#province').append($('<option>', {
                            value: data[0].nom_prov,
                            text: data[0].nom_prov
                        }));
                    }
                    $('#province').val(data[0].nom_prov);
                    if (!($("#municipality option[value='" + data[0].nom_mun + "']").length > 0)) {
                        $('#municipality').empty();
                        $('#municipality').append($('<option>', {
                            value: data[0].nom_mun,
                            text: data[0].nom_mun
                        }));
                    }
                    $('#municipality').val(data[0].nom_mun);
                }
            });
             */
        };

        var handle_ll =  function(){
            longitude.change(function () {
                // console.log("cambio longitud");
                changeLngLat()
            });
            latitude.change(function () {
                // console.log("cambio latitud");
                changeLngLat()
            })
        };

        var municipio_opt = $("#municipality_id");
        var departamento_opt = $("#state_province_id");
        let urlmodule = "{/literal}{$path_url}/{$subcontrol}_{literal}";

        var handle_option_municipio = function(){
            $('#state_province_id').on('change',function(){
                var id = $('#state_province_id').val();
                municipio_search(id);
            });
        };

        var municipio_search = function(id){
            municipio_opt.find("option").remove();
            // disabled el selectbox
            municipio_opt.prop('disabled', true);
            if(id!="") {
                $.post(urlmodule+"/get.municipio"
                    , {id: id}
                    , function (res, textStatus, jqXHR) {
                        let selOption = $('<option></option>');
                        municipio_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_municipio_id#}{literal}"));
                        let municipio_list = []
                        for (var row in res) {
                            municipio_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].name));
                            municipio_list[res[row].id] = res[row];
                        }
                        municipio_opt.trigger('chosen:updated');
                        municipio_opt.prop('disabled', false);
                    }
                    , 'json');
            }else{
                //handle_options_init();
            }
        };

        var handle_change_municipio = function(){
            $('#municipality_id').on('change',function(){
                var id = $('#municipality_id').val();
                push_point_municipio(id);
            });
        };
        var push_point_municipio = function(id){
            if(id!="") {
                $.post(urlmodule+"/get.point_municipio"
                    , {id: id}
                    , function (res, textStatus, jqXHR) {
                        // console.log(res[0].departamento_id)
                        changeLocation(res[0].lat, res[0].lon);
                        map.setView(new L.LatLng(res[0].lat, res[0].lon), 10);
                        latitude.val(res[0].lat);
                        longitude.val(res[0].lon);
                        $('#state_province_id').val(res[0].departamento_id);
                    }
                    , 'json');
            }else{
                //handle_options_init();
            }
        };

        var refresh_option_dep_mun = function(lat, lng){
            var id='';
            if(lat!="" && lng!="") {
                departamento_opt.find("option").remove();
                departamento_opt.prop('disabled', true);
                municipio_opt.find("option").remove();
                municipio_opt.prop('disabled', true);
                $.post(urlmodule+"/get.point"
                    , {lat: lat,
                        lng: lng}
                    // , {lng: lng}
                    , function (res, textStatus, jqXHR) {
                        // console.log(res);
                        let selOption = $('<option></option>');
                        municipio_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_municipio_id#}{literal}"));
                        departamento_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_departamento_id#}{literal}"));
                        let departamento_list = []
                        for (var row in res) {
                            departamento_opt.append($('<option></option>').attr({value:res[row].state_province_id, selected: true}).text(res[row].state_province));
                            departamento_list[res[row].state_province_id] = res[row];
                        }
                        let municipio_list = []
                        for (var row1 in res) {
                            municipio_opt.append($('<option></option>').attr("value", res[row1].municipality_id).text(res[row1].municipality));
                            municipio_list[res[row1].municipality_id] = res[row1];
                        }
                        municipio_opt.trigger('chosen:updated');
                        municipio_opt.prop('disabled', false);
                        departamento_opt.trigger('chosen:updated');
                        departamento_opt.prop('disabled', false);
                    }
                    , 'json');
            }else{
                //handle_options_init();
            }
        }

        $(function() {
            var lat = latitude.val();
            var lng = longitude.val();
            const utmCoords = convertirUTM(lat, lng);
            refresh_option_dep_mun(lat,lng);
            $('#verbatim_latitude').val(convertirDMS(lat));
            $('#utm_latitude').val(utmCoords.x);

            $('#verbatim_longitude').val(convertirDMS(lng));
            $('#utm_longitude').val(utmCoords.y);

            $('#zone').val(utmCoords.zone);
            $('#hemisferio').val(utmCoords.hemisferio);
        });

        // var location_latitude_decimal = $('#location_latitude_decimal').val();
        var handle_calculos = function(){
            $("#location_latitude_decimal").bind("keyup keydown change", function(){
                var lat = latitude.val();
                var lng = longitude.val();
                const utmCoords = convertirUTM(lat, lng);
                refresh_option_dep_mun(lat,lng);
                $('#verbatim_latitude').val(convertirDMS(lat));
                $('#utm_latitude').val(utmCoords.x);
                $('#utm_longitude').val(utmCoords.y);
                $('#zone').val(utmCoords.zone);
                $('#hemisferio').val(utmCoords.hemisferio);
            });
            $("#location_longitude_decimal").bind("keyup keydown change", function(){
                var lat = latitude.val();
                var lng = longitude.val();
                const utmCoords = convertirUTM(lat, lng);
                refresh_option_dep_mun(lat,lng);
                $('#verbatim_longitude').val(convertirDMS(lng));
                $('#utm_latitude').val(utmCoords.x);
                $('#utm_longitude').val(utmCoords.y);
                $('#zone').val(utmCoords.zone);
                $('#hemisferio').val(utmCoords.hemisferio);
            });
        };

        return {
            // public functions
            init: function () {
                // default charts
                createMap();
                handle_ll();
                handle_option_municipio();
                handle_change_municipio();
                handle_calculos();
            }
        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_general_form.init();
        snippet_geovisor.init();
    });
</script>
{/literal}