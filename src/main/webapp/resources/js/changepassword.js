$("#changePwdSubmit").click(function(){
/*function changePasswordSubmit(){*/
		 $("#formData").removeAttr("action");
		//console.log("eSignature method starting");
		
	    var formData = $('#formData').serialize();
	    $.ajax(
	        {type: "post", 
	         url: "/ecx_rrbPortal/passwordReset/validateChangePassword",
	         data : formData,
	         success: 
		         function (responseText, textStatus, jqXHR) {
	                 //console.log("validation responseText--->" + responseText); 
	        	     if(responseText===''){ 
					    
	                              document.forms[0].action="/ecx_rrbPortal/passwordReset/processChangePassword";
	                              this.disabled="true";
	                          	greyOutPage();
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

