
//顯示物品 發送
function send(account, liveChatArticle){

	var liveStreamSeqNo = $('.seqNo').val();

//alert(liveChatArticle);
//alert(account);

	stompClient.send("/app/proshow/" + liveStreamSeqNo , {}, JSON.stringify({ 'liveChatArticle':liveChatArticle, 'account':account}));
	
}