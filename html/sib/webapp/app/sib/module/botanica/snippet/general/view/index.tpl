{include file="index.css.tpl"}
<div class="card card-custom gutter-b example example-compact">
    <div class="card-body pt-0 pb-0 pl-5 pr-5">
        <div class="alert alert-custom fade show pt-1 pb-1 pl-5 pr-5 ayuda" role="alert">
            <div class="alert-icon"><i class="flaticon-notes"></i></div>
            <div class="alert-text text-justify text-dark-65" >{#message#}</div>
        </div>
    </div>

    <div class="card-header py-3">
        <div class="card-title">
            <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
            <h3 class="card-label text-dark-50">{#title#}</h3>
        </div>
    </div>
    <!--begin::Form-->
    <form method="POST"
          action="{$path_url}/{$subcontrol}_/{if $type=="update"}{$id}/{/if}save/"
          id="general_form">

        <div class="card-body  pt-1 pb-0">
            <div class="form-group row pt-0 pb-0 mb-0">
                <div class="col-lg-4">
                    <label>{#field_occurrence_id#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer2"
                               name="item[occurrence_id]" value="{$item.occurrence_id|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-key"></i></span></div>
                    </div>
                    <span class="form-text text-muted">{#field_msg_occurrence_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_basis_of_record#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer2"
                               name="item[basis_of_record]" value="{$item.basis_of_record|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-key"></i></span></div>
                    </div>
                    <span class="form-text text-muted">{#field_msg_basis_of_record#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_type#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[type]" value="{$item.type|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_type#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-info"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_type#}</span>
                </div>
            </div>
        </div>

        <div class="card-header py-3">
            <div class="card-title  m-0">
                <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
                <span class="font-weight-bold font-size-h4 text-dark-50">{#title2#}</span>
            </div>
        </div>
        <div class="card-body  pt-1 pb-0 proyecto" >
            <div class="form-group row  pt-0 pb-0 mb-0">
                <div class="col-lg-8">
                    <label>{#field_institution_id#}<span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[institution_id]" id="institution_id"
                                data-placeholder="{#field_Holder_institution_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.institucion selected=$item.institution_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_institution_id#}</span>
                </div>
                <div class="col-lg-4" id="institution_code_s">
                    <label>{#field_institucion_code#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[institution_code]"
                               id="institution_code"
                               value="{$item.institution_code|escape:"html"}"

                                {*                               required*}
                                {*                               data-fv-not-empty___message="{#glFieldRequired#}"*}
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas flaticon-layer"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_institution_code#}</span>
                </div>
            </div>
        </div>

        <div class="card-body pt-5 pb-0 ">
            <div class="form-group row">
                <div class="col-lg-4">
                    <label>{#field_collection_code#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[collection_code]" value="{$item.collection_code|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fab fa-centercode"></i></span></div>
                    </div>
                    <span class="form-text text-muted">{#field_msg_collection_code#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_collection_id#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[collection_id]" value="{$item.collection_id|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-key"></i></span></div>
                    </div>
                    <span class="form-text text-muted">{#field_msg_collection_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_catalog_number#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer2"
                               name="item[catalog_number]" value="{$item.catalog_number|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info" ><i class="fab fa-centercode"></i></span></div>
                    </div>
                    <span class="form-text text-muted">{#field_msg_catalog_number#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_language_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[language_id]" id="language_id"
                                data-placeholder="{#field_Holder_language_id#}" {$privFace.input}
                        >
                            <option></option>
                            {html_options options=$cataobj.language selected=$item.language_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_language_id#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_license_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[license_id]" id="license_id"
                                data-placeholder="{#field_Holder_license_id#}" {$privFace.input}
                        >
                            <option></option>
                            {html_options options=$cataobj.license selected=$item.license_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_license_id#}</span>
                </div>
                <div class="col-lg-5">
                    <label>{#field_rights_holder#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[rights_holder]" value="{$item.rights_holder|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_rights_holder#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="far fa-user-circle"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_rights_holder#}</span>
                </div>
                <div class="col-lg-7">
                    <label>{#field_access_rights#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[access_rights]" value="{$item.access_rights|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_access_rights#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-lock"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_access_rights#}</span>
                </div>
                <div class="col-lg-12">
                    <label>{#field_information_withheld#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[information_withheld]" value="{$item.information_withheld|escape:"html"}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_information_withheld#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-clipboard-list"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_information_withheld#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_recorded_by#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[recorded_by]" value="{$item.recorded_by|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_recorded_by#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="far fa-user-circle"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_recorded_by#}</span>
                </div>
                <div class="col-lg-3">
                    <label>{#field_individual_count#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer2"
                               name="item[individual_count]" value="{$item.individual_count|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-key"></i></span></div>
                    </div>
                    <span class="form-text text-muted">{#field_msg_individual_count#}</span>
                </div>
                <div class="col-lg-3">
                    <label>{#field_sex_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[sex_id]" id="sex_id"
                                data-placeholder="{#field_Holder_sex_id#}" {$privFace.input}
                        >
                            <option></option>
                            {html_options options=$cataobj.sex selected=$item.sex_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_sex_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_life_stage_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[life_stage_id]" id="type_select_estado"
                                data-placeholder="{#field_Holder_life_stage_id#}" {$privFace.input}
                        >
                            <option></option>
                            {html_options options=$cataobj.life_stage selected=$item.life_stage_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_life_stage_id#}</span>
                </div>
{*                <div class="col-lg-4">*}
{*                    <label>{#field_life_stage_id#}: </label>*}
{*                    <div class="input-group">*}
{*                        <select class="form-control m-select2 select2_general"*}
{*                                name="item[life_stage_id]" id="life_stage_id"*}
{*                                data-placeholder="{#field_Holder_life_stage_id#}" {$privFace.input}*}
{*                        >*}
{*                            <option></option>*}
{*                            {html_options options=$cataobj.life_stage selected=$item.life_stage_id}*}
{*                        </select>*}
{*                    </div>*}
{*                    <span class="form-text text-black-50">{#field_GroupMsg_life_stage_id#}</span>*}
{*                </div>*}
                <div class="col-lg-4">
                    <label>{#field_occurrence_status_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[occurrence_status_id]" id="occurrence_status_id"
                                data-placeholder="{#field_Holder_occurrence_status_id#}" {$privFace.input}
                        >
                            <option></option>
                            {html_options options=$cataobj.occurrence_status selected=$item.life_stage_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_occurrence_status_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_preparations_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[preparations_id]" id="preparations_id"
                                data-placeholder="{#field_Holder_preparations_id#}" {$privFace.input}
                        >
                            <option></option>
                            {html_options options=$cataobj.preparations selected=$item.life_stage_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_preparations_id#}</span>
                </div>
                <div class="col-lg-5">
                    <label>{#field_disposition#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[disposition]" value="{$item.disposition|escape:"html"}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_disposition#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-folder-plus"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_disposition#}</span>
                </div>
                <div class="col-lg-3">
                    <label>{#field_event_id#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[event_id]" value="{$item.event_id|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fab fa-orcid"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_event_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_sampling_protocol#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[sampling_protocol]" value="{$item.sampling_protocol|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="    fas fa-scroll"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_sampling_protocol#}</span>
                </div>
                <div class="col-lg-12">
                    <label>{#field_occurrence_remarks#} </label>
                    <div class="m-input-icon m-input-icon--right">
                        <div class="summernote" id="occurrence_remarks">{$item.occurrence_remarks}</div>
                        <input class="form-control m-input" type="hidden" name="item[occurrence_remarks]" id="occurrence_remarks_input" {$privFace.input}>
                    </div>
                </div>
            </div>
        </div>


        <div class="card-footer">
            {if $privFace.edit == 1}
                <button type="reset" class="btn btn-primary mr-2" id="general_submit">
                    <i class="la la-save"></i>
                    {#glBtnSaveChanges#}</button>
            {/if}
            <a href="{$path_url}" class="btn btn-light-primary ">
                <i class="la la-angle-double-left"></i>{if $type =="new"} {#glBtnCancel#} {else} {#glBtnBackToList#}{/if}
            </a>
        </div>

    </form>
    <!--end::Form-->
</div>

{include file="index.js.tpl"}