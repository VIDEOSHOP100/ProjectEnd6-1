/**
 * 
 */
$(document).ready(function() {
	$('.connectButton').click(function(){
		connect();
	})
	
	
	
	$('.clickButton').click(function(){
		var roomNumber = $('.roomNumber').val();
		var name = $(this).parents('div').find('.message').val();
		stompClient.send("/app/messageSystem/" + roomNumber , {}, JSON.stringify({ 'messageArticle':name, 'account':'bob', 'receiverAccount':'bob'}));
	})
	
	function addMessage(message){
		$('div').append('<p>message:   ' + message + '</p>');
	}
	
	var stompClient = null;
 

    function connect() {
	    var socket = new SockJS('/EEIT/messageEndPoint');
	    stompClient = Stomp.over(socket);
	    stompClient.connect({}, function(frame) {
//	        setConnected(true);
	    	var roomNumber = $('.roomNumber').val();
	    	var name = $(this).parents('div').find('.message').val();
	        console.log('Connected: ' + frame);
	        alert(roomNumber)
	        stompClient.subscribe('/message/subscription/' + roomNumber , function(messagereturn){
	            console.log(messagereturn);
	            alert('return')
	            addMessage(JSON.parse(messagereturn.body).messageArticle);
	        });
	    });
	}

	function disconnect() {
	    if (stompClient != null) {
	        stompClient.disconnect();
	    }
	    setConnected(false);
	    console.log("Disconnected");
	}

//	function sendName() {
//	    var name = document.getElementById('name').value;
//	    stompClient.send("/app/hello", {}, JSON.stringify({ 'name': name }));
//	}

//	function showGreeting(message) {
//	    var response = document.getElementById('response');
//	    var p = document.createElement('p');
//	    p.style.wordWrap = 'break-word';
//	    p.appendChild(document.createTextNode(message));
//	    response.appendChild(p);
//	}
})