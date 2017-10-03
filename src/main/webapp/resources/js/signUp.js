

$("#signUpSubmit").click(function(){
	
		 $("#formData").removeAttr("action");
		//console.log("eSignature method starting");
		
		 /*var formData = $('#formData').serialize();
		    var isAgreeToCert = $("#agreeToCert").is(':checked');
		    if(isAgreeToCert){
		    	 formData=formData+"&agreeToCert=";
		    }*/
		    
	    var formData = $('#formData').serialize();
	    $.ajax(
	        {type: "post", 
	         url: "/ecx_rrbPortal/register/validateSignUp.do",
	         data : formData,
	         success: 
		         function (responseText, textStatus, jqXHR) {
	                 //console.log("validation responseText--->" + responseText); 
	        	     if(responseText===''){ 
	        	    	 greyOutPage();
	                              document.forms[0].action="/ecx_rrbPortal/register/processSignUp";
	                              this.disabled="true";
	                              document.forms[0].submit();
					               
	        	     } else {
	        	    	 displayErrors(responseText);
	        	    	 return false;
	        	     } 
	             },
	             error: function (jqXHR, textStatus, errorThrown) {
	            	 displayForbiddenError (errorThrown);
	            	   
	                 $('html, body').animate({scrollTop: '800px'}, 800);
	                
	             }
	    }); 
	
	});


$("document").ready(function() {
	$("#dateOfBirth").inputmask({mask: "99/99/9999"});
	 var validationErrorDataVal = $('#validationErrorData').val();
	 if(!checkEmpty(validationErrorDataVal)){
		 var obj = jQuery.parseJSON( validationErrorDataVal);
		 displayErrors(obj);
	 }
});

