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
$field_item["occurrence_id"]=array("type"=>"text");
$field_item["basis_of_record"]=array("type"=>"text");
$field_item["type"]=array("type"=>"text");
$field_item["collection_code"]=array("type"=>"text");
$field_item["collection_id"]=array("type"=>"text");
$field_item["catalog_number"]=array("type"=>"text");
$field_item["language_id"]=array("type"=>"text");
$field_item["license_id"]=array("type"=>"text");
$field_item["rights_holder"]=array("type"=>"text");
$field_item["access_rights"]=array("type"=>"text");
//$field_item["active"]=array("type"=>"checkbox_02");


$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
