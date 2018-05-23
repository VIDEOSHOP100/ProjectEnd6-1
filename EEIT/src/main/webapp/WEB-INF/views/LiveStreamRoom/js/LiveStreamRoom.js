/**
 * 
 */

$(document).ready(function() {	
	//隱藏左下訊息
	$('.hahaha').hide();
	//進入畫面隱藏控制單
	 $('.editform').hide();
	//聊天框拖曳-------------
	var grid = $(".draggable");
	grid.draggable({cursor: "progress"});
	//聊天框拖曳------------
//	$('#JQellipsis').readmore({
//		  speed: 75,
//		  maxHeight: 500
//	});
//	grid.resizable({
//		 ghost: true,
//	 animate: true
//	});
	
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
//				alert(data)
//				var statusdata = data.status;
//				var account = statusdata.account;
//				var productSeqNo = statusdata.productSeqNo;
				
//				var parentElement = thisDeleteButton.parents('.row')
//				parentElement.find('.col-md-7').remove();
//				parentElement.find('.col-md-5').remove();
				
				
//				alert("拍賣物品"+productSeqNo+"已賣給"+account);
//				responsiveVoice.speak("拍賣物品"+productSeqNo+"已賣給"+account,"Chinese Female");
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


//進入聊天室---------------------------------------
window.onload=sendView;
function sendView(account, liveStreamView){
	var account = $('#catch-account').val();
//	var senderAccountFistWord = account.substring(0,1).charCodeAt()
	var liveStreamSeqNo = $('.seqNo').val();
	var liveStreamView = $('#showView').text();
//	alert(liveStreamView)
//	alert(account)
	var roomNumber = $('.roomNumber').val();
//alert(liveChatArticle);
//alert(account);
	var name = $(this).parents('div').find('.message').val();
	stompClient.send("/app/ShowHistory/" + liveStreamSeqNo , {}, JSON.stringify({ 'liveStreamView':liveStreamView, 'account':account}));
	
}
//進入聊天室--------------------------------------
//出聊天室--------------------------------------
window.onbeforeunload=senEndView;
function senEndView(account, liveStreamView){
	var account = $('#catch-account').val();
//	var senderAccountFistWord = account.substring(0,1).charCodeAt()
	var liveStreamSeqNo = $('.seqNo').val();
	var liveStreamView = $('#showView').text();
//	alert(liveStreamView)
//	alert(account)
	var roomNumber = $('.roomNumber').val();
//alert(liveChatArticle);
//alert(account);
	var name = $(this).parents('div').find('.message').val();
	stompClient.send("/app/ShowEndHistory/" + liveStreamSeqNo , {}, JSON.stringify({ 'liveStreamView':liveStreamView, 'account':account}));
	
}
//出聊天室----------------------------------------
window.onbeforeunload=senEndView;
function addEndView(account, liveStreamView ,allLiveStreamView){
//	var liveStreamView = $('#showView').text();
//alert(liveStreamView)
	
	$('#showViewAfter+div').remove();
$('#showViewAfter').after('<div><p><i class="fas fa-user"></i>&nbsp;&nbsp;目前觀看人數：'+(liveStreamView)--+'&nbsp;&nbsp;&nbsp;<i class="fas fa-users"></i>&nbsp;&nbsp;總觀看人次：'+(allLiveStreamView)+'</p></div>') 
}

function addView(account, liveStreamView,allLiveStreamView){
//	var liveStreamView = $('#showView').text();
//alert(liveStreamView)
	
	$('#showViewAfter+div').remove();
$('#showViewAfter').after('<div><p><i class="fas fa-user"></i>&nbsp;&nbsp;目前觀看人數：'+(liveStreamView)+++'&nbsp;&nbsp;&nbsp;<i class="fas fa-users"></i>&nbsp;&nbsp;總觀看人次：'+(allLiveStreamView)+++'</p></div>') 
}


//叫價結束開始----------------------------------------
function SendEndBid(account, productSeqNo){
	var senderAccountFistWord = account.substring(0,1).charCodeAt()
	var liveStreamSeqNo = $('.seqNo').val();
	var productSeqNo = $('#productSeqNo').val();

	stompClient.send("/app/endAuction/" + productSeqNo , {}, JSON.stringify({ 'productSeqNo':productSeqNo, 'account':account}));
	
}   
$(document).on('click','.deleteAuction',function(e){
	SendEndBid(account, productSeqNo);
});
//叫價結束END----------------------------------------
//拍賣結束出現在中間-------------------------------------
function addAuctionEnd(account, productSeqNo,proName){
	
	responsiveVoice.speak("拍賣物品"+proName+"已賣給"+account,"Chinese Female");
//	append('<div class="relative2"><p class="hahaha">'+"拍賣物品"+ productSeqNo + "已賣給 "+ account +'</p></div>')
$('.hahaha').html("拍賣物品："+"<br><br><p style='color:red'>["+proName+"]</p>" + "已賣給： <p style='color:red'>"+ account+"</p>");
$('.hahaha').show();
	$('.hahaha').dialog({
		autoOpen:false,
		show:{
			effect: "fold",
			duration:500
		},
		hide:{
			effect:"fold",
			duration:500
		}
	})
	$('.hahaha').dialog({
		height:500,
		width:400,
		modal:true,
		title: account,
		buttons:{
			Ok:function(){
				$(this).dialog("close");
			}
		}
	})
	$('.hahaha').dialog("open");
	$('.proitemcontroller').remove();
}

//--------------------------------------------------
 //增加會員購買商品到聊天室窗----------------------------------------------------
//var productSeqNo = $('.productSeqNo').val();
function addBid(account, productSeqNo,bidPrice,auctionSeqNo){
	responsiveVoice.speak("會員"+account+"叫價"+bidPrice+"元","Chinese Female");
	$('.card-bodycontroller').append('<div class="chatBlock"><p class="bidrow">'+"會員"+ account + "叫價: "+ bidPrice +'元</p></div>')
}

var flag = 0;
//增加會員聊天到聊天室窗----------------------------------------------------

//-------------------------------------彈幕開始----------------------------------------
var colors = ['#FFFFFF','#99FFFF','#FFFFBB','#99FF33'];
function addMessage(account,liveChatArticle){

				$('.card-bodycontroller').append('<div class="chatBlock"><p class="chatrow">'+ account + ": "+ liveChatArticle +'</p></div>')
	
					if(flag !=0){
						clearInterval(timer);
					}
	var text = liveChatArticle;
	var index = parseInt(Math.random()*7);
	var screenW = 800;
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


//---------------------------------------彈幕結束-----------------------------------------------------------------
//--------------------------------------------------------------------------------------------------------

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
//叫價TEXT-------------------------------------------------------------------------------------------------------
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
   
//叫價結束訂閱---------------------------
    stompClient.subscribe('/target/endAuction/subscription/' + productSeqNo , function(auctreturn){
//    	var account = $('#catch-account').val();
    	addAuctionEnd(JSON.parse(auctreturn.body).account,JSON.parse(auctreturn.body).productSeqNo,JSON.parse(auctreturn.body).proName)
    	
    });
//叫價結束訂閱----------------------------------------
    
    
//觀看人數開始----------------------------------
    stompClient.subscribe('/target/ShowHistory/subscription/' + liveStreamSeqNo , function(historyreturn){
//    	var account = $('#catch-account').val();
    	addView(JSON.parse(historyreturn.body).account,JSON.parse(historyreturn.body).liveStreamView,JSON.parse(historyreturn.body).allLiveStreamView)
    	
    });
//觀看人數開始----------------------------------   
    
    
    
//觀看人數結束----------------------------------  
    stompClient.subscribe('/target/ShowEndHistory/subscription/' + liveStreamSeqNo , function(historyreturn){
//    	var account = $('#catch-account').val();
    	addEndView(JSON.parse(historyreturn.body).account,JSON.parse(historyreturn.body).liveStreamView,JSON.parse(historyreturn.body).allLiveStreamView)
    	
    });
    
//觀看人數結束----------------------------------   
    
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
//$(document).on('click','.ccc',function(){
//
//	  $('.ccc').balloon({ html: true,
//		  contents: '<h4 class="card-title JQellipsisTitle">${product.proName}</h4>'
//			    +'<input type="text" size="40">'
//			    +'<input type="submit" value="Search">'});
//	});

//時間選擇器 
	 $(function () {
        $('#aucBegin').datetimepicker({format: 'yyyy-mm-dd hh:ii:ss'});
    });
	 $(function () {
        $('#aucEnd').datetimepicker({format: 'yyyy-mm-dd hh:ii:ss'});
    });
	 
//動態標題 HOVER
	 
	 $(".mt-4").hover(
			  function () {
			    $(this).addClass('animated infinite bounce');
			  }, 
			  function () {
			    $(this).removeClass('animated infinite bounce');
			  }
			  );
//開關插劍	
	 $("[name='my-checkbox']").bootstrapSwitch();
	 
	 
	 $('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', function(event, state) {
		 
		 if(state==true){
//			 alert(true)
			 //顯示物品並隱藏控制列
			 $('.onsaleitems').show();
			 $('.editform').hide();
			 
			
		 }else{
			 //顯示控制列並隱藏物品
			 $('.onsaleitems').hide();
			 $('.editform').show();
		 }
		  console.log(this); // DOM element
		  console.log(event); // jQuery event
		  console.log(state); // true | false
		});
	 
	 
//網格位移sexmove
	 
	 $(function() {
		    $( "#sexmove" ).sortable();
		    $( "#sexmove" ).disableSelection();
		  });
	 
})

