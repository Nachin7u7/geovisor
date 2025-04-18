<?PHP
namespace App\Sib\Module\Zoologia_reptiles\Snippet\general;
use Core\CoreResources;

class Index extends CoreResources
{
    var $objTable = "especimen";
//    var $fkey_field = "coleccion_id";
//    var $fkey_id = 6;
//    var $extraWhere = "";
    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
//        $this->extraWhere = $this->fkey_field."=".$this->fkey_id ;
    }
    function getItem($idItem){

        $info = '';

        if($idItem!=''){
            $sqlSelect = ' i.*
                           , concat(u1.name,\' \',u1.last_name) AS user_creater
                            , CONCAT(u2.name,\' \',u2.last_name) as user_updater';
            $sqlFrom = ' '.$this->table[$this->objTable].' i
                         LEFT JOIN '.$this->table_core["user"].' u1 on u1.id=i.user_create
                         LEFT JOIN '.$this->table_core["user"].' u2 on u2.id=i.user_update';
            $sqlWhere = ' i.id='.$idItem;
            $sqlGroup = ' ';

            $sql = 'SELECT '.$sqlSelect.'
                  FROM '.$sqlFrom.'
                  WHERE '.$sqlWhere.'
                  '.$sqlGroup;
            $info = $this->dbm->Execute($sql);
            $info = $info->fields;


        }
        return $info;
    }
    function updateData($rec,$itemId,$action){
        //print_struc($rec);exit;
        $form="module";
        $itemData  = $this->processData($form,$rec,$action);
        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$this->table[$this->objTable],$action,$field_id);
        $res["accion"] = $action;
        return $res;
    }

    function processData($form,$rec,$action="new"){
        $dataResult = array();
        switch($form){
            case 'module':
                $dataResult = $this->processFields($rec,$this->campos[$form],$action);
                /**
                 * Additional processes when saving the data
                 */
                if ($action=="new"){
                    $dataResult["categoria_id"] = 5;
                }
                if ($dataResult["language_id"]=="" or $dataResult["language_id"]==0){
                    $dataResult["language_id"] = NULL;
                }
                if ($dataResult["license_id"]=="" or $dataResult["license_id"]==0){
                    $dataResult["license_id"] = NULL;
                }
                if ($dataResult["life_stage_id"]=="" or $dataResult["life_stage_id"]==0){
                    $dataResult["life_stage_id"] = NULL;
                }
                if ($dataResult["occurrence_status_id"]=="" or $dataResult["occurrence_status_id"]==0){
                    $dataResult["occurrence_status_id"] = NULL;
                }
                if ($dataResult["preparations_id"]=="" or $dataResult["preparations_id"]==0){
                    $dataResult["preparations_id"] = NULL;
                }
                if ($dataResult["sex_id"]=="" or $dataResult["sex_id"]==0){
                    $dataResult["sex_id"] = NULL;
                }
                break;
        }
        return $dataResult;
    }

}