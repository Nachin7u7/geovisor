<?PHP

namespace App\Sib\Taxonomia_p_vertebrado\Index;

use Core\CoreResources;

class Index extends CoreResources
{
    public $objTable = "taxonomia";
    public $folder = "catalogoTaxonomia";
    public $fkeyField = "categoria_id";
    public $extraWhere = "";

    public function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
        $this->extraWhere = $this->fkeyField . "= '2'";
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


    public function getItemDatatableRows()
    {
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "item";
        $db = $dbSetting[0];
        /**
         * Additional configuration
         */
        $extraWhere = $this->extraWhere;
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db, $grid, $table, $primaryKey, $extraWhere);
        foreach ($result['data'] as $itemId => $valor) {
            if (isset($result['data'][$itemId]['fecha_inicio'])) {
                $result['data'][$itemId]['fecha_inicio'] = $this->changeDataFormat($valor['fecha_inicio'], "d/m/Y");
            }
            if (isset($result['data'][$itemId]['fecha_conclusion'])) {
                $result['data'][$itemId]['fecha_conclusion'] =
                    $this->changeDataFormat($valor['fecha_conclusion'], "d/m/Y");
            }

            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($valor['created_at'], "d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($valor['updated_at'], "d/m/Y H:i:s");

        }
        return $result;
    }

    /**
     * Index::deleteData($id)
     *
     * Delete a record from the database
     *
     * @param $id
     * @return mixed
     */
    public function deleteData($id)
    {
        $fieldId = "id";
         $where = "";
        return $this->deleteItem($id, $fieldId, $this->table[$this->objTable], $where);
    }
}
