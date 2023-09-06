<?PHP

namespace App\Sib\Paleontologia_vertebrado\Foto;

use Core\CoreResources;
use Intervention\Image\ImageManagerStatic as Image;

class Index extends CoreResources
{
    public $objTable = "especimen_foto";
    public $folder = "foto";
    public $fkeyField = "especimen_id";

    public function __construct()
    {
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }

    /**
     * Implementación desde aca
     */

    public function getItemDatatableRows($itemId)
    {
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "index";
        $db = $dbSetting[0];
        /**
         * Additional configuration
         */
        $extraWhere = $this->fkeyField . "='" . $itemId . "' ";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db, $grid, $table, $primaryKey, $extraWhere);
        foreach ($result['data'] as $itemId => $valor) {
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($valor['created_at'], "d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($valor['updated_at'], "d/m/Y H:i:s");
        }
        $result["recordsTotal"] = $result["recordsFiltered"];
        return $result;
    }


    public function updateData($rec, $itemId, $form, $action, $itemIdParent, $inputFile)
    {
        $tabla = $this->table[$this->objTable];
        $itemData = $this->processData($form, $rec, $itemIdParent, $action);
        /**
         * Save processed data
         */
        $fieldId = "id";
        $res = $this->updateItem($itemId, $itemData, $tabla, $action, $fieldId);
        $res["accion"] = $action;
        /**
         * Process attachment
         */
        if ($res["res"] == 1) {
            $item = $this->getItem($res["id"], $itemIdParent);
            $itemIdName = $this->fkeyField;
            $idName = "id";
            $this->saveAttachment(
                $item,
                $tabla,
                $inputFile,
                $itemIdParent,
                $res["id"],
                $action,
                $this->folder,
                $itemIdName,
                $idName
            );
            /**
             * Una vez almacenado, procedemos a cambiar el tamaño de la imagen
             */
            $this->changePortadaSize($inputFile["tmp_name"], $itemIdParent, $res["id"]);
        }
        return $res;
    }

    public function processData($form, $rec, $itemId, $action = "new")
    {
        $dataResult = array();
        if ($form == 'index') {
            $dataResult = $this->processFields($rec, $this->campos[$form], $action);

            if ($action == "new") {
                $dataResult["activo"] = "true";
                $dataResult[$this->fkeyField] = $itemId;
            }
        }
        return $dataResult;
    }

    public function getItem($id, $itemId)
    {
        $sql = "select *
                from " . $this->table[$this->objTable] . " as p
                where p.id = '" . $id . "' and p." . $this->fkeyField . " = '" . $itemId . "'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    private function changePortadaSize($fileAddress, $itemId, $id)
    {
        $dir = $this->getFiledir($itemId);
        /**
         * 1000
         */
        $file = $dir . $id . "_1000.jpg";
        $img = Image::make($fileAddress);

        $img->resize(1000, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $img->save($file);
        /**
         * 600
         */
        $file = $dir . $id . "_web.jpg";
        $img = Image::make($fileAddress);
        $img->resize(600, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $img->save($file);
        /**
         * 200
         */
        $file = $dir . $id . "_canvas_200.jpg";
        $img = Image::make($fileAddress);
        $img->resize(400, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $img->resizeCanvas(200, 200);
        $img->save($file);

    }


    public function deleteData($id, $itemId)
    {
        $item = $this->getItem($id, $itemId);
        /**
         * Delete the record from the database
         */
        $fieldId = "id";
        $where = $this->fkeyField . "='" . $itemId . "'";
        $res = $this->deleteItem($id, $fieldId, $this->table[$this->objTable], $where);
        if ($res["res"] == 1) {
            /**
             * borramos el archivo primero
             */
            $this->deleteAttachmentFile($id, $itemId, $item["attached_extension"], $this->folder);
            /**
             * borrar los archivos adicionales
             */
            $this->deletePhoto($itemId, $id);

        }
        return $res;
    }

    private function deletePhoto($itemId, $id)
    {
        $dir = $this->getFiledir($itemId);
        $file = $dir . $id . "_1000.jpg";
        $this->deleteFile($file);
        $file = $dir . $id . "_web.jpg";
        $this->deleteFile($file);
        $file = $dir . $id . "_canvas_200.jpg";
        $this->deleteFile($file);
    }

    private function deleteFile($file)
    {
        if (file_exists($file)) {
            unlink($file);
        }
    }

    private function getFiledir($itemId)
    {
        return $this->getAttachmentDir($itemId, 0, $this->folder);
    }

    public function getFile($id, $itemId, $portada = 0)
    {
        $msgErro = "<div style='text-align: center;  background-color: #fee7dc;
                            vertical-align: center; padding-top: 50px;padding-bottom: 50px;'>
                        <span style='color:red; font-family: Arial,serif;font-size:26px;'>
                        The file does not exists</span>
                        </div>";
        $item = $this->getItem($id, $itemId);

        if ($item["id"] != "") {
            $dir = $this->getFiledir($itemId);
            if ($portada == 1) {
                $file = $dir . $id . "_web.jpg";
                $contenDisposition = "inline";
            } elseif ($portada == 2) {
                $file = $dir . $id . "_1000.jpg";
                $contenDisposition = "inline";
            } elseif ($portada == 3) {
                $file = $dir . $id . "_canvas_200.jpg";
                $contenDisposition = "inline";
            } else {
                $contenDisposition = "attachment";
                $file = $dir . $id . "." . $item["attached_extension"];
            }
            if (file_exists($file)) {
                header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
                header("Last-Modified: " . gmdate("D,d M YH:i:s") . " GMT");
                header("Cache-Control: no-cache, must-revalidate");
                header("Pragma: no-cache");
                header("Content-Type:" . $item["attached_type"]);
                header('Content-Disposition: ' . $contenDisposition . '; filename="' . $item["attached_name"] . '"');
                readfile($file);
                exit;
            } else {
                echo $msgErro;
            }
        } else {
            echo $msgErro;
        }
        exit;
    }


}
