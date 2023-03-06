<?PHP
namespace App\Sib\Module\Zoologia_reptiles\Snippet\general;
use Core\CoreResources;

class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog(){
        $where = "kingdom_id=2 AND class_id=1";
        $this->addCatalogList($this->table["catalogo_taxonomia"]
            ,"taxonomia","","scientific_name",""
            ,"scientific_name",$where,"","");

    }

    function getTaxonomia($id){
        /**
         * sacamos la taxonomia
         */
        if($id!="" and $id>0){
            $sql = "select * from ".$this->table["catalogo_taxonomia"]." as i where i.id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

}