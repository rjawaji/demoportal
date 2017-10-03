$("#registerMyAccountSubmit").click(function(){
		 $("#formData").removeAttr("action");
		//console.log("eSignature method starting");
		
	    var formData = $('#formData').serialize();
	    $.ajax(
	        {type: "post", 
	         url: "/ecx_rrbPortal/register/validateMyAccount",
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
	                 $('html, body').animate({scrollTop: '800px'}, 800);
	                
	             }
	    }); 
	
	});


/*function selectList() {
    var validationQuestionlist = document.getElementById("validationQuestionlist");
    if (validationQuestionlist.value == "") {
    //If the "Please Select" option is selected display error.
    alert("Please select an option!");
    return false;
    }
    return true;
}*/


$("document").ready(function() {
    $('#phone').inputmask({mask: "999-999-9999"}); 
	$('#mobileNumber').inputmask({mask: "999-999-9999"}); 
	 var validationErrorDataVal = $('#validationErrorData').val();
	 if(!checkEmpty(validationErrorDataVal)){
		 var obj = jQuery.parseJSON( validationErrorDataVal);
		 displayErrors(obj);
	 }
});

