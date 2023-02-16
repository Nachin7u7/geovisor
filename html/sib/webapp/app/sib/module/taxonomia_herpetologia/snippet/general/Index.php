<?PHP
namespace App\Sib\Module\Taxonomia_herpetologia\Snippet\general;
use Core\CoreResources;

class Index extends CoreResources
{
    var $objTable = "catalogo_taxonomia";
    function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
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
        if( $res["res"]==1){
            $this->setClass($itemData["class_id"], $itemId);
            $this->setOrder($itemData["order_id"], $itemId);
            $this->setFamily($itemData["family_id"], $itemId);
            $this->setGenus($itemData["genus_id"], $itemId);
            $this->setKingdom($itemData["kingdom_id"], $itemId);
        }
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
                    $dataResult["kingdom_id"] = 2;
                    $dataResult["kingdom"] = "Animalae";
                }
                $dataResult["class"] = $this->getItemClass($rec["class_id"])["nombre"];
                $dataResult["order"] = $this->getItemOrder($rec["order_id"])["nombre"];
                $dataResult["family"] = $this->getItemFamily($rec["family_id"])["nombre"];
                $dataResult["genus"] = $this->getItemGenus($rec["genus_id"])["nombre"];
                break;
        }
        return $dataResult;
    }

    private function setClass($class_id, $itemId){
        if($class_id!=""){
            $sql = "SELECT * 
                    FROM catalogo.clase where id=".$class_id;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["class"]=$item["nombre"];
            $where = "id = ".$itemId;
            $table = $this->table["catalogo_taxonomia"];
            $this->dbm->AutoExecute($table,$rec,"UPDATE",$where);
        }
    }

    function getItemClass($id){
        $sql = "select * from catalogo.clase where id = '".$id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function setOrder($orden_id, $itemId){
        if($orden_id!=""){
            $sql = "SELECT * 
                    FROM catalogo.orden where id=".$orden_id;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["order"]=$item["nombre"];
            $where = "id = ".$itemId;
            $table = $this->table["catalogo_taxonomia"];
            $this->dbm->AutoExecute($table,$rec,"UPDATE",$where);
        }
    }

    function getItemOrder($id){
        $sql = "select * from catalogo.orden where id = '".$id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function setFamily($family_id, $itemId){
        if($family_id!=""){
            $sql = "SELECT * 
                    FROM catalogo.familia where id=".$family_id;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["family"]=$item["nombre"];
            $where = "id = ".$itemId;
            $table = $this->table["catalogo_taxonomia"];
            $this->dbm->AutoExecute($table,$rec,"UPDATE",$where);
        }
    }

    function getItemFamily($id){
        $sql = "select * from catalogo.familia where id = '".$id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function setGenus($genus_id, $itemId){
        if($genus_id!=""){
            $sql = "SELECT * 
                    FROM catalogo.genero where id=".$genus_id;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["genus"]=$item["nombre"];
            $where = "id = ".$itemId;
            $table = $this->table["catalogo_taxonomia"];
            $this->dbm->AutoExecute($table,$rec,"UPDATE",$where);
        }
    }

    function getItemGenus($id){
        $sql = "select * from catalogo.genero where id = '".$id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function setKingdom($kingdom_id, $itemId){
        if($kingdom_id!=""){
            $sql = "SELECT * 
                    FROM catalogo.reino where id=".$kingdom_id;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["kingdom"]=$item["nombre"];
            $where = "id = ".$itemId;
            $table = $this->table["catalogo_taxonomia"];
            $this->dbm->AutoExecute($table,$rec,"UPDATE",$where);
        }
    }

}