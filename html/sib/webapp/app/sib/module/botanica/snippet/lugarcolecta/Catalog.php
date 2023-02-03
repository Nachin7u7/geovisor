<?PHP
namespace App\Sib\Module\Botanica\Snippet\Lugarcolecta;
use Core\CoreResources;
class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */
    public function conf_catalog_form(){
//        $where = "cod_dep <> '0' ";
//        $this->addCatalogList($this->table["departamento"]
//            ,"departamento","","name",""
//            ,"name",$where,"","");
//        $where = $item["departamento_id"] != ""?" departamento_id = ".$item["departamento_id"]:"";
//        $this->addCatalogList($this->table["municipio"]
//            ,"municipio","","name",""
//            ,"name",$where,"","");
    }
//    public function conf_catalog_formEspecimen($item){
//
//    }


    public function confCatalog(){
    }
}