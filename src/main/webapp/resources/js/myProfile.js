$("#myProfileSubmit").click(function(){
		 $("#formData").removeAttr("action");
		//console.log("eSignature method starting");
		
	    var formData = $('#formData').serialize();
	    $.ajax(
	        {type: "post", 
	         url: "/ecx_rrbPortal/validateMyProfile",
	         data : formData,
	         success: 
		         function (responseText, textStatus, jqXHR) {
	                 //console.log("validation responseText--->" + responseText); 
	        	     if(responseText===''){ 
	        	    		greyOutPage();
	                              document.forms[0].action="/ecx_rrbPortal/processMyProfile";
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
	
	});

$("#emailAddress").blur(function(){
	var currentEmail = $('#currentEmail').val().toLowerCase();
	var enteredEmail = $(this).val().toLowerCase();
	
	if(enteredEmail != currentEmail){
		$("#reenterEmailId2").removeClass("hide").addClass("show");
	} else {
		$("#reenterEmailId2").removeClass("show").addClass("hide");
		$("#reenterEmailId2").val('');
	}
	
});

$("#reqNewVerfEmail").click(function(){
	 $("#formData").removeAttr("action");
	//console.log("eSignature method starting");
	
   var formData = $('#formData').serialize();
   $.ajax(
       {type: "post", 
        url: "/ecx_rrbPortal/requestNewProfileVerificationEmail",
        data : formData,
        success: 
	         function (responseText, textStatus, jqXHR) {
                //console.log("validation responseText--->" + responseText); 
       	     if(responseText===''){ 
       	    		greyOutPage();
                             document.forms[0].action="/ecx_rrbPortal/login";
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

});



$("document").ready(function() {
	$('#phone').inputmask({mask: "999-999-9999"}); 
	$('#mobileNumber').inputmask({mask: "999-999-9999"}); 
	 var validationErrorDataVal = $('#validationErrorData').val();
	 if(!checkEmpty(validationErrorDataVal)){
		 var obj = jQuery.parseJSON( validationErrorDataVal);
		 displayErrors(obj);
	 }
});

