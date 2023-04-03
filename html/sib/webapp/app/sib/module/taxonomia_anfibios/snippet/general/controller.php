<?PHP
use App\Sib\Module\Taxonomia_anfibios\Snippet\general\Index;
use App\Sib\Module\Taxonomia_anfibios\Snippet\general\Catalog;
use Core\Core;

$objItem = new Index();
$objCatalog = new Catalog();

/**
 * Todo el sub Control se recuperará mediante llamadas por ajax
 */
$templateModule = $frontend["baseAjax"];

switch($action){
    /**
     * Página por defecto (index)
     */
    default:
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("general");

        $smarty->assign("type",$type);
        if($type=="update"){
            $item = $objItem->getItem($id);
            if(trim($item["location_latitude_decimal"]=="") or  trim($item["location_longitude_decimal"]=="")  ){
                $item["location_latitude_decimal"] = -16.513279;
                $item["location_longitude_decimal"] = -68.1666655;
            }
        }else{
            $item["location_latitude_decimal"] = -16.513279;
            $item["location_longitude_decimal"] = -68.1666655;
        }
        $smarty->assign("item",$item);
        /**
         * Catalog
         */

        $objCatalog->confCatalog();
        $cataobj= $objCatalog->getCatalogList();
//        print_struc($cataobj);exit;
        $smarty->assign("cataobj", $cataobj);

        $smarty->assign("subpage",$webm["sc_index"]);
        break;

    case 'save':
        $respuesta = $objItem->updateData($_REQUEST["item"],$id,$type);
        Core::printJson($respuesta);
        break;
    case 'get.class':
        $item = $objCatalog->getClassOptions($_REQUEST["id"]);
        Core::printJson($item);
        break;
    case 'get.order':
        $item = $objCatalog->getOrderOptions($_REQUEST["id"]);
        Core::printJson($item);
        break;
    case 'get.family':
        $item = $objCatalog->getFamilyOptions($_REQUEST["id"]);
        Core::printJson($item);
        break;
    case 'get.genus':
        $item = $objCatalog->getGenusOptions($_REQUEST["id"]);
        Core::printJson($item);
        break;
    /**
     * Todas las funcionalidades para añadir phylum
     */
    case 'get.formaddphylum':
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("formItemAddPhylum");
        $smarty->assign("subpage",$webm["sc_formAddPhylum"]);
        break;
    case 'saveaddphylum':
        $respuesta = $objItem->updateDataPhylum($_REQUEST["item"]);
        Core::printJson($respuesta);
        break;
    case 'get.phylum':
        $item = $objCatalog->getPhylumOptions();
        Core::printJson($item);
        break;
    /**
     * Todas las funcionalidades para añadir class
     */
    case 'get.formaddclass':
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("formItemAddClass");
        $smarty->assign("subpage",$webm["sc_formAddClass"]);
        break;
    case 'saveaddclass':
        $respuesta = $objItem->updateDataClass($_REQUEST["item"]);
        Core::printJson($respuesta);
        break;
    case 'get.classselect':
        $item = $objCatalog->getClassSelect();
        Core::printJson($item);
        break;
    /**
     * Todas las funcionalidades para añadir order
     */
    case 'get.formaddorder':
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("formItemAddOrder");
        $smarty->assign("subpage",$webm["sc_formAddOrder"]);
        break;
    case 'saveaddorder':
        $respuesta = $objItem->updateDataOrder($_REQUEST["item"]);
        Core::printJson($respuesta);
        break;
    case 'get.orderselect':
        $item = $objCatalog->getOrderSelect();
        Core::printJson($item);
        break;
    /**
     * Todas las funcionalidades para añadir family
     */
    case 'get.formaddfamily':
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("formItemAddFamily");
        $smarty->assign("subpage",$webm["sc_formAddFamily"]);
        break;
    case 'saveaddfamily':
        $respuesta = $objItem->updateDataFamily($_REQUEST["item"]);
        Core::printJson($respuesta);
        break;
    case 'get.familyselect':
        $item = $objCatalog->getFamilySelect();
        Core::printJson($item);
        break;
    /**
     * Todas las funcionalidades para añadir genus
     */
    case 'get.formaddgenus':
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("formItemAddGenus");
        $smarty->assign("subpage",$webm["sc_formAddGenus"]);
        break;
    case 'saveaddgenus':
        $respuesta = $objItem->updateDataGenus($_REQUEST["item"]);
        Core::printJson($respuesta);
        break;
    case 'get.genusselect':
        $item = $objCatalog->getGenusSelect();
        Core::printJson($item);
        break;
}