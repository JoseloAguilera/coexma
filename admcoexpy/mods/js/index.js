
<?php if (isset($mensaje)) {?>
$(document).ready(function(){
	$("#modal-mensaje").modal("show");
});
<?php
	unset($mensaje);
} ?>

//DataTable
$(document).ready(function() {
    $('#tablapedidos').DataTable( {
        dom: 'Bfrtip',
        order: [[ 0, "asc" ]],
        orientation: 'landscape',
		pageSize: 'LEGAL',
		pageLength: 5,
        // aoColumnDefs: [ {
        //     aTargets: [ 5 ],
        //     mRender: $.fn.dataTable.render.number('.', ',', 0, 'G$ ')
        // }],
        columnDefs: [ {
            targets: 0,
            render: $.fn.dataTable.render.moment( 'YYYY-MM-DD', 'DD/MM/YYYY')
        } ],
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'pdfHtml5'
        ]
	});
	
	$('#tablastock').DataTable( {
        dom: 'Bfrtip',
        order: [[ 1, "asc" ]],
        orientation: 'landscape',
		pageSize: 'LEGAL',
		pageLength: 5,
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'pdfHtml5'
        ]
	});

	$('#tablacliente').DataTable( {
        dom: 'Bfrtip',
        order: [[ 1, "desc" ]],
        orientation: 'landscape',
		pageSize: 'LEGAL',
		pageLength: 5,
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'pdfHtml5'
        ]
	});
	
	$('#tablavisitas').DataTable( {
        dom: 'Bfrtip',
        order: [[ 2, "desc" ]],
        orientation: 'landscape',
		pageSize: 'LEGAL',
		pageLength: 5,
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'pdfHtml5'
        ]
    });
});