<?PHP

namespace App\Sib\Zoologia_mastozoologia\general;

use Core\CoreResources;

class Index extends CoreResources
{
    public $objTable = "especimen";

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
        return $res;
    }

    public function processData($form, $rec, $action = "new")
    {
        $dataResult = array();
        if ($form == 'module') {
            $dataResult = $this->processFields($rec, $this->campos[$form], $action);

            if ($action == "new") {
                $dataResult["categoria_id"] = 6;
            }

            $fieldsToCheck = [
                "language_id",
                "license_id",
                "life_stage_id",
                "occurrence_status_id",
                "preparations_id",
                "sex_id"
            ];

            foreach ($fieldsToCheck as $field) {
                if ($dataResult[$field] == "" || $dataResult[$field] == 0) {
                    $dataResult[$field] = null;
                }
            }
        }
        return $dataResult;
    }
}
