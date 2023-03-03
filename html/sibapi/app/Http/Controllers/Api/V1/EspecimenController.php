<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Especimen;
use Illuminate\Http\Request;

use App\Http\Resources\V1\EspecimenResource;
ini_set('memory_limit','512M');

class EspecimenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    /**
     * @OA\Get(
     *     path="/api/v1/especimen/",
     *     summary="Lista de especimenes ",
     *     description="Devuelve la lista de los datos de especimenes",
     *     operationId="v1getEspecimenList",
     *     tags={"ESPECIMEN"},
     *     security={{"bearerAuth":{}}},

     *     @OA\Response(
     *         response=200,
     *         description="Json con datos de la lista de Especimenes",
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
        return EspecimenResource::collection(Especimen::all());
        //return Especimen::all();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Especimen  $especimen
     * @return \Illuminate\Http\Response
     */


    /**
     * @OA\Get(
     *     path="/api/v1/especimen/{especimenId}",
     *     summary="Buscar una Ccfs por ID",
     *     description="Devuelve la información de Especimen específico",
     *     operationId="v1getEspecimen",
     *     tags={"ESPECIMEN"},
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
        $especimen = Especimen::find($id);
        if (is_null($especimen)){
            $response = [
                'success' => false,
                'message' => 'Proposito not found.',
            ];
            return response()->json($response, '404');
        }
        return new EspecimenResource($especimen);
    }

}
