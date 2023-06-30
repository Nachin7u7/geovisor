<?PHP

namespace App\Sib\Zoologia_reptiles\Foto;

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
    public function conf_catalog_form()
    {
        /**
         * Agregar catalogos
         */
    }

    public function get_activo_option()
    {
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }
}
