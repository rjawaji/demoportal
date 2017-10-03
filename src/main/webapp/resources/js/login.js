function loginSubmit(){
		 $("#formData").removeAttr("action");
		//console.log("eSignature method starting");
		
	    var formData = $('#formData').serialize();
	    $.ajax(
	        {type: "post", 
	         url: "/ecx_rrbPortal/validateLoginForm.do",
	         data : formData,
	         success: 
		         function (responseText, textStatus, jqXHR) {
	                 //console.log("validation responseText--->" + responseText); 
	        	     if(responseText===''){ 
	        	    		greyOutPage();
	                              document.forms[0].action="processLogin.do";
	                              this.disabled="true";
	                              document.forms[0].submit();
					               
	        	     } else {
	        	    	 displayErrors(responseText);
	        	    	 return false;
	        	     } 
	             },
	             error: function (jqXHR, textStatus, errorThrown) {
	                 $('html, body').animate({scrollTop: '800px'}, 800);
	                
	             }
	    }); 
    	
	}

$("document").ready(function() {
	 /*var validationErrorDataVal = $('#validationErrorData').val();
	 if(!checkEmpty(validationErrorDataVal)){
		 var obj = jQuery.parseJSON( validationErrorDataVal);
		 displayErrors(obj);
	 }*/
});