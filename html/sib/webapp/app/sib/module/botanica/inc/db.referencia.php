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
$db_table[] = Core::getTableConfig("especimen_foto");
$db_table[] = Core::getTableConfig("institucion");
$appVars["table"]  = Core::getDbTablesFromArray($db_table,$dbSchemaName);
unset($db_table);
unset($db_prefix);


$db_table = array();
$dbSchemaName = "catalogo";
$db_table[] = Core::getTableConfig("pais");
$db_table[] = Core::getTableConfig("language");
$db_table[] = Core::getTableConfig("license");
$db_table[] = Core::getTableConfig("life_stage");
$db_table[] = Core::getTableConfig("occurrence_status");
$db_table[] = Core::getTableConfig("preparations");
$db_table[] = Core::getTableConfig("sex");
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
