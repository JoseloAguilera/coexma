//DataTable
$(document).ready(function() {
    $('#tabladatos').DataTable( {
        dom: 'Bfrtip',
        order: [[ 1, "asc" ]],
        orientation: 'landscape',
        pageSize: 'LEGAL',
        columnDefs: [ {
            targets: [0,1],
            render: $.fn.dataTable.render.moment( 'YYYY-MM-DD', 'DD/MM/YYYY')
        } ],
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'pdfHtml5'
        ]
    });
});

<?php if (isset($mensaje)) {?>
$(document).ready(function(){
    $("#modal-mensaje").modal("show");
});
<?php
    unset($mensaje);
} ?>