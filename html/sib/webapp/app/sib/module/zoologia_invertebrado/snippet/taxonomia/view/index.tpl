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
                <div class="col-lg-12">
                    <label>{#field_identified_by#}<span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[identified_by]"
                               value="{$item.identified_by|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_identified_by#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="far fa-user"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_identified_by#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_type_status#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[type_status]"
                               value="{$item.type_status|escape:"html"}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_type_status#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fab fa-centercode"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_type_status#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_identification_qualifier#} :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[identification_qualifier]"
                               value="{$item.identification_qualifier|escape:"html"}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_identification_qualifier#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-user-edit"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_identification_qualifier#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_scientific_name#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[catalogo_taxonomia_id]"
                                id="catalogo_taxonomia_id"
                                data-placeholder="{#field_Holder_scientific_name#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.taxonomia selected=$item.catalogo_taxonomia_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_scientific_name#}</span>
                </div>

                <div class="col-lg-6" id="scientific_name_authorship_s">
                    <label>{#field_scientific_name_authorship#}<span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[scientific_name_authorship]"
                               id="scientific_name_authorship"
                               value="{$item.scientific_name_authorship|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_scientific_name_authorship#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="far fa-user"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_scientific_name_authorship#}</span>
                </div>

                <div class="col-lg-4" id="kingdom_s">
                    <label>{#field_kingdom#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[kingdom]" id="kingdom"
                               value="{$item.kingdom|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    {*                    <span class="form-text text-muted">{#field_msg_fieldNumber#}</span>*}
                </div>
                <div class="col-lg-4" id="class_s">
                    <label>{#field_class#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[class]" id="class"
                               value="{$item.class|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    {*                    <span class="form-text text-muted">{#field_msg_fieldNumber#}</span>*}
                </div>
                <div class="col-lg-4" id="order_s">
                    <label>{#field_order#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[order]" id="order"
                               value="{$item.order|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    {*                    <span class="form-text text-muted">{#field_msg_fieldNumber#}</span>*}
                </div>
                <div class="col-lg-4" id="family_s">
                    <label>{#field_family#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[family]" id="family"
                               value="{$item.family|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    {*                    <span class="form-text text-muted">{#field_msg_fieldNumber#}</span>*}
                </div>
                <div class="col-lg-4" id="genus_s">
                    <label>{#field_genus#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[genus]" id="genus"
                               value="{$item.genus|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    {*                    <span class="form-text text-muted">{#field_msg_fieldNumber#}</span>*}
                </div>
                <div class="col-lg-4">
                    <label>{#field_specific_epithet#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[specific_epithet]" id="specific_epithet"
                               value="{$item.specific_epithet|escape:"html"}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_specific_epithet#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_specific_epithet#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_vernacular_name#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[vernacular_name]" id="vernacular_name"
                               value="{$item.vernacular_name|escape:"html"}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_vernacular_name#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_vernacular_name#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_taxon_rank#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[taxon_rank]" id="taxon_rank"
                               value="{$item.taxon_rank|escape:"html"}"
                               minlength="3"
                               data-fv-string-length___message="{#field_length_taxon_rank#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_taxon_rank#}</span>
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