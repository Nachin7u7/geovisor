<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class EspecimenResource extends JsonResource
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

            'kingdom' => $this->kingdom,
            'phylum' => $this->phylum,
            'class' => $this->class,
            'order' => $this->order,
            'family' => $this->family,
            'genus' => $this->genus,
            'scientificName' => $this->scientific_name,
            'scientificNameAuthorship' => $this->scientific_name_authorship,
            'vernacularName' => "",

            'taxonRank' => $this->taxon_rank,
            'country' => $this->country,
            'countryCode' => $this->country_code,
            'stateProvince' => $this->state_province,
            'county' => $this->county,
            'municipality' => $this->municipality,
            'locality' => $this->locality,
            'eventDate' => $this->date,

            'coordinates' => [
                'decimalLatitude' => $this->location_latitude_decimal ?? null,
                'decimalLongitude' => $this->location_longitude_decimal ?? null,
            ],


/*
  'specificEpithet' => $this->specific_epithet,
            'basisOfRecord' => $this->basis_of_record,
            'type' => $this->type,
            'institutionCode' => $this->institution_code,
            'catalogNumber' => $this->catalog_number,
            'language_id' => $this->language_id,
            'language' => [
                'id' => $this->languageEspecimen->id ?? null,
                'name' => $this->languageEspecimen->nombre ?? null,
            ],
            'license_id' => $this->license_id,
            'license' => [
                'id' => $this->licenseEspecimen->id ?? null,
                'name' => $this->licenseEspecimen->nombre ?? null,
            ],
            'rightsHolder' => $this->rights_holder,
            'accessRights' => $this->access_rights,
            'informationWithheld' => $this->information_withheld,
            'recordedBy' => $this->recorded_by,
            'individualCount' => $this->individual_count,
            'sex' => $this->sex,
            'preparations' => $this->preparations,
            'disposition' => $this->disposition,
            'otherCatalogNumbers' => $this->other_catalog_numbers,

            'verbatimEventDate' => $this->verbatim_event_date,
            'eventTime' => $this->event_time,
            'fieldNumber' => $this->field_number,
            'eventRemarks' => $this->event_remarks,
            'continent' => $this->continent,



            'verbatimLocality' => $this->verbatim_locality,

            'verbatimLatitude' => $this->verbatim_latitude,
            'verbatimLongitude' => $this->verbatim_longitude,


*/

        ];
    }
}
