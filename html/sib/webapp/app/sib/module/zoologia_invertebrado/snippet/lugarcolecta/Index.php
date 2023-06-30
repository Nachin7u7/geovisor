<?PHP

namespace App\Sib\Zoologia_invertebrado\Lugarcolecta;

use Core\CoreResources;

class Index extends CoreResources
{
    public $objTable = "especimen";
    public $fkeyField = "id";

    public function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }

    /**
     * Implementación desde aca
     */


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
        /**
         * Process attachment
         */
        if ($res["res"] == 1) {
            /**
             * Reconfiguraremos la relación del departamento y municipio principal
             */
            $fieldGeom = "geom";
            $requestGeom = $this->setGeomPointPostgis(
                $itemData["location_longitude_decimal"],
                $itemData["location_latitude_decimal"],
                "especimen",
                $fieldGeom,
                $fieldId,
                $res["id"]
            );
            if ($requestGeom["res"] != 1) {
                $res = $requestGeom;
            }
        }
        return $res;
    }

    public function processData($form, $rec, $action = "new")
    {
        $dataResult = array();
        if ($form == 'module') {
            $dataResult = $this->processFields($rec, $this->campos[$form], $action);

            if ($action == "new") {
                $dataResult["continent"] = "América del Sur";
                $dataResult["pais"] = "Bolivia (Plurinational State of)";
            }
        }
        return $dataResult;
    }

}
