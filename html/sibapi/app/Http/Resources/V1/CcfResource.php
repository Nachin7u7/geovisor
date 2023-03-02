<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class CcfResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->nombre,
            'codigo' => $this->codigo,
            'departamento' => $this->departamento,
            'municipio' => $this->municipio,
            'licencia_funcionamiento' => $this->licencia_funcionamiento,
            'responsable' => $this->responsable,
            'superficie' => $this->superficie,
            'latitud' => $this->location_latitude_decimal,
            'longitud' => $this->location_longitude_decimal,
        ];
    }
}
