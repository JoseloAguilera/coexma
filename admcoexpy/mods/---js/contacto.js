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
            order: [[ 1, "desc" ]],
            orientation: 'landscape',
            pageSize: 'LEGAL',
            columnDefs: [ {
                targets: 1,
                render: $.fn.dataTable.render.moment( 'YYYY-MM-DD', 'DD/MM/YYYY')
            } ],
            buttons: [
                'copyHtml5',
                'excelHtml5',
                'pdfHtml5'
            ]
        });
    });
    
    $(document).ready(function(){
        $(document).on('shown.bs.modal','#AltModal', function (event) {
            var button = $(event.relatedTarget) // objeto que disparó el modal
            var codigo = button.data('codigo')
            var nombre = button.data('nombre')
            var fecha = button.data('fecha')
            var email = button.data('email')
            var telefono = button.data('telefono')
            var asunto = button.data('asunto')
            var mensaje = button.data('mensaje')
            
            // Actualiza los datos del modal
            var modal = $(this)
            modal.find('.modal-title').text('Contacto de ' + nombre);
            modal.find('#codigo').val(codigo);
            modal.find('#nombre').val(nombre);
            modal.find('#fecha').val(fecha);
            modal.find('#email').val(email);
            modal.find('#telefono').val(telefono);
            modal.find('#asunto').val(asunto);
            modal.find('#mensaje').val(mensaje);
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