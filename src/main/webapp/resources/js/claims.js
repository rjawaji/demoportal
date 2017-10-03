
$(document).ready(function() {  
	$('#claimStatusTable').DataTable( {
		"pageLength" : 10,
		
		dom: 'Bfrtip',
		
		buttons: [

		          'excel',		           

		          'pdf'

		          ]
    } );
} );


$("document").ready(function() {
	 var validationErrorDataVal = $('#validationErrorData').val();
	 if(!checkEmpty(validationErrorDataVal)){
		 var obj = jQuery.parseJSON( validationErrorDataVal);
		 displayErrors(obj);
	 }
});