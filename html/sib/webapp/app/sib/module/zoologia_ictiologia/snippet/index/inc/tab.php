<?PHP
/**
 * Configuración de los tabs a utilizarse en el snippet
 */

$tabs = array();
\Core\Core::setLenguage("tabItem"); //cargamos idioma

/**
 * Realizamos la configuración de los taps para cada grupo que utilicemos
 */
//-------------------------------------------------------------
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_taxonomia"]
,   "id_name"=>"taxonomia"
,   "icon" => "fas fa-otter m--font-success"
,   "new" => 1
);

//-------------------------------------------------------------
$item_tab[]=array(
    "label"=> $smarty->config_vars["tabGeneral"]
,   "id_name"=>"general"
,   "icon" => "fas fa-dungeon m--font-success"
,   "new" => 0
);

//-------------------------------------------------------------

$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_datoscolecta"]
,   "id_name"=>"datoscolecta"
,   "icon" => "fas fa-book m--font-success"
,   "new" => 0
);
//-------------------------------------------------------------

$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_lugarcolecta"]
,   "id_name"=>"lugarcolecta"
,   "icon" => "fas fa-map-marker m--font-success"
,   "new" => 0
);

//-------------------------------------------------------------
$item_tab[]=array(
    "label"=> $smarty->config_vars["tab_foto"]
,   "id_name"=>"foto"
,   "icon" => "fas fa-paperclip m--font-success"
,   "new" => 0
);
//-------------------------------------------------------------

/**
 * Se añade el arreglo de tabs configurada a $tabs
 */
$group = "index";
$tabs[$group]= $item_tab;
unset($item_tab); // siempre se borrar la variable para iniciar una nueva configuración

/**
 * A partir de aca puede añadir todos los grupos de tabs que sean necesarias para esta vista
 */
