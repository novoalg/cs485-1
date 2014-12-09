$(document).ready(function() {
    $('#all-orders').dataTable( {
		"order": [[ 0, "desc" ]]
    } );
    
    $('#one-order').dataTable( {
		"order": [[ 0, "desc" ]]
    } );
} );