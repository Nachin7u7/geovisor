<?PHP

namespace App\Sib\Module\Zoologia_anfibios\Snippet\Index;

use Core\CoreResources;

class Catalog extends CoreResources
{
    public function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }

    public function getActiveOption()
    {
        global $smarty;
        $dato = array();
        $dato["1"] = $smarty->config_vars["glOptActive"];
        $dato["0"] = $smarty->config_vars["glOptInactive"];
        return $dato;
    }

    public function confCatalog()
    {
        /**
         * Agregar catalogos
         */
    }
}
