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
$grid_table[] = array(
    "table" => $appVars["table"] ["sex"] // Nombre de la tabla con la que hara la relación
, "alias" => "s" //Alias de la tabla para el join
, "field_id" => "id" //Id de la tabla que hara la relación
, "relationship_id" => "sex_id" //Campo de relación en la tabla principal
);
$grid_table[] = array(
    "table" => $appVars["table"] ["occurrence_status"] // Nombre de la tabla con la que hara la relación
, "alias" => "os" //Alias de la tabla para el join
, "field_id" => "id" //Id de la tabla que hara la relación
, "relationship_id" => "occurrence_status_id" //Campo de relación en la tabla principal
);
/**
 * Configuración de los campos que mostraremos en la grilla
 */
$grid_item[] = array("field" => "catalog_number", "label" => $smarty->config_vars["table_catalog_number"]);
$grid_item[] = array("field" => "class", "label" => $smarty->config_vars["table_class"]);
$grid_item[] = array("field" => "order", "label" => $smarty->config_vars["table_order"]);
$grid_item[] = array("field" => "family", "label" => $smarty->config_vars["table_family"]);
$grid_item[] = array("field" => "genus", "label" => $smarty->config_vars["table_genus"]);

$grid_item[] = array("field" => "nombre", "label" => $smarty->config_vars["table_sex"]
, "table_as" => "s", "as" => "sex");

$grid_item[] = array("field" => "nombre", "label" => $smarty->config_vars["table_occurrence_status"]
, "table_as" => "os", "as" => "occurrence_status");

$grid_item[] = array("field" => "created_at", "label" => $smarty->config_vars["gl_table_created_at"]);
$grid_item[] = array("field" => "updated_at", "label" => $smarty->config_vars["gl_table_updated_at"]);

$group = "item";
$grid[$group] = $grid_item;
$grid_table_join[$group] = $grid_table;
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
