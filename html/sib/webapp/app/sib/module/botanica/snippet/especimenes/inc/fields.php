<?PHP
/**
 * Configuramos todas los grupos de campos, para creación y verificación de formulaios
 */
$fields = array();
/***
 * Configuraciòn de los grupos de campos a utilizar
 */
$field_item = array();
$field_item["basisofrecord"]=array("type"=>"text");
//$field_item["type"]=array("type"=>"text");
//$field_item["institutionCode_id"]=array("type"=>"text");
//$field_item["institutionID"]=array("type"=>"text");
//$field_item["collectionCode"]=array("type"=>"text");

$group = "index";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Apartir de aca, puedes configurar otros campos
 */
