<?PHP
namespace App\Sib\Module\Taxonomia_invertebrados\Snippet\general;
use Core\CoreResources;

class Catalog extends CoreResources{

    function __construct(){
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog(){
        $this->addCatalogList($this->table["kingdom"]
            ,"kingdom","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["categoria"]
            ,"categoria","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["phylum"]
            ,"phylum","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["order"]
            ,"order","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["family"]
            ,"family","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["genus"]
            ,"genus","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["class"]
            ,"class","","nombre",""
            ,"nombre","","","");
    }

    function getPhylumOptions(){
        /**
         * sacamos datos de Phylum
         */
        $sql = "select p.id, p.nombre from ".$this->table["phylum"]." as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }
    function getClassOptions($id){
        /**
         * sacamos class
         */
        if($id!="" and $id>0){
            $sql = "select id, nombre from ".$this->table["class"]." as o where o.phylum_id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }
    function getOrderOptions($id){
        /**
         * sacamos order
         */
        if($id!="" and $id>0){
            $sql = "select id, nombre from ".$this->table["order"]." as o where o.class_id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }
    function getFamilyOptions($id){
        /**
         * sacamos family
         */
        if($id!="" and $id>0){
            $sql = "select id, nombre from ".$this->table["family"]." as f where f.order_id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }
    function getGenusOptions($id){
        /**
         * sacamos family
         */
        if($id!="" and $id>0){
            $sql = "select id, nombre from ".$this->table["genus"]." as g where g.family_id = '".$id."'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

    function getClassSelect(){
        /**
         * sacamos datos de Class
         */
        $sql = "select p.id, p.nombre from ".$this->table["class"]." as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

    function getOrderSelect(){
        /**
         * sacamos datos de Order
         */
        $sql = "select p.id, p.nombre from ".$this->table["order"]." as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

    function getFamilySelect(){
        /**
         * sacamos datos de Family
         */
        $sql = "select p.id, p.nombre from ".$this->table["family"]." as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

    function getGenusSelect(){
        /**
         * sacamos datos de Family
         */
        $sql = "select p.id, p.nombre from ".$this->table["genus"]." as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

}