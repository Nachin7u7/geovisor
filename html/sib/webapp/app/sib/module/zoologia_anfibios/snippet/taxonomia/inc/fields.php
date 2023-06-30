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
$field_item["identified_by"]=array("type"=>"text");
$field_item["type_status"]=array("type"=>"text");
$field_item["catalogo_taxonomia_id"]=array("type"=>"text");
$field_item["scientific_name_authorship"]=array("type"=>"text");
$field_item["identification_qualifier"] = array("type" => "text");
$field_item["genus"]=array("type"=>"text");
$field_item["kingdom"]=array("type"=>"text");
$field_item["order"]=array("type"=>"text");
$field_item["family"]=array("type"=>"text");
$field_item["class"]=array("type"=>"text");
$field_item["specific_epithet"] = array("type" => "text");
$field_item["vernacular_name"] = array("type" => "text");
$field_item["taxon_rank"] = array("type" => "text");

$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
