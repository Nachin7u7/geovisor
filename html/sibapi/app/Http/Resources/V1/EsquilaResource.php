<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class EsquilaResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        //return parent::toArray($request);
        return [
            'id' => $this->id,
            'year' => $this->anio,
            'fecha_captura' => $this->fecha_captura,
            'numero_acta' => $this->numero_acta,
            'sitio_captura' => $this->sitio_captura,
            'departamento' => [
                'id' => $this->departamentoTipo->id ?? null,
                'name' => $this->departamentoTipo->name ?? null,
            ],
            'municipio' => [
                'id' => $this->municipioTipo->id ?? null,
                'provincia' => $this->municipioTipo->provincia ?? null,
                'name' => $this->municipioTipo->name ?? null,
            ],
            'coordinates' => [
                'latitud' => $this->location_latitude_decimal ?? null,
                'longitud' => $this->location_longitude_decimal ?? null,
            ],
        ];
    }
}
