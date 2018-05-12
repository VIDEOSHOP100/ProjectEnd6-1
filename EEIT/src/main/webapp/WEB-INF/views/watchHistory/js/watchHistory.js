/**
 * 
 */

$(document).ready(function() {	
	
	$('.deleteBlock').click(function(){
		var thisDeleteButton = $(this) 
		var videoSeqNo = thisDeleteButton.parents('.col-md-5').find('input').val();
		$.ajax({
			type: "POST",
			url: "/EEIT/watchHistory",
			data: {_method : "PUT", videoSeqNo : videoSeqNo, watchHistoryStatus : '0'},
			timeout: 600000,
			success: function (data) {
				var parentElement = thisDeleteButton.parents('.row')
				parentElement.find('.col-md-7').remove();
				parentElement.find('.col-md-5').remove();
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		});
	})

})