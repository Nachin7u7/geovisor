<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */

/**
 * Arreglos que se utilizaran en esta configuración para guardar los grupos de campos
 */
$fields = array();

/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();
$field_item["date"] = array("type" => "text");
$field_item["verbatim_event_date"] = array("type" => "date_01");
$field_item["event_time"] = array("type" => "text");
$field_item["field_number"] = array("type" => "text");
$field_item["event_remarks"] = array("type" => "text");
$field_item["colector_principal"] = array("type" => "text");

$fields["module"] = $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
