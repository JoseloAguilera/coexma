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
    
    // $('#AltModal').on('show.bs.modal', function (event) {
    $(document).ready(function(){
        $(document).on('shown.bs.modal','#AltModal', function (event) {
            var button = $(event.relatedTarget) // objeto que disparó el modal
            var codigo = button.data('codigo')
            var foto = button.data('foto')
            var nombre = button.data('nombre')
            var unidad = button.data('unidad')
            var email = button.data('email')
            var skype = button.data('skype')
            var telefonoa = button.data('telefonoa')
            var telefonob = button.data('telefonob')
            var whatsapp = button.data('whatsapp')
            var espanol = button.data('espanol')
            var portugues = button.data('portugues')
            var ingles = button.data('ingles')
    
            // Actualiza los datos del modal
            var modal = $(this)
            modal.find('.modal-title').text('Vendedor ' + nombre);
            modal.find('#codigo').val(codigo);
            modal.find('#imgurl').val(foto);
            document.getElementById("img-alt").src="../img/vendedores/"+foto;
            modal.find('#nombre').val(nombre);
            modal.find('#unidad').val(unidad);
            $('.selectpicker').selectpicker('refresh');
            modal.find('#email').val(email);
            modal.find('#skype').val(skype);
            modal.find('#telefonoa').val(telefonoa);
            modal.find('#telefonob').val(telefonob);
            modal.find('#whatsapp').val(whatsapp);


            if (espanol == "1") {
                $('#espanol-alt').bootstrapToggle('on')
                // console.log("espanol ON");
            } else {
                $('#espanol-alt').bootstrapToggle('off')
            }
            // console.log("espanhol " + espanol);

            if (portugues == "1") {
                $('#portugues-alt').bootstrapToggle('on')
                // console.log("portugues ON");
            } else {
                $('#portugues-alt').bootstrapToggle('off')
            }
            // console.log("portugues " + portugues);

            if (ingles == "1") {
                $('#ingles-alt').bootstrapToggle('on')
                console.log("ingles ON");
            } else {
                $('#ingles-alt').bootstrapToggle('off')
            }
            // console.log("ingles " + ingles);
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