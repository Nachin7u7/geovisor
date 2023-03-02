<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Esquila extends Model
{
    use HasFactory;
    protected $table = 'vicuna.esquila';
    //protected $primaryKey = 'id';

    public function departamentoTipo(){
        return $this->belongsTo(Departamento::class,'departamento_id','id');
    }
    public function municipioTipo(){
        return $this->belongsTo(Municipio::class,'municipio_id','id');
    }
}
