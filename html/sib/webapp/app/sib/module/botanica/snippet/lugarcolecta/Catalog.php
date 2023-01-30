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
    public function conf_catalog_form($item){
        $where = "cod_dep <> '0' ";
        $this->addCatalogList($this->table["departamento"]
            ,"departamento","","name",""
            ,"name",$where,"","");
        $where = $item["departamento_id"] != ""?" departamento_id = ".$item["departamento_id"]:"";
        $this->addCatalogList($this->table["municipio"]
            ,"municipio","","name",""
            ,"name",$where,"","");
    }
    public function conf_catalog_formEspecimen($item){
        $where = "catalogo_taxonomia_id=".$item;
        $this->addCatalogList($this->table["especimen"]
            ,"especimen","","basisofrecord",""
            ,"basisofrecord",$where,"","");
    }


    function getMunicipioOptions($id){
        /**
         * sacamos los municipios
         */
        if($id!="" and $id>0){
            $sql = "select id,sec_prov,provincia,name,zona,id_ut,capital,cod_ut,ine_dpto,ine_prov,ine_mun from ".$this->table["municipio"]." as m where m.departamento_id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }
    function getEspecimenes($id){
        /**
         * sacamos los especimenes
         */
        if($id!="" and $id>0){
            $sql = "select id, basisofrecord from ".$this->table["especimen"]." as m ";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }


    public function confCatalog(){
    }
}