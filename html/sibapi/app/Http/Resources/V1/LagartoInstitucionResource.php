<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class LagartoInstitucionResource extends JsonResource
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
            'numero_registro' => $this->numero_registro,
            'name' => $this->nombre,
            'nit' => $this->nit,
            'red_id' => $this->red_id,
            'red' => [
                'id' => $this->red->id ?? null,
                'name' => $this->red->nombre ?? null,
            ],
            'address' => $this->direccion,
            'actividad' => $this->actividad,
            'representante_legal' => $this->representante_legal,
            'departamento_id' => $this->departamento_id,
            'departamento' => [
                'id' => $this->departamentoTipo->id ?? null,
                'name' => $this->departamentoTipo->name ?? null,
            ],
            'telefono' => $this->telefono,
            'email' => $this->email,
            'fecha_inscripcion' => $this->fecha_inscripcion ?? null,
            'fecha_expiracion' => $this->fecha_expiracion ?? null,
            'coordinates' => [
                'latitud' => $this->location_latitude_decimal ?? null,
                'longitud' => $this->location_longitude_decimal ?? null,
            ],
            'actividades' => $this->actividades ?? null,
        ];
    }
}
