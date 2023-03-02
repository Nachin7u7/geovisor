<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Esquila;
use Illuminate\Http\Request;

use App\Http\Resources\V1\EsquilaResource;

class EsquilaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    /**
     * @OA\Get(
     *     path="/api/v1/esquila/",
     *     summary="Lista de actas de esquila de Vicuña",
     *     description="Devuelve la lista de los datos de actas de equila de vicuña",
     *     operationId="v1getEsquilaList",
     *     tags={"VICUNA"},
     *     security={{"bearerAuth":{}}},

     *     @OA\Response(
     *         response=200,
     *         description="Json con datos de la lista de actas de equila de vicuña",
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
        return EsquilaResource::collection(Esquila::all());
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Esquila  $esquila
     * @return \Illuminate\Http\Response
     */

    /**
     * @OA\Get(
     *     path="/api/v1/esquila/{esquilaId}",
     *     summary="Buscar una acta de esquila de vicuña por ID",
     *     description="Devuelve la información de una acta de esquila de vicuña específico",
     *     operationId="v1getEsquila",
     *     tags={"VICUNA"},
     *     security={{"bearerAuth":{}}},
     *     @OA\Parameter(
     *      name="citesId",in="path",required=true,
     *      description="ID de la solicitud acta de esquila de vicuña",
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
    public function show(Esquila $esquila)
    {
        return new EsquilaResource($esquila);
    }

}
