$(document).ready(function() {
    $('#all-orders').dataTable();
    $('#one-order').dataTable( {
		"paging": false, 
    } );
} );