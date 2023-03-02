<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\LagartoInstitucion;
use Illuminate\Http\Request;

use App\Http\Resources\V1\LagartoInstitucionResource;

class LagartoInstitucionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    /**
     * @OA\Get(
     *     path="/api/v1/lagarto_institucion/",
     *     summary="Lista de instituciones de lagarto",
     *     description="Devuelve la lista de los datos de instituciones de lagarto",
     *     operationId="v1getLagartoInstitucionList",
     *     tags={"LAGARTO"},
     *     security={{"bearerAuth":{}}},

     *     @OA\Response(
     *         response=200,
     *         description="Json con datos de la lista de institcuiones de lagarto",
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
        return LagartoInstitucionResource::collection(LagartoInstitucion::all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\LagartoInstitucion  $lagartoInstitucion
     * @return \Illuminate\Http\Response
     */
    /**
     * @OA\Get(
     *     path="/api/v1/lagarto_institucion/{lagartoInsitucionId}",
     *     summary="Buscar una institución por ID",
     *     description="Devuelve la información de una institución (LAGARTO) específico",
     *     operationId="v1getLagartoInstitucion",
     *     tags={"LAGARTO"},
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
    public function show(LagartoInstitucion $lagartoInstitucion)
    {
        return new LagartoInstitucionResource($lagartoInstitucion);
    }

}
