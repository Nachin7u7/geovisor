<?PHP

use App\Sib\Zoologia_ormitologia\taxonomia\Index;
use App\Sib\Zoologia_ormitologia\taxonomia\Catalog;
use Core\Core;

$objItem = new Index();
$objCatalog = new Catalog();

/**
 * Todo el sub Control se recuperará mediante llamadas por ajax
 */
$templateModule = $frontend["baseAjax"];

switch ($action) {
    /**
     * Página por defecto (index)
     */
    default:
        /**
         * Language settings, section
         */
        \Core\Core::setLenguage("general");

        $smarty->assign("type", $type);
        if ($type == "update") {
            $item = $objItem->getItem($id);
            if (trim($item["location_latitude_decimal"] == "") || trim($item["location_longitude_decimal"] == "")) {
                $item["location_latitude_decimal"] = -16.513279;
                $item["location_longitude_decimal"] = -68.1666655;
            }
        } else {
            $item["location_latitude_decimal"] = -16.513279;
            $item["location_longitude_decimal"] = -68.1666655;
        }
        $smarty->assign("item", $item);
        /**
         * Catalog
         */

        $objCatalog->confCatalog();
        $cataobj = $objCatalog->getCatalogList();
        $smarty->assign("cataobj", $cataobj);

        $smarty->assign("subpage", $webm["sc_index"]);
        break;

    case 'save':
        $respuesta = $objItem->updateData($_REQUEST["item"], $id, $type);
        Core::printJson($respuesta);
        break;

    case 'get.item':
        $item = $objCatalog->getTaxonomia($_REQUEST["id"]);
        Core::printJson($item);
        break;
}
