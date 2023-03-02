<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IcasInstitucion extends Model
{
    use HasFactory;
    protected $table = 'icas.institucion';

    public function departamentoTipo(){
        return $this->belongsTo(Departamento::class,'departamento_id','id');
    }

    public function tipo(){
        return $this->belongsTo(IcasInstitucionTipo::class,'tipo_id','id');
    }

    public function pais(){
        return $this->belongsTo(Pais::class,'pais_id','id');
    }
}
