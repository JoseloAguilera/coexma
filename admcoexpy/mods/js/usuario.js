
$('#contrasena1, #contrasena2').on('keyup', function () {
    var mensaje = "";
    if ($('#contrasena1').val() == $('#contrasena2').val()) {
        $('#alerta').html(mensaje);
    } else 
        mensaje = '<p class="alert alert-danger" style="margin-top:0px;margin-bottom:0px;padding: 10px;">Las contraseñas no coinciden!</p>';
        $('#alerta').html(mensaje);
});

$('#contrasena1-alt, #contrasena2-alt').on('keyup', function () {
    var mensaje = "";
    if ($('#contrasena1-alt').val() == $('#contrasena2-alt').val()) {
        $('#alerta2').html(mensaje);
    } else 
        mensaje = '<p class="alert alert-danger" style="margin-top:0px;margin-bottom:0px;padding: 10px;">Las contraseñas no coinciden!</p>';
        $('#alerta2').html(mensaje);
});

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
        pageLength: 10,
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'pdfHtml5'
        ]
    });

    $('#tabladatos2').DataTable( {
        dom: 'Bfrtip',
        order: [[ 0, "asc" ]],
        orientation: 'landscape',
        pageSize: 'LEGAL',
        pageLength: 10,
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
        var usuario = button.data('usuario')
        var nombre = button.data('nombre')
        var tipo = button.data('mesa')

        // Actualiza los datos del modal
        var modal = $(this)
        modal.find('.modal-title').text('Usuario ' + usuario);
        modal.find('#codigo').val(codigo);
        modal.find('#usuario').val(usuario);
        modal.find('#nombre').val(nombre);

        // if (tipo == 'Admin') {
        //     $("#tipo").text("Tipo Usuário");
        //     modal.find('#mesa').val(tipo);
        // } else {
        //     $("#tipo").text("Numero Mesa");
        //     modal.find('#mesa').val(tipo);
        // }

    })

    $(document).on('shown.bs.modal','#AddModal', function (event) {
        var button = $(event.relatedTarget) // objeto que disparó el modal
        var tipo = button.data('tipo')
        
        // if (tipo == 'admin') {
        //     $('#mesa').empty();
        //     $('#mesa').append('<option value="NULL" selected>Admin</option>');
        //     $('#mesa').selectpicker('refresh');
        //     $("#tipousuario").text("Tipo Usuário");
        // } else if (tipo == 'mesa') {
        //     $("#tipousuario").text("Numero Mesa");
        //     carregaMesas(null);
        // }
    })
});

// modal para confirmar si quiere remover el registro
var modalConfirm = function(callback){
    //botón que llama el modal
    $("#btn-confirmar").on("click", function(){
        $("#ExcModal").modal('show');
    });

    //si quiere remover el registro
    $("#modal-btn-si").on("click", function(){
        callback(true);
        $("#ExcModal").modal('hide');
    });

    //si no quiere remover el registro
    $("#modal-btn-no").on("click", function(){
        callback(false);
        $("#ExcModal").modal('hide');
    });
};
//función que trabaja con la respuesta del modal (sí o no)
modalConfirm(function(confirm){
    if(confirm){
        //Acciones si el usuario confirma
        $("#btn-excluir").click();
    }
});