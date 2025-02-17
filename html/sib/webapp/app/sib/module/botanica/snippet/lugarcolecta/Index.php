<?PHP
namespace App\Sib\Botanica\Lugarcolecta;
use Core\CoreResources;
class Index extends CoreResources
{
    var $objTable = "especimen";
    var $fkey_field = "id";

    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */


    function updateData($rec,$itemId,$form,$action,$item_id=""){
        //print_struc($rec);exit;
        $form="module";
        $itemData  = $this->processData($form,$rec,$action);

        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$this->table[$this->objTable],$action,$field_id);
        $res["accion"] = $action;
        /**
         * Process attachment
         */
        if( $res["res"]==1){
            /**
             * Reconfiguraremos la relación del departamento y municipio principal
             */
            $fieldGeom = "geom";
            $requestGeom = $this->setGeomPointPostgis(
                $itemData["location_longitude_decimal"]
                ,$itemData["location_latitude_decimal"]
                ,"especimen"
                ,$fieldGeom
                ,$field_id
                ,$res["id"]
            );
            if($requestGeom["res"]!=1){
                $res = $requestGeom;
            }
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
                    //$dataResult["active"] = 1;
                }
                break;
        }
        return $dataResult;
    }

}
