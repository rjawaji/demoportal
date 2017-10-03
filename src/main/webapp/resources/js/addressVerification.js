$("#addressVerificationSubmit").click(function(){
	greyOutPage();
	                              document.forms[0].action="/ecx_rrbPortal/register/processSignUp";
	                              this.disabled="true";
	                              document.forms[0].submit();

	});


