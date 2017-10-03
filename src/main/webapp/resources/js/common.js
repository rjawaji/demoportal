
$(document).ready(function(e) {
	 var token = $("input[name='_csrf']").val();
	    var header = "X-CSRF-TOKEN";
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	    
	$("#submitbtn").click(function(e){
		$(".submittoggle").toggle();
	});
	
	 $( "#dateOfBirth").datepicker({
				 maxDate: '0',
				 changeMonth: true,
				 changeYear: true,
				 yearRange:"-130:+0"
	 });
	 
	 
	 
	 $('#infoIcon').tooltip();
	 
	
	  $("#effectiveDate").datepicker({
	        dateFormat: 'MM yy',
	        changeMonth: true,
	        changeYear: true,
	        yearRange:"-130:+0",
	        showButtonPanel: true,
	        onClose: function(dateText, inst) {
	            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	            $(this).val($.datepicker.formatDate('MM yy', new Date(year, month, 1)));
	        	$(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
	        }
	    });

	   $("#effectiveDate").focus(function () {
	        $(".ui-datepicker-calendar").hide();
	        $("#ui-datepicker-div").position({
	            my: "center top",
	            at: "center bottom",
	            of: $(this)
	        });
	        
	       
	    });
	    
	    $("#effectiveDate").focus(function () {
	    $(".ui-datepicker-prev, .ui-datepicker-next").remove();
	    });

	    

		 $( "#dateFrom").datepicker({
			 maxDate: '0',
			 changeMonth: true,
			 changeYear: true,
			 yearRange:"-100:+0"
		 });

		 $( "#dateTo").datepicker({
			 maxDate: '0',
			 changeMonth: true,
			 changeYear: true,
			 yearRange:"-100:+0"
		 });

		 $('input[name="dateRange"]').on('click', function() {
			    if ($(this).val() === 'true') {
			        $('#dateFrom').removeProp("disabled");
			        $('#dateTo').removeProp("disabled");
			    }
			    else {
			        $('#dateFrom').prop("disabled", "disabled");
			        $('#dateTo').prop("disabled", "disabled");
			    }
			});
		 
		$('input[type=radio]').change(function()
				 {
				     if (this.checked)
				     {
				         $(this).closest('.dateSelection')
				             .find('input[type=radio]').not(this)
				             .prop('checked', false);
				     }
				 });
	
		$("#dateFromClear").click(function(event){
			  event.preventDefault();
			  $("#dateFrom").val("");
			});
		
		$("#dateToClear").click(function(event){
			  event.preventDefault();
			  $("#dateTo").val("");
			});
});


function displayErrors (responseText){
	 
    var $errorList = $('#errorList');
    if ( $errorList.length){
    	$errorList.remove();
    }

    var value = "";
    var objectId = "";
    var errorCountVal = 0;
    var onee = "<ul class='errorSummaryList' id='errorList'>";
    var errorList = "";
    
    for(key in responseText) {
        value = "";
        objectId = "";
        value = responseText[key];
        objectId = "#"+key;
        type = $(objectId).attr('type');
        //console.log("ksm have errors --->" + key + " " + value + ", OBJECT ID " + objectId); 

        if (value != "") {
   			//console.log("ADDING TO LIST --->" + value); 
			errorList += value + " ";
        }

    	if ("fileupload" == key) {
    		if (value == "") {
    			$(objectId).closest('div').removeClass("has-error");
    		} else {
	        	errorCountVal = errorCountVal+1;
				$(objectId).closest('div').addClass("has-error");  
		        onee = onee+" <li class='errorSummaryItem'><a href='"+objectId+"'><span class='errorSummaryLabel'>"+value+"</span></a></li>";
		        $(objectId).tooltip({ inheritState: true }).attr('title', value);
    		}
    	} else if ( $(objectId).is("select") && value==""){
        	$(objectId).closest('div').removeClass("has-error");   
        } else if ( $(objectId).is('select') && value!=""){
        	errorCountVal = errorCountVal+1;
			$(objectId).closest('div').addClass("has-error");  
	        onee = onee+" <li class='errorSummaryItem'><a href='"+objectId+"'><span class='errorSummaryLabel'>"+value+"</span></a></li>";
	        $(objectId).tooltip({ inheritState: true }).attr('title', '');
    	} else if ($(objectId).is('textarea') && value=="" ){
     		$(objectId).closest('div').removeClass("has-error");
    	} else if ($(objectId).is('textarea') && value!="" ){
        	errorCountVal = errorCountVal+1;
        	$(objectId).closest('div').addClass("has-error");  
			onee = onee+" <li class='errorSummaryItem'><a href='"+objectId+"'><span class='errorSummaryLabel'>"+value+"</span></a></li>";
			$(objectId).tooltip({ inheritState: true }).attr('title', value);
        } else if($(objectId).is('input[type="text"]') || objectId=='#password'  ){   
        	if(value!="") {
        		errorCountVal = errorCountVal+1;
        	 	$(objectId).closest('div').addClass("has-error");  
				onee = onee+" <li class='errorSummaryItem'><a href='"+objectId+"'><span class='errorSummaryLabel'>"+value+"</span></a></li>";
				$(objectId).tooltip({ inheritState: true }).attr('title', value);
        	} else {
        		 $(objectId).closest('div').removeClass("has-error"); 
         	}
	    } else if (value!="" && type=='file') { //radio button
	      	 errorCountVal = errorCountVal+1;
	      	 $(objectId).addClass("radioButtonError");
	      	 onee = onee+" <li class='errorSummaryItem'><a href='"+objectId+"'><span class='errorSummaryLabel'>"+value+"</span></a></li>";
	      	 $(objectId).tooltip({ inheritState: true }).attr('title', value);
	    } else if (value!="") { //radio button
	      	 errorCountVal = errorCountVal+1;
	      	 $(objectId).addClass("radioButtonError");
	      	 onee = onee+" <li class='errorSummaryItem'><a href='"+objectId+"1'><span class='errorSummaryLabel'>"+value+"</span></a></li>";
	      	 $(objectId).tooltip({ inheritState: true }).attr('title', value);
	    } else {
	      	 $(objectId).closest('div').removeClass("radioButtonError");  
	      	 $(objectId).closest('div').removeClass("has-error");  
        }
    }// for each key
     onee = onee+"</ul>";
     //console.log("onee--->"+onee);

	console.log("Your information contains " + errorCountVal + " errors. " + errorList);
	    //document.title = errorList;
	    $('#displayErrorList').val("Your information contains " + errorCountVal + " errors. " + errorList);

     $('#errorSummary-0').removeClass('hide').addClass('show');
     $('#errorSummary-0').append(onee);
     $('.errorCount').text(errorCountVal); 
     $('html, body').animate({scrollTop: '200px'});
     $('#errorSummary-0').focus();    
     document.forms[0].action="";
        
 
}

function displayForbiddenError (errorThrown){
	if(errorThrown == "Forbidden"){
		 var $errorList = $('#errorList');
   	    if ( $errorList.length){
   	    	$errorList.remove();
   	    }
   	    var onee = "<ul class='errorSummaryList' id='errorList'><li class='errorSummaryItem'><a href='#'><span class='errorSummaryLabel'>Please refresh page and access application.</span></a></li>";
   	    $('#errorSummary-0').removeClass('hide').addClass('show');
   	     $('#errorSummary-0').append(onee);
   	     $('.errorCount').text("1");  
	 }
}

function checkEmpty (variable){
	if (isNullAndUndef(variable) || variable=='') {
		return true;
	}
	return false; 
}
	 
function isNullAndUndef(variable) {
    if (variable == null || variable == undefined || typeof  variable == 'undefined') { 
       return true;
    }
    return false;
}

function greyOutPage() {
	
	$("#dialog-greyOut").dialog({
		open: function() {                         // open event handler
	        $(this)                                // the element being dialogged
	            .parent()                          // get the dialog widget element
	            .find(".ui-dialog-titlebar-close") // find the close button for this dialog
	            .hide();                           // hide it
	    },
		 resizable: false,
	        height:125,
	        width:250,
	        modal: true
	}); 
}
