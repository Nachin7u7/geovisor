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
                <div class="col-lg-6">
                    <label>{#field_date#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[date]" value="{$item.date|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_date#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_verbatimEventDate#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control date_general" id="valid_until"
                               name="item[verbatim_event_date]" value="{$item.verbatim_event_date|date_format:'%d/%m/%Y'}"
                               data-fv-not-empty___message="{#glFieldRequired#}"
                        >
                        <div class="input-group-append"><span class="input-group-text calendar"><i class="flaticon-event-calendar-symbol"></i></span></div>
                    </div>
                    <span class="form-text text-black-50">{#field_msg_verbatimEventDate#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_eventTime#}:</label>
                    <div class="input-group">
                        <input class="form-control" id="hora"
                               name="item[event_time]" value="{$item.event_time}"
                               readonly="readonly" placeholder="Seleccione la hora" type="text"/>
                    </div>
                    <span class="form-text text-muted">{#field_msg_eventTime#}</span>
                </div>
                <div class="col-lg-6">
                    <label>{#field_fieldNumber#}:</label>
                    <div class="input-group">
                        <input type="text" class="form-control number_integer2"
                               name="item[field_number]" value="{$item.field_number|escape:"html"}"
                        >
                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-info"></i></span></div>
                    </div>
                    <span class="form-text text-muted">{#field_msg_fieldNumber#}</span>
                </div>
                <div class="col-lg-12">
                    <label>{#field_eventRemarks#}:</label>
                    <input type="text" class="form-control"
                           name="item[event_remarks]"
                           value="{$item.event_remarks|escape:"html"}"
                           minlength="3"
                           data-fv-string-length___message="{#field_length_eventRemarks#}"
                    >
                    <span class="form-text text-black-50">{#field_msg_eventRemarks#}</span>
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