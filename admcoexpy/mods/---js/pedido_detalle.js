//DataTable
$(document).ready(function() {
    $('#tabladatos').DataTable( {
        dom: 'Bfrtip',
        order: [[ 0, "asc" ]],
        orientation: 'landscape',
        pageSize: 'LEGAL',
        aoColumnDefs: [ {
            aTargets: [ 3 , 5 ],
            mRender: $.fn.dataTable.render.number('.', ',', 0, 'G$ ')
        }],
        columns: [
            null,
            null,
            null,
            null,
            null,
            { className: "text-bold" }
        ],
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