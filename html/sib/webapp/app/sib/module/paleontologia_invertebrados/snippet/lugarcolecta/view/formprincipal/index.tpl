{include file="formprincipal/index.css.tpl"}
<div class="card card-custom gutter-b ">
    <!--begin::Form-->
    <form method="POST"
          action="{$path_url}/{$subcontrol}_/{if $type=="update"}{$id}/{/if}save.principal/"
          id="general_form">

        <div class="card-header py-3">
            <div class="card-title  m-0">
                <span class="card-icon"><i class="flaticon2-next text-dark-25"></i></span>
                <span class="font-weight-bold font-size-h4 text-primary">{#title_datos#}</span>
            </div>
        </div>

        <div class="card-body py-0">
            <div class="form-group">
                <div id="map" style="height:400px;"></div>
            </div>
            <div class="form-group row">
                <div class="col-lg-6">
                    <label>{#field_continent#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[continent]"
                               id="continent" required
                               value="{$item.continent|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fas fa-map-marked-alt text-info"></i></span></div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <label>{#field_pais#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[country]"
                               id="country" required
                               value="{$item.country|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}" disabled
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fas fa-map-marked-alt text-info"></i></span></div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <label>{#field_departamento_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[state_province_id]" id="state_province_id"
                                data-placeholder="{#field_Holder_departamento_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.departamento selected=$item.state_province_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_departamento_id#}</span>
                </div>

                <div class="col-lg-4">
                    <label>{#field_municipio_id#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2 select2_general"
                                name="item[municipality_id]" id="municipality_id"
                                data-placeholder="{#field_Holder_municipio_id#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.municipio selected=$item.municipality_id}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_municipio_id#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_locality#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[locality]"
                               id="locality"
                               value="{$item.locality|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-location-arrow text-info"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_locality#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#fiel_location_latitude_decimal#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control location_latitude_decimal"
                               name="item[location_latitude_decimal]"
                               id="location_latitude_decimal"
                               required
                               value="{$item.location_latitude_decimal|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-map-marker-alt text-danger"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_location_latitude_decimal#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#fiel_location_longitude_decimal#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control location_longitude_decimal"
                               id="location_longitude_decimal"
                               required
                               name="item[location_longitude_decimal]"
                               value="{$item.location_longitude_decimal|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-map-marker-alt text-danger"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_location_longitude_decimal#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_verbatim_latitude#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[verbatim_latitude]"
                               id="verbatim_latitude"
                               required
                               value="{$item.verbatim_latitude|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-map-marker-alt text-danger"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_verbatim_latitude#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_verbatim_longitude#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               id="verbatim_longitude"
                               required
                               name="item[verbatim_longitude]"
                               value="{$item.field_verbatim_longitude|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-map-marker-alt text-danger"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_verbatim_longitude#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_utm_latitude#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               name="item[utm_latitude]"
                               id="utm_latitude"
                               required
                               value="{$item.utm_latitude|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-map-marker-alt text-danger"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_utm_latitude#}</span>
                </div>
                <div class="col-lg-4">
                    <label>{#field_utm_longitude#}  <span class="text-danger bold">*</span> :</label>
                    <div class="input-group">
                        <input type="text" class="form-control"
                               id="utm_longitude"
                               required
                               name="item[utm_longitude]"
                               value="{$item.utm_longitude|escape:"html"}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i
                                        class="fa fa-map-marker-alt text-danger"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_utm_longitude#}</span>
                </div>
                <div class="col-lg-2">
                    <label>{#field_zona#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer2"
                               id="zone"
                               name="item[zone]"
                               value="{$item.zone|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    <span class="form-text text-muted">{#field_msg_zona#}</span>
                </div>
                <div class="col-lg-2">
                    <label>{#field_hemisferio#} <span class="text-danger bold">*</span> : </label>
                    <div class="input-group">
                        <select class="form-control m-select2"
                                name="item[hemisferio]" id="hemisferio"
                                data-placeholder="{#field_Holder_hemisferio#}" {$privFace.input}
                                required
                                data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                            <option></option>
                            {html_options options=$cataobj.hemisferio selected=$item.hemisferio}
                        </select>
                    </div>
                    <span class="form-text text-black-50">{#field_GroupMsg_hemisferio#}</span>
                </div>
            </div>
        </div>


        <div class="card-footer">
            {if $privFace.edit == 1}
                <button type="reset" class="btn btn-primary mr-2" id="general_submit">
                    <i class="la la-save"></i>
                    {#glBtnSaveChanges#}</button>
            {/if}
            {*
            <a href="{$path_url}" class="btn btn-light-primary ">
                <i class="la la-angle-double-left"></i>{if $type =="new"} {#glBtnCancel#} {else} {#glBtnBackToList#}{/if}
            </a>
*}
        </div>
    </form>
    <!--end::Form-->
</div>

{include file="formprincipal/index.js.tpl"}