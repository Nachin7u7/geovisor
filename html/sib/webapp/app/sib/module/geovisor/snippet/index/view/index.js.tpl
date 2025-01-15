{*
https://leaflet-extras.github.io/leaflet-providers/preview/
*}
<script src="https://maps.googleapis.com/maps/api/js?key={$google_map_key}"></script>
<script src="/js/geo/leaflet.1.7.1/leaflet.js"></script>


<script src="/js/geo/leaflet.spin/example/spin/dist/spin.min.js"></script>
<script src="/js/geo/leaflet.spin/leaflet.spin.min.js"></script>

<script src="/js/geo/leaflet.sidebar-v2/js/leaflet-sidebar.js"></script>


<script src="/js/geo/leaflet.extramarkers/dist/js/leaflet.extra-markers.js">

<script src="/js/geo/leaflet.fullscreen/Control.FullScreen.js"></script>
<script src="/js/geo/Leaflet.GoogleMutant.js"></script>

<script src="/js/geo/leaflet.ajax/dist/leaflet.ajax.js"></script>
<script src="/js/geo/leaflet.ajax/example/spin.js"></script>

<!--script src="/js/geo/leaflet.groupedlayercontrol/dist/leaflet.groupedlayercontrol.min.js"></script-->
<script src="/js/geo/leaflet.panel-layers/dist/leaflet-panel-layers.min.js"></script>
<script src="/js/geo/leaflet.wms/dist/leaflet.wms.js"></script>
<script src="/js/geo/leaflet.minimap/dist/Control.MiniMap.min.js"></script>
<script src="/js/geo/leaflet.control.custom/Leaflet.Control.Custom.js"></script>


<script src="/js/geo/leaflet.wms-legend/leaflet.wmslegend.js"></script>


<script src="/js/geo/leaflet.gibs/src/GIBSMetadata.js"></script>
<script src="/js/geo/leaflet.gibs/src/GIBSLayer.js"></script>

<script src="/js/chart.js/Chart.min.js"></script>


{literal}
<script>
    var filtro_var="";
    var filtro_departamento, filtro_programa;
    var filtro_estado,filtro_gd_tipo_fuente_generacion;
    var urlsys = '{/literal}{$path_url}{literal}';
    var urljson = urlsys+'/get.point';

    var json_layer;
    var recargar;
    let workspaces = "sib:";


    var snippet_tab_item = function () {
        var borra_contenido_tabs = function () {
            {/literal}
            {foreach from=$menu_tab item=row key=idx}
            $("#{$row.id_name}_pane").html("");
            {/foreach}
            {literal}
            reset_estado();
        };
        var handler_tab_build = function(){
            $('[data-toggle="tabajax"]').click(function(e) {
                e.preventDefault();
                var $this = $(this),
                    loadurl = $this.attr('data-href') + filtro_var,
                    targ = $this.attr('data-target');
                id_name =targ;
                targ = "#"+targ+"_pane";
                //Vaciamos el tab
                recargar = 0;
                switch(id_name) {
                {/literal}
                {foreach from=$menu_tab item=row key=idx}
                    case '{$row.id_name}':
                        if ({$row.id_name}_var ==0){
                            {$row.id_name}_var =1;
                            recargar = 1;
                        }
                        break;
                {/foreach}
                {literal}
                }

                if(recargar==1){
                    borra_contenido_tabs();
                    cargando = "<div style='text-align: center;padding-top: 50px;'>Cargando datos...</div>";
                    $(targ).html(cargando);
                    $.get(loadurl, function(data) {
                        $(targ).html(data);
                    });

                    switch(id_name) {
                    {/literal}
                    {foreach from=$menu_tab item=row key=idx}
                        case '{$row.id_name}':
                            {$row.id_name}_var =1;
                            break;
                    {/foreach}
                    {literal}
                    }
                }

                return false;
            });
        };


        {/literal}
        {foreach from=$menu_tab item=row key=idx}
        var {$row.id_name}_var;
        {/foreach}
        {literal}


        var reset_estado = function(){
            {/literal}
            {foreach from=$menu_tab item=row key=idx}
            {$row.id_name}_var = 0;
            {/foreach}
            {literal}
        };

        return {
            init: function() {
                handler_tab_build();
                reset_estado();
            },
            reset_estado: function () {
                reset_estado();
            }
        };
    }();



    var map;
    var snippet_geovisor = function () {

        var map_default_center = [-17.403918, -64.354500];
        var map_default_zoom= 6;
        var geoserver_mmaya = '/geoserver/wms';
        var geoserver_sig01 = 'https://sig01.mmaya.gob.bo/geoserver/wms';
        var layer_departamento,layer_municipio;
        var uh_nivel1,uh_nivel2,uh_nivel3,uh_nivel4,uh_nivel5, macroregion,cuencas_operativas;

        var getGroupedOverlays = function(){

            /**
             * Grupos restantes
             */
            var overLayers = [
                {
                    group: "Administrativos",
                    collapsed: true,
                    layers: [
                        {
                            active: true,
                            name: "Departamento",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: layer_departamento
                        },
                        {
                            name: "Municipio",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: layer_municipio
                        }

                    ]
                },
                {
                    group: "Unidad Hidrográfica",
                    collapsed: true,
                    layers: [
                        {
                            active: false,
                            name: "UH Nivel5",
                            icon: '<i class="fa fa-map-marked-alt icon-sm"></i>',
                            layer: uh_nivel5
                        },
                        ...
                    ]
                },
                ...
            ];
            return overLayers;
        };

        var initialiseMap = function(){
            var mapOptions = {
                center: map_default_center//punto
                , zoom: map_default_zoom
                ,fullscreenControl: true
                ,scrollWheelZoom: true
            };
            var m = L.map('map',mapOptions);
            L.control.scale({metric: true, imperial: false}).addTo(m);
            return m;
        };

        var createMap = function(){
            map = initialiseMap();
            var controlLayers = new L.Control.PanelLayers(getBaseLayers(), getGroupedOverlays(), options);
            map.addControl(controlLayers);
        };

        return {
            init: function() {
                createMap();
            },
        };

    }();

    jQuery(document).ready(function() {
        snippet_geovisor.init();
        snippet_tab_item.init();
    });

</script>
{/literal}
