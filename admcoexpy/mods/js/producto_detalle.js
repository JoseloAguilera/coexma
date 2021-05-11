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
        order: [[ 1, "asc" ]],
        orientation: 'landscape',
        pageSize: 'LEGAL',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'pdfHtml5'
        ]
    });
    $('#tabladatos1').DataTable( {
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
    $('#tabladatos2').DataTable( {
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
        var url = button.data('url')
        var orden = button.data('orden')
        var activo = button.data('activo')
        
        console.log(activo);
        // Actualiza los datos del modal
        var modal = $(this)
        modal.find('.modal-title').text('Imagen ' + url);
        modal.find('#codigo').val(codigo);
        modal.find('#imgurl').val(url);
        document.getElementById("img-alt").src="../img/productos/"+url;
        modal.find('#orden').val(orden);

        if (activo == "1") {
            $('#toggle-activo').bootstrapToggle('on')
        } else {
            $('#toggle-activo').bootstrapToggle('off')
        }
        
    })

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
    
});

// modal para confirmar si quiere remover el registro (WAREHOUSE)
var modalConfirm = function(callback){
    //botón que llama el modal
    $("#btn-confirmarpr").on("click", function(){
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
    //Acciones si el usuario confirma
    if(confirm){
        $("#btn-excluirpr").click();
    }
});

// modal para confirmar si quiere remover el registro (PACOTE)
var excPaqueteConfirm = function(callback){
    //botón que llama el modal
    $("#btn-confirmar").on("click", function(){
        $("#ExcModal").modal('show');
    });

    //si quiere remover el registro
    $("#excmodal-btn-si").on("click", function(){
        callback(true);
        $("#ExcModal").modal('hide');
    });
    //si no quiere remover el registro
    $("#excmodal-btn-no").on("click", function(){
        callback(false);
        $("#ExcModal").modal('hide');
    });
};
//función que trabaja con la respuesta del modal (sí o no)
excPaqueteConfirm(function(confirm){
    //Acciones si el usuario confirma
    if(confirm){
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


$(document).ready(function(){
    $(document).on('shown.bs.modal','#AltAtributoModal', function (event) {
        var button = $(event.relatedTarget) // objeto que disparó el modal
        var codigo = button.data('codigo')
        var nombre = button.data('nombre')
        var select = button.data('newval')
        var atributo = button.data('atributo')
        var valores = button.data('valores')
        var activo = button.data('activo')

        // Actualiza los datos del modal
        var modal = $(this)
        modal.find('.modal-title').text('Atributo ' + nombre);
        modal.find('#codigo').val(codigo);
        modal.find('#atributo').val(atributo);
        $('.selectpicker').selectpicker('refresh');
        document.getElementById("nuevovlr").dataset.codigo = codigo;
        document.getElementById("nuevovlr").dataset.select = select;
      
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

// modal para confirmar si quiere remover el registro
var modalConfirm = function(callback){
    //botón que llama el modal
    $("#btn-confirmar-atributo").on("click", function(){
        $("#DelAtributoModal").modal('show');
    });

    //si quiere remover el registro
    $("#atributo-btn-si").on("click", function(){
        callback(true);
        $("DelAtributoModal").modal('hide');
    });

    //si no quiere remover el registro
    $("#atributo-btn-no").on("click", function(){
        callback(false);
        $("DelAtributoModal").modal('hide');
    });
};
//función que trabaja con la respuesta del modal (sí o no)
modalConfirm(function(confirm){
    if(confirm){
        //Acciones si el usuario confirma
        $("#btn-excluir-atributo").click();
    }
});

$(document).ready(function(){
    $(document).on('shown.bs.modal','#AddValorModal', function (event) {
        var button = $(event.relatedTarget) // objeto que disparó el modal
        var codigo = button.data('codigo')
        var valores = button.data('select')

        var modal = $(this)
        modal.find('#codigo').val(codigo);

        $('#valor').empty();
        valores = valores.split(";");
        for (var i = 0; i < valores.length; i++) {
            valor = valores[i].split(".");
            $('#valor').append('<option value="' + valor[0] + '">' + valor[1] + '</option>');
        }
        $('.selectpicker').selectpicker('refresh');
        console.log(valor);
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

$(document).ready(function(){
    $(document).on('shown.bs.modal','#AltStockModal', function (event) {
        var button = $(event.relatedTarget) // objeto que disparó el modal
        var codigo = button.data('codigo')
        var valores = button.data('valores')
        var stock = button.data('stock')
        var precio = button.data('precio')
        var descuento = button.data('descuento')

        // Actualiza los datos del modal
        var modal = $(this)
        modal.find('.modal-title').text('Stock ');
        modal.find('#codigo').val(codigo);
        modal.find('#stock').val(stock);
        modal.find('#precio').val(precio);
        modal.find('#descuento').val(descuento);
      
        if (valores != "") {
            valores = valores.split(";");
            for (var i = 0; i < valores.length; i++) {
                valor = valores[i].split(":");
                modal.find('#sel-'+valor[0]).val(valor[1]);
                $('.selectpicker').selectpicker('refresh');
                $('#sel-'+valor[0]).prop('disabled', true);
            }
        }
    })
});

// modal para confirmar si quiere remover el registro
var modalConfirmVlr = function(callback){
    //botón que llama el modal
    $("#btn-confirmar-stock").on("click", function(){
        $("#DelStockModal").modal('show');
    });

    //si quiere remover el registro
    $("#modal-btn-si-stock").on("click", function(){
        callback(true);
        $("#DelStockModal").modal('hide');
    });

    //si no quiere remover el registro
    $("#modal-btn-no-stock").on("click", function(){
        callback(false);
        $("#DelStockModal").modal('hide');
    });
};
//función que trabaja con la respuesta del modal (sí o no)
modalConfirmVlr(function(confirm){
    if(confirm){
        //Acciones si el usuario confirma
        $("#btn-excluir-stock").click();
    }
});