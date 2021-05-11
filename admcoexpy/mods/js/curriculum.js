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
            order: [[ 0, "asc" ], [ 1, "asc" ]],
            orientation: 'landscape',
            pageSize: 'LEGAL',
            buttons: [
                'copyHtml5',
                'excelHtml5',
                'pdfHtml5'
            ]
        });
    });
    