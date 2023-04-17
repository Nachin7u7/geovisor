{literal}
<script>
    var snippet_general_form = function(){
        "use strict";
        /**
         * Datos del formulario y el boton
         */
        var form = $('#general_form');
        var btn_submit = $('#general_submit');
        var phylum_opt = $("#phylum_id");
        var class_opt = $("#class_id");
        var order_opt = $("#order_id");
        var family_opt = $("#family_id");
        var genus_opt = $("#genus_id");
        let urlmodule = "{/literal}{$path_url}/{$subcontrol}_{literal}";
        var formv;
        /**
         * Antes de enviar el formulario se ejecuta la siguiente funcion
         */
        var showRequest= function(formData, jqForm, op)  {
            btn_submit.addClass('spinner spinner-white spinner-right').attr('disabled', true);
            return true;
        };

        var showResponse = function (res, statusText) {
            btn_submit.removeClass('spinner spinner-white spinner-right').attr('disabled', false);
            let url = "{/literal}{$path_url}{literal}";
            coreUyuni.generalShowResponse(res,url);

        };

        /**
         * Opciones para generar el objeto del formulario
         */
        var options = {
            beforeSubmit:showRequest
            , success:  showResponse
            , data: {type:'{/literal}{$type}{literal}'}
        };

        /**
         * Se da las propiedades de ajaxform al formulario
         */
        var handle_form_submit=function(){
            form.ajaxForm(options);
            formv = FormValidation.formValidation(
                document.getElementById('general_form'),
                {
                    plugins: {
                        declarative: new FormValidation.plugins.Declarative({html5Input: true,}),
                        trigger: new FormValidation.plugins.Trigger(),
                        bootstrap: new FormValidation.plugins.Bootstrap(),
                        submitButton: new FormValidation.plugins.SubmitButton(),
                    }
                }
            );

        };
        /**
         * Se da las funcionalidades al boton enviar
         */
        var handle_btn_submit = function() {
            btn_submit.click(function(e) {
                e.preventDefault();
                /**
                 * Copiamos los datos de summerNote a una variable
                 */
                $('#descripcion_input').val($('#descripcion').summernote('code'));

                formv.validate().then(function(status) {
                    if(status === 'Valid'){
                        form.submit();
                    }else{
                        Swal.fire({icon: 'error',title: lngUyuni.formFieldControlTitle, text: lngUyuni.formFieldControlMsg});
                    }
                });

            });
        };
        /**
         * Iniciamos los componentes necesarios como , summernote, select2 entre otros
         */
        var handle_components = function(){
            coreUyuni.setComponents();
        };

        var handle_type_select = function(){
            $('#type_select_category').on('change',function(){
                handle_type();
            });
        };
        var handle_font_select = function(){
            $('#type_select_font').on('change',function(){
                handle_font();
            });
        };

        var mini_div= $('#mini_div');
        var font_div= $('#font_div');

        var handle_type = function(){
            var id = $('#type_select_category').val();
            id = id==null? '': id.toString();
            console.log(id);
            mini_div.addClass('d-none');
            switch (id){
                case '3':
                    mini_div.removeClass('d-none');
                    break;
            }
        };
        var handle_font = function(){
            var id = $('#type_select_font').val();
            id = id==null? '': id.toString();
            font_div.addClass('d-none');
            switch (id){
                case '1':
                    font_div.removeClass('d-none');
                    break;
            }
        };


        /**
         * añadir Phylum form
         */
        var subcontrol = "{/literal}{$subcontrol}{literal}";
        var phylum_btn = $("#phylum_btn");
        // var p_opt = $("#actividad_unidad_id");
        var handle_addPhylum = function () {
            phylum_btn.click(function(e){
                e.preventDefault();
                var load_url = urlmodule;
                load_url += '/get.formaddphylum';
                let cargando = lngUyuni.loading+'...'+cargando_vista;
                $("#modal-content_"+subcontrol+"_peque").html(cargando);
                $("#form_modal_"+subcontrol+"_peque").modal("show");
                $.get(load_url, function(data) {
                    $("#modal-content_"+subcontrol+"_peque").html(data);
                });
            });
        };

        var getPhylum= function(id){
            phylum_opt.find("option").remove();
            $.post(urlmodule+"/get.phylum", {}
                , function (res, textStatus, jqXHR) {
                    let selOption = $('<option></option>');
                    phylum_opt.append(selOption.attr("value", "").text("{/literal}{#field_holder_phylum_id#}{literal}"));
                    let person_list = []
                    for (var row in res) {
                        phylum_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                        person_list[res[row].id] = res[row];
                    }
                    phylum_opt.val(id);
                    phylum_opt.trigger('change');
                }
                , 'json');
            phylum_opt.prop('disabled', false);
        };

        /**
         * añadir Class form
         */
        var class_btn = $("#class_btn");
        var handle_addClass = function () {
            class_btn.click(function(e){
                e.preventDefault();
                var load_url = urlmodule;
                load_url += '/get.formaddclass';
                let cargando = lngUyuni.loading+'...'+cargando_vista;
                $("#modal-content_"+subcontrol+"_peque").html(cargando);
                $("#form_modal_"+subcontrol+"_peque").modal("show");
                $.get(load_url, function(data) {
                    $("#modal-content_"+subcontrol+"_peque").html(data);
                });
            });
        };


        var getClass = function(id){
            class_opt.find("option").remove();
            $.post(urlmodule+"/get.classselect", {}
                , function (res, textStatus, jqXHR) {
                    let selOption = $('<option></option>');
                    class_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_class_id#}{literal}"));
                    let person_list = []
                    for (var row in res) {
                        class_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                        person_list[res[row].id] = res[row];
                    }
                    class_opt.val(id);
                    class_opt.trigger('change');
                }
                , 'json');
            class_opt.prop('disabled', false);
        };

        /**
         * añadir Order form
         */
        var order_btn = $("#order_btn");
        var handle_addOrder = function () {
            order_btn.click(function(e){
                e.preventDefault();
                var load_url = urlmodule;
                load_url += '/get.formaddorder';
                let cargando = lngUyuni.loading+'...'+cargando_vista;
                $("#modal-content_"+subcontrol+"_peque").html(cargando);
                $("#form_modal_"+subcontrol+"_peque").modal("show");
                $.get(load_url, function(data) {
                    $("#modal-content_"+subcontrol+"_peque").html(data);
                });
            });
        };


        var getOrder = function(id){
            order_opt.find("option").remove();
            $.post(urlmodule+"/get.orderselect", {}
                , function (res, textStatus, jqXHR) {
                    let selOption = $('<option></option>');
                    order_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_order_id#}{literal}"));
                    let person_list = []
                    for (var row in res) {
                        order_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                        person_list[res[row].id] = res[row];
                    }
                    order_opt.val(id);
                    order_opt.trigger('change');
                }
                , 'json');
            order_opt.prop('disabled', false);
        };
        /**
         * añadir Family form
         */
        var family_btn = $("#family_btn");
        var handle_addFamily = function () {
            family_btn.click(function(e){
                e.preventDefault();
                var load_url = urlmodule;
                load_url += '/get.formaddfamily';
                let cargando = lngUyuni.loading+'...'+cargando_vista;
                $("#modal-content_"+subcontrol+"_peque").html(cargando);
                $("#form_modal_"+subcontrol+"_peque").modal("show");
                $.get(load_url, function(data) {
                    $("#modal-content_"+subcontrol+"_peque").html(data);
                });
            });
        };


        var getFamily = function(id){
            family_opt.find("option").remove();
            $.post(urlmodule+"/get.familyselect", {}
                , function (res, textStatus, jqXHR) {
                    let selOption = $('<option></option>');
                    family_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_family_id#}{literal}"));
                    let person_list = []
                    for (var row in res) {
                        family_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                        person_list[res[row].id] = res[row];
                    }
                    family_opt.val(id);
                    family_opt.trigger('change');
                }
                , 'json');
            family_opt.prop('disabled', false);
        };
        /**
         * añadir Genus form
         */
        var genus_btn = $("#genus_btn");
        var handle_addGenus = function () {
            genus_btn.click(function(e){
                e.preventDefault();
                var load_url = urlmodule;
                load_url += '/get.formaddgenus';
                let cargando = lngUyuni.loading+'...'+cargando_vista;
                $("#modal-content_"+subcontrol+"_peque").html(cargando);
                $("#form_modal_"+subcontrol+"_peque").modal("show");
                $.get(load_url, function(data) {
                    $("#modal-content_"+subcontrol+"_peque").html(data);
                });
            });
        };


        var getGenus = function(id){
            genus_opt.find("option").remove();
            $.post(urlmodule+"/get.genusselect", {}
                , function (res, textStatus, jqXHR) {
                    let selOption = $('<option></option>');
                    genus_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_genus_id#}{literal}"));
                    let person_list = []
                    for (var row in res) {
                        genus_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                        person_list[res[row].id] = res[row];
                    }
                    genus_opt.val(id);
                    genus_opt.trigger('change');
                }
                , 'json');
            genus_opt.prop('disabled', false);
        };

        var handle_option_class = function(){
            $('#phylum_id').on('change',function(){
                var id = $('#phylum_id').val();
                class_search(id);
            });
        };
        var class_search = function(id){
            class_opt.find("option").remove();
            // disabled el selectbox
            class_opt.prop('disabled', true);
            if(id!="") {
                $.post(urlmodule+"/get.class"
                    , {id: id}
                    , function (res, textStatus, jqXHR) {
                        let selOption = $('<option></option>');
                        class_opt.append(selOption.attr("value", "").text("{/literal}{#field_GroupMsg_class_id#}{literal}"));
                        let class_list = []
                        for (var row in res) {
                            class_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                            class_list[res[row].id] = res[row];
                        }
                        class_opt.trigger('chosen:updated');
                        class_opt.prop('disabled', false);
                    }
                    , 'json');
            }else{
            }
        };
        var handle_option_order = function(){
            $('#class_id').on('change',function(){
                var id = $('#class_id').val();
                order_search(id);
            });
        };
        var order_search = function(id){
            order_opt.find("option").remove();
            // disabled el selectbox
            order_opt.prop('disabled', true);
            if(id!="") {
                $.post(urlmodule+"/get.order"
                    , {id: id}
                    , function (res, textStatus, jqXHR) {
                        let selOption = $('<option></option>');
                        order_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_order_id#}{literal}"));
                        let order_list = []
                        for (var row in res) {
                            order_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                            order_list[res[row].id] = res[row];
                        }
                        order_opt.trigger('chosen:updated');
                        order_opt.prop('disabled', false);
                    }
                    , 'json');
            }else{
            }
        };
        var handle_option_family = function(){
            $('#order_id').on('change',function(){
                var id = $('#order_id').val();
                family_search(id);
            });
        };

        var family_search = function(id){
            family_opt.find("option").remove();
            // disabled el selectbox
            family_opt.prop('disabled', true);
            if(id!="") {
                $.post(urlmodule+"/get.family"
                    , {id: id}
                    , function (res, textStatus, jqXHR) {
                        let selOption = $('<option></option>');
                        family_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_family_id#}{literal}"));
                        let family_list = []
                        for (var row in res) {
                            family_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                            family_list[res[row].id] = res[row];
                        }
                        family_opt.trigger('chosen:updated');
                        family_opt.prop('disabled', false);
                    }
                    , 'json');
            }else{
            }
        };
        var handle_option_genus = function(){
            $('#family_id').on('change',function(){
                var id = $('#family_id').val();
                genus_search(id);
            });
        };

        var genus_search = function(id){
            genus_opt.find("option").remove();
            // disabled el selectbox
            genus_opt.prop('disabled', true);
            if(id!="") {
                $.post(urlmodule+"/get.genus"
                    , {id: id}
                    , function (res, textStatus, jqXHR) {
                        let selOption = $('<option></option>');
                        genus_opt.append(selOption.attr("value", "").text("{/literal}{#field_Holder_genus_id#}{literal}"));
                        let family_list = []
                        for (var row in res) {
                            genus_opt.append($('<option></option>').attr("value", res[row].id).text(res[row].nombre));
                            family_list[res[row].id] = res[row];
                        }
                        genus_opt.trigger('chosen:updated');
                        genus_opt.prop('disabled', false);
                    }
                    , 'json');
            }else{
            }
        };
        return {
            init: function() {
                handle_form_submit();
                handle_btn_submit();
                handle_components();
                handle_type_select();
                handle_font_select();

                handle_addPhylum();
                handle_addClass();
                handle_addOrder();
                handle_addFamily();
                handle_addGenus();

                handle_option_class();
                handle_option_order();
                handle_option_family();
                handle_option_genus();

            },
            getPhylum:function (id) {
                getPhylum(id);
            },
            getClass:function (id) {
                getClass(id);
            },
            getOrder:function (id) {
                getOrder(id);
            },
            getFamily:function (id) {
                getFamily(id);
            },
            getGenus:function (id) {
                getGenus(id);
            },
        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_general_form.init();
    });

</script>
{/literal}