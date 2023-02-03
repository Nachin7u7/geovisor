<?PHP
/**
 * Configuramos todas las grillas que utilizaremos en este snippet
 */
$grid = array();
$grid_table_join = array();

\Core\Core::setLenguage("tableIndex"); //cargamos idioma
/**
 * Configuración de tablas relacionales, (JOIN)
 */
//$grid_table[] = array(
//    "table" => $appVars["table"] ["programa_estado"] // Nombre de la tabla con la que hara la relación
//,    "alias"=> "e" //Alias de la tabla para el join
//,   "field_id"=>"id" //Id de la tabla que hara la relación
//,   "relationship_id"=>"estado_id" //Campo de relación en la tabla principal
//);
//$grid_table[] = array(
//    "table" => $appVars["table"] ["moneda"] // Nombre de la tabla con la que hara la relación
//,    "alias"=> "m" //Alias de la tabla para el join
//,   "field_id"=>"id" //Id de la tabla que hara la relación
//,   "relationship_id"=>"moneda_id" //Campo de relación en la tabla principal
//);
/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[]=array("field" => "basis_of_record","label"=> $smarty->config_vars["table_basis_of_record"]);
$grid_item[]=array("field" => "type","label"=> $smarty->config_vars["table_type"]);
$grid_item[]=array("field" => "collection_code","label"=> $smarty->config_vars["table_collection_code"]);
$grid_item[]=array("field" => "catalog_number","label"=> $smarty->config_vars["table_catalog_number"]);
$grid_item[]=array("field" => "rights_holder","label"=> $smarty->config_vars["table_rights_holder"]);
$grid_item[]=array("field" => "access_rights","label"=> $smarty->config_vars["table_access_rights"]);
$grid_item[]=array("field" => "recorded_by","label"=> $smarty->config_vars["table_recorded_by"]);

$grid_item[]=array("field" => "created_at","label"=> $smarty->config_vars["gl_table_created_at"]);
$grid_item[]=array("field" => "updated_at","label"=> $smarty->config_vars["gl_table_updated_at"]);

$group = "item";
$grid[$group]= $grid_item;
$grid_table_join[$group]= $grid_table;
unset($grid_item);
unset($grid_table);
/**
 * A partir de aca puede añadir todas las grillas que sean necesarias para esta vista
 */
/*/
print_struc($grid_table_join);
print_struc($grid);
exit;
/**/