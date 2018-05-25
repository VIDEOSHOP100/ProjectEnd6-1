/**
 * 
 */
$(document).ready(function() {	
		//檢舉影片
		var videoSeqNo = $('input[name="videoSeqNo]').val();
	
		dialogdelete = $("#delete-dialog-form").dialog({
			autoOpen: false,
			height: 250,
			width: 600,
			modal: true,
			buttons: {
				"確認封鎖": deletevideo,
				"取消": function() {
					dialogdelete.dialog( "close" );
				}
			},
			close: function() {
				form[0].reset();
			}
		});
		$(document).on("click",".delete-video",function(){
			dialogdelete.dialog("open");
		});
		function deletevideo() {
			var form = $('#deleteForm')[0];
			$.ajax({
				type: "GET",
				enctype: 'multipart/form-data',
				url: "/EEIT/VideoReport/ban/" + videoSeqNo ,
				timeout: 600000,
				cache: false,
		        contentType: false,
		        processData: false,
				success: function (data) {
//					selectedDivOutside.remove();
//					dialogdelete.dialog( "close" );
//					alert("SUCCESS!!!")
				},
				error: function (e) {
					console.log("ERROR : ", e);
//					alert(e);
					dialog.dialog( "close" );
				}
			});
		}
		form = dialogdelete.find( "form" ).on( "submit", function( event ) {
			event.preventDefault();
		});
	
		//
		$( ".sidebarUserButtonFriend" ).each(function() {
			$(this).attr('name',$(this).attr('name').toUpperCase())
		})
		var videoSeqNo = $('input[name="videoSeqNo"]').val();
		var account = $('#account').val();
		
		//顯示推片影片
		$(document).on('click', '.introducedVideoShowButton', function(){
			console.log($(this).parent('.col-md-3').children('.introducedVideo'))
			$(this).parents('.col-md-3').find('.introducedVideo').removeClass('introducedVideo')
			$(this).remove();
		})
		
		
		//comment影藏內容
		$( ".commentArticle" ).each(function() {
			var thisBlock= $(this)[0]
			console.log(thisBlock)
			if (thisBlock.offsetHeight < thisBlock.scrollHeight ||
					thisBlock.offsetWidth < thisBlock.scrollWidth) {
			} else {
				$(this).parents('.media-body').children('.commentArticleShowButton').remove();
				$(this).removeClass('commentArticleHide');
			}
		});
		$(document).on('click','.commentArticleShowButton',function(){
			if($(this).parent('.media-body').children('.commentArticle').is(".commentArticleHide")){
				$(this).parent('.media-body').children('.commentArticle').removeClass('commentArticleHide')
				$(this).text('隱藏完整內容')
			}else if(!$(this).parent('.media-body').children('.commentArticle').is(".commentArticleHide")){
				$(this).parent('.media-body').children('.commentArticle').addClass('commentArticleHide')
				$(this).text('顯示完整內容')
			}
		})
		//影片描述隱藏內容
		var element = $('#allComments')[0]
		if (element.offsetHeight < element.scrollHeight ||
			element.offsetWidth < element.scrollWidth) {
		} else {
			$('.showAllCommentButton').hide();
		}
		var element = $('.videoDescriptionHide')[0]
		if (element.offsetHeight < element.scrollHeight ||
			element.offsetWidth < element.scrollWidth) {
		} else {
			$('.showDescriptionButton').hide();
		}
		$(document).on('click','.showDescriptionButton',function(){
//			alert('aaaa');
			if($('.videoDescription').is('.videoDescriptionHide')){
				$('.videoDescription').removeClass('videoDescriptionHide')
				$('.showDescriptionButton').text('隱藏完整內容')
			}else if(!$('.videoDescription').is('.videoDescriptionHide')){
				$('.videoDescription').addClass('videoDescriptionHide')
				$('.showDescriptionButton').text('顯示完整內容')
			}
			
		})
		
		//隱藏回復
		$( ".showReplyButton" ).each(function() {
			if($(this).closest('.media-body').find('.replyBlock').length ==  0){
				$(this).remove()
			}else if($(this).closest('.media-body').find('.replyBlock').length >  0){
				$(this).closest('.media-body').find('.replyBlock').hide()
			}
		});
		
		$(document).on('click','.showReplyButton',function(){
			if($(this).text() == '隱藏回復'){
				$(this).closest('.media-body').find('.replyBlock').hide()
				$(this).text('顯示回復')
			}else if($(this).text() == '顯示回復'){
				$(this).closest('.media-body').find('.replyBlock').show()
				$(this).text('隱藏回復')
			}
		})
		$(document).on('click','.showAllCommentButton',function(){
			$('.allCommentsHide').removeClass('allCommentsHide')
			$(this).remove()
		})
// 	 	以下聊天室--------------------------------------------------------------------------- 
		var chatRoomAlert = [];
		var chatRoomName = [];
		var id;
        $('.sidebarUserButton').click(function () {
            var right = 220;
            id = $(this).attr('id');
            right = $('div[class="box"]').length * 320 + right;
            if ($('div[id="' + id + '1"]').length == 0) {
                if ($('div[class="box"]').length == 5) {
                    right = 220
                    var name = $(this).attr('name');
                    $('div[name=' + right + ']').remove()
                    $('.chatplace').prepend($('<div id = "' + id + '1"><div class="box-head"><span> ' + id + '</span><span><i class="fas fa-exclamation-circle alertMessageNumber"></i><span class="unreadNumber">0</span></span><button><i class="fas fa-times"></i></button></div><div class="box-body"></div><div class="box-message"><input type="text"></div></div>').addClass('box').css({ "right": right + "px" }).attr('name', right))
                    right = right + 320;
                    count++;
                } else {
                    var name = $(this).attr('name');
                    $('div[name=' + right + ']').remove()
                    $('.chatplace').append($('<div id = "' + id + '1"><div class="box-head"><span> ' + id + '</span><span><i class="fas fa-exclamation-circle alertMessageNumber"></i><span class="unreadNumber">0</span></span><button><i class="fas fa-times"></i></button></div><div class="box-body"></div><div class="box-message"><input type="text"></div></div>').addClass('box').css({ "right": right + "px" }).attr('name', right))
                    right = right + 320;
                    count++;
                }
                selectAllMessage(account,id);
            }
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
    			$(this).parent('div').children('.box-head').css({"background-color":"#4A0080"});
    			updateScroll();
    		}
        })
        $(document).on('keyup','.box-message>input',function(e){
            if(e.keyCode == 13)
            {
				if($.trim($(this).val())!=""){
					send(id,$(this).val());
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
		function selectAllMessage(senderAccount,receiverAccount){
//			$.getJSON('../messageSystem/ShowRecordingMessage.do',{ 'senderAccount': senderAccount,'receiverAccount': receiverAccount},function(datareturn){
//				var docFrag = $(document.createDocumentFragment());
//				$.each(datareturn, function (idx,data) {
//						var cell1;
//						if(data.messageSenderAccount == senderAccount){
//							 cell1 = $('<p class="messageTimeMe">'+ data.messageTime.substring(0, 16)+'</p><p class="me">' + data.messageSenderAccount + ": " + data.messageArticle + '</p>')
//						}else if(data.messageSenderAccount == receiverAccount){
//							 cell1 = $('<p class="messageTimeHim">'+ data.messageTime.substring(0, 16)+'</p><p class="him">'+ data.messageSenderAccount + ": " + data.messageArticle + '</p>')
//						}
//						docFrag.append(cell1);
//				})
//				$('#'+receiverAccount+'1').find('.box-body').append(docFrag);
//				updateScroll()
//			})
		}
		//websocket-------------------------------------------------------------
		var count;
		var wsUri = "ws://localhost:8080/iiiProject/message.do";
		var websocket;
		var storeTimeInterval;
//		websocket = new WebSocket(wsUri);
//		websocket.onopen = function(){
//			var message = {
//					messageSenderAccount : userAccount,
//					messageReceiverAccount : "receiver",
//					messageArticle : "Hello!!!!!!"
//			}
//			websocket.send(JSON.stringify(message));
//		websocket.onmessage = function(e){
//			var splitmessage = e.data.split(',');
//			if(splitmessage[0] == userAccount){
//				$('#'+splitmessage[1]+'1>.box-body').append('<p class="me">'+ splitmessage[0] + ": "+ splitmessage[2]+'</p>')       
//			}else{
//				$('#'+splitmessage[0]+'1>.box-body').append('<p class="him">'+ splitmessage[0] + ": "+ splitmessage[2]+'</p>')   
//			}
//			updateScroll();
//			if($('#'+splitmessage[0]+'1>.box-body').css('display') == 'none'){
//					$('#'+splitmessage[0]+'1>.box-head').css('background-color','#CA82FF')
//					console.log(chatRoomName);
//					console.log(chatRoomAlert);
//					var flag = true;
//					var j;
//						for(j = 0 ; j < 5 ; j ++){
//							if(chatRoomName[j] == splitmessage[0]){
//								flag = false;
//							}	
//						}
//						for(var i = 0; i < 5; i ++){
//							if(chatRoomName[i] == undefined){
//								j = i;
//								break;
//							}
//						}
//						if(flag){
//							chatRoomAlert[j] = setInterval(function (){
//								if($('#'+splitmessage[0]+'1>.box-head').css('background-color') == 'rgb(74, 0, 128)'){//rgb(241,222,255)
//									$('#'+splitmessage[0]+'1>.box-head').css('background-color','#CA82FF')
//								}else{
//									$('#'+splitmessage[0]+'1>.box-head').css('background-color','#4A0080')
//								}
//							},1000);
//							chatRoomName[j] = splitmessage[0];
//							$('#'+splitmessage[0]+'1>.box-head').find('.unreadNumber').css({'display':'inline'})
//						}
//						$('#'+splitmessage[0]+'1>.box-head>span>.alertMessageNumber').css({'display':'inline'})
//						
//						$('#'+splitmessage[0]+'1>.box-head>span>.unreadNumber').text(parseInt($('#'+splitmessage[0]+'1>.box-head>span>.unreadNumber').text())+1);
// 				}
//			}
//		}
//		websocket.onerror = function(e){
//			alert("error = " + e);
//		}
//		websocket.onclose = function(e){
//			alert("close" + e);
//		}
//		function send(receiverid,message){
//			var messageSend = {
//					messageSenderAccount : userAccount,
//					messageReceiverAccount : receiverid,
//					messageArticle : message
//				
//			};
//			websocket.send(JSON.stringify(messageSend));
//		}
		//自動滾動
//        function updateScroll(){
	//          var element = $('.box-body')
	//          element.css({'background-color':'red'})
	//          element.scrollTop = element.scrollHeight;
// 	     	 var height = 0;
// 	     	 $('.box-body p').each(function(i, value){
// 	              height += parseInt($(this).height());
// 	          });
	
// 	          height += '';
	
// 	          $('.box-body').animate({scrollTop: height});
//        	var d = $('.box-body');
//        	d.scrollTop(d.prop("scrollHeight"));
//    	 }
		//以上聊天室----------------------------------------------------------------------------------------------------------------------
		var uploaderaccount = $('.uploaderaccount').find('p').text();
		$('.subscription').click(function(){
			if($.trim($('#account').val()) == ""){
				window.location.replace(loginUrl);
			}else{
				var subscriptionStatus = $('.subscription').attr("name");
				if(subscriptionStatus == "subscription"){
					$.ajax({
						type: "POST",
						url: "/EEIT/subscriptionUploader",
						data: {_method : "PUT", account : account, uploaderAccount : uploaderaccount, subscriptionUploaderStatus : "nonSubscription"},
						timeout: 600000,
						success: function (data) {
							$('.subscription').attr("name","nonSubscription");
							$('.subscription').css({
								'-webkit-filter':'grayscale(100%)'
							})
							$('.subscription').text('訂閱')
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}else if(subscriptionStatus == "nonSubscription"){
					$.ajax({
						type: "POST",
						url: "/EEIT/subscriptionUploader",
						data: {account : account, uploaderAccount : uploaderaccount, subscriptionUploaderStatus : 'subscription'},
						timeout: 600000,
						success: function (data) {
							$('.subscription').attr("name","subscription");
							$('.subscription').css({
								'-webkit-filter':'none'
							})
							$('.subscription').html('已訂閱&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-bell"></i>')
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}
			}
		})
		var videoSeqNo = $('input[name="videoSeqNo"]').val();
//		$.getJSON('../CommentVideo/showComments.do',{ 'videoSeqNo': videoSeqNo},function(datareturn){
//			var docFrag = $(document.createDocumentFragment());
//
//				var allcomments = $('#allComments');
//	           $.each(datareturn, function (idx,data) {
//					
//					 var cell1 = $('<img></img>').addClass("d-flex mr-3 rounded-circle").attr({height:"50px" , width:"50px",src:"/iiiProject/global/GetImage.do?userAccount=" + data.userAccount +"&type=member"}) 
//					 var cell2 = $('<div></div>').addClass("media-body")
//					 
//					 var cell3 = $('<h5></h5>').addClass("mt-0").text(data.userAccount);
//					 var cell7 = $('<span></span>').text(data.commentDate).append($('<span></span>').addClass("hide").text(data.seqNo));
//					 var cell3 = cell3.append(cell7);
//					 var cell4 = cell2.text(data.comments);
//					 var cell8 = $('<p></p>').append(   $('<button></button>').addClass("btn btn-info replyButton").text("回復").append(   $('<i></i>').addClass("fas fa-comment") ));
//					 var cell4 = cell4.append(cell8);
//					 var cell5 = cell4.prepend(cell3);
//					 var cell6 = $('<div></div>').addClass("media mb-4").attr({id:data.seqNo}).append([cell1,cell5]);
//					 docFrag.append(cell6);
//					 var outerseqno= data.seqNo;
//						 $.getJSON('../replyCommentVideo/showReplyComments.do',{ 'commentSeqNo': data.seqNo},function(datareturn){
//							 $.each(datareturn, function (idx,data) {
//								 var upperComment = $('#' + data.commentSeqNo).children('.media-body');
//								 var cell1 = $('<img></img>').addClass("d-flex mr-3 rounded-circle").attr({height:"50px" , width:"50px",src:"/iiiProject/global/GetImage.do?userAccount=" + data.replyCommentsUserAccount +"&type=member"}) 
//								 var cell2 = $('<div></div>').addClass("media-body")
//								 var cell3 = $('<h5></h5>').addClass("mt-0").text(data.replyCommentsUserAccount);
//								 var cell7 = $('<span></span>').text(data.replyCommentsDate).append($('<span></span>').addClass("hide").text(data.seqNo));
//								 var cell3 = cell3.append(cell7);
//								 var cell4 = cell2.text(data.replyComments);
//								 var cell5 = cell4.prepend(cell3);
//								 var cell6 = $('<div></div>').addClass("media mb-4").append([cell1,cell5]);
//								 upperComment.append(cell6);
//							 })
//						 })
//					
//					 
//					 
//	           })
//	           
//	           
//	           
//	           allcomments.prepend(docFrag);
//	           $(".replyButton").click(function(){
//					if($(this).parent('p').children('form').length == 0){
//						var cell1 = $('<textarea></textarea>').addClass("form-control").attr({rows:"3",id:"replyArea"})
//					    var cell2 = $('<div></div>').addClass("form-group")
//					     var cell2 = cell2.append(cell1);
//					    var cell3 = $('<button></button>').addClass("btn btn-primary replySubmit").attr({type:"button"}).text("Submit")
//					     var cell4 = $('<form></form>')
//					     var cell4 = cell4.append([cell2,cell3]);
//					    $(this).after(cell4)
//					}
//				    
//					 $(".replySubmit").click(function(){
//							var thisinsubmit = $(this)
//						 var replywords = $(this).parent('form').find('textarea').val();
//						 var userAccount = $('input[name="userAccount"]').val();
//						 var commentSeqNo =  $(this).parents('.media-body').children('h5').find('.hide').text();
//						 var seqNo = $('').val();
//						 $.getJSON('../replyCommentVideo/ReplyComments.do',{ 'replywords': replywords,'userAccount':userAccount ,'commentSeqNo':commentSeqNo},function(datareturn){
//							 var upperComment = thisinsubmit.parents('.media-body');
//							 var cell1 = $('<img></img>').addClass("d-flex mr-3 rounded-circle").attr({height:"50px" , width:"50px",src:"/iiiProject/global/GetImage.do?userAccount=" + datareturn.replyCommentsUserAccount +"&type=member"}) 
//							 var cell2 = $('<div></div>').addClass("media-body")
//							 var cell3 = $('<h5></h5>').addClass("mt-0").text(datareturn.replyCommentsUserAccount);
//							 var cell7 = $('<span></span>').text(datareturn.replyCommentsDate).append($('<span></span>').addClass("hide").text(datareturn.seqNo));
//							 var cell3 = cell3.append(cell7);
//							 var cell4 = cell2.text(datareturn.replyComments);
//							 var cell5 = cell4.prepend(cell3);
//							 var cell6 = $('<div></div>').addClass("media mb-4").append([cell1,cell5]);
//							 upperComment.append(cell6);
//						 });
//						 $(this).parent('form').find('textarea').val("")
//					 });
//				});
//		})
		$(document).on('click','#commentButton',function(){
			if($.trim($('#account').val()) == ""){
				window.location.replace(loginUrl);
			}else{
				var commentArticle = $.trim($('#commentArea').val());
				var data = { account: account,videoSeqNo:videoSeqNo ,commentArticle:commentArticle};
				if(commentArticle != ""){
					$.ajax({
						type: "POST",
						url: "/EEIT/CommentVideos",
						contentType : 'application/json; charset=utf-8',
				        dataType: "json",
	//			        accepts: "application/json; charset=utf-8",
				        data: JSON.stringify(data),
						timeout: 600000,
						success: function (data) {
							var datareturn = data.message;
							var allcomments = $('#allComments');
							var commentTime= new Date(datareturn.commentDate)
							var time =  commentTime.getFullYear()
							             + '-' + ('0' + (commentTime.getMonth()+1)).slice(-2)
							             + '-' + ('0' + commentTime.getDate()).slice(-2)
							             + " " + ('0'  + commentTime.getHours()).slice(-2)+':'
							             + ('0'  + commentTime.getMinutes()).slice(-2)+':'
							             + ('0' + commentTime.getSeconds()).slice(-2);
							var cell1 = $('<a class="uploaderLink" href="/EEIT/profile/'+ datareturn.account +'"><img class="d-flex mr-3 rounded-circle" height="50px" width="50px" src="/EEIT/getImage/member/'+ datareturn.account +'"></img></a>')
							var cell2 = $('<div></div>').addClass("media-body")
							var cell3 = $('<h5 class="mt-0"><a class="uploaderLink" href="/EEIT/profile/'+ datareturn.account +'">' + datareturn.account + '</a></h5>');
							var cell7 = $('<span></span>').text(time).append($('<span></span>').addClass("hide").text(datareturn.commentVideoSeqNo));
							var cell3 = cell3.append(cell7);
							var cell4 = cell2.append('<p class="commentArticle commentArticleHide">'+ datareturn.commentArticle +'</p><p class="commentArticleShowButton">顯示完整內容</p>');
							var cell8 = $('<p></p>').append(   $('<button></button>').addClass("btn btn-info replyButton").text("回復").append(   $('<i></i>').addClass("fas fa-pencil-alt "))).append('<input type="hidden" value = "" class="commentVideosLikeUnlikeStatus"/><span class="commentLikeNumber">&nbsp0&nbsp</span><button type="button" value="" class="likeButtonNone commentLike"></button><span class="commentUnLikeNumber">&nbsp0&nbsp</span><button type="button" value="" class="unlikeButtonNone commentUnlike"></button>')
							var cell4 = cell4.append(cell8);
							var cell5 = cell4.prepend(cell3);
							var cell6 = $('<div></div>').addClass("media mb-4").append([cell1,cell5]);
							allcomments.prepend(cell6);
							var thisBlock = $('#allComments').find('.media:first').find('.commentArticle')[0]
							var thisBlockForDelete = $('#allComments').find('.media:first').find('.commentArticle')
							if (thisBlock.offsetHeight < thisBlock.scrollHeight ||
								thisBlock.offsetWidth < thisBlock.scrollWidth) {
							} else {
								thisBlockForDelete.parents('.media-body').children('.commentArticleShowButton').remove();
								thisBlockForDelete.removeClass('commentArticleHide');
							}
							 
							 
	//							$(".replyButton").click(function(){
	//								if($(this).parent('p').children('form').length == 0){
	//									    var cell1 = $('<textarea></textarea>').addClass("form-control").attr({rows:"3",id:"replyArea"})
	//									    var cell2 = $('<div></div>').addClass("form-group")
	//									     var cell2 = cell2.append(cell1);
	//									    var cell3 = $('<button></button>').addClass("btn btn-primary replySubmit").attr({type:"button"}).text("Submit")
	//									     var cell4 = $('<form></form>')
	//									     var cell4 = cell4.append([cell2,cell3]);
	//									    $(this).parents('p').append(cell4)
	//								}
	//								$(".replySubmit").click(function(){
	//									var replyCommentArticle = $(this).parents('form').find('textarea').val().replace(/\s+/g, "");
	//									alert(replyCommentArticle)
	//									if(replyCommentArticle != ""){
	//
	//										var thisinsubmit = $(this)
	//										 var commentVideoSeqNo =  $(this).parents('.media-body').find('.hide:first').text();
	//										 var data = {account: account,commentVideoSeqNo:commentVideoSeqNo ,replyCommentArticle:replyCommentArticle}
	//										 $.ajax({
	//												type: "POST",
	//												url: "/EEIT/replyCommentVideo",
	//												contentType : 'application/json; charset=utf-8',
	//										        dataType: "json",
	//										        data: JSON.stringify(data),
	//												timeout: 600000,
	//												success: function (data) {
	//													var datareturn = data.replyCommentVideoBean;
	//													var commentTime = new Date(datareturn.replyCommentDate);
	//													var time = commentTime.getFullYear() + '-' + ( commentTime.getMonth() + 1 ) + '-' + commentTime.getDate() + "  " + commentTime.getHours() + ":" + commentTime.getMinutes() + ":" + commentTime.getSeconds()
	//													 var upperComment = thisinsubmit.parents('p');
	//													 var cell1 = $('<img></img>').addClass("d-flex mr-3 rounded-circle").attr({height:"50px" , width:"50px",src:"/EEIT/getImage/member/" + datareturn.account}) 
	//													 var cell2 = $('<div></div>').addClass("media-body")
	//													 var cell3 = $('<h5></h5>').addClass("mt-0").text(datareturn.account);
	//													 var cell7 = $('<span></span>').text(time).append($('<span></span>').addClass("hide").text(datareturn.replyCommentVideoSeqNo));
	//													 var cell3 = cell3.append(cell7);
	//													 var cell4 = cell2.text(datareturn.replyCommentArticle).append($('<p><span><input type="hidden" value="" class="replyCommentVideosLikeUnlikeStatus"><span class="replyCommentLikeNumber">&nbsp0&nbsp</span><button type="button" value="" class="replyCommentLike likeButtonNone"></button><span class="replyCommentUnLikeNumber">&nbsp0&nbsp</span><button type="button" value="" class="replyCommentUnlike unlikeButtonNone"></button></span></p>'));
	//													 var cell5 = cell4.prepend(cell3);
	//													 var cell6 = $('<div></div>').addClass("media mb-4").append([cell1,cell5]);
	//													 upperComment.after(cell6);
	//												},
	//												error: function (e) {
	//													console.log("ERROR : ", e);
	//													alert(e);
	//												}
	//										});
	//										$(this).parents('form').find('textarea').val("");
	//									}
	//								});
	//								 
	//							});
							
						},
						error: function (xhr, status, error) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}
				$('#commentArea').val("")
			}
		})
		$(document).on('click',".replyButton",function(){
			if($.trim($('#account').val()) == ""){
				window.location.replace(loginUrl);
			}else{
				if($(this).parent('p').children('form').length == 0){
					    var cell1 = $('<textarea></textarea>').addClass("form-control").attr({rows:"3",id:"replyArea"})
					    var cell2 = $('<div></div>').addClass("form-group")
					     var cell2 = cell2.append(cell1);
					    var cell3 = $('<button></button>').addClass("btn btn-primary replySubmit").attr({type:"button"}).text("Submit")
					     var cell4 = $('<form></form>')
					     var cell4 = cell4.append([cell2,cell3]);
					    $(this).parents('p').append(cell4)
				}
	//			 $(".replySubmit").click(function(){
	//				 var replyCommentArticle = $(this).parents('form').find('textarea').val().replace(/\s+/g, "");
	//				 if(replyCommentArticle != ""){
	//					 var thisinsubmit = $(this)
	//					 var commentVideoSeqNo =  $(this).parents('.media-body').find('.hide:first').text();
	//					 var seqNo = $('').val();
	//					 var data = {account: account,commentVideoSeqNo:commentVideoSeqNo ,replyCommentArticle:replyCommentArticle}
	//					 $.ajax({
	//							type: "POST",
	//							url: "/EEIT/replyCommentVideo",
	//							contentType : 'application/json; charset=utf-8',
	//					        dataType: "json",
	//					        data: JSON.stringify(data),
	//							timeout: 600000,
	//							success: function (data) {
	//								var datareturn = data.replyCommentVideoBean;
	//								var commentTime = new Date(datareturn.replyCommentDate);
	//								var time = commentTime.getFullYear() + '-' + ( commentTime.getMonth() + 1 ) + '-' + commentTime.getDate() + "  " + commentTime.getHours() + ":" + commentTime.getMinutes() + ":" + commentTime.getSeconds()
	//								 var upperComment = thisinsubmit.parents('p');
	//								 var cell1 = $('<img></img>').addClass("d-flex mr-3 rounded-circle").attr({height:"50px" , width:"50px",src:"/EEIT/getImage/member/" + datareturn.account}) 
	//								 var cell2 = $('<div></div>').addClass("media-body")
	//								 var cell3 = $('<h5 class = "mt-0"><a class="uploaderLink" href="/uploaderHomePage/'+ datareturn.account +'">' + datareturn.account + '</a></h5>');
	//								 var cell7 = $('<span></span>').text(time).append($('<span></span>').addClass("hide").text(datareturn.replyCommentVideoSeqNo));
	//								 var cell3 = cell3.append(cell7);
	//								 var cell4 = cell2.text(datareturn.replyCommentArticle).append($('<p><span><input type="hidden" value="" class="replyCommentVideosLikeUnlikeStatus"><span class="replyCommentLikeNumber">&nbsp0&nbsp</span><button type="button" value="" class="replyCommentLike likeButtonNone"></button><span class="replyCommentUnLikeNumber">&nbsp0&nbsp</span><button type="button" value="" class="replyCommentUnlike unlikeButtonNone"></button></span></p>'));
	//								 var cell5 = cell4.prepend(cell3);
	//								 var cell6 = $('<div></div>').addClass("media mb-4").append([cell1,cell5]);
	//								 upperComment.after(cell6);
	//							},
	//							error: function (e) {
	//								console.log("ERROR : ", e);
	//								alert(e);
	//							}
	//						});
	//				 	}
	//				 $(this).parents('form').find('textarea').val("");
	//			 });
			}
		});
		
		$(document).on('click',".replySubmit",function(){
			 var replyCommentArticle = $(this).parents('form').find('textarea').val().replace(/\s+/g, "");
			 if(replyCommentArticle != ""){
				 var thisinsubmit = $(this)
				 var commentVideoSeqNo =  $(this).parents('.media-body').find('.hide:first').text();
				 var seqNo = $('').val();
				 var data = {account: account,commentVideoSeqNo:commentVideoSeqNo ,replyCommentArticle:replyCommentArticle}
				 $.ajax({
						type: "POST",
						url: "/EEIT/replyCommentVideo",
						contentType : 'application/json; charset=utf-8',
				        dataType: "json",
				        data: JSON.stringify(data),
						timeout: 600000,
						success: function (data) {
							var datareturn = data.replyCommentVideoBean;
							var commentTime = new Date(datareturn.replyCommentDate);
							var time = commentTime.getFullYear() + '-' + ( commentTime.getMonth() + 1 ) + '-' + commentTime.getDate() + "  " + commentTime.getHours() + ":" + commentTime.getMinutes() + ":" + commentTime.getSeconds()
							 var upperComment = thisinsubmit.parents('p');
							 var cell1 = $('<a class="uploaderLink" href="/profile/'+ datareturn.account +'"><img class="d-flex mr-3 rounded-circle" height="50px" width="50px" src="/EEIT/getImage/member/'+ datareturn.account +'"></img></a>')
							 var cell2 = $('<div></div>').addClass("media-body")
							 var cell3 = $('<h5 class = "mt-0"><a class="uploaderLink" href="/profile/'+ datareturn.account +'">' + datareturn.account + '</a></h5>');
							 var cell7 = $('<span></span>').text(time).append($('<span></span>').addClass("hide").text(datareturn.replyCommentVideoSeqNo));
							 var cell3 = cell3.append(cell7);
							 var cell4 = cell2.append("<p class='commentArticle commentArticleHide'>"+datareturn.replyCommentArticle+"</p><p class='commentArticleShowButton'>顯示完整內容</p>").append($('<p><span><input type="hidden" value="" class="replyCommentVideosLikeUnlikeStatus"><span class="replyCommentLikeNumber">&nbsp0&nbsp</span><button type="button" value="" class="replyCommentLike likeButtonNone"></button><span class="replyCommentUnLikeNumber">&nbsp0&nbsp</span><button type="button" value="" class="replyCommentUnlike unlikeButtonNone"></button></span></p>'));
							 var cell5 = cell4.prepend(cell3);
							 var cell6 = $('<div></div>').addClass("media mb-4").append([cell1,cell5]);
							 upperComment.after(cell6);
							 
							 $( ".commentArticle" ).each(function() {
								var thisBlock= $(this)[0]
								console.log(thisBlock)
								if (thisBlock.offsetHeight < thisBlock.scrollHeight ||
										thisBlock.offsetWidth < thisBlock.scrollWidth) {
								} else {
									$(this).parents('.media-body').children('.commentArticleShowButton').remove();
									$(this).removeClass('commentArticleHide');
								}
							});
							 
							 thisinsubmit.closest('.media-body').find('.replyBlock').show()
							 thisinsubmit.closest('.media-body').find('.showReplyButton').remove();
//							console.log($(this).closest('.media-body').find('.replyBlock'));
//							$( $(this).closest('.media-body').find('.replyBlock') ).each(function() {
//								console.log($( this ));
//								  $( this ).show();
//							});
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
			 	}
			 $(this).parents('form').find('textarea').val("");
		 });
// 		$(".replyButton").on("click", function(){
// 		    alert("The paragraph was clicked.");
// 		});


//		var dataLikeStart = $('form[name="likeVideo"]').serialize();
//		$.getJSON('../likeUnlikeVideos/GetLikeStatus.do',dataLikeStart,function(datareturn){
//			console.log(datareturn);
//			if(datareturn.likeStatus == 'like'){
//				$('.likeButton').css({
//					
//					'background-image': 'url(images/likefinal.jpg)'
//				})
//			}else if(datareturn.likeStatus == 'unlike'){
//				$('.unlikeButton').css({
//					'background-image': 'url(images/unlikefinal.jpg)'
//				})
//			}
//			
//			$('#likeNumber').text(datareturn.likes);
//			$('#unlikeNumber').text(datareturn.unlikes);
//			
//		})
		
		
		//影片讚
		$(document).on('click','.like',function() {
			if($.trim($('#account').val()) == ""){
				window.location.replace(loginUrl);
			}else{
				var likeUnlikeStatus = $('input[name="likeUnlikeStatus"]').val();
				if(likeUnlikeStatus == "like"){
					$.ajax({
						type: "POST",
						url: "/EEIT/likeUnlikeVideos",
						data: {_method : "PUT", account : account, videoSeqNo : videoSeqNo, likeUnlikeStatus : "none"},
						timeout: 600000,
						success: function (data) {
							$('.like').addClass('likeButtonNone').removeClass('likeButton');
							$('#likeNumber').text(data.likeNumber)
							$('#unlikeNumber').text(data.unlikeNumber)
							$('input[name="likeUnlikeStatus"]').val("none");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
					
				}else if(likeUnlikeStatus == "unlike" || likeUnlikeStatus == "none" ){
					$.ajax({
						type: "POST",
						url: "/EEIT/likeUnlikeVideos",
						data: {_method : "PUT", account : account,  videoSeqNo : videoSeqNo, likeUnlikeStatus : "like"},
						timeout: 600000,
						success: function (data) {
							$('.like').addClass('likeButton').removeClass('likeButtonNone');
							$('.unlike').addClass('unlikeButtonNone').removeClass('unlikeButton');
							$('#likeNumber').text(data.likeNumber)
							$('#unlikeNumber').text(data.unlikeNumber)
							$('input[name="likeUnlikeStatus"]').val("like");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}else if(!likeUnlikeStatus){
					$.ajax({
						type: "POST",
						url: "/EEIT/likeUnlikeVideos",
						data: {account : account,  videoSeqNo : videoSeqNo, likeUnlikeStatus : "like"},
						timeout: 600000,
						success: function (data) {
							$('.like').addClass('likeButton').removeClass('likeButtonNone');
							$('#likeNumber').text(data.likeNumber)
							$('#unlikeNumber').text(data.unlikeNumber)
							$('input[name="likeUnlikeStatus"]').val("like");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}
	//			var datas = $('form[name="likeVideo"]').serialize();
	//			$.getJSON('../likeUnlikeVideos/likeunlikeVideo.do',datas,function(datareturn){
	//				$('#likeNumber').text(datareturn.like);
	//				$('#unlikeNumber').text(datareturn.unlike);
	//				if(datareturn.likeStatus == 'like'){
	//					$('.unlikeButton').css({
	//						'background-image': 'url(images/unlikefinalgray.jpg)'
	//					})
	//					$('.likeButton').css({
	//						
	//						'background-image': 'url(images/likefinal.jpg)'
	//					})
	//				}else if(datareturn.likeStatus == 'unlike'){
	//					$('.likeButton').css({
	//						
	//						'background-image': 'url(images/likefinalgray.jpg)'
	//					})
	//					$('.unlikeButton').css({
	//						'background-image': 'url(images/unlikefinal.jpg)'
	//					})
	//				}else if(datareturn.likeStatus == 'none'){
	//					$('.unlikeButton').css({
	//						'background-image': 'url(images/unlikefinalgray.jpg)'
	//							
	//					})
	//					$('.likeButton').css({
	//						'background-image': 'url(images/likefinalgray.jpg)'
	//					})
	//				}
	//				
	//
	//		    });
			}
		})
		$(document).on('click','.unlike',function() {
			if($.trim($('#account').val()) == ""){
				window.location.replace(loginUrl);
			}else{
				var likeUnlikeStatus = $('input[name="likeUnlikeStatus"]').val();
				if(likeUnlikeStatus == "unlike"){
					$.ajax({
						type: "POST",
						url: "/EEIT/likeUnlikeVideos",
						data: {_method : "PUT", account : account, videoSeqNo : videoSeqNo, likeUnlikeStatus : "none"},
						timeout: 600000,
						success: function (data) {
							$('.unlike').addClass('unlikeButtonNone').removeClass('unlikeButton');
							$('#likeNumber').text(data.likeNumber)
							$('#unlikeNumber').text(data.unlikeNumber)
							$('input[name="likeUnlikeStatus"]').val("none");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
					
				}else if(likeUnlikeStatus == "like" || likeUnlikeStatus == "none" ){
					$.ajax({
						type: "POST",
						url: "/EEIT/likeUnlikeVideos",
						data: {_method : "PUT", account : account,  videoSeqNo : videoSeqNo, likeUnlikeStatus : "unlike"},
						timeout: 600000,
						success: function (data) {
							$('.unlike').addClass('unlikeButton').removeClass('unlikeButtonNone');
							$('.like').addClass('likeButtonNone').removeClass('likeButton');
							$('#likeNumber').text(data.likeNumber)
							$('#unlikeNumber').text(data.unlikeNumber)
							$('input[name="likeUnlikeStatus"]').val("unlike");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}else if(!likeUnlikeStatus){
					$.ajax({
						type: "POST",
						url: "/EEIT/likeUnlikeVideos",
						data: {account : account,  videoSeqNo : videoSeqNo, likeUnlikeStatus : "unlike"},
						timeout: 600000,
						success: function (data) {
							$('.unlike').addClass('unlikeButton').removeClass('unlikeButtonNone');
							$('#likeNumber').text(data.likeNumber)
							$('#unlikeNumber').text(data.unlikeNumber)
							$('input[name="likeUnlikeStatus"]').val("unlike");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}
			}
		})
		
		//留言讚
		
		$(document).on('click','.commentLike',function() {
			if($.trim($('#account').val()) == ""){
				window.location.replace(loginUrl);
			}else{
				var thisCommentLike = $(this)
				var likeUnlikeVideoCommentStatus = thisCommentLike.parents('p').find('.commentVideosLikeUnlikeStatus').val();
				var commentVideoSeqNo = thisCommentLike.parents('.media-body').find('.hide:first').text()
				if(likeUnlikeVideoCommentStatus == "like"){
					$.ajax({
						type: "POST",
						url: "/EEIT/CommentVideosLikeUnlike",
						data: {_method : "PUT", commentVideoSeqNo : commentVideoSeqNo, commentLikeUnlikeStatus : "none"},
						timeout: 600000,
						success: function (data) {
							thisCommentLike.addClass('likeButtonNone').removeClass('likeButton');
							thisCommentLike.parents('p').find('.commentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisCommentLike.parents('p').find('.commentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisCommentLike.parents('p').find('.commentVideosLikeUnlikeStatus').val("none");
							
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
					
				}else if(likeUnlikeVideoCommentStatus == "unlike" || likeUnlikeVideoCommentStatus == "none" ){
					$.ajax({
						type: "POST",
						url: "/EEIT/CommentVideosLikeUnlike",
						data: {_method : "PUT", commentVideoSeqNo : commentVideoSeqNo, commentLikeUnlikeStatus : "like"},
						timeout: 600000,
						success: function (data) {
							thisCommentLike.addClass('likeButton').removeClass('likeButtonNone');
							thisCommentLike.parents('p').find('.commentUnlike').addClass('unlikeButtonNone').removeClass('unlikeButton');
							thisCommentLike.parents('p').find('.commentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisCommentLike.parents('p').find('.commentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisCommentLike.parents('p').find('.commentVideosLikeUnlikeStatus').val("like");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}else if(!likeUnlikeVideoCommentStatus){
					$.ajax({
						type: "POST",
						url: "/EEIT/CommentVideosLikeUnlike",
						data: {commentVideoSeqNo : commentVideoSeqNo, commentLikeUnlikeStatus : "like"},
						timeout: 600000,
						success: function (data) {
							thisCommentLike.addClass('likeButton').removeClass('likeButtonNone');
							thisCommentLike.parents('p').find('.commentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisCommentLike.parents('p').find('.commentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisCommentLike.parents('p').find('.commentVideosLikeUnlikeStatus').val("like");
							
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}
			}
		})
		
		$(document).on('click','.commentUnlike',function() {
			if($.trim($('#account').val()) == ""){
				window.location.replace(loginUrl);
			}else{
				var thisCommentUnLike = $(this)
				var likeUnlikeVideoCommentStatus = thisCommentUnLike.parents('p').find('.commentVideosLikeUnlikeStatus').val();
				var commentVideoSeqNo = thisCommentUnLike.parents('.media-body').find('.hide:first').text()
	//			alert(likeUnlikeVideoCommentStatus)
	//			alert(commentVideoSeqNo)
				if(likeUnlikeVideoCommentStatus == "unlike"){
					$.ajax({
						type: "POST",
						url: "/EEIT/CommentVideosLikeUnlike",
						data: {_method : "PUT", commentVideoSeqNo : commentVideoSeqNo, commentLikeUnlikeStatus : "none"},
						timeout: 600000,
						success: function (data) {
							thisCommentUnLike.addClass('unlikeButtonNone').removeClass('unlikeButton');
							thisCommentUnLike.parents('p').find('.commentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisCommentUnLike.parents('p').find('.commentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisCommentUnLike.parents('p').find('.commentVideosLikeUnlikeStatus').val("none");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
					
				}else if(likeUnlikeVideoCommentStatus == "like" || likeUnlikeVideoCommentStatus == "none" ){
					$.ajax({
						type: "POST",
						url: "/EEIT/CommentVideosLikeUnlike",
						data: {_method : "PUT", commentVideoSeqNo : commentVideoSeqNo, commentLikeUnlikeStatus : "unlike"},
						timeout: 600000,
						success: function (data) {
							thisCommentUnLike.addClass('unlikeButton').removeClass('unlikeButtonNone');
							thisCommentUnLike.parents('p').find('.commentLike').addClass('likeButtonNone').removeClass('likeButton');
							thisCommentUnLike.parents('p').find('.commentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisCommentUnLike.parents('p').find('.commentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisCommentUnLike.parents('p').find('.commentVideosLikeUnlikeStatus').val("unlike");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}else if(!likeUnlikeVideoCommentStatus){
					$.ajax({
						type: "POST",
						url: "/EEIT/CommentVideosLikeUnlike",
						data: {commentVideoSeqNo : commentVideoSeqNo, commentLikeUnlikeStatus : "unlike"},
						timeout: 600000,
						success: function (data) {
							thisCommentUnLike.addClass('unlikeButton').removeClass('unlikeButtonNone');
							thisCommentUnLike.parents('p').find('.commentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisCommentUnLike.parents('p').find('.commentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisCommentUnLike.parents('p').find('.commentVideosLikeUnlikeStatus').val("unlike");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}
			}
		})
		
		
		
		//回復讚
		$(document).on('click','.replyCommentLike',function() {
			if($.trim($('#account').val()) == ""){
				window.location.replace(loginUrl);
			}else{
				var thisReplyCommentLike = $(this)
				var likeUnlikeVideoReplyCommentStatus = thisReplyCommentLike.parents('span').find('.replyCommentVideosLikeUnlikeStatus').val();
				var replyCommentVideoSeqNo = thisReplyCommentLike.closest('.media-body').find('.hide:first').text()
				if(likeUnlikeVideoReplyCommentStatus == "like"){
					$.ajax({
						type: "POST",
						url: "/EEIT/ReplyCommentVideoLikeUnlike",
						data: {_method : "PUT", replyCommentVideoSeqNo : replyCommentVideoSeqNo, replyCommentVideoLikeUnlikeStatus : "none"},
						timeout: 600000,
						success: function (data) {
							thisReplyCommentLike.addClass('likeButtonNone').removeClass('likeButton');
							thisReplyCommentLike.parents('span').find('.replyCommentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisReplyCommentLike.parents('span').find('.replyCommentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisReplyCommentLike.parents('span').find('.replyCommentVideosLikeUnlikeStatus').val("none");
							
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
					
				}else if(likeUnlikeVideoReplyCommentStatus == "unlike" || likeUnlikeVideoReplyCommentStatus == "none" ){
					$.ajax({
						type: "POST",
						url: "/EEIT/ReplyCommentVideoLikeUnlike",
						data: {_method : "PUT", replyCommentVideoSeqNo : replyCommentVideoSeqNo, replyCommentVideoLikeUnlikeStatus : "like"},
						timeout: 600000,
						success: function (data) {
							thisReplyCommentLike.addClass('likeButton').removeClass('likeButtonNone');
							thisReplyCommentLike.parents('span').find('.replyCommentUnlike').addClass('unlikeButtonNone').removeClass('unlikeButton');
							thisReplyCommentLike.parents('span').find('.replyCommentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisReplyCommentLike.parents('span').find('.replyCommentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisReplyCommentLike.parents('span').find('.replyCommentVideosLikeUnlikeStatus').val("like");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}else if(!likeUnlikeVideoReplyCommentStatus){
					$.ajax({
						type: "POST",
						url: "/EEIT/ReplyCommentVideoLikeUnlike",
						data: {replyCommentVideoSeqNo : replyCommentVideoSeqNo, replyCommentVideoLikeUnlikeStatus : "like"},
						timeout: 600000,
						success: function (data) {
							thisReplyCommentLike.addClass('likeButton').removeClass('likeButtonNone');
							thisReplyCommentLike.parents('span').find('.replyCommentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisReplyCommentLike.parents('span').find('.replyCommentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisReplyCommentLike.parents('span').find('.replyCommentVideosLikeUnlikeStatus').val("like");
							
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}
			}
		})
		
		$(document).on('click','.replyCommentUnlike',function() {
			if($.trim($('#account').val()) == ""){
				window.location.replace(loginUrl);
			}else{
				var thisReplyCommentUnLike = $(this)
				var likeUnlikeVideoReplyCommentStatus = thisReplyCommentUnLike.parents('span').find('.replyCommentVideosLikeUnlikeStatus').val();
				var replyCommentVideoSeqNo = thisReplyCommentUnLike.closest('.media-body').find('.hide:first').text()
				if(likeUnlikeVideoReplyCommentStatus == "unlike"){
					$.ajax({
						type: "POST",
						url: "/EEIT/ReplyCommentVideoLikeUnlike",
						data: {_method : "PUT", replyCommentVideoSeqNo : replyCommentVideoSeqNo, replyCommentVideoLikeUnlikeStatus : "none"},
						timeout: 600000,
						success: function (data) {
							thisReplyCommentUnLike.addClass('unlikeButtonNone').removeClass('unlikeButton');
							thisReplyCommentUnLike.parents('span').find('.replyCommentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisReplyCommentUnLike.parents('span').find('.replyCommentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisReplyCommentUnLike.parents('span').find('.replyCommentVideosLikeUnlikeStatus').val("none");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
					
				}else if(likeUnlikeVideoReplyCommentStatus == "like" || likeUnlikeVideoReplyCommentStatus == "none" ){
					$.ajax({
						type: "POST",
						url: "/EEIT/ReplyCommentVideoLikeUnlike",
						data: {_method : "PUT", replyCommentVideoSeqNo : replyCommentVideoSeqNo, replyCommentVideoLikeUnlikeStatus : "unlike"},
						timeout: 600000,
						success: function (data) {
							thisReplyCommentUnLike.addClass('unlikeButton').removeClass('unlikeButtonNone');
							thisReplyCommentUnLike.parents('span').find('.replyCommentLike').addClass('likeButtonNone').removeClass('likeButton');
							thisReplyCommentUnLike.parents('span').find('.replyCommentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisReplyCommentUnLike.parents('span').find('.replyCommentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisReplyCommentUnLike.parents('span').find('.replyCommentVideosLikeUnlikeStatus').val("unlike");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}else if(!likeUnlikeVideoReplyCommentStatus){
					$.ajax({
						type: "POST",
						url: "/EEIT/ReplyCommentVideoLikeUnlike",
						data: {replyCommentVideoSeqNo : replyCommentVideoSeqNo, replyCommentVideoLikeUnlikeStatus : "unlike"},
						timeout: 600000,
						success: function (data) {
							thisReplyCommentUnLike.addClass('unlikeButton').removeClass('unlikeButtonNone');
							thisReplyCommentUnLike.parents('span').find('.replyCommentLikeNumber').html('&nbsp' + data.likeNumber + '&nbsp')
							thisReplyCommentUnLike.parents('span').find('.replyCommentUnLikeNumber').html('&nbsp' + data.unlikeNumber + '&nbsp')
							thisReplyCommentUnLike.parents('span').find('.replyCommentVideosLikeUnlikeStatus').val("unlike");
						},
						error: function (e) {
							console.log("ERROR : ", e);
//							alert(e);
						}
					});
				}
			}
		})
		function reportVideo(){
			var form = $('#videoReport')[0]
			var data = new FormData(form);
			$.ajax({
				type: "POST",
				url: "/EEIT/VideoReport",
				enctype: 'multipart/form-data',
				data: data,
				timeout: 600000,
				cache: false,
		        contentType: false,
		        processData: false,
				success: function (data) {
//					alert("OK")
					$( "#reportSuccess" ).dialog({
				      modal: true,
				      buttons: {
				        Ok: function() {
				          $( this ).dialog( "close" );
				          dialogReport.dialog( "close" );
				        }
				      }
				    });
				},
				error: function (e) {
					console.log("ERROR : ", e);
//					alert(e);
				}
			});
		}
	
		$( ".reportVideo" ).button().on( "click", function() {
			dialogReport.dialog( "open" );
		});
		dialogReport = $("#reportDialog").dialog({
			autoOpen: false,
			height: 600,
			width: 400,
			modal: true,
			buttons: {
				"送出": reportVideo,
				"取消": function() {
					dialogReport.dialog( "close" );
				}
			},
			close: function() {
				form[0].reset();
			}
		});
		
		var form = dialogReport.find( "form" ).on( "submit", function( event ) {
			      event.preventDefault();
		});
		
		
})