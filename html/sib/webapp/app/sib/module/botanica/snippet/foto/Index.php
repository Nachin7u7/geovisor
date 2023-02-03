<?PHP
namespace App\Sib\Module\Botanica\Snippet\Foto;
use Core\CoreResources;
use Intervention\Image\ImageManagerStatic as Image;

class Index extends CoreResources
{
    var $objTable = "especimen_foto";
    var $folder = "foto";
    var $fkey_field = "especimen_id";

    function __construct(){
        /**
         * We initialize all the libraries and variables for the new class
         */
        $this->appInit();
    }
    /**
     * Implementación desde aca
     */

    public function getItemDatatableRows($item_id){
        global $dbSetting;
        $table = $this->table[$this->objTable];
        $primaryKey = 'id';
        $grid = "index";
        $db=$dbSetting[0];
        /**
         * Additional configuration
         */
        $extraWhere = $this->fkey_field."='".$item_id."' " ;
        $groupBy = "";
        $having = "";
        /**
         * Result of the query sent
         */
        $result = $this->getGridDatatableSimple($db,$grid,$table, $primaryKey, $extraWhere);
        foreach ($result['data'] as $itemId => $valor) {
            $result['data'][$itemId]['created_at'] = $this->changeDataFormat($result['data'][$itemId]['created_at'],"d/m/Y H:i:s");
            $result['data'][$itemId]['updated_at'] = $this->changeDataFormat($result['data'][$itemId]['updated_at'],"d/m/Y H:i:s");
        }
        $result["recordsTotal"]=$result["recordsFiltered"];
        return $result;
    }


    function updateData($rec,$itemId,$form,$action,$item_id, $input_file){
        //print_struc($_FILES);
        $tabla = $this->table[$this->objTable];
        $itemData  = $this->processData($form,$rec,$action,$item_id);
        /**
         * Save processed data
         */
        $field_id="id";
        $res = $this->updateItem($itemId,$itemData ,$tabla,$action,$field_id);
        $res["accion"] = $action;
        /**
         * Process attachment
         */
        if( $res["res"]==1){
            $item = $this->getItem($res["id"],$item_id);
            $item_id_name = $this->fkey_field;
            $id_name = "id";
            $adjunto = $this->saveAttachment($item,$tabla,$input_file,$item_id,$res["id"],$action,$this->folder,$item_id_name,$id_name);
            /**
             * Una vez almacenado, procedemos a cambiar el tamaño de la imagen
             */
            $this->changePortadaSize($input_file["tmp_name"],$item_id,$res["id"]);
        }
        return $res;
    }

    function processData($form,$rec,$action="new",$item_id){
        $dataResult = array();
        switch($form){
            case 'index':
                $dataResult = $this->processFields($rec,$this->campos[$form],$action);
                /**
                 * Additional processes when saving the data
                 */
                if ($action=="new"){
                    $dataResult["activo"] = "true";
                    $dataResult[$this->fkey_field]= $item_id;
                }
                break;

        }
        return $dataResult;
    }

    function getItem($id,$item_id){
        $sql = "select * from ".$this->table[$this->objTable]." as p where p.id = '".$id."' and p.".$this->fkey_field." = '".$item_id."'";
        $item = $this->dbm->Execute($sql);
        $item = $item->fields;
        return $item;
    }

    function changePortadaSize($fileAddress,$item_id,$id){
        $dir = $this->getFiledir($item_id);
        //$dir  = $this->getAttachmentDir($id,0,$this->folder);
        /**
         * 1000
         */
        $file = $dir.$id."_1000.jpg";
        $img = Image::make($fileAddress);

        $img->resize(1000, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $img->save($file);
        /**
         * 600
         */
        $file = $dir.$id."_web.jpg";
        $img = Image::make($fileAddress);
        //$img->resize(800, 240);
        $img->resize(600, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $img->save($file);
        /**
         * 200
         */
        $file = $dir.$id."_canvas_200.jpg";
        $img = Image::make($fileAddress);
        $img->resize(400, null, function ($constraint) {
            $constraint->aspectRatio();
        });
        $img->resizeCanvas(200,200);
        $img->save($file);

    }


    function deleteData($id,$item_id){
        $item = $this->getItem($id,$item_id);
        /**
         * Delete the record from the database
         */
        $field_id="id";
        $where = $this->fkey_field."='".$item_id."'";
        $res = $this->deleteItem($id,$field_id,$this->table[$this->objTable],$where);
        if($res["res"]==1){
            /**
             * borramos el archivo primero
             */
            $this->deleteAttachmentFile($id,$item_id,$item["attached_extension"],$this->folder);
            /**
             * borrar los archivos adicionales
             */
            if(file_exists($file)) unlink($file);
            $this->deletePhoto($item_id,$id);

        }
        return $res;
    }

    function deletePhoto($item_id,$id){
        $dir = $this->getFiledir($item_id);
        $file = $dir.$id."_1000.jpg";
        $this->deleteFile($file);
        $file = $dir.$id."_web.jpg";
        $this->deleteFile($file);
        $file = $dir.$id."_canvas_200.jpg";
        $this->deleteFile($file);
    }
    function deleteFile($file){
        if(file_exists($file)) unlink($file);
    }

    function getFiledir($item_id){
        $dir  = $this->getAttachmentDir($item_id,0,$this->folder);
        return $dir;
    }

    function getFile($id,$item_id,$portada=0){
        $msg_erro = "<div style='text-align: center;  background-color: #fee7dc;vertical-align: center; padding-top: 50px;padding-bottom: 50px;'><span style='color:red; font-family: Arial;font-size:26px;'>The file does not exists</span></div>";
        $item = $this->getItem($id,$item_id);

        if($item["id"]!=""){
            $dir = $this->getFiledir($item_id);
            //$file = $dir.$id.".".$item["attached_extension"];
            if($portada==1){
                $file = $dir.$id."_web.jpg";
                $contenDisposition = "inline";
            }else if($portada==2){
                $file = $dir.$id."_1000.jpg";
                $contenDisposition = "inline";
                //$conten_Disposition = "attachment";
            }else if($portada==3){
                $file = $dir.$id."_canvas_200.jpg";
                $contenDisposition = "inline";
                //$conten_Disposition = "attachment";
            }else{
                $contenDisposition = "attachment";
                //$contenDisposition = "inline";
                $file = $dir.$id.".".$item["attached_extension"];
            }
            if(file_exists($file)){
                header ("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
                header ("Last-Modified: " . gmdate("D,d M YH:i:s") . " GMT");
                header ("Cache-Control: no-cache, must-revalidate");
                header ("Pragma: no-cache");
                header ("Content-Type:".$item["attached_type"]);
                header ('Content-Disposition: '.$contenDisposition.'; filename="'.$item["attached_name"].'"');
                //header ("Content-Length: " . $item["attached_size"]);
                readfile($file);
                exit;
            }else{
                echo $msg_erro;
            }
        }else{
            echo $msg_erro;
        }
        exit;
    }



}
