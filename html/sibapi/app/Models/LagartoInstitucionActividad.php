<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LagartoInstitucionActividad extends Model
{
    use HasFactory;
    protected $table = 'catalogo.lagarto_actividad';
    protected $tableRelacional = 'lagarto.institucion_actividad';

    public function actividades(){
        return $this->belongsToMany(LagartoInstitucion::class, $this->tableRelacional,'institucion_id','actividad_id');
    }
}
