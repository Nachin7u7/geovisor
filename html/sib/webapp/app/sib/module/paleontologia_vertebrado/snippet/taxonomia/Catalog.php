<?PHP

namespace App\Sib\Paleontologia_vertebrado\taxonomia;

use Core\CoreResources;

class Catalog extends CoreResources
{

    public function __construct()
    {
        /**
         * Inicializamos todas las librerias y variables para el submodulo
         */
        $this->appInit();
    }

    public function confCatalog()
    {
        $where = "categoria_id='2'";
        $this->addCatalogList(
            $this->table["taxonomia"],
            "taxonomia",
            "",
            "scientific_name",
            "",
            "scientific_name",
            $where,
            "",
            ""
        );
    }

    public function getTaxonomia($id)
    {
        /**
         * sacamos la taxonomia
         */
        if ($id != "" && $id > 0) {
            $sql = "select * from " . $this->table["taxonomia"] . " as i where i.id = '" . $id . "'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }
}
