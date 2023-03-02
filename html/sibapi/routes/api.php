<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Api\V1\CiteController as CiteV1;
use App\Http\Controllers\Api\V1\CatalogoCitesPropositoController as PropositoV1;
use App\Http\Controllers\Api\V1\EsquilaController as EsquilaV1;
use App\Http\Controllers\Api\V1\IcasInstitucionController as IcasInsitucionV1;
use App\Http\Controllers\Api\V1\LagartoInstitucionController as LagartoInsitucionV1;
use App\Http\Controllers\Api\V1\CcfController as CcfsV1;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
*/


Route::apiResource('v1/cites',CiteV1::class)
    ->only(['index','show'])
    ->middleware('auth:sanctum');

Route::apiResource('v1/list_species_amazon',App\Http\Controllers\Api\V1\CatalogoCitesEspecieController::class)
    ->only(['index','show'])
    ->middleware('auth:sanctum');
/*
Route::apiResource('v1/purposes',App\Http\Controllers\Api\V1\CatalogoCitePropositoController::class)
    ->only(['index','show'])
    ->middleware('auth:sanctum');
*/
Route::apiResource('v1/list_purpose',PropositoV1::class)
    ->only(['index','show'])
    ->middleware('auth:sanctum');

Route::apiResource('v1/esquila',EsquilaV1::class)
    ->only(['index','show'])
    ->middleware('auth:sanctum');


Route::apiResource('v1/icas_institucion',IcasInsitucionV1::class)
    ->only(['index','show'])
    ->middleware('auth:sanctum');

Route::apiResource('v1/lagarto_institucion',LagartoInsitucionV1::class)
    ->only(['index','show'])
    ->middleware('auth:sanctum');

Route::apiResource('v1/centro_custodia',CcfsV1::class)
    ->only(['index','show'])
    ->middleware('auth:sanctum');

//Login
Route::post('login',[App\Http\Controllers\Api\LoginController::class,'login']);
