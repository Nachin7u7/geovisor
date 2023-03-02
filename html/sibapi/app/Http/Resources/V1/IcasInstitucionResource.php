<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class IcasInstitucionResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializableDIRECCIÓN
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->nombre,
            'tipo_id' => $this->tipo_id,
            'tipo' => [
                'id' => $this->tipo->id ?? null,
                'name' => $this->tipo->nombre ?? null,
            ],
            'address' => $this->direccion,
            'phone_number' => $this->telefono,
            'cell_phone_number' => $this->celular,
            'web' => $this->web,
            'email' => $this->email,
            'pais_id' => $this->pais_id,
            'pais' => [
                'id' => $this->pais->id ?? null,
                'name' => $this->pais->nombre ?? null,
                'sigla' => $this->pais->sigla ?? null,
            ],
            'departamento_id' => $this->departamento_id,
            'departamento' => [
                'id' => $this->departamentoTipo->id ?? null,
                'name' => $this->departamentoTipo->name ?? null,
            ],
            'ciudad' => $this->ciudad,
            'responsable' => $this->responsable,
            'responsable_operativo' => $this->responsable_operativo,
            'estado' => $this->estado ?? null,
            'fecha_acreditacion' => $this->fecha_acreditacion ?? null,
            'fecha_expiracion' => $this->fecha_expiracion ?? null,
             'coordinates' => [
                 'latitud' => $this->location_latitude_decimal ?? null,
                 'longitud' => $this->location_longitude_decimal ?? null,
            ],

        ];
    }
}
