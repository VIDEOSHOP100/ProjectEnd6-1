//$(document).ready(function() {
//
//	$(document).on("click", ".myMessageSeqNo", function() {
//		var myMessageSeqNo = $('.myMessageSeqNo').val();
//		$.ajax({
//
//			type : "GET",
//			url : "/EEIT/getMyMessage/" + myMessageSeqNo,
//
//			success : function(data) {
//
//				var mail = data.myMessage;
//
//				$('#dialog-message').attr("title", mail.myMessageTitle);
//				$('#myMessageFrom').append(mail.myMessageFrom);
//				$('#myMessageContent').text(mail.myMessageContent);
//
//				$('#dialog-message').dialog({
//
//					modal : true
//
//				})
//
//			},
//			error : function(e) {
//				console.log("ERROR : ", e);
//				alert(e);
//			}
//
//		})
//
//	});
//
//})