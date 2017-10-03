var docwidth,bodypadding;

$(document).ready(function(e) {
	Respond();
	PageFunction();
});

$(window).resize(function(e) {
	Respond();
});

function PageFunction(){	
	$('[data-toggle="tooltip"]').tooltip({
    	'placement': 'top'
	});
	$(".tr_href").click(function() {
		window.document.location = $(this).attr("href");
	});	
	$(".navbar-toggle").click( function(e) {
		a = $(this).siblings(".navbar-toggle");
		if(a.hasClass("collapsed")===false){
			a.addClass("collapsed")
			a.attr("aria-expanded","false");
			var b = a.attr("data-target");
			$(b).removeClass("in")

		}
	});	
}

function Respond(){
	$("body").css("overflow-y","hidden")
	docwidth = parseFloat($("body").width())	
	//All Functions
	$(".panel-heading").addClass("open");
	$("body").css("overflow-y","scroll")	
	var overlay = $(".overlaybox").height()-84
	var overlaybuttons = $("#overlaybuttonwrapper").height()
	$(".overlaytext").height(overlay-overlaybuttons)
}

function HeaderHeight(){
	var a = parseFloat($("#fixedheader").css("height"))
	return a
}