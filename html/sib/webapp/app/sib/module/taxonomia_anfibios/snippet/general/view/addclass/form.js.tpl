{literal}
<script>
    var snippet_form_{/literal}{$subcontrol}{literal}_class = function() {
        "use strict";
        let form = $('#form_{/literal}{$subcontrol}{literal}_peque');
        let btn_submit = $('#form_submit_{/literal}{$subcontrol}{literal}_peque');
        let btn_close = $('#form_close_{/literal}{$subcontrol}{literal}_peque');
        let pmodal = $("#form_modal_{/literal}{$subcontrol}{literal}_peque");
        var formv;
        /**
         * Antes de enviar el formulario se ejecuta la siguiente funcion
         */
        var showRequest= function(formData, jqForm, op) {
            let phylum_id = $('#phylum_id').val();
            // console.log("Phylum id", phylum_id)
            formData.push({name: "item[phylum_id]", value: phylum_id});
            btn_submit.addClass('spinner spinner-white spinner-right').attr('disabled', true);
            btn_close.attr('disabled', true);
            return true;
        };

        var showResponse = function (res, statusText) {
            coreUyuni.itemFormShowResponse(res,pmodal,"");
            btn_close.attr('disabled', false);
            btn_submit.removeClass('spinner spinner-white spinner-right').attr('disabled', false);
            snippet_{/literal}{$subcontrol}{literal}_form.getClass(res.id);
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
                document.getElementById('form_{/literal}{$subcontrol}{literal}_peque'),
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

                formv.validate().then(function(status) {
                    if(status === 'Valid'){
                        form.submit();
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

        //== Public Functions
        return {
            // public functions
            init: function() {
                handle_form_submit();
                handle_btn_submit();
                handle_components();
            }
        };
    }();

    //== Class Initialization
    jQuery(document).ready(function() {
        snippet_form_{/literal}{$subcontrol}{literal}_class.init();
    });

</script>
{/literal}
