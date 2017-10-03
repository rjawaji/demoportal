$("#verifyProfileSubmit").click(function(){
		// $("#formData").removeAttr("action");
		//console.log("eSignature method starting");
		
	    var formData = $('#formData').serialize();
	    $.ajax(
	        {type: "post", 
	         url: "/ecx_rrbPortal/validateverifyProfile",
	         data: formData,
	         success: 
		         function (responseText, textStatus, jqXHR) {  
	                 //console.log("validation responseText--->" + responseText); 
	        	     if(responseText===''){ 
	        	    		greyOutPage();
	                              document.forms[0].action="/ecx_rrbPortal/verifyProfile";
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

$("#verifyProfileClear").click(function(){
 $('#verificationCode').val('');
 $('#userId').val('');
 $('#errorSummary-0').removeClass('show').addClass('hide');
});

$("document").ready(function() {
	 var validationErrorDataVal = $('#validationErrorData').val();
	 if(!checkEmpty(validationErrorDataVal)){
		 var obj = jQuery.parseJSON( validationErrorDataVal);
		 displayErrors(obj);
	 }
});

