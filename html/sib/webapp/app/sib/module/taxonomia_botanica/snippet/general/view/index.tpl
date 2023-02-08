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
                            {html_options options=$cataobj.reino selected=1}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_reino_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_division_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[division_id]" id="division_id"
                                data-placeholder="{#field_Holder_division_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option value=""></option>
                            {html_options options=$cataobj.division selected=$item.division_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_division_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_orden_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[order_id]" id="order_id"
                                data-placeholder="{#field_Holder_orden_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.orden selected=$item.order_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_orden_id#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_familia_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[family_id]" id="family_id"
                                data-placeholder="{#field_Holder_familia_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.familia selected=$item.family_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_familia_id#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_genero_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[genus_id]" id="genus_id"
                                data-placeholder="{#field_Holder_genero_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.genero selected=$item.genus_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_genero_id#}</span>
                </div>
{*                <div class="col-lg-4">*}
{*                    <label>{#field_filo_id#} <span class="text-danger bold">*</span> : </label>*}
{*                    <div class="input-group">*}
{*                        <select class="form-control m-select2 select2_general"*}
{*                                name="item[filo_id]" id="filo_id"*}
{*                                data-placeholder="{#field_Holder_filo_id#}" {$privFace.input}*}
{*                                required*}
{*                                data-fv-not-empty___message="{#glFieldRequired#}"*}
{*                        >*}
{*                            <option></option>*}
{*                            {html_options options=$cataobj.filo selected=$item.filo_id}*}
{*                        </select>*}
{*                    </div>*}
{*                    <span class="form-text text-black-50">{#field_GroupMsg_filo_id#}</span>*}
{*                </div>*}
{*                <div class="col-lg-4">*}
{*                    <label>{#field_clase_id#} <span class="text-danger bold">*</span> : </label>*}
{*                    <div class="input-group">*}
{*                        <select class="form-control m-select2 select2_general"*}
{*                                name="item[clase_id]" id="clase_id"*}
{*                                data-placeholder="{#field_Holder_clase_id#}" {$privFace.input}*}
{*                                required*}
{*                                data-fv-not-empty___message="{#glFieldRequired#}"*}
{*                        >*}
{*                            <option></option>*}
{*                            {html_options options=$cataobj.clase selected=$item.clase_id}*}
{*                        </select>*}
{*                    </div>*}
{*                    <span class="form-text text-black-50">{#field_GroupMsg_clase_id#}</span>*}
{*                </div>*}
{*                <div class="col-lg-4">*}
{*                    <label>{#field_tipo_nomenclatura_id#} <span class="text-danger bold">*</span> : </label>*}
{*                    <div class="input-group">*}
{*                        <select class="form-control m-select2 select2_general"*}
{*                                name="item[tipo_nomenclatura_id]" id="tipo_nomenclatura_id"*}
{*                                data-placeholder="{#field_Holder_tipo_nomenclatura_id#}" {$privFace.input}*}
{*                                required*}
{*                                data-fv-not-empty___message="{#glFieldRequired#}"*}
{*                        >*}
{*                            <option></option>*}
{*                            {html_options options=$cataobj.tipo_nomenclatura selected=$item.tipo_nomenclatura_id}*}
{*                        </select>*}
{*                    </div>*}
{*                    <span class="form-text text-black-50">{#field_GroupMsg_tipo_nomenclatura_id#}</span>*}
{*                </div>*}
{*                <div class="col-lg-4">*}
{*                    <label>{#field_categoria_taxon_id#} <span class="text-danger bold">*</span> : </label>*}
{*                    <div class="input-group">*}
{*                        <select class="form-control m-select2 select2_general"*}
{*                                name="item[categoria_taxon_id]" id="categoria_taxon_id"*}
{*                                data-placeholder="{#field_Holder_categoria_taxon_id#}" {$privFace.input}*}
{*                                required*}
{*                                data-fv-not-empty___message="{#glFieldRequired#}"*}
{*                        >*}
{*                            <option></option>*}
{*                            {html_options options=$cataobj.categoria_taxon selected=$item.categoria_taxon_id}*}
{*                        </select>*}
{*                    </div>*}
{*                    <span class="form-text text-black-50">{#field_GroupMsg_categoria_taxon_id#}</span>*}
{*                </div>*}
{*                <div class="col-lg-4">*}
{*                    <label>{#field_epiteto_id#} <span class="text-danger bold">*</span> : </label>*}
{*                    <div class="input-group">*}
{*                        <select class="form-control m-select2 select2_general"*}
{*                                name="item[epiteto_id]" id="epiteto_id"*}
{*                                data-placeholder="{#field_Holder_epiteto_id#}" {$privFace.input}*}
{*                                required*}
{*                                data-fv-not-empty___message="{#glFieldRequired#}"*}
{*                        >*}
{*                            <option></option>*}
{*                            {html_options options=$cataobj.epiteto selected=$item.epiteto_id}*}
{*                        </select>*}
{*                    </div>*}
{*                    <span class="form-text text-black-50">{#field_GroupMsg_epiteto_id#}</span>*}
{*                </div>*}
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
                        <div class="input-group-append"><span class="input-group-text field_info"><i class="fas fa-otter"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#nombre_cientifico_field_msg#}</span>
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