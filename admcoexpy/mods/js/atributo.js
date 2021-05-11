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
            ]
        });
    });
    
    $(document).ready(function(){
        $(document).on('shown.bs.modal','#AltModal', function (event) {
            var button = $(event.relatedTarget) // objeto que disparó el modal
            var codigo = button.data('codigo')
            var nombre = button.data('nombre')
            var valores = button.data('valores')
            var activo = button.data('activo')
    
            // Actualiza los datos del modal
            var modal = $(this)
            modal.find('.modal-title').text('Atributo ' + nombre);
            modal.find('#codigo').val(codigo);
            modal.find('#nombre').val(nombre);
            document.getElementById("nuevovlr").dataset.codigo =  codigo;
          
            if (activo == "1") {
                $('#activo').bootstrapToggle('on')
            } else {
                $('#activo').bootstrapToggle('off')
            }

            var table = document.getElementById("tbvalores");
            var tableRows = table.getElementsByTagName('tr');
            var rowCount = tableRows.length;
    
            if (rowCount > 1) {
                for (var x=rowCount-1; x > 0 ; x--) {
                    table.deleteRow(x);
                }
            }
            
            if (valores != "") {
                valores = valores.split("*");
                for (var i = 0; i < valores.length; i++) {
                    valor = valores[i].split(";");
                    var row = table.insertRow(i+1);
                    row.dataset.toggle = "modal";
                    row.dataset.target = "#AltValorModal";
                    row.dataset.codigo =  valor[0];    
                    row.dataset.nombre =  valor[1];    
                    row.dataset.activo =  valor[2];    
                    row.insertCell(0).innerHTML = valor[1];
                    if (valor[2] == 1) {
                        row.insertCell(1).innerHTML = '<span style="color: white">S</span><i class="fa fa-check text-success"></i>'
                    } else {
                        row.insertCell(1).innerHTML = '<span style="color: white">N</span><i class="fa fa-close text-danger"></i>'
                    }
                }
            }

        })
    });
    $(document).ready(function(){
        $(document).on('shown.bs.modal','#AddValorModal', function (event) {
            var button = $(event.relatedTarget) // objeto que disparó el modal
            var codigo = button.data('codigo')

            var modal = $(this)
            modal.find('#codigo').val(codigo);
        })
    });

    $(document).ready(function(){
        $(document).on('shown.bs.modal','#AltValorModal', function (event) {
            var button = $(event.relatedTarget) // objeto que disparó el modal
            var codigo = button.data('codigo')
            var nombre = button.data('nombre')
            var activo = button.data('activo')
    
            // Actualiza los datos del modal
            var modal = $(this)
            modal.find('.modal-title').text('Valor ' + nombre);
            modal.find('#codigo').val(codigo);
            modal.find('#nombre').val(nombre);
          
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

    // modal para confirmar si quiere remover el registro
    var modalConfirmVlr = function(callback){
        //botón que llama el modal
        $("#btn-confirmar-vlr").on("click", function(){
            $("#mi-modal-vlr").modal('show');
        });
    
        //si quiere remover el registro
        $("#modal-btn-si-vlr").on("click", function(){
            callback(true);
            $("#mi-modal-vlr").modal('hide');
        });
    
        //si no quiere remover el registro
        $("#modal-btn-no-vlr").on("click", function(){
            callback(false);
            $("#mi-modal").modal('hide');
        });
    };
    //función que trabaja con la respuesta del modal (sí o no)
    modalConfirmVlr(function(confirm){
        if(confirm){
            //Acciones si el usuario confirma
            $("#btn-excluir-vlr").click();
        }
    });