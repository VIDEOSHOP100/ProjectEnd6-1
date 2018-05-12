/**
 * 
 */

$(document).ready(function() {	
	
	$('.deleteBlock').click(function(){
		var thisDeleteButton = $(this) 
		var liveStreamSeqNo = thisDeleteButton.val();
		$.ajax({
			type: "POST",
			url: "/EEIT/endLiveStream",
			data: {_method : "PUT", liveStreamSeqNo : liveStreamSeqNo, liveStatus : '0'},
			timeout: 600000,
			success: function (data) {
//				var parentElement = thisDeleteButton.parents('.row')
//				parentElement.find('.col-md-7').remove();
//				parentElement.find('.col-md-5').remove();
				alert("直播已關閉 跳轉回首頁");
				window.location.href="http://localhost:8080/EEIT/";
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		});
	})

})
//liveStreamHistorySeqNo : liveStreamHistorySeqNo,