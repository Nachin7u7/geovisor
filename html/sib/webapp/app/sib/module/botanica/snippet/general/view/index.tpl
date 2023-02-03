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

        <div class="card-body">
            <div class="form-group row">
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
                <div class="col-lg-12">
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
                <div class="col-lg-12">
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