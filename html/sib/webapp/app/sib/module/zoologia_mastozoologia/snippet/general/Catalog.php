<?PHP
namespace App\Sib\Module\Zoologia_mastozoologia\Snippet\general;
use Core\CoreResources;

class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog(){
        $this->addCatalogList($this->table["language"]
            ,"language","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["license"]
            ,"license","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["departamento"]
            ,"departamento","","name",""
            ,"name","","","");

        $this->addCatalogList($this->table["sex"]
            ,"sex","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["institucion"]
            ,"institucion","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["life_stage"]
            ,"life_stage","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["occurrence_status"]
            ,"occurrence_status","","nombre",""
            ,"nombre","","","");

        $this->addCatalogList($this->table["preparations"]
            ,"preparations","","nombre",""
            ,"nombre","","","");
    }

    function getInstitucion($id){
        /**
         * sacamos la intitucion
         */
        if($id!="" and $id>0){
            $sql = "select * from ".$this->table["institucion"]." as i where i.id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

}