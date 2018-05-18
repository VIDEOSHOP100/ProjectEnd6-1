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

var flag = 0;
//增加會員聊天到聊天室窗
var colors = ['#FFFFFF','#99FFFF','#FFFFBB','#99FF33'];
function addMessage(account,liveChatArticle){

				$('.card-bodycontroller').append('<div class="chatBlock"><p class="chatrow">'+ account + ": "+ liveChatArticle +'</p></div>')
	
					if(flag !=0){
						clearInterval(timer);
					}
	var text = liveChatArticle;
	var index = parseInt(Math.random()*7);
	var screenW = window.innerWidth;
	var screenH = dm.offsetHeight;
	var max = Math.floor(screenH/40);
	var height = 10+ 40 * (parseInt(Math.random()*(max+1))-1);
	if(height>400){
		var height = 340;
	}
	var span = document.createElement('span');
	span.classList.add("movespan")
	span.style.left = screenW +'px';
	span.style.top = height + 30+'px';
	span.style.color = colors[index];
	span.innerHTML = text;
	var dmDom = $('#dm').append(span);
//	var dmDom = document.getElementById('dm');
//	dmDom.prependChild(span);
	timer= setInterval(move,35);
	flag++;
	updateScroll();
}
function move(){
//	alert('111');
	var arr=[];
	var oSpan = document.getElementsByClassName('movespan');
//	alert(oSpan.length);
	for(var i = 0; i< oSpan.length;i++){
		arr.push(oSpan[i].offsetLeft);
		arr[i] -=2
		
		oSpan[i].style.left = arr[i]+'px';
		if(arr[i] < -oSpan[i].offsetWidth) {
		$('#dm span:first').remove();
			
//	var dmDom = document.getElementById('dm');
//	dmDom.removeChild(dmDom.childNodes[0]);
	}
	}
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

