

/**
 *WebRTC兼容浏览器
 */
var PeerConnection = (window.PeerConnection || window.webkitPeerConnection00
		|| window.webkitRTCPeerConnection || window.mozRTCPeerConnection);
var URL = (window.URL || window.webkitURL || window.msURL || window.oURL);
var getUserMedia = (navigator.getUserMedia || navigator.webkitGetUserMedia
		|| navigator.mozGetUserMedia || navigator.msGetUserMedia);
var RTCIceCandidate = (window.mozRTCIceCandidate || window.RTCIceCandidate);
var RTCSessionDescription = (window.mozRTCSessionDescription || window.RTCSessionDescription);

navigator.getMedia = (navigator.getUserMedia || navigator.webkitGetUserMedia
		|| navigator.mozGetUserMedia || navigator.msGetUserMedia);

var uploaderAccountList;
var notificationKey 
var socket = new SockJS('/EEIT/endPoint');
stompClient = Stomp.over(socket);
stompClient.connect({}, function(frame) {
    console.log('Connected: ' + frame);
    stompClient.subscribe('/target/chatRoom/subscription/1' , function(messagereturn){
    	
    	console.log('=========================================================================================================================')
        console.log(JSON.parse(messagereturn.body).userName)
        console.log(JSON.parse(messagereturn.body).candidate)
        console.log(JSON.parse(messagereturn.body).type)
        console.log(JSON.parse(messagereturn.body).event)
        console.log(JSON.parse(messagereturn.body).data)
        console.log('=========================================================================================================================')
        var json = JSON.parse(messagereturn.body);
		//如果是一个ICE的候选，则将其加入到PeerConnection中，否则设定对方的session描述为传递过来的描述
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
				// 如果是一个offer，那么需要回复一个answer
				if (json.event === "_offer") {
					answerPeerConnection.createAnswer(sendAnswerFn,
							function(error) {
								console.log('Failure callback: ' + error);
							});
				}
			}
		}
        
    });
})

$('.showUserName').append(Math.round(Math.random()*100))
//$('.showUserName').append("aaa")
var userName = $('.showUserName').text()

// stun和turn服务器，如果搭建了自己的stun和turn服务器，请修改此处。
var iceServer = {
	"iceServers" : [ 
		{"url" : "stun:stun.voxgratia.org" },
//		{"url" : "stun:111.200.54.118:3478" },
//		{"url" : "stun:stun.ideasip.com" },
		{
		 "url" : "turn:numb.viagenie.ca",
		 "username" : "webrtc@live.com",
		 "credential" : "muazkh"
		} 
	  ]
};

//创建PeerConnection实例 (参数为null则没有iceserver，即使没有stunserver和turnserver，仍可在局域网下通讯)
var answerPeerConnection = new PeerConnection(iceServer);

var offerPeerConnection = new PeerConnection(iceServer);

//发送ICE候选到其他客户端
answerPeerConnection.onicecandidate = function(event) {
	if (event.candidate !== null) {
		stompClient.send("/app/chatRoom/1", {}, JSON.stringify( {
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
	if (event.candidate !== null) {
		stompClient.send("/app/chatRoom/1", {},JSON.stringify( {
			"userName" : userName,
			"type" : "_ice_offer",
			"event" : "_ice_candidate",
			"data" : {
				"candidate" : event.candidate
			}
		}));
	}
};

//如果检测到媒体流连接到本地，将其绑定到一个video标签上输出
answerPeerConnection.onaddstream = function(event) {
//	unLoading();
	$('.yourVideo')[0].src = URL
			.createObjectURL(event.stream);
};

offerPeerConnection.onaddstream = function(event) {
//	unLoading();
	$('.yourVideo')[0].src = URL
			.createObjectURL(event.stream);
};

// 发送answer的函数，发送本地session描述
var sendAnswerFn = function(desc) {
	answerPeerConnection.setLocalDescription(desc);
	stompClient.send("/app/chatRoom/1", {}, JSON.stringify( {
		"userName" : userName,
		"event" : "_answer",
		"data" : {
			"sdp" : desc
		}
	}));
};

// 发送offer的函数，发送本地session描述
var sendOfferFn = function(desc) {
	offerPeerConnection.setLocalDescription(desc);
	stompClient.send("/app/chatRoom/1", {}, JSON.stringify( {
		"userName" : userName,
		"event" : "_offer",
		"data" : {
			"sdp" : desc
		}
	}));
};

// 获取本地音频和视频流,可选择
navigator.getMedia( {
	"audio" : true,
	"video" : true 
//	 video: { facingMode: "user" } //如果有前置摄像头的话使用前置摄像头
}, function(stream) {

	//绑定本地媒体流到video标签用于输出
	$('.myVideo')[0].src = URL.createObjectURL(stream);

	//静音处理
	$('.myVideo')[0].muted = true;

	//向PeerConnection中加入需要发送的流
	answerPeerConnection.addStream(stream);
	offerPeerConnection.addStream(stream);

	$("#tips-content").html("正在等待连接，请等待...");

	//发送一个offer信令,如果有回应，则作为发起方；否则，是应答方
	offerPeerConnection.createOffer(sendOfferFn, function(error) {
		console.log('Failure callback: ' + error);
	});

}, function(error) {
	alert("获取不到媒体流，请确认视频设备");
	$("#tips-content").html("获取不到媒体流，请确认视频设备");
	//处理媒体流创建失败错误
	console.log('getUserMedia error: ' + error);
});

