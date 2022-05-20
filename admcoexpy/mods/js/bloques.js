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
            order: [[ 0, "desc" ]],
            orientation: 'landscape',
            pageSize: 'LEGAL',
            buttons: [
                'copyHtml5',
                'excelHtml5',
                'pdfHtml5'
            ]
        });
    });
    
    // $('#AltModal').on('show.bs.modal', function (event) {
    $(document).ready(function(){
        $(document).on('shown.bs.modal','#AltModal', function (event) {
            var button = $(event.relatedTarget) // objeto que disparó el modal
            var codigo = button.data('codigo')
            var ubicacion = button.data('ubicacion')
            var titulo = button.data('titulo')
            var descripcion = button.data('descripcion')
            var fondo = button.data('fondo')
            var color_tit = button.data('color_tit')
            var color_desc = button.data('color_desc')
            var activo = button.data('activo')
            var posicion = button.data('posicion')
            //console.log(activo);

                      
            // Actualiza los datos del modal
            var modal = $(this)
            modal.find('.modal-title').text('Bloque ' + titulo);
            modal.find('#codigo').val(codigo);
            modal.find('#ubicacion').val(ubicacion);
            modal.find('#titulo').val(titulo);
            modal.find('#descripcion').val(descripcion);
            modal.find('#fondo').val(fondo);
            modal.find('#color_tit').val(color_tit);
            modal.find('#color_desc').val(color_desc);
            modal.find('#posicion').val(posicion);
            $('.selectpicker').selectpicker('refresh');
            
            //modal.find('#activo').val(activo);

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
    
    // formato para campos moneda
    String.prototype.reverse = function(){
        return this.split('').reverse().join('');
    };
    
    function formatoMoneda(campo, evento){
        var tecla = (!evento) ? window.event.keyCode : evento.which;
        var valor  =  campo.value.replace(/[^\d]+/gi,'').reverse();
        var resultado  = "";
        var mascara = "###.###.###.###";
        mascara = mascara.reverse();
        for (var x=0, y=0; x<mascara.length && y<valor.length;) {
            if (mascara.charAt(x) != '#') {
                resultado += mascara.charAt(x);
                x++;
            } else {
                resultado += valor.charAt(y);
                y++;
                x++;
            }
        }
        campo.value = resultado.reverse();
    }
    
    function formatoNro(campo, evento){
        var tecla = (!evento) ? window.event.keyCode : evento.which;
        var valor  =  campo.value.replace(/[^\d]+/gi,'').reverse();
        var resultado  = "";
        var mascara = "#####";
        mascara = mascara.reverse();
        for (var x=0, y=0; x<mascara.length && y<valor.length;) {
            if (mascara.charAt(x) != '#') {
                resultado += mascara.charAt(x);
                x++;
            } else {
                resultado += valor.charAt(y);
                y++;
                x++;
            }
        }
        campo.value = resultado.reverse();
    }