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
			error		: 	function() {
								$('.error',$(this)).text("Sorry I can't find you on the guest list");
							},
			success     : 	showPartnerRsvp,
			data 		: 	$(this).serialize(),
			dataType    : 	"json", 
			type		: 	"POST"
		});
		
		return false;
	});
	
	$('.partnerRsvp').live('submit', function(event) {
		$.ajax($(this).attr('action'), {
			context		: 	$(this),
			data 		: 	$(this).serialize(),
			success		: 	showMenuRsvp,
			dataType	: 	"json",
			type		: 	"POST"
		});
		
		return false;
	});
	
	$('.partnerSkip').live('click', function(ev) { 
		showMenuRsvp()
		return false;
	});
});

function showPartnerRsvp(data)
{
	$('.error',$(this)).text("");

	$('.rsvp input').attr('disabled', 'disabled');
		
	$.ajax({
		url			: "/guests/"+data.guest.id+"/partner_rsvp",
		dataType	: "html",
		success		: function(data) {
						$('#content').append(data)
					  }
	});
}

function showMenuRsvp(data)
{
	
	$('.partnerRsvp input').attr('disabled', 'disabled');
	$('.partnerRsvp button').attr('disabled', 'disabled');
	
	$.ajax({
		url			: "/guests/menu_rsvp",
		dataType	: "html",
		success		: function(data) {
						$('#content').append(data);
						
						$('.menuRsvp input.name').autocomplete({
							source: "/menu_items/find"
						});
					  }
	});
}