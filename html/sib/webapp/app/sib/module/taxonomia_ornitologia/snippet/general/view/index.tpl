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
                    <label>{#field_reino_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[kingdom_id]" id="kingdom_id" disabled
                                data-placeholder="{#field_Holder_reino_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option value=""></option>
                            {html_options options=$cataobj.kingdom selected=2}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_reino_id#}</span>
                </div>
                <div class="col-lg-4" hidden>
                    <label>{#field_categoria_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[categoria_id]" id="categoria_id" disabled
                                data-placeholder="{#field_Holder_categoria_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option value=""></option>
                            {html_options options=$cataobj.categoria selected=8}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_categoria_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_phylum_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[phylum_id]" id="phylum_id"
                                data-placeholder="{#field_Holder_phylum_id#}" {$privFace.input}
                        >
                            <option value=""></option>
                            {html_options options=$cataobj.phylum selected=$item.phylum_id}
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-success" id="phylum_btn" type="button">+</button>
                        </div>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_phylum_id#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_class_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[class_id]" id="class_id"
                                data-placeholder="{#field_Holder_class_id#}" {$privFace.input}
                        >
                            <option value=""></option>
                            {html_options options=$cataobj.class selected=$item.class_id}
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-success" id="class_btn" type="button">+</button>
                        </div>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_class_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_order_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[order_id]" id="order_id"
                                data-placeholder="{#field_Holder_order_id#}" {$privFace.input}
                        >
                            <option></option>
                            {html_options options=$cataobj.order selected=$item.order_id}
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-success" id="order_btn" type="button">+</button>
                        </div>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_order_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_family_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[family_id]" id="family_id"
                                data-placeholder="{#field_Holder_family_id#}" {$privFace.input}
                        >
                            <option></option>
                            {html_options options=$cataobj.family selected=$item.family_id}
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-success" id="family_btn" type="button">+</button>
                        </div>

                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_family_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_genus_id#}: </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[genus_id]" id="genus_id"
                                data-placeholder="{#field_Holder_genus_id#}" {$privFace.input}
                        >
                            <option></option>
                            {html_options options=$cataobj.genus selected=$item.genus_id}
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-success" id="genus_btn" type="button">+</button>
                        </div>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_genus_id#}</span>
                </div>

                <div class="col-lg-12">
                    <label>{#field_species_id#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[species]" value="{$item.species|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#nombre_species_field_length#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-otter"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#species_msg#}</span>
                </div>
                <div class="col-lg-12">
                    <label>{#nombre_cientifico_field#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[scientific_name]" value="{$item.scientific_name|escape:"html"}"
                               required
                               data-fv-not-empty___message="{#glFieldRequired#}"
                               minlength="3"
                               data-fv-string-length___message="{#nombre_cientifico_field_length#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fab fa-sistrix"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#nombre_cientifico_field_msg#}</span>
                </div>
                <div class="col-lg-12">
                    <label>{#scientific_name_authorship_field#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[scientific_name_authorship]" value="{$item.scientific_name_authorship|escape:"html"}"
                               minlength="3"
                               data-fv-string-length___message="{#scientific_name_authorship_field_length#}"
                        >
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-user"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#scientific_name_authorship_field_msg#}</span>
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
<!--begin::Modal-->
<div class="modal fade" id="form_modal_{$subcontrol}_peque"
     data-backdrop="static" tabindex="-1" role="dialog"
     aria-labelledby="staticBackdrop" aria-hidden="true"
     style="z-index:1044;"
>
    <div class="modal-dialog " role="document">
        <div class="modal-content " id="modal-content_{$subcontrol}_peque">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal Title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <i aria-hidden="true" class="ki ki-close"></i>
                </button>
            </div>

        </div>
    </div>
</div>
<!--end::Modal-->
{include file="index.js.tpl"}