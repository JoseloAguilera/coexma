//DataTable
$(document).ready(function() {
    $('#tabladatos').DataTable( {
        dom: 'Bfrtip',
        order: [[ 1, "asc" ]],
        orientation: 'landscape',
        pageSize: 'LEGAL',
        aoColumnDefs: [ {
            aTargets: [ 5 ],
            mRender: $.fn.dataTable.render.number('.', ',', 0, 'G$ ')
        }],
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