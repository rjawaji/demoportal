	$("#submitMfa").click(function(){
		var mfaCode = $('#mfaCode').val();
		if(checkEmpty(mfaCode)) {
			$('#errorSummary-0').removeClass('hide').addClass('show');
			$('#errorText').text('Please enter the MFA code provided to you.');
		} else {
			$('#mfaForm').attr("action", "/ecx_rrbPortal/validateMFACode");
			greyOutPage();
			$('#mfaForm').submit();
		}
	});

	$('#generateEmail').click(function() {
		generateOTP('EMAIL');
	});
	
	$('#generateText').click(function(){
		generateOTP('TEXT');
	});

	function generateOTP(mfaType) {
		$.ajax({
			type : "get",
			url: "/ecx_rrbPortal/generateMFACode",
			data: {
				"mfaType" : mfaType
			},
			success: function(data){
				if(!checkEmpty(data)) {
					$('#errorSummary-0').removeClass('hide').addClass('show');
					$('#errorText').text(data);
					$("#generateText").removeClass('hide').addClass('show');
					$("#generateEmail").removeClass('hide').addClass('show');
				} else {
					$('#errorSummary-0').removeClass('show').addClass('hide');
					$("#generateText").removeClass('show').addClass('hide');
					$("#generateEmail").removeClass('show').addClass('hide');
					$("#enterMfa").removeClass('hide').addClass('show');					
				}
			},
			error: function (jqXHR, textStatus, errorThrown) {
				 displayForbiddenError (errorThrown);
				$('html, body').animate({scrollTop: '800px'}, 800);
			}
		});
	}
	
	$('#regenerateMfa').click(function(){
		$('#errorSummary-0').removeClass('show').addClass('hide');
		$("#generateEmail").removeClass('hide').addClass('show');
		$("#enterMfa").removeClass('show').addClass('hide');
		$('#mfaCode').val('');
		var mobilePhone = $('#mobilePhone').text();
		if(mobilePhone != 'No mobile number on file.') {
			$("#generateText").removeClass('hide').addClass('show');
		}
	});
	
	/*$(function(){
		$('#errorSummary-0').removeClass('show').addClass('hide');
		$('#errorText').text('');
	});*/