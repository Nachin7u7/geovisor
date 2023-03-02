<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Http\Resources\V1\CcfResource;
use App\Models\Ccf;
use Illuminate\Http\Request;

class CcfController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    /**
     * @OA\Get(
     *     path="/api/v1/centro_custodia/",
     *     summary="Lista de Centros de Custodia de fauna Silvestre ",
     *     description="Devuelve la lista de los datos de Centros de Custodia de fauna Silvestre",
     *     operationId="v1getCcfsList",
     *     tags={"CCFS"},
     *     security={{"bearerAuth":{}}},

     *     @OA\Response(
     *         response=200,
     *         description="Json con datos de la lista de Centros de Custodia de fauna Silvestre",
     *         @OA\JsonContent()
     *
     *     ),
     *     @OA\Response(
     *         response="401",
     *         description="No autentificado",
     *         @OA\JsonContent(
     *              @OA\Property(property="message", type="string", example="Unauthenticated"),
     *         )
     *     )
     * )
     *
     */
    public function index()
    {
        //
        return Ccf::all();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Ccf  $ccf
     * @return \Illuminate\Http\Response
     */

    /**
     * @OA\Get(
     *     path="/api/v1/centro_custodia/{ccfsId}",
     *     summary="Buscar una Ccfs por ID",
     *     description="Devuelve la información de un Centro de Custodia de fauna Silvestre (Ccfs) específico",
     *     operationId="v1getCcfs",
     *     tags={"CCFS"},
     *     security={{"bearerAuth":{}}},
     *     @OA\Parameter(
     *      name="citesId",in="path",required=true,
     *      description="ID de la institución",
     *      @OA\Schema(type="integer",default="1",format="int64")
     *     ),
     *
     *     @OA\Response(
     *         response=200,
     *         description="Se optiene los datos con éxito",
     *          @OA\JsonContent()
     *     ),
     *     @OA\Response(
     *         response="404",
     *         description="No se encontraron datos",
     *         @OA\JsonContent()
     *     ),
     *     @OA\Response(
     *         response="401",
     *         description="No autentificado",
     *         @OA\JsonContent(
     *              @OA\Property(property="message", type="string", example="Unauthenticated"),
     *         )
     *     )
     *
     * )
     *
     */

    public function show($id)
    {
        $ccf = Ccf::find($id);

        if (is_null($ccf)) {
            $response = [
                'success' => false,
                'message' => 'Proposito not found.',
            ];
            return response()->json($response, '404');
        }
        return new CcfResource($ccf);
    }

}
