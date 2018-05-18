/**
 * 
 */
$(document).ready(function() {
	var account = $('.accountForMessage').val();
	var uploaderAccountList;
	$.ajax({
		type: "GET",
		url: "/EEIT/subscriptionUploader/" + account,
		timeout: 600000,
		success: function (data) {
			uploaderAccountList = data.allSubscriptionUploader
		},
		error: function (e) {
			console.log("ERROR : ", e);
			alert(e);
		}
	});
	
	
	var socket = new SockJS('/EEIT/messageEndPoint');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame) {
    	console.log('Connected: ' + frame);
    	$.each(uploaderAccountList, function (idx,data) {
		    stompClient.subscribe('/notification/subscription/' + uploaderAccountList.account , function(notificationreturn){
	//	        addMessage(JSON.parse(notificationreturn.body).account,JSON.parse(notificationreturn.body).receiverAccount,JSON.parse(notificationreturn.body).messageArticle)
		    	alert('OK')
		    });
    	})
    });
//	function addNotification(account, receiverAccount, messageArticle){
//		if(account == senderAccount){
//			$('#' + receiverAccount +'1>.box-body').append('<p class="me">'+ account + ": "+ messageArticle +'</p>')
//			
//		}else if(account != senderAccount){
//			$('#' + account +'1>.box-body').append('<p class="him">'+ account + ": "+ messageArticle +'</p>')
//		}
//		updateScroll();
//	}
})