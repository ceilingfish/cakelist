// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function()
{
	$('.guestlist input.name').autocomplete({
		source: "/guests/find"
	});

	$('.rsvp').submit(function(event) {

		$.ajax("/guests/rsvp", {
			context		: 	$(this),
			success 	: 	confirmRSVP,
			error		: 	function() {
								$('.error',$(this)).text("Sorry I can't find you on the guest list");
							},
			data 		: 	$(this).serialize(),
			type		: 	"POST"
		});
		
		return false;
	});
	
	$('.partnerRsvp').live('submit', function(event) {
		$.ajax("/guests/rsvp", {
			context		: 	$(this),
			success 	: 	confirmPartnerRSVP,
			data 		: 	$(this).serialize(),
			type		: 	"POST"
		});
		
		return false;
	});
	
	$('.partnerCreate').live('submit', function(event) {
		
		$.ajax($(this).attr('action'), {
			context		: 	$(this),
			success 	: 	confirmPartnerRSVP,
			data 		: 	$(this).serialize(),
			type		: 	"POST"
		});
		
		return false;
	});
});

function confirmPartnerRSVP(data) {
	
	$(this).replaceWith('<p class="partner">Great! we\'ll see you both on the 16th of June!</p>');
}

function confirmRSVP(data) {
	$('.error',$(this)).text("");
	$.ajax({
		url			: "/guests/confirm_rsvp",
		data		: data,
		dataType	: "html",
		success		: function(data) {
						$.fancybox({
							content: data,
							autoDimensions: false
						});
					  }
	});
}
