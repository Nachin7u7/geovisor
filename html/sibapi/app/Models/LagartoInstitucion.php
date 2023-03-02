<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LagartoInstitucion extends Model
{
    use HasFactory;
    protected $table = 'lagarto.institucion';
    protected $tableRelacional = 'lagarto.institucion_actividad';

    public function departamentoTipo(){
        return $this->belongsTo(Departamento::class,'departamento_id','id');
    }

    public function red(){
        return $this->belongsTo(LagartoInstitucionRed::class,'red_id','id');
    }

    public function actividades(){
        return $this->belongsToMany(LagartoInstitucionActividad::class, $this->tableRelacional,'institucion_id','actividad_id');;
    }
}
