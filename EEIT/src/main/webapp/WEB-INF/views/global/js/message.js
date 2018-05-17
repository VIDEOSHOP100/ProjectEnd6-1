/**
 * 
 */



//以下聊天室-------------------------------------------------------------------	
	


$(document).ready(function() {
	var chatRoomAlert = [];
	var chatRoomName = [];
	var senderAccount = $('.accountForMessage').val()
	var count;
    setTimeout(function() {
        $("#insert-messageImage-form").removeClass('hideForm')
        $("#insert-messageFile-form").removeClass('hideForm')
        $("#insert-messageVideo-form").removeClass('hideForm')
     }, 2000);
    $('.sidebarUserButton').click(function () {
        var right = 220;
        id = $(this).attr('id');
        right = $('div.box').length * 320 + right;
        if ($('div[id="' + id + '1"]').length == 0) {
            if ($('div.box').length == 5) {
                right = 220
                var name = $(this).attr('name');
                $('div[name=' + right + ']').remove()
                $('.chatplace').prepend($('<div id = "' + id + '1"><div class="box-head box-headNoneChangeColor"><span class="receiverAccount"> ' + id + '</span><span><i class="fas fa-exclamation-circle alertMessageNumber"></i><span class="unreadNumber">0</span></span><button><i class="fas fa-times"></i></button></div><div class="box-body"></div><div class="box-message"><textarea rows="4" cols="50"></textarea><div class="messagePlus popup"><div class="myPopup">貼圖</div><button class="btn imageButton"><i class="fas fa-image"></i></button><button class="btn stickerButton"><i class="far fa-smile"></i></button><button class="btn fileButton"><i class="far fa-file-alt"></i></button><button class="btn videoButton"><i class="fas fa-video"></i></button></div></div></div>').addClass('box box-open').css({ "right": right + "px" }).attr('name', right))
                right = right + 320;
                count++;
                $.ajax({
        			type: "GET",
        			url: "/EEIT/Sticker",
        			timeout: 600000,
        			success: function (datareturn) {
        				alert("aaaa")
        				var docFrag = $(document.createDocumentFragment());
        				$.each(datareturn.stickerBeanList, function (idx,data) {
        					var cell1 = $('<img class="stickerSend" height="75px" width="75px" src=/EEIT/getImage/sticker/'+ data.stickerSeqNo +' name="'+ data.stickerSeqNo +'"> ')
        					
        					docFrag.append(cell1);
        				})
        				$('#' + id + '1').find('.myPopup').append(docFrag);
        			},
        			error: function (e) {
        				console.log("ERROR : ", e);
        				alert(e);
        			}
        		})
            } else {
                var name = $(this).attr('name');
                $('div[name=' + right + ']').remove()
                $('.chatplace').append($('<div id = "' + id + '1"><div class="box-head box-headNoneChangeColor"><span class="receiverAccount"> ' + id + '</span><span><i class="fas fa-exclamation-circle alertMessageNumber"></i><span class="unreadNumber">0</span></span><button><i class="fas fa-times"></i></button></div><div class="box-body"></div><div class="box-message"><textarea rows="4" cols="50"></textarea><div class="messagePlus popup"><div class="myPopup"><p>貼圖</p></div><button class="btn imageButton"><i class="fas fa-image"></i></button><button class="btn stickerButton"><i class="far fa-smile"></i></button><button class="btn fileButton"><i class="far fa-file-alt"></i></button><button class="btn videoButton"><i class="fas fa-video"></i></button></div></div></div>').addClass('box box-open').css({ "right": right + "px" }).attr('name', right))
                right = right + 320;
                count++;
                $.ajax({
        			type: "GET",
        			url: "/EEIT/Sticker",
        			timeout: 600000,
        			success: function (datareturn) {
        				var docFrag = $(document.createDocumentFragment());
        				$.each(datareturn.stickerBeanList, function (idx,data) {
        					var cell1 = $('<img class="stickerSend" height="75px" width="75px" src=/EEIT/getImage/sticker/'+ data.stickerSeqNo +' name="'+ data.stickerSeqNo +'"> ')
        					
        					docFrag.append(cell1);
        				})
        				$('#' + id + '1').find('.myPopup').append(docFrag);
        			},
        			error: function (e) {
        				console.log("ERROR : ", e);
        				alert(e);
        			}
        		})
            }
            selectAllMessage(id);
        }
        $(this).removeClass('sidebarUserButtonAlert').removeClass('sidebarUserButtonChangeColor').addClass('sidebarUserButtonNone')
    })
    $(document).on('click', '.box-head>button', function () {
        var number = ($(this).parent('div').parent('div').attr('name') - 220) / 320
        $(this).parent('div').parent('div').remove();
        disp($(".box").toArray(), number);
    })
    
    $(document).on('click', '.box-head', function () {
		if($(this).parent('div').children('.box-body').css("display") != "none"){
			$(this).parent('div').children('.box-body').css({"display":"none"});
			$(this).parent('div').children('.box-message').css({"display":"none"});
			$(this).parent('div').css({"height":"30px"});
			$(this).parents('.box').removeClass('box-open').addClass('box-close')
		}else{
			$(this).parent('div').children('.box-body').css({"display":"block"});
			$(this).parent('div').children('.box-message').css({"display":"block"});
			$(this).parent('div').css({"height":"285px"});
			for(var i = 0; i < 5 ; i ++ ){
				console.log("before : " + chatRoomName[i])
				console.log("before : " + chatRoomAlert[i])
				if(chatRoomName[i] == $(this).children('span:first-child').text().trim()){
					clearInterval(chatRoomAlert[i])
					chatRoomAlert[i] = undefined;
        			chatRoomName[i] = undefined;
        			break;
				}
				console.log("after : " + chatRoomName[i])
				console.log("after : " + chatRoomAlert[i])
			}
			$(this).find('.alertMessageNumber').css({'display':'none'})
			$(this).find('.unreadNumber').css({'display':'none'})
			$(this).find('.unreadNumber').text('0');
			$(this).parent('div').children('.box-head').addClass('box-headNoneChangeColor');
			updateScroll();
			$(this).parents('.box').removeClass('box-close').addClass('box-open')
			$(this).removeClass('box-headAlert box-headChangeColor').addClass('box-headNoneChangeColor');
		}
    })
    $(document).on('keyup','.box-message>textarea',function(e){
        if(e.keyCode == 13)
        {
			if($.trim($(this).val())!=""){
				var receiverAccount = $.trim($(this).parents('.box').find('.receiverAccount').text())
				send(senderAccount,receiverAccount,$(this).val(),"text");
                $(this).val(" ")
			}
        }
        
    });

    function disp(divs, number) {
        for (var i = number; i < divs.length; i++) {
            console.log("before" + $(divs[i]).attr("name"))
            var boxname = $(divs[i]).attr("name");
            $(divs[i]).attr("name", parseInt(boxname) - 320)

            $(divs[i]).css({ 'right': parseInt(boxname) - 320 })
            console.log("after" + $(divs[i]).attr("name"))
        }
    }		
	function selectAllMessage(receiverAccount){
		$.ajax({
			type: "GET",
			url: "/EEIT/messageSystem",
			data: { 'receiverAccount': receiverAccount},
			timeout: 600000,
			success: function (datareturn) {
				var docFrag = $(document.createDocumentFragment());
				$.each(datareturn.messageBeanList, function (idx,data) {
					var cell1;
					var commentTime= new Date(data.messageDate)
					var time;
					time =  commentTime.getFullYear()
					             + '-' + ('0' + (commentTime.getMonth()+1)).slice(-2)
					             + '-' + ('0' + commentTime.getDate()).slice(-2)
					             + " " + ('0'  + commentTime.getHours()).slice(-2)+':'
					             + ('0'  + commentTime.getMinutes()).slice(-2)+':'
					             + ('0' + commentTime.getSeconds()).slice(-2);
					if(data.account == senderAccount){
						if(data.messageType == 'text'){
							cell1 = $('<p class="messageTimeMe">'+ time.substring(0, 19)+'</p><p class="me">' + data.account + ": " + data.messageArticle + '</p>')
						}else if(data.messageType == 'sticker'){
							cell1 = $('<p class="messageTimeMe">'+ time.substring(0, 19)+'</p><p class="me">' + '<img height="75px" width="75px" src="/EEIT/getImage/sticker/'+ data.messageArticle +'" name="'+ data.messageArticle +'">')
						}else if(data.messageType == 'image'){
							cell1 = $('<p class="messageTimeMe">'+ time.substring(0, 19)+'</p><p class="me">' + '<i class="fas fa-images"></i><a class="messageFile" href="/EEIT/getFile/messageImage/'+ data.messageArticle + '"><img height="150px" width="120px" src="/EEIT/getImage/messageImage/'+ data.messageArticle +'" name="'+ data.messageArticle +'"></a>')
						}else if(data.messageType == 'file'){
							var key = data.messageArticle.indexOf(',')
							var seqNo = data.messageArticle.substring(0, key)
							var fileName = data.messageArticle.substring(key + 1)
							cell1 = $('<p class="messageTimeMe">'+ time.substring(0, 19)+'</p><p class="me">' + '<a class="messageFile" href="/EEIT/getFile/messageFile/'+ seqNo +'" name="'+ seqNo +'"><i class="far fa-file"></i>'+ fileName +'</a></p>')
						}else if(data.messageType == 'video'){
							cell1 = $('<p class="messageTimeMe">'+ time.substring(0, 19)+'</p><p class="me">' + '<video controls="controls" class="messageVideo" height="150px" width="200px" src="/EEIT/getVideo/messageVideo/'+ data.messageArticle +'" name="'+ data.messageArticle +'">')
						}
					}else if(data.account == receiverAccount){
						if(data.messageType == 'text'){
							cell1 = $('<p class="messageTimeHim">'+ time.substring(0, 19)+'</p><p class="him">'+ data.account + ": " + data.messageArticle + '</p>')
						}else if(data.messageType == 'sticker'){
							cell1 = $('<p class="messageTimeHim">'+ time.substring(0, 19)+'</p><p class="him">' + '<img  height="75px" width="75px" src="/EEIT/getImage/sticker/'+ data.messageArticle +'" name="'+ data.messageArticle +'">')
						}else if(data.messageType == 'image'){
							cell1 = $('<p class="messageTimeHim">'+ time.substring(0, 19)+'</p><p class="him">' + '<i class="fas fa-images"></i><a class="messageFile" href="/EEIT/getFile/messageImage/'+ data.messageArticle + '"><img height="150px" width="120px" src="/EEIT/getImage/messageImage/'+ data.messageArticle +'" name="'+ data.messageArticle +'"></a>')
						}else if(data.messageType == 'file'){
							var key = data.messageArticle.indexOf(',')
							var seqNo = data.messageArticle.substring(0, key)
							var fileName = data.messageArticle.substring(key + 1)
							cell1 = $('<p class="messageTimeHim">'+ time.substring(0, 19)+'</p><p class="him">' + '<a class="messageFile" href="/EEIT/getFile/messageFile/'+ seqNo +'" name="'+ seqNo +'"><i class="far fa-file"></i>'+ fileName +'</a></p>')
						}else if(data.messageType == 'video'){
							cell1 = $('<p class="messageTimeHim">'+ time.substring(0, 19)+'</p><p class="him">' + '<video controls="controls" class="messageVideo" height="150px" width="200px" src="/EEIT/getVideo/messageVideo/'+ data.messageArticle +'" name="'+ data.messageArticle +'">')
						}
					}
					docFrag.append(cell1);
				})
				$('#'+receiverAccount+'1').find('.box-body').append(docFrag);
				updateScroll()
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		});
	}
	//websocket 
	var uploaderAccountList;
	var notificationKey 
	var socket = new SockJS('/EEIT/endPoint');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function(frame) {
    	var roomNumber = $('.roomNumber').val();
        console.log('Connected: ' + frame);
        $('.sidebarUserButton').each(function(){
        	var receiverAccount = $(this).attr('id');
        	var senderAccountFistWord = senderAccount.substring(0,1).charCodeAt()
        	var receiverAccountFistWord = receiverAccount.substring(0,1).charCodeAt()
        	var firstAccount;
            var secondAccount; 
        	if(senderAccountFistWord > receiverAccountFistWord ){
        		firstAccount = senderAccount
                secondAccount = receiverAccount
        	}else if(senderAccountFistWord < receiverAccountFistWord){
        		firstAccount = receiverAccount
        		secondAccount = senderAccount
        	}
	        stompClient.subscribe('/target/message/subscription/' + firstAccount + "/" + secondAccount , function(messagereturn){
	            addMessage(JSON.parse(messagereturn.body).account,JSON.parse(messagereturn.body).receiverAccount,JSON.parse(messagereturn.body).messageArticle,JSON.parse(messagereturn.body).messageType)
	        });
        })

        $.ajax({
    		type: "GET",
    		url: "/EEIT/subscriptionUploader/JSON/" + senderAccount,
    		timeout: 600000,
    		success: function (data) {
    			uploaderAccountList = data.allSubscriptionUploaderBeanList
    			$.each(uploaderAccountList, function (idx,data) {
    			    stompClient.subscribe('/target/notification/subscription/' + $.trim(data.account) , function(notificationreturn){
    			    	var notificationAccountreturn = JSON.parse(notificationreturn.body).account;
    			    	var notificationArticlereturn = JSON.parse(notificationreturn.body).notificationArticle;
    			    	var notificationDatereturn = JSON.parse(notificationreturn.body).notificationDate;
    			    	var notificationTypereturn = JSON.parse(notificationreturn.body).notificationType;
    			    	var notificationEventPKreturn = JSON.parse(notificationreturn.body).eventPK;
    			    	var uploadDate= new Date(notificationDatereturn)
    					var MyDateString;
    					MyDateString =  uploadDate.getFullYear()
    					             + '-' + ('0' + (uploadDate.getMonth()+1)).slice(-2)
    					             + '-' + ('0' + uploadDate.getDate()).slice(-2)
    			    	$('.notification-dropdown-menu').prepend($('<a class="dropdown-item notificationItemLink" href="/EEIT/'+ notificationTypereturn +'/'+ notificationEventPKreturn +'">'+
																			'<div class="notificationItem notificationItemAlert">'+
																			'<img class="notificationItemImage" height="70px" width="30px" src="/EEIT/getImage/member/'+ notificationAccountreturn +'">'+
																			'<div class="notificationItemInner">'+
																				'<p class="notificationItemAccount">'+ notificationAccountreturn +'</p>'+
																				'<p class="notificationItemArticle" title="'+ notificationArticlereturn +'">'+ notificationArticlereturn +'</p>'+
																				'<p class="notificationItemTime">'+ MyDateString +'</p>'+
																			'</div>'+
																		'</div>'+
																	'</a>'))
    			    	if(!notificationKey){
    			    		notificationKey = setInterval(function(){ 
        			    		if($('.notification').is('.notificationAlert')){
        			    			$('.notification').addClass('notificationNone').removeClass('notificationAlert')
        			    		}else if($('.notification').is('.notificationNone')){
        			    			$('.notification').addClass('notificationAlert').removeClass('notificationNone')
        			    		}
        			    	}, 500);
    			    	}
    			    	$('.emptyNotification').remove();
    			    });
    			})
    		},
    		error: function (e) {
    			console.log("ERROR : ", e);
    			alert(e);
    		}
    	});
    });
    
    $('.notificatiolink').click(function(){
    	clearInterval(notificationKey);
    	$('.notification').addClass('notificationNone').removeClass('notificationAlert')
    })
    
    
    function send(senderAccount, receiverAccount, messageArticle, messageType){
    	var senderAccountFistWord = senderAccount.substring(0,1).charCodeAt()
    	var receiverAccountFistWord = receiverAccount.substring(0,1).charCodeAt()
    	var firstAccount;
        var secondAccount; 
    	if(senderAccountFistWord > receiverAccountFistWord ){
    		firstAccount = senderAccount
            secondAccount = receiverAccount
    	}else if(senderAccountFistWord < receiverAccountFistWord){
    		firstAccount = receiverAccount
    		secondAccount = senderAccount
    	}
		var roomNumber = $('.roomNumber').val();
		var name = $(this).parents('div').find('.message').val();
		stompClient.send("/app/messageSystem/" + firstAccount + "/" + secondAccount , {}, JSON.stringify({ 'messageArticle':messageArticle, 'account':senderAccount, 'receiverAccount': receiverAccount, "messageType" : messageType}));
	}
	
	function addMessage(account, receiverAccount, messageArticle, messageType){
		if(account == senderAccount){
			if($('#' + receiverAccount +'1>.box-body').length>0){
				if(messageType == 'sticker'){
					$('#' + receiverAccount +'1>.box-body').append('<p class="me"><img height="75px" width="75px" src="/EEIT/getImage/sticker/'+ messageArticle +'" name="'+ messageArticle +'"></p>')
				}else if(messageType == 'text'){
					$('#' + receiverAccount +'1>.box-body').append('<p class="me">'+ account + ": "+ messageArticle +'</p>')
				}else if(messageType == 'image'){
					$('#' + receiverAccount +'1>.box-body').append('<p class="me"><i class="fas fa-images"></i><a class="messageFile" href="/EEIT/getFile/messageImage/'+ messageArticle + '"><img height="150px" width="120px" src="/EEIT/getImage/messageImage/'+ messageArticle +'" name="'+ messageArticle +'"></a></p>')
				}else if(messageType == 'file'){
					var key = messageArticle.indexOf(',')
					var seqNo = messageArticle.substring(0, key)
					var fileName = messageArticle.substring(key+1)
					$('#' + receiverAccount +'1>.box-body').append('<p class="me"><a class="messageFile" href="/EEIT/getFile/messageFile/'+ seqNo +'" name="'+ seqNo +'"><i class="far fa-file"></i>'+ fileName +'</a></p>')
				}else if(messageType == 'video'){
					$('#' + receiverAccount +'1>.box-body').append('<p class="me"><video controls="controls" height="150px" width="200px" class="messageVideo" src="/EEIT/getVideo/messageVideo/'+ messageArticle + '"></p>')
				}
				
				
				
				if($('#' + receiverAccount +'1').is('.box-close')){
					$('#' + receiverAccount +'1').find('.box-head').addClass('box-headAlert')
				}
			}else if($('#' + receiverAccount +'1>.box-body').length==0){
				
				$('#' + receiverAccount).addClass('sidebarUserButtonAlert')
			}
		}else if(account != senderAccount){
			if($('#' + account +'1>.box-body').length > 0){
				if(messageType == 'sticker'){
					$('#' + account +'1>.box-body').append('<p class="him"><img height="75px" width="75px" src="/EEIT/getImage/sticker/'+ messageArticle +'" name="'+ messageArticle +'"></p>')
				}else if(messageType == 'text'){
					$('#' + account +'1>.box-body').append('<p class="him">'+ account + ": "+ messageArticle +'</p>')
				}else if(messageType == 'image'){
					$('#' + account +'1>.box-body').append('<p class="him"><i class="fas fa-images"></i><a class="messageFile" href="/EEIT/getFile/messageImage/'+ messageArticle + '"><img height="150px" width="120px" src="/EEIT/getImage/messageImage/'+ messageArticle +'" name="'+ messageArticle +'"></a></p>')
				}else if(messageType == 'file'){
					var key = messageArticle.indexOf(',')
					var seqNo = messageArticle.substring(0, key)
					var fileName = messageArticle.substring(key+1)
					$('#' + account +'1>.box-body').append('<p class="him"><a class="messageFile" href="/EEIT/getFile/messageFile/'+ seqNo +'" name="'+ seqNo +'"><i class="far fa-file"></i>'+ fileName +'</a></p>')
				}else if(messageType == 'video'){
					$('#' + account +'1>.box-body').append('<p class="him"><video controls="controls" height="150px" width="200px" class="messageVideo" src="/EEIT/getVideo/messageVideo/'+ messageArticle + '"></p>')
				}
				if($('#' + account +'1').is('.box-close')){
					$('#' + account +'1').find('.box-head').addClass('box-headAlert')
				}
			}else if($('#' + account +'1>.box-body').length == 0){
				$('#' + account).addClass('sidebarUserButtonAlert')
			}
		}
		updateScroll();
	}
	
	var sidebarUserButtonChangeColor = setInterval(function(){ 
		$('.sidebarUserButtonAlert').each(function(){
			var thisButton = $(this);
			if(!thisButton.is('.sidebarUserButtonChangeColor')){
				thisButton.addClass('sidebarUserButtonChangeColor').removeClass('sidebarUserButtonNone')
			} else if(thisButton.is('.sidebarUserButtonChangeColor')){
				thisButton.removeClass('sidebarUserButtonChangeColor').addClass('sidebarUserButtonNone')
			}
			
		})
	}, 500);
	var boxheadChangeColor = setInterval(function(){ 
		$('.box-headAlert').each(function(){
			var thisButton = $(this);
			if(!thisButton.is('.box-headChangeColor')){
				thisButton.addClass('box-headChangeColor').removeClass('box-headNoneChangeColor')
			} else if(thisButton.is('.box-headChangeColor')){
				thisButton.removeClass('box-headChangeColor').addClass('box-headNoneChangeColor')
			}
			
		})
	}, 500);
	
	function updateScroll(){
		var element = $('.box-body')
		var scrollHeight = element.prop("scrollHeight");
		element.scrollTop(scrollHeight,200);

	}
	
	$(document).on('click','.messagePlus .stickerButton',function(){
		var thisButton = $(this);
		myFunction(thisButton)
	})
	
	function myFunction(thisButton) {
	    var popup = thisButton.parents(".messagePlus").find(".myPopup");
	    if(popup.is('.show')){
	    	popup.removeClass('show')
	    }else if(!popup.is('.show')){
	    	popup.addClass('show')
	    }
	}
	
	//貼圖點擊觸發事件
	$(document).on("click",".stickerSend",function(){
		var stickerSeqNo = $(this).attr('name')
		var receiverAccount = $.trim($(this).parents('.box').find('.receiverAccount').text());
    	var senderAccountFistWord = senderAccount.substring(0,1).charCodeAt()
    	var receiverAccountFistWord = receiverAccount.substring(0,1).charCodeAt()
    	var firstAccount;
        var secondAccount; 
    	if(senderAccountFistWord > receiverAccountFistWord ){
    		firstAccount = senderAccount
            secondAccount = receiverAccount
    	}else if(senderAccountFistWord < receiverAccountFistWord){
    		firstAccount = receiverAccount
    		secondAccount = senderAccount
    	}
		stompClient.send("/app/messageSystem/" + firstAccount + "/" + secondAccount , {}, JSON.stringify({ 'messageArticle':stickerSeqNo, 'account':senderAccount, 'receiverAccount': receiverAccount, "messageType" : "sticker" }));
//		$('#' + 'micky' +'1>.box-body').append('<p class="me">'+ '<img class="" height="50px" width="50px" src="'+ $(this).attr('src') +'">' +'</p>')
		updateScroll();
	})
	
	//圖片傳送點擊觸發事件
	$(document).on("click",".imageButton",function(){
		dialogMessageImageInsert.dialog("open");
		var receiverAccount = $.trim($(this).parents('.box').find('.receiverAccount').text());
		$('#imageReceiverAccount').val(receiverAccount)
	})
	dialogMessageImageInsert = $("#insert-messageImage-form").dialog({
		autoOpen: false,
		height: 170,
		width: 600,
		modal: true,
		buttons: {
			"確認傳送": insertMessageImage,
			"取消": function() {
				dialogMessageImageInsert.dialog( "close" );
			}
		},
		close: function() {
			form[0].reset();
		}
	});
	function insertMessageImage(){
		var form = $('#insertMessageImageForm')[0];
		var data = new FormData(form);
		if($.trim($("#messageImage").val()) != ""){
			$.ajax({
	    		type: "POST",
	    		cache: false,
		        contentType: false,
		        processData: false,
				enctype: 'multipart/form-data',
	    		url: "/EEIT/MessageImage/",
	    		data: data,
	    		timeout: 600000,
	    		success: function (data) {
	    			var receiverAccount = $('#imageReceiverAccount').val()
	    			var messageImageSeqNo = data.messageImageSeqNo
	    	    	var senderAccountFistWord = senderAccount.substring(0,1).charCodeAt()
	    	    	var receiverAccountFistWord = receiverAccount.substring(0,1).charCodeAt()
	    	    	var firstAccount;
	    	        var secondAccount; 
	    	    	if(senderAccountFistWord > receiverAccountFistWord ){
	    	    		firstAccount = senderAccount
	    	            secondAccount = receiverAccount
	    	    	}else if(senderAccountFistWord < receiverAccountFistWord){
	    	    		firstAccount = receiverAccount
	    	    		secondAccount = senderAccount
	    	    	}
	    			stompClient.send("/app/messageSystem/" + firstAccount + "/" + secondAccount , {}, JSON.stringify({ 'messageArticle':messageImageSeqNo, 'account':senderAccount, 'receiverAccount': receiverAccount, "messageType" : "image" }));
	    			dialogMessageImageInsert.dialog( "close" );
	    		},
	    		error: function (e) {
	    			console.log("ERROR : ", e);
	    			alert(e);
	    		}
	    	});
		}else{
			alert('請選取圖片')
		}
	}
	
	//檔案傳送點擊觸發事件
	$(document).on("click",".fileButton",function(){
		dialogMessageFileInsert.dialog("open");
		var receiverAccount = $.trim($(this).parents('.box').find('.receiverAccount').text());
		$('#fileReceiverAccount').val(receiverAccount)
	})
	dialogMessageFileInsert = $("#insert-messageFile-form").dialog({
		autoOpen: false,
		height: 170,
		width: 600,
		modal: true,
		buttons: {
			"確認傳送": insertMessageFile,
			"取消": function() {
				dialogMessageFileInsert.dialog( "close" );
			}
		},
		close: function() {
			form[0].reset();
		}
	});
	function insertMessageFile(){
		var form = $('#insertMessageFileForm')[0];
		var data = new FormData(form);
		if($.trim($("#messageFile").val()) != ""){
			$.ajax({
	    		type: "POST",
	    		cache: false,
		        contentType: false,
		        processData: false,
				enctype: 'multipart/form-data',
	    		url: "/EEIT/MessageFile/",
	    		data: data,
	    		timeout: 600000,
	    		success: function (data) {
	    			var receiverAccount = $('#fileReceiverAccount').val()
	    			var messageImageSeqNo = data.messageFileSeqNo
	    	    	var senderAccountFistWord = senderAccount.substring(0,1).charCodeAt()
	    	    	var receiverAccountFistWord = receiverAccount.substring(0,1).charCodeAt()
	    	    	var firstAccount;
	    	        var secondAccount; 
	    	    	if(senderAccountFistWord > receiverAccountFistWord ){
	    	    		firstAccount = senderAccount
	    	            secondAccount = receiverAccount
	    	    	}else if(senderAccountFistWord < receiverAccountFistWord){
	    	    		firstAccount = receiverAccount
	    	    		secondAccount = senderAccount
	    	    	}
	    	    	var messageFileName = data.messageFileName;
	    			stompClient.send("/app/messageSystem/" + firstAccount + "/" + secondAccount , {}, JSON.stringify({ 'messageArticle':messageImageSeqNo + ',' + messageFileName, 'account':senderAccount, 'receiverAccount': receiverAccount, "messageType" : "file" }));
	    			dialogMessageFileInsert.dialog( "close" );
	    		},
	    		error: function (e) {
	    			console.log("ERROR : ", e);
	    			alert(e);
	    		}
	    	});
		}else{
			alert('請選取檔案')
		}
	}
	
	//點擊影片觸發事件
	$(document).on("click",".videoButton",function(){
		dialogMessageVideoInsert.dialog("open");
		var receiverAccount = $.trim($(this).parents('.box').find('.receiverAccount').text());
		$('#videoReceiverAccount').val(receiverAccount)
	})
	dialogMessageVideoInsert = $("#insert-messageVideo-form").dialog({
		autoOpen: false,
		height: 170,
		width: 600,
		modal: true,
		buttons: {
			"確認傳送": insertMessageVideo,
			"取消": function() {
				dialogMessageVideoInsert.dialog( "close" );
			}
		},
		close: function() {
			form[0].reset();
		}
	});
	function insertMessageVideo(){
		var form = $('#insertMessageVideoForm')[0];
		var data = new FormData(form);
		if($.trim($("#messageVideo").val()) != ""){
			$.ajax({
	    		type: "POST",
	    		cache: false,
		        contentType: false,
		        processData: false,
				enctype: 'multipart/form-data',
	    		url: "/EEIT/MessageVideo/",
	    		data: data,
	    		timeout: 600000,
	    		success: function (data) {
	    			var receiverAccount = $('#videoReceiverAccount').val()
	    			var messageVideoSeqNo = data.messageVideoSeqNo
	    	    	var senderAccountFistWord = senderAccount.substring(0,1).charCodeAt()
	    	    	var receiverAccountFistWord = receiverAccount.substring(0,1).charCodeAt()
	    	    	var firstAccount;
	    	        var secondAccount; 
	    	    	if(senderAccountFistWord > receiverAccountFistWord ){
	    	    		firstAccount = senderAccount
	    	            secondAccount = receiverAccount
	    	    	}else if(senderAccountFistWord < receiverAccountFistWord){
	    	    		firstAccount = receiverAccount
	    	    		secondAccount = senderAccount
	    	    	}
	    			stompClient.send("/app/messageSystem/" + firstAccount + "/" + secondAccount , {}, JSON.stringify({ 'messageArticle':messageVideoSeqNo, 'account':senderAccount, 'receiverAccount': receiverAccount, "messageType" : "video" }));
	    			dialogMessageVideoInsert.dialog( "close" );
	    		},
	    		error: function (e) {
	    			console.log("ERROR : ", e);
	    			alert(e);
	    		}
	    	});
		}else{
			alert('請選取影片')
		}
	}
	
	
	
	
	var form = dialogMessageImageInsert.find( "form" ).on( "submit", function( event ) {
	      event.preventDefault();
	});
})
	//以上聊天室-------------------------------------------------------------------