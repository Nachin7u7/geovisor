<?PHP
namespace App\Sib\Module\Botanica\Snippet\general;
use Core\CoreResources;

class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog(){
        $where = "kingdom_id=1";
        $this->addCatalogList($this->table["taxonomia"]
            ,"taxonomia","","scientific_name",""
            ,"scientific_name",$where,"","");

    }

    function getTaxonomia($id){
        /**
         * sacamos la taxonomia
         */
        if($id!="" and $id>0){
            $sql = "select * from ".$this->table["taxonomia"]." as i where i.id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

}