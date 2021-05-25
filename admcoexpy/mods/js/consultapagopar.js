<?php if (isset($mensaje)) {?>
    $(document).ready(function(){
        $("#modal-mensaje").modal("show");
    });
    <?php
        unset($mensaje);
    } ?>
    
    //DataTable
    $(document).ready(function() {
        $('#tabladatos').DataTable( {
            dom: 'Bfrtip',
            order: [[ 0, "asc" ]],
            orientation: 'landscape',
            pageSize: 'LEGAL',
            buttons: [
                'copyHtml5',
                'excelHtml5',
                'pdfHtml5'
            ]//, 
            // columnDefs: [{
            // 	targets: [ 0 ],
            // 	visible: false,
            // 	searchable: false
            // }]
        });
    });
    
    // $('#AltModal').on('show.bs.modal', function (event) {
    $(document).ready(function(){
        $(document).on('shown.bs.modal','#AltModal', function (event) {
            var button = $(event.relatedTarget) // objeto que disparó el modal
            var codigo = button.data('codigo')
            var nombre = button.data('nombre')
            var url = button.data('url')
            var activo = button.data('activo')
    
            // console.log(marca);
            // Actualiza los datos del modal
            var modal = $(this)
            modal.find('.modal-title').text('Marca ' + nombre);
            modal.find('#codigo').val(codigo);
            modal.find('#nombre').val(nombre);
            modal.find('#imgurl').val(url);
            document.getElementById("img-alt").src="img/marcas/"+url;
          
            if (activo == "1") {
                $('#activo').bootstrapToggle('on')
            } else {
                $('#activo').bootstrapToggle('off')
            }
        })
    });
    
    // modal para confirmar si quiere remover el registro
    var modalConfirm = function(callback){
        //botón que llama el modal
        $("#btn-confirmar").on("click", function(){
            $("#mi-modal").modal('show');
        });
    
        //si quiere remover el registro
        $("#modal-btn-si").on("click", function(){
            callback(true);
            $("#mi-modal").modal('hide');
        });
    
        //si no quiere remover el registro
        $("#modal-btn-no").on("click", function(){
            callback(false);
            $("#mi-modal").modal('hide');
        });
    };
    //función que trabaja con la respuesta del modal (sí o no)
    modalConfirm(function(confirm){
        if(confirm){
            //Acciones si el usuario confirma
            $("#btn-excluir").click();
        }
    });

    //función responsable por mostrar la imagen que el usuario eligió en el elemento img
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById("img").src = e.target.result;
                document.getElementById("img-alt").src = e.target.result;
                // $(input).next().attr('src', e.target.result)
            };
            reader.readAsDataURL(input.files[0]);
        }
        else {
            var img = input.value;
            document.getElementById("img").src=img;
            document.getElementById("img-alt").src=img;
            // $(input).next().attr('src',img);
        }
    } 
    
    function verificaMostraBotao(){
        $('input[type=file]').each(function(index){
            if ($('input[type=file]').eq(index).val() != ""){
                readURL(this);
                $('.hide').show();
            }
        });
    }
    
    $('input[type=file]').on("change", function(){
      verificaMostraBotao();
    });
    
    $('.hide').on("click", function(){
        $(document.body).append($('<input />', {type: "file" }).change(verificaMostraBotao));
        $(document.body).append($('<img />'));
        $('.hide').hide();
    });