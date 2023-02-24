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
$field_item["kingdom_id"]=array("type"=>"text");
$field_item["division_id"]=array("type"=>"text");
$field_item["order_id"]=array("type"=>"text");
$field_item["family_id"]=array("type"=>"text");
$field_item["genus_id"]=array("type"=>"text");
$field_item["phylum_id"]=array("type"=>"text");
$field_item["class_id"]=array("type"=>"text");
$field_item["scientific_name"]=array("type"=>"text");
//$field_item["active"]=array("type"=>"checkbox_02");


$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
