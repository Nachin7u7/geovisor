<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\IcasInstitucion;
use Illuminate\Http\Request;

use App\Http\Resources\V1\IcasInstitucionResource;

class IcasInstitucionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    /**
     * @OA\Get(
     *     path="/api/v1/icas_institucion/",
     *     summary="Lista de instituciones ICAS",
     *     description="Devuelve la lista de los datos de instituciones ICAS",
     *     operationId="v1getIcasInstitucionList",
     *     tags={"ICAS"},
     *     security={{"bearerAuth":{}}},

     *     @OA\Response(
     *         response=200,
     *         description="Json con datos de la lista de instituciones ICAS",
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
        return IcasInstitucionResource::collection(IcasInstitucion::all());

    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\IcasInstitucion  $icasInstitucion
     * @return \Illuminate\Http\Response
     */
    /**
     * @OA\Get(
     *     path="/api/v1/icas_institucion/{icasInsitucionId}",
     *     summary="Buscar una institución por ID",
     *     description="Devuelve la información de una institución (ICAS) específico",
     *     operationId="v1getIcasInstitucion",
     *     tags={"ICAS"},
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
    public function show(IcasInstitucion $icasInstitucion)
    {
        return new IcasInstitucionResource($icasInstitucion);
    }
}
