$("#passwordResetSubmit").click(function(){
		 $("#formData").removeAttr("action");
		//console.log("eSignature method starting");
		
	    var formData = $('#formData').serialize();
	    $.ajax(
	        {type: "post", 
	         url: "/ecx_rrbPortal/passwordReset/validatePasswordReset",
	         data : formData,
	         success: 
		         function (responseText, textStatus, jqXHR) {
	                 //console.log("validation responseText--->" + responseText); 
	        	     if(responseText===''){ 
	        	    		greyOutPage();
	                              document.forms[0].action="/ecx_rrbPortal/passwordReset/processPasswordReset";
	                              this.disabled="true";
	                              document.forms[0].submit();
					               
	        	     } else {
	        	    	 displayErrors(responseText);
	        	     } 
	             },
	             error: function (jqXHR, textStatus, errorThrown) {
	            	 displayForbiddenError (errorThrown);
	                 $('html, body').animate({scrollTop: '800px'}, 800);
	                
	             }
	    }); 
    	return false;
	});

$("document").ready(function() {
	 var validationErrorDataVal = $('#validationErrorData').val();
	 if(!checkEmpty(validationErrorDataVal)){
		 var obj = jQuery.parseJSON( validationErrorDataVal);
		 displayErrors(obj);
	 }
});

