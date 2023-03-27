<?PHP
namespace App\Sib\Module\Taxonomia_ictiologia\Snippet\general;
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
        $this->addCatalogList($this->table["division"]
            ,"division","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["orden"]
            ,"orden","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["familia"]
            ,"familia","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["genero"]
            ,"genero","","nombre",""
            ,"nombre","","","");
        $this->addCatalogList($this->table["clase"]
            ,"clase","","nombre",""
            ,"nombre","","","");
    }

}