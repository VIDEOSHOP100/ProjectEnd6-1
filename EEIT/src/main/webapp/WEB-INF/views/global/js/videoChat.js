/**
 * 
 */

$( function() {
	var receiverAccount;
	var senderAccount = $('.accountForMessage').val();
	var userName = $('.accountForMessage').val();
	var track;
	var PeerConnection = (window.PeerConnection || window.webkitPeerConnection00
			|| window.webkitRTCPeerConnection || window.mozRTCPeerConnection);
	var URL = (window.URL || window.webkitURL || window.msURL || window.oURL);
	var getUserMedia = (navigator.getUserMedia || navigator.webkitGetUserMedia
			|| navigator.mozGetUserMedia || navigator.msGetUserMedia);
	var RTCIceCandidate = (window.mozRTCIceCandidate || window.RTCIceCandidate);
	var RTCSessionDescription = (window.mozRTCSessionDescription || window.RTCSessionDescription);

	navigator.getMedia = (navigator.getUserMedia || navigator.webkitGetUserMedia
			|| navigator.mozGetUserMedia || navigator.msGetUserMedia);
	
	var iceServer = {
		"iceServers" : [ 
//			{"url" : "stun:stun.voxgratia.org" },
//			{"url" : "stun:111.200.54.118:3478" },
//			{"url" : "stun:stun.ideasip.com" },
//			{"url":'stun:stun01.sipphone.com'},
//			{"url":'stun:stun.ekiga.net'},
//			{"url":'stun:stun.fwdnet.net'},
//			{"url":'stun:stun.ideasip.com'},
//			{"url":'stun:stun.iptel.org'},
//			{"url":'stun:stun.rixtelecom.se'},
//			{"url":'stun:stun.schlund.de'},
			{"url":'stun:stun.l.google.com:19302'},
//			{"url":'stun:stun1.l.google.com:19302'},
//			{"url":'stun:stun2.l.google.com:19302'},
//			{"url":'stun:stun3.l.google.com:19302'},
//			{"url":'stun:stun4.l.google.com:19302'},
//			{"url":'stun:stunserver.org'},
//			{"url":'stun:stun.softjoys.com'},
//			{"url":'stun:stun.voiparound.com'},
//			{"url":'stun:stun.voipbuster.com'},
//			{"url":'stun:stun.voipstunt.com'},
//			{"url":'stun:stun.voxgratia.org'},
//			{"url":'stun:stun.xten.com'},
//			{
//			 "url" : "turn:numb.viagenie.ca",
//			 "username" : "webrtc@live.com",
//			 "credential" : "muazkh"
//			}, 
			{
				url: 'turn:192.158.29.39:3478?transport=udp',
				credential: 'JZEOEt2V3Qb0y27GRntt2u2PAYA=',
				username: '28224511:1379330808'
			},
//			{
//				url: 'turn:192.158.29.39:3478?transport=tcp',
//				credential: 'JZEOEt2V3Qb0y27GRntt2u2PAYA=',
//				username: '28224511:1379330808'
//			}
		  ]
	};
	var answerPeerConnection = new PeerConnection(iceServer);
	var offerPeerConnection = new PeerConnection(iceServer);
	
	function connect(){
		if(!receiverAccount){
			receiverAccount = $('.whoCall').val()
		}
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
		stompClient.subscribe('/target/chatRoom/subscription/' + firstAccount + "/" + secondAccount, function(messagereturn){
	    	
	    	console.log('=========================================================================================================================')
	        console.log(JSON.parse(messagereturn.body).userName)
	        console.log(JSON.parse(messagereturn.body).candidate)
	        console.log(JSON.parse(messagereturn.body).type)
	        console.log(JSON.parse(messagereturn.body).event)
	        console.log(JSON.parse(messagereturn.body).data)
	        console.log('=========================================================================================================================')
	        var json = JSON.parse(messagereturn.body);
			if (json.event == "_ice_candidate") {
				if (json.userName != userName) {
					if (json.type == "_ice_offer") {
						answerPeerConnection.addIceCandidate(new RTCIceCandidate(
								json.data.candidate));
					}
					if (json.type == "_ice_answer") {
						offerPeerConnection.addIceCandidate(new RTCIceCandidate(
								json.data.candidate));
					}
				}
			} else if (json.message === "websocket open!") {
				console.log("open!");
			} else {
				if (json.userName != userName) {
					answerPeerConnection
							.setRemoteDescription(new RTCSessionDescription(
									json.data.sdp));
					offerPeerConnection.setRemoteDescription(new RTCSessionDescription(
							json.data.sdp));
					if (json.event === "_offer") {
						answerPeerConnection.createAnswer(sendAnswerFn,
								function(error) {
									console.log('Failure callback: ' + error);
								});
					}
				}
			}
	        
	    });
		answerPeerConnection.onicecandidate = function(event) {
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
			if (event.candidate !== null) {
				stompClient.send("/app/chatRoom/" + firstAccount + "/" + secondAccount, {}, JSON.stringify( {
					"userName" : userName,
					"type" : "_ice_answer",
					"event" : "_ice_candidate",
					"data" : {
						"candidate" : event.candidate
					}
				}));
			}
		};
		offerPeerConnection.onicecandidate = function(event) {
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
			if (event.candidate !== null) {
				stompClient.send("/app/chatRoom/" + firstAccount + "/" + secondAccount, {},JSON.stringify( {
					"userName" : userName,
					"type" : "_ice_offer",
					"event" : "_ice_candidate",
					"data" : {
						"candidate" : event.candidate
					}
				}));
			}
		};
		answerPeerConnection.onaddstream = function(event) {
			$('.yourVideo')[0].src = URL
					.createObjectURL(event.stream);
		};

		offerPeerConnection.onaddstream = function(event) {
			$('.yourVideo')[0].src = URL
					.createObjectURL(event.stream);
		};
		
		var sendAnswerFn = function(desc) {
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
			answerPeerConnection.setLocalDescription(desc);
			stompClient.send("/app/chatRoom/" + firstAccount + "/" + secondAccount, {}, JSON.stringify( {
				"userName" : userName,
				"event" : "_answer",
				"data" : {
					"sdp" : desc
				}
			}));
		};
		var sendOfferFn = function(desc) {
			offerPeerConnection.setLocalDescription(desc);
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
			stompClient.send("/app/chatRoom/" + firstAccount + "/" + secondAccount, {}, JSON.stringify( {
				"userName" : userName,
				"event" : "_offer",
				"data" : {
					"sdp" : desc
				}
			}));
		};

		navigator.getMedia( {
			"audio" : true,
			"video" : true 
		}, function(stream) {
			window.streamReference = stream;
			$('.myVideo')[0].src = URL.createObjectURL(stream);
			$('.myVideo')[0].muted = true;
			answerPeerConnection.addStream(stream);
			offerPeerConnection.addStream(stream);
			$("#tips-content").html("正在等待连接，请等待...");
			offerPeerConnection.createOffer(sendOfferFn, function(error) {
				console.log('Failure callback: ' + error);
			});
		}, function(error) {
			alert("获取不到媒体流，请确认视频设备");
			$("#tips-content").html("获取不到媒体流，请确认视频设备");
			console.log('getUserMedia error: ' + error);
		});
	}
	
	$( "#dialog" ).dialog({
		autoOpen: false,
		height: 500,
		width: 500,
	});
	
	$(document).on( "click",".liveButton",function() {
		var temp = $(this).closest('.box').attr('id')
		receiverAccount = temp.substring(0, temp.length - 1);
		$( "#dialog" ).dialog( "open" );
		$( ".callUser" ).show();
		$( ".disconnectUser" ).hide();
	});
	
	
	$(document).on("click",".disconnectUser",function(){
		window.streamReference.getVideoTracks().forEach(function(track) {
	        track.stop();
	    });
		$('.yourVideo')[0].src = ""
		$('.myVideo')[0].src = ""
		$('.whoCallDisplay').text(" ")
		$( "#dialog" ).dialog( "close" );
		receiverAccount = undefined
	})
	$(document).on("click",".callUser",function(){
		var caller;
		if(!receiverAccount){
			caller = true;
			receiverAccount = $('.whoCall').val()
		}
		connect();
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
    	if(caller){
    		stompClient.send("/app/messageSystem/" + firstAccount + "/" + secondAccount , {}, JSON.stringify({ 'messageArticle':"正在接通...", 'account':senderAccount, 'receiverAccount': receiverAccount, "messageType" : "call" }));
    	}else if(!caller){
    		stompClient.send("/app/messageSystem/" + firstAccount + "/" + secondAccount , {}, JSON.stringify({ 'messageArticle':senderAccount + "來電了....", 'account':senderAccount, 'receiverAccount': receiverAccount, "messageType" : "call" }));
    		$('.whoCallDisplay').text("撥號中....")
    	}
    	$( ".callUser" ).hide()
    	$( ".disconnectUser" ).show()
	})
});