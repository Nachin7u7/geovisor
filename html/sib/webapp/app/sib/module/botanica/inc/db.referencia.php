<?PHP
use Core\Core;
/**
 * Configuración de referncias de las tablas de las base de datos que utilizaremos en este módulo
 *
 */
$appVars["table"]  = array();
/**
 * Tablas de información principal, configuración de los objetos principales
 */

$db_prefix = ""; //prefijo de la base de datos
$db_table = array();
$dbSchemaName = "coleccion";
$db_table[] = Core::getTableConfig("catalogo_taxonomia");
$db_table[] = Core::getTableConfig("especimen");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName);
unset($db_table);
unset($db_prefix);


$db_table = array();
$dbSchemaName = "catalogo";
$db_table[] = Core::getTableConfig("reino");
$db_table[] = Core::getTableConfig("division");
$db_table[] = Core::getTableConfig("orden");
$db_table[] = Core::getTableConfig("familia");
$db_table[] = Core::getTableConfig("genero");
$db_table[] = Core::getTableConfig("especie");
$db_table[] = Core::getTableConfig("filo");
$db_table[] = Core::getTableConfig("clase");
$db_table[] = Core::getTableConfig("tipo_nomenclatura");
$db_table[] = Core::getTableConfig("categoria_taxon");
$db_table[] = Core::getTableConfig("epiteto");
$db_table[] = Core::getTableConfig("coleccion");
$db_table[] = Core::getTableConfig("pais");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName,$appVars["table"] );
unset($db_table);

$db_table = array();
$dbSchemaName = "geo";
$db_table[] = Core::getTableConfig("departamento");
$db_table[] = Core::getTableConfig("municipio");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName,$appVars["table"] );
unset($db_table);

/**
 * Otras base de datos
 */

/* /
print_struc($appVars["table"] );
print_struc($CFG->table);
exit;
/**/
