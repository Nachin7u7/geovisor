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
$field_item["categoria_id"]=array("type"=>"text");
$field_item["order_id"]=array("type"=>"text");
$field_item["family_id"]=array("type"=>"text");
$field_item["genus_id"]=array("type"=>"text");
$field_item["phylum_id"]=array("type"=>"text");
$field_item["class_id"]=array("type"=>"text");
$field_item["species"]=array("type"=>"text");
$field_item["scientific_name"]=array("type"=>"text");
$field_item["scientific_name_authorship"]=array("type"=>"text");
//$field_item["active"]=array("type"=>"checkbox_02");


$fields["module"]= $field_item;
unset($field_item);
/**
 * Apartir de aca, puedes configurar otros campos
 */

/**
 * Formulario Unidad
 */
$field_item = array();
$field_item["nombre"]=array("type"=>"text");
$group = "addphylum";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Formulario Class
 */
$field_item = array();
$field_item["nombre"]=array("type"=>"text");
$field_item["phylum_id"]=array("type"=>"text");
$group = "addclass";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Formulario Order
 */
$field_item = array();
$field_item["nombre"]=array("type"=>"text");
$field_item["class_id"]=array("type"=>"text");
$group = "addorder";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Formulario Family
 */
$field_item = array();
$field_item["nombre"]=array("type"=>"text");
$field_item["order_id"]=array("type"=>"text");
$group = "addfamily";
$fields[$group]= $field_item;
unset($field_item);

/**
 * Formulario Genus
 */
$field_item = array();
$field_item["nombre"]=array("type"=>"text");
$field_item["family_id"]=array("type"=>"text");
$group = "addgenus";
$fields[$group]= $field_item;
unset($field_item);