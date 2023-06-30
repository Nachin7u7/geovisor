<?PHP

namespace App\Sib\Zoologia_ormitologia\Lugarcolecta;

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

    /**
     * Implementación desde aca
     */
    public function conf_catalog_form($item)
    {
        $where = "cod_dep <> '0' ";
        $this->addCatalogList(
            $this->table["departamento"],
            "departamento",
            "",
            "name",
            "",
            "name",
            $where,
            "",
            ""
        );
        $where = $item["departamento_id"] != "" ? " departamento_id = " . $item["departamento_id"] : "";
        $this->addCatalogList(
            $this->table["municipio"],
            "municipio",
            "",
            "name",
            "",
            "name",
            $where,
            "",
            ""
        );
    }


    public function getMunicipioOptions($id)
    {
        /**
         * sacamos los municipios
         */
        if ($id != "" && $id > 0) {
            $sql = "select id,sec_prov,provincia,name,zona,id_ut,capital,cod_ut,
                        ine_dpto,ine_prov,ine_mun,lat,lon
                    from " . $this->table["municipio"] . " as m where m.departamento_id = '" . $id . "'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

    public function getMunicipioPoint($id)
    {
        /**
         * sacamos los municipios
         */
        if ($id != "" && $id > 0) {
            $sql = "select id,sec_prov,provincia,name,zona,id_ut,capital,cod_ut,
                        ine_dpto,ine_prov,ine_mun,lat,lon, departamento_id
                    from " . $this->table["municipio"] . " as m where m.id = '" . $id . "'";
            $item = $this->dbm->Execute($sql);
            $item = $item->GetRows();
        }
        return $item;
    }

    public function getDepartamentOptions()
    {
        /**
         * sacamos los municipios
         */
        $sql = "select id,name from " . $this->table["departamento"] . " as m where cod_dep <> '0'";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }

    public function geHemisferio()
    {
        $dato = array();
        $dato["N"] = "N";
        $dato["S"] = "S";
        return $dato;
    }

    public function getPoint($lat, $lng)
    {
        $sql = "SELECT d.id AS municipality_id, d.departamento_id as state_province_id,
                d.departamen AS state_province, d.provincia as county, d.name as municipality
            FROM " . $this->table["municipio"] . " as d
            INNER JOIN " . $this->table["municipio"] . " m
            ON ST_Contains(d.geom, ST_SetSRID(ST_Point(" . $lng . ", " . $lat . "), 4326))
            AND ST_Contains(m.geom, ST_SetSRID(ST_Point(" . $lng . ", " . $lat . "), 4326))";
        $item = $this->dbm->Execute($sql);
        $item = $item->GetRows();
        return $item;
    }
}
