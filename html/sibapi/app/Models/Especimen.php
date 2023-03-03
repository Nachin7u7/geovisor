<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Especimen extends Model
{
    use HasFactory;
    protected $table = 'coleccion.especimen';

    public function categoria(){
        return $this->belongsTo(CatalogoCategoria::class,'categoria_id','id');
    }

    public function languageEspecimen(){
        return $this->belongsTo(EspecimenLanguage::class,'language_id','id');
    }

    public function licenseEspecimen(){
        return $this->belongsTo(EspecimenLicense::class,'license_id','id');
    }
}
