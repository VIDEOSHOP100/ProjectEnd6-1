/**
 * 
 */

$(document).ready(function() {	
	var account = $('#catch-account').val();
	var bidPrice = $('.bidPrice').val();
	var productSeqNo = $('#productSeqNo').val();
	var liveStreamSeqNo = $('.seqNo').val();
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
//	var auctionSeqNo = $('#auctionSeqNo').val();
//	alert(auctionSeqNo)
$('.deleteAuction').click(function(){
		var thisDeleteButton = $(this) 
		var productSeqNo = $('#auctionSeqNo').val();
		$.ajax({
			type: "POST",
			url: "/EEIT/endAuction",
			data: {_method : "PUT", productSeqNo : productSeqNo, auctionStatus : 2},
			timeout: 600000,
			success: function (data) {
//				var parentElement = thisDeleteButton.parents('.row')
//				parentElement.find('.col-md-7').remove();
//				parentElement.find('.col-md-5').remove();
				alert("拍賣物品"+productSeqNo+"已賣給"+account);
				responsiveVoice.speak("拍賣物品"+productSeqNo+"已賣給"+account,"Chinese Female");
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		});
	})


//websocket 

 
//	var uploaderAccountList;
//	var notificationKey 

function send(account, liveChatArticle){
    	var senderAccountFistWord = account.substring(0,1).charCodeAt()
    	var liveStreamSeqNo = $('.seqNo').val();

		var roomNumber = $('.roomNumber').val();
//alert(liveChatArticle);
//alert(account);
		var name = $(this).parents('div').find('.message').val();
		stompClient.send("/app/livechat/" + liveStreamSeqNo , {}, JSON.stringify({ 'liveChatArticle':liveChatArticle, 'account':account}));
		
	}
//var chatmessage = $('.chat-message').val(); 
//alert(chatmessage);

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



 //增加會員購買商品到聊天室窗
//var productSeqNo = $('.productSeqNo').val();
function addBid(account, productSeqNo,bidPrice,auctionSeqNo){
	responsiveVoice.speak("會員"+account+"叫價"+bidPrice+"元","Chinese Female");
	$('.card-bodycontroller').append('<div class="chatBlock"><p class="bidrow">'+"會員"+ account + "叫價: "+ bidPrice +'元</p></div>')
}
//增加會員聊天到聊天室窗
function addMessage(account,liveChatArticle){

				$('.card-bodycontroller').append('<div class="chatBlock"><p class="chatrow">'+ account + ": "+ liveChatArticle +'</p></div>')

//	updateScroll();
}

function sendBid(account, productSeqNo,bidPrice){
	var senderAccountFistWord = account.substring(0,1).charCodeAt()
	var liveStreamSeqNo = $('.seqNo').val();
	var productSeqNo = $('#productSeqNo').val();
//	var roomNumber = $('.roomNumber').val();
//alert(liveChatArticle);
//alert(account);
//	var name = $(this).parents('div').find('.message').val();
	stompClient.send("/app/Bid/" + productSeqNo , {}, JSON.stringify({ 'productSeqNo':productSeqNo, 'account':account, 'bidPrice':bidPrice}));
	
}   
//叫價TEXT
$(document).on('keyup','.input-Bid>input',function(e){
	var productSeqNo = $('#productSeqNo').val();
//	alert(account);
	console.log(e.keyCode);
    if(e.keyCode == 13)
    {
		if($.trim($(this).val())!=""){
//			var receiverAccount = $.trim($(this).parents('.box').find('.receiverAccount').text())
			sendBid(account,productSeqNo,$(this).val());
            $(this).val(" ")
		}
    }
     
});







//alert(productSeqNo);
//alert(liveStreamSeqNo);
//$('.sidebarUserButton').each(function(){
//
//})
//  stompClient.subscribe('/target/livechat/subscription/'+liveStreamSeqNo,function(messagereturn){
//      addMessage(JSON.parse(messagereturn.body).account,JSON.parse(messagereturn.body).liveStreamArticle)
//  });

//console.log("asdasd");
//console.log(stompClient); 
//聊天室開始----------------------------------
stompClient.connect({}, function(frame) {
    console.log('Connected: ' + frame);
    stompClient.subscribe('/target/livechat/subscription/' + liveStreamSeqNo , function(messagereturn){
    	addMessage(JSON.parse(messagereturn.body).account,JSON.parse(messagereturn.body).liveChatArticle)
    	updateScroll()
    });
//聊天室結束----------------------------------
    
//取商品開始----------------------------------
//    var productSeqNo = $('#productSeqNo').val();
    stompClient.subscribe('/target/Bid/subscription/' + productSeqNo , function(bidreturn){
    	
        	addBid(JSON.parse(bidreturn.body).account,JSON.parse(bidreturn.body).productSeqNo,JSON.parse(bidreturn.body).bidPrice)

       });      
//取商品結束--------------------------------------- 
});
function updateScroll(){
	var element = $('.card-bodycontroller')
	var scrollHeight = element.prop("scrollHeight");
	element.scrollTop(scrollHeight,200);

}
//檢舉開始-----------------------------------------
$('#reportSubmit').click(function(){
	
	var reportTitle = $('#reportTitle').val();
	var reportContent = $('#reportContent').val();
	var reportType = $('#reportType').val();
	var accountTo = $('.uploadaccount').text();
	$.ajax({
		type:"POST",
		url:"/EEIT/LiveStreamReport",
		data:{accountTo:accountTo , reportTitle:reportTitle , reportContent:reportContent,reportType:reportType},
		timeout: 600000,
		success:function(){
//			$('#memberReportButton').attr("disabled","disabled").text("已檢舉");
			$('#cancel').trigger("click");
			alert("檢舉直播主:"+accountTo+"成功")
		},
		error: function (e) {
			console.log("ERROR : ", e);
			alert(e);
		}
	})
	
})
//檢舉結束------------------------------------------


$(document).on('click','.chatrow',function(){
//    $('.voiceSubmit').click(function(){
//    	alert($(this).text()) 
//	alert($(this).text().split(":",2)[1])
        responsiveVoice.speak($(this).text().split(":",2)[1],"Chinese Female")

    });




})

