<?PHP

namespace App\Sib\Taxonomia_p_vertebrado\general;

use Core\CoreResources;

class Index extends CoreResources
{
    public $objTable = "taxonomia";

    public function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }

    public function getItem($idItem)
    {

        $info = '';

        if ($idItem != '') {
            $sqlSelect = ' i.*
                           , concat(u1.name,\' \',u1.last_name) AS user_creater
                            , CONCAT(u2.name,\' \',u2.last_name) as user_updater';
            $sqlFrom = ' ' . $this->table[$this->objTable] . ' i
                         LEFT JOIN ' . $this->table_core["user"] . ' u1 on u1.id=i.user_create
                         LEFT JOIN ' . $this->table_core["user"] . ' u2 on u2.id=i.user_update';
            $sqlWhere = ' i.id=' . $idItem;
            $sqlGroup = ' ';

            $sql = 'SELECT ' . $sqlSelect . '
                  FROM ' . $sqlFrom . '
                  WHERE ' . $sqlWhere . '
                  ' . $sqlGroup;
            $info = $this->dbm->Execute($sql);
            $info = $info->fields;


        }
        return $info;
    }

    public function updateData($rec, $itemId, $action)
    {
        $form = "module";
        $itemData = $this->processData($form, $rec, $action);
        /**
         * Save processed data
         */
        $fieldId = "id";
        $res = $this->updateItem($itemId, $itemData, $this->table[$this->objTable], $action, $fieldId);
        $res["accion"] = $action;
        if ($res["res"] == 1) {
            $this->setPhylum($itemData["phylum_id"], $itemId);
            $this->setClass($itemData["class_id"], $itemId);
            $this->setOrder($itemData["order_id"], $itemId);
            $this->setFamily($itemData["family_id"], $itemId);
            $this->setGenus($itemData["genus_id"], $itemId);
            $this->setKingdom($itemData["kingdom_id"], $itemId);
        }
        return $res;
    }

    public function processData($form, $rec, $action = "new")
    {
        $dataResult = array();
        $dataResult = $this->processFields($rec, $this->campos[$form], $action);
        switch ($form) {
            case 'module':
                /**
                 * Additional processes when saving the data
                 */
                if ($action == "new") {
                    $dataResult["kingdom_id"] = 2;
                    $dataResult["kingdom"] = "Animalae";
                    $dataResult["categoria_id"] = 2;
                }
                $dataResult["phylum"] = $this->getItemPhylum($rec["phylum_id"])["nombre"];
                $dataResult["class"] = $this->getItemClass($rec["class_id"])["nombre"];
                $dataResult["order"] = $this->getItemOrder($rec["order_id"])["nombre"];
                $dataResult["family"] = $this->getItemFamily($rec["family_id"])["nombre"];
                $dataResult["genus"] = $this->getItemGenus($rec["genus_id"])["nombre"];
                break;
            case 'addphylum':
                $dataResult["kingdom_id"] = 2;
                break;
            case 'addclass':
            case 'addorder':
            case 'addfamily':
            case 'addgenus':
            default:
        }
        return $dataResult;
    }

    private function setPhylum($divisionId, $itemId)
    {
        if ($divisionId != "") {
            $sql = "SELECT *
                    FROM catalogo.phylum where id=" . $divisionId;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["division"] = $item["nombre"];
            $where = "id = " . $itemId;
            $table = $this->table["taxonomia"];
            $this->dbm->AutoExecute($table, $rec, "UPDATE", $where);
        }
    }

    public function getItemPhylum($id)
    {
        $sql = "select * from catalogo.phylum where id = '" . $id . "'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function setClass($classId, $itemId)
    {
        if ($classId != "") {
            $sql = "SELECT *
                    FROM catalogo.class where id=" . $classId;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["class"] = $item["nombre"];
            $where = "id = " . $itemId;
            $table = $this->table["taxonomia"];
            $this->dbm->AutoExecute($table, $rec, "UPDATE", $where);
        }
    }

    public function getItemClass($id)
    {
        $sql = "select * from catalogo.class where id = '" . $id . "'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function setOrder($ordenId, $itemId)
    {
        if ($ordenId != "") {
            $sql = "SELECT *
                    FROM catalogo.order where id=" . $ordenId;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["order"] = $item["nombre"];
            $where = "id = " . $itemId;
            $table = $this->table["taxonomia"];
            $this->dbm->AutoExecute($table, $rec, "UPDATE", $where);
        }
    }

    public function getItemOrder($id)
    {
        $sql = "select * from catalogo.order where id = '" . $id . "'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function setFamily($familyId, $itemId)
    {
        if ($familyId != "") {
            $sql = "SELECT *
                    FROM catalogo.family where id=" . $familyId;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["family"] = $item["nombre"];
            $where = "id = " . $itemId;
            $table = $this->table["taxonomia"];
            $this->dbm->AutoExecute($table, $rec, "UPDATE", $where);
        }
    }

    public function getItemFamily($id)
    {
        $sql = "select * from catalogo.family where id = '" . $id . "'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function setGenus($genusId, $itemId)
    {
        if ($genusId != "") {
            $sql = "SELECT *
                    FROM catalogo.genus where id=" . $genusId;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["genus"] = $item["nombre"];
            $where = "id = " . $itemId;
            $table = $this->table["taxonomia"];
            $this->dbm->AutoExecute($table, $rec, "UPDATE", $where);
        }
    }

    public function getItemGenus($id)
    {
        $sql = "select * from catalogo.genus where id = '" . $id . "'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function setKingdom($kingdomId, $itemId)
    {
        if ($kingdomId != "") {
            $sql = "SELECT *
                    FROM catalogo.kingdom where id=" . $kingdomId;
            $res = $this->dbm->execute($sql);
            $item = $res->fields;
            $rec = array();
            $rec["kingdom"] = $item["nombre"];
            $where = "id = " . $itemId;
            $table = $this->table["taxonomia"];
            $this->dbm->AutoExecute($table, $rec, "UPDATE", $where);
        }
    }

    public function updateDataPhylum($rec)
    {
        $action = "new";
        $itemParentId = "";
        $itemId = "";
        $tabla = $this->table["phylum"];
        $form = "addphylum";
        $itemData = $this->processData($form, $rec, $action, $itemParentId);

        $numeroRegistros = $this->getDuplicate($itemData["nombre"], $tabla);
        if ($numeroRegistros >= 1) {
            $res["res"] = 2;
            $res["type"] = 1;
            $res["msgdb"] = "El nombre " . $itemData["nombre"] . " ya esta registrado";
        }
        if ($res["res"] == 2) {
            return $res;
        }

        /**
         * Save processed data
         */
        $fieldId = "id";
        $res = $this->updateItem($itemId, $itemData, $tabla, $action, $fieldId);
        $res["accion"] = $action;
        return $res;
    }

    public function updateDataClass($rec)
    {
        $action = "new";
        $itemParentId = "";
        $itemId = "";
        $tabla = $this->table["class"];
        $form = "addclass";
        $itemData = $this->processData($form, $rec, $action, $itemParentId);

        $numeroRegistros = $this->getDuplicate($itemData["nombre"], $tabla);
        if ($numeroRegistros >= 1) {
            $res["res"] = 2;
            $res["type"] = 1;
            $res["msgdb"] = "El nombre " . $itemData["nombre"] . " ya esta registrado";
        }
        if ($res["res"] == 2) {
            return $res;
        }
        /**
         * Save processed data
         */
        $fieldId = "id";
        $res = $this->updateItem($itemId, $itemData, $tabla, $action, $fieldId);
        $res["accion"] = $action;
        return $res;
    }

    public function updateDataOrder($rec)
    {
        $action = "new";
        $itemParentId = "";
        $itemId = "";
        $tabla = $this->table["order"];
        $form = "addorder";
        $itemData = $this->processData($form, $rec, $action, $itemParentId);

        $numeroRegistros = $this->getDuplicate($itemData["nombre"], $tabla);
        if ($numeroRegistros >= 1) {
            $res["res"] = 2;
            $res["type"] = 1;
            $res["msgdb"] = "El nombre " . $itemData["nombre"] . " ya esta registrado";
        }
        if ($res["res"] == 2) {
            return $res;
        }
        /**
         * Save processed data
         */
        $fieldId = "id";
        $res = $this->updateItem($itemId, $itemData, $tabla, $action, $fieldId);
        $res["accion"] = $action;

        return $res;
    }

    public function updateDataFamily($rec)
    {
        $action = "new";
        $itemParentId = "";
        $itemId = "";
        $tabla = $this->table["family"];
        $form = "addfamily";
        $itemData = $this->processData($form, $rec, $action, $itemParentId);
        $numeroRegistros = $this->getDuplicate($itemData["nombre"], $tabla);
        if ($numeroRegistros >= 1) {
            $res["res"] = 2;
            $res["type"] = 1;
            $res["msgdb"] = "El nombre " . $itemData["nombre"] . " ya esta registrado";
        }
        if ($res["res"] == 2) {
            return $res;
        }
        /**
         * Save processed data
         */
        $fieldId = "id";
        $res = $this->updateItem($itemId, $itemData, $tabla, $action, $fieldId);
        $res["accion"] = $action;

        return $res;
    }

    public function updateDataGenus($rec)
    {
        $action = "new";
        $itemParentId = "";
        $itemId = "";
        $tabla = $this->table["genus"];
        $form = "addgenus";
        $itemData = $this->processData($form, $rec, $action, $itemParentId);
        $numeroRegistros = $this->getDuplicate($itemData["nombre"], $tabla);
        if ($numeroRegistros >= 1) {
            $res["res"] = 2;
            $res["type"] = 1;
            $res["msgdb"] = "El nombre " . $itemData["nombre"] . " ya esta registrado";
        }
        if ($res["res"] == 2) {
            return $res;
        }
        /**
         * Save processed data
         */
        $fieldId = "id";
        $res = $this->updateItem($itemId, $itemData, $tabla, $action, $fieldId);
        $res["accion"] = $action;

        return $res;
    }

    private function getDuplicate($nombre, $table)
    {
        /**
         * Sacar si exite duplicado el registro
         */
        $sql = "SELECT count(*) as total
                    FROM " . $table . " WHERE nombre='" . $nombre . "'";
        $res = $this->dbm->execute($sql);
        $item = $res->fields;
        return $item["total"];
    }
}
