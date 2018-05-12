/**
 * 
 */

$(document).ready(function() {	
	
	$('.deleteBlock').click(function(){
		var thisDeleteButton = $(this) 
		var uploaderAccount = thisDeleteButton.parents('.media-body').find('.mt-0').text();
		$.ajax({
			type: "POST",
			url: "/EEIT/subscriptionUploader",
			data: {_method : "PUT", uploaderAccount : uploaderAccount, subscriptionUploaderStatus : 'nonSubscription'},
			timeout: 600000,
			success: function (data) {
				thisDeleteButton.parents('.media').remove()
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		});
	})

})