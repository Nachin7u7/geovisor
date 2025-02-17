<link rel="stylesheet" type="text/css" href="/js/geo/leaflet.1.7.1/leaflet.css" />

<link rel="stylesheet" type="text/css" href="/js/geo/leaflet.extramarkers/dist/css/leaflet.extra-markers.min.css" />

<link rel="stylesheet" type="text/css" href="/js/geo/leaflet.sidebar-v2/css/leaflet-sidebar.css" />
<link rel="stylesheet" type="text/css" href="/js/geo/leaflet.fullscreen/Control.FullScreen.css" />
<!--link rel="stylesheet" type="text/css" href="/js/geo/leaflet.groupedlayercontrol/dist/leaflet.groupedlayercontrol.min.css" /-->
<link rel="stylesheet" type="text/css" href="/js/geo/leaflet.panel-layers/dist/leaflet-panel-layers.min.css" />
<link rel="stylesheet" type="text/css" href="/js/geo/leaflet.minimap/dist/Control.MiniMap.min.css" />

<link rel="stylesheet" type="text/css" href="/js/geo/leaflet.wms-legend/leaflet.wmslegend.css" />

{literal}
<style>
    body {

        padding: 0;
        margin: 0;

    }

    html,
    body,
    #map {

        height: 100% !important;
        width: 100% !important;
    }

    .leaflet-panel-layers {
        width: 50px;
        min-width: 50px;
    }

    .leaflet-panel-layers.expanded {
        width: auto;
        overflow-x: hidden;
        overflow-y: auto;
    }

    .leaflet-panel-layers-item {
        padding: 0px;
    }

    .leaflet-panel-layers-group.collapsible:not(.expanded) {
        padding: 0px;
        font-weight: bold;
        size: 12px !important;
    }

    .leaflet-panel-layers-grouplabel .leaflet-panel-layers-title {
        padding-right: 15px;
    }

    .titulo2 {
        padding: 3px;
        border-bottom: 2px solid #0997fa;
        background: #f7fbfb;
        /*
            text-transform: uppercase;
            font-weight: bolder;
            */
        color: #0997fa;
        font-size: 11px;
    }

    .titulo {
        border-bottom: 4px solid #8c49c4 !important;
        background: #f9f6fb;
        padding: 8px;
        font-size: 10px;
    }

    .ubicacion_titulo {
        padding: 2px;
        border-bottom: 2px solid #438084;
        font-weight: bolder;
        background: #f7fbfb;
        text-transform: uppercase;
        color: #438084;
        font-size: 10px;
    }

    .ubicacion {
        font-size: 9px;
        color: #a7a7a7;
    }

    .menuizq {
        /*background: red;*/
        opacity: 0.85 !important;
    }

    .leaflet-popup-content-wrapper {
        text-align: left !important;

    }

    .leaflet-popup-content-wrapper .leaflet-popup-content {
        font-size: 11px !important;
    }

    h4.titulo_esta {
        font-size: 13px;
        padding-top: 5px;
        border-bottom: 2px solid #7236aa;
        text-transform: uppercase;
    }

    #map div.leaflet-panel-layers {
        /*
            background-color: #f2f8fa;
             */
        /*color: #fff;*/

    }

    /**
        Base
         */
    .sinb-group .leaflet-panel-layers-base .leaflet-panel-layers-group {
        background-color: rgba(230, 231, 238, .5);
    }

    .sinb-group .leaflet-panel-layers-base .leaflet-panel-layers-item .leaflet-panel-layers-title span {
        padding-left: 5px;
    }

    .sinb-group .leaflet-panel-layers-base .leaflet-panel-layers-item .leaflet-panel-layers-title {
        padding-left: 2px;
    }

    .sinb-group .leaflet-panel-layers-base .leaflet-panel-layers-item,
    .sinb-group .leaflet-panel-layers-base .leaflet-panel-layers-item:hover {
        background-color: rgba(230, 231, 238, .5);
        border: 0px solid #97a62e !important;
    }

    .sinb-group .leaflet-panel-layers-base .leaflet-panel-layers-grouplabel .leaflet-panel-layers-title,
    .sinb-group .leaflet-panel-layers-base .leaflet-panel-layers-icon {
        color: #0c5d9b !important;
    }

    /**
        Layers
         */
    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-group {
        background-color: #4A90E2;
        /* Azul brillante */
        border-radius: 8px;
        /* Hace que los bordes sean más suaves */
        padding: 10px 12px !important;
        /* Aumenta el área del botón */
        margin-bottom: 8px !important;
        /* Más separación entre los grupos */
        min-height: 35px !important;
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-grouplabel:hover {
        filter: brightness(1.2);
        /* Hace que el color resalte al pasar el mouse */
        transform: scale(1.2);
        /* Efecto leve de agrandamiento */
        transition: all 0.2s ease-in-out;
    }


    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-grouplabel {
        padding: 4px 8px !important;
        /* Reduce padding vertical y lateral */
        min-height: 20px !important;
        /* Ajusta la altura mínima */
        line-height: 18px !important;
        /* Asegura una buena alineación */
        display: flex;
        align-items: center;
        /* Centra el contenido */
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-grouplabel .leaflet-panel-layers-title {
        font-size: 15px !important;
        padding: 2px 5px !important;
        /* Reduce espacio interno */
        color: #FFFFFF !important;
        font-weight: bold;
        text-transform: uppercase;
        white-space: nowrap;
        /* Evita que se corte */
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-icon {
        color: #FFD700 !important;
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-item {
        background-color: rgba(254, 255, 246, .8);
        border: 1px solid #97a62e !important;
        /*color: #535563 !important;*/
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-item:hover {
        /*
            background-color: rgba(252,255,235,.8);
             */
        background-color: rgba(255, 254, 229, .8);
        border: 1px solid #72a62e !important;
        /*color: #535563 !important;*/
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-item,
    .leaflet-panel-layers-title {
        color: #535563 !important;
    }


    /**
        Unidad Hidrográfica
         */

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-group:nth-of-type(1) {
        background-color: #FF5733;
        /* Rojo */
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-group:nth-of-type(2) {
        background-color: #2ECC71;
        /* Verde */
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-group:nth-of-type(3) {
        background-color: #F1C40F;
        /* Amarillo */
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-group:nth-of-type(4) {
        background-color: #9B59B6;
        /* Morado */
    }

    .sinb-group .leaflet-panel-layers-overlays .leaflet-panel-layers-group:nth-of-type(5) {
        background-color: #3498DB;
        /* Azul */
    }
</style>
{/literal}