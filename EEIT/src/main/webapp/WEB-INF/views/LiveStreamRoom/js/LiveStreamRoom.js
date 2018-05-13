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


//websocket 

 
//	var uploaderAccountList;
//	var notificationKey 

function send(account, liveStreamArticle){
    	var senderAccountFistWord = account.substring(0,1).charCodeAt()
    	var liveStreamSeqNo = $('.seqNo').val();

		var roomNumber = $('.roomNumber').val();

		var name = $(this).parents('div').find('.message').val();
		stompClient.send("/app/livechat/" + liveStreamSeqNo , {}, JSON.stringify({ 'liveStreamArticle':liveStreamArticle, 'account':account}));
	}
//var chatmessage = $('.chat-message').val(); 
//alert(chatmessage);
var account = $('#catch-account').val();
$(document).on('keyup','.input-group>input',function(e){

//	alert(account);
	console.log(e.keyCode);
    if(e.keyCode == 13)
    {
		if($.trim($(this).val())!=""){
//			var receiverAccount = $.trim($(this).parents('.box').find('.receiverAccount').text())
			send(account,$(this).val(),"text");
            $(this).val(" ")
		}
    }
    
});
 
//
//function addMessage(account, receiverAccount, messageArticle, messageType){
//	if(account == senderAccount){
//		if($('#' + receiverAccount +'1>.box-body').length>0){
//			if(messageType == 'sticker'){
//				$('#' + receiverAccount +'1>.box-body').append('<p class="me"><img class="stickerSend" height="75px" width="75px" src="/EEIT/getImage/sticker/'+ messageArticle +'" name="'+ messageArticle +'"></p>')
//			}else if(messageType == 'text'){
//				$('#' + receiverAccount +'1>.box-body').append('<p class="me">'+ account + ": "+ messageArticle +'</p>')
//			}
//			if($('#' + receiverAccount +'1').is('.box-close')){
//				$('#' + receiverAccount +'1').find('.box-head').addClass('box-headAlert')
//			}
//		}else if($('#' + receiverAccount +'1>.box-body').length==0){
//			
//			$('#' + receiverAccount).addClass('sidebarUserButtonAlert')
//		}
//	}else if(account != senderAccount){
//		if($('#' + account +'1>.box-body').length > 0){
//			if(messageType == 'sticker'){
//				$('#' + account +'1>.box-body').append('<p class="him"><img class="stickerSend" height="75px" width="75px" src="/EEIT/getImage/sticker/'+ messageArticle +'" name="'+ messageArticle +'"></p>')
//			}else if(messageType == 'text'){
//				$('#' + account +'1>.box-body').append('<p class="him">'+ account + ": "+ messageArticle +'</p>')
//			}
//			if($('#' + account +'1').is('.box-close')){
//				$('#' + account +'1').find('.box-head').addClass('box-headAlert')
//			}
//		}else if($('#' + account +'1>.box-body').length == 0){
//			$('#' + account).addClass('sidebarUserButtonAlert')
//		}
//	}
//	updateScroll();
//}




var liveStreamSeqNo = $('.seqNo').val();
//alert(liveStreamSeqNo);
//$('.sidebarUserButton').each(function(){
//
//})
//  stompClient.subscribe('/target/livechat/subscription/'+liveStreamSeqNo,function(messagereturn){
//      addMessage(JSON.parse(messagereturn.body).account,JSON.parse(messagereturn.body).liveStreamArticle)
//  });
console.log("asdasd"); 
console.log(stompClient); 
  stompClient.subscribe('/target/livechat/subscription/' + liveStreamSeqNo , function(messagereturn){
      addMessage(JSON.parse(messagereturn.body).account,JSON.parse(messagereturn.body).receiverAccount,JSON.parse(messagereturn.body).messageArticle,JSON.parse(messagereturn.body).messageType)
  });
  
        