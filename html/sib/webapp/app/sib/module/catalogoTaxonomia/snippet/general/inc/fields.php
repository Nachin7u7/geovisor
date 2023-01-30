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
$field_item["reino_id"]=array("type"=>"text");
$field_item["division_id"]=array("type"=>"text");
$field_item["orden_id"]=array("type"=>"text");
$field_item["familia_id"]=array("type"=>"text");
$field_item["genero_id"]=array("type"=>"text");
$field_item["especie_id"]=array("type"=>"text");
$field_item["filo_id"]=array("type"=>"text");
$field_item["clase_id"]=array("type"=>"text");
$field_item["tipo_nomenclatura_id"]=array("type"=>"text");
$field_item["categoria_taxon_id"]=array("type"=>"text");
$field_item["epiteto_id"]=array("type"=>"text");
$field_item["nombre_cientifico"]=array("type"=>"text");
//$field_item["active"]=array("type"=>"checkbox_02");


$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */
