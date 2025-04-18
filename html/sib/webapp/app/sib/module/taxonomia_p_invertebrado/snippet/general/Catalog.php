<?PHP

namespace App\Sib\Taxonomia_p_invertebrado\general;

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
        $this->addCatalogList(
            $this->table["kingdom"],
            "kingdom",
            "",
            "nombre",
            "",
            "nombre",
            "",
            "",
            ""
        );
        $this->addCatalogList(
            $this->table["categoria"],
            "categoria",
            "",
            "nombre",
            "",
            "nombre",
            "",
            "",
            ""
        );
        $this->addCatalogList(
            $this->table["phylum"],
            "phylum",
            "",
            "nombre",
            "",
            "nombre",
            "",
            "",
            ""
        );
        $this->addCatalogList(
            $this->table["order"],
            "order",
            "",
            "nombre",
            "",
            "nombre",
            "",
            "",
            ""
        );
        $this->addCatalogList(
            $this->table["family"],
            "family",
            "",
            "nombre",
            "",
            "nombre",
            "",
            "",
            ""
        );
        $this->addCatalogList(
            $this->table["genus"],
            "genus",
            "",
            "nombre",
            "",
            "nombre",
            "",
            "",
            ""
        );
        $this->addCatalogList(
            $this->table["class"],
            "class",
            "",
            "nombre",
            "",
            "nombre",
            "",
            "",
            ""
        );
    }

    public function getPhylumOptions()
    {
        /**
         * sacamos datos de Phylum
         */
        $sql = "select p.id, p.nombre
                from " . $this->table["phylum"] . " as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

    public function getClassOptions($id)
    {
        /**
         * sacamos class
         */
        if ($id != "" && $id > 0) {
            $sql = "select id, nombre from " . $this->table["class"] . " as o where o.phylum_id = '" . $id . "'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

    public function getOrderOptions($id)
    {
        /**
         * sacamos order
         */
        if ($id != "" && $id > 0) {
            $sql = "select id, nombre from " . $this->table["order"] . " as o where o.class_id = '" . $id . "'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

    public function getFamilyOptions($id)
    {
        /**
         * sacamos family
         */
        if ($id != "" && $id > 0) {
            $sql = "select id, nombre from " . $this->table["family"] . " as f where f.order_id = '" . $id . "'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

    public function getGenusOptions($id)
    {
        /**
         * sacamos family
         */
        if ($id != "" && $id > 0) {
            $sql = "select id, nombre from " . $this->table["genus"] . " as g where g.family_id = '" . $id . "'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

    public function getClassSelect()
    {
        /**
         * sacamos datos de Class
         */
        $sql = "select p.id, p.nombre from " . $this->table["class"] . " as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

    public function getOrderSelect()
    {
        /**
         * sacamos datos de Order
         */
        $sql = "select p.id, p.nombre from " . $this->table["order"] . " as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

    public function getFamilySelect()
    {
        /**
         * sacamos datos de Family
         */
        $sql = "select p.id, p.nombre from " . $this->table["family"] . " as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

    public function getGenusSelect()
    {
        /**
         * sacamos datos de Family
         */
        $sql = "select p.id, p.nombre from " . $this->table["genus"] . " as p order by p.nombre";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }
}
