/**
 * 
 */



$(document).ready(function() {	
	
	$('.deleteBlock').click(function(){
		var thisDeleteButton = $(this) 
		var videoSeqNo = thisDeleteButton.parents('.card-body').find('input').val();
		$.ajax({
			type: "POST",
			url: "/EEIT/likeUnlikeVideos",
			data: {_method : "PUT", videoSeqNo : videoSeqNo, likeUnlikeStatus : 'none'},
			timeout: 600000,
			success: function (data) {
				thisDeleteButton.parents('.portfolio-item').remove();
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		});
	})

})