
$("document").ready(function() {
	 $( "#dialog-confirm" ).dialog({
         resizable: false,
         height:200,
         width:400,
         modal: true,
         buttons: [{
             id:"btn-accept",
             text: "Ok",
             click: function() {
             	$( this ).dialog( "close" );
                 
             }
         } 
         ]

  });
});