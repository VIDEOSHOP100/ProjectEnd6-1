/**
 * 
 */


$(document).ready(function() {
	var account = $('.account').val();
	$('body > div.container > div > div > div > div > div > button').click(function(){
		var videoSeqNo = $(this).parent('div').find('input').val();
		var thisButton = $(this);
		var data = {videoSeqNo : videoSeqNo}
		$.ajax({
			type: "POST",
			url: "/EEIT/watchLaterVideo",
			contentType : 'application/json; charset=utf-8',
	        dataType: "json",
//	        accepts: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			timeout: 600000,
			success: function (data) {
				if(data.status == "watchLater"){
					thisButton.addClass('btn-info')
				}else if(data.status == "nonWatchLater"){
					thisButton.removeClass('btn-info')
				}
		
			},
			error: function (e) {
				console.log("ERROR : ", e);
//				alert(e);
			}
		});
	})
	
	$('.watchLater').each(function(){
		var videoSeqNo = $(this).find('input').val();
		var thisButton = $(this).find('button')
		if(account != ''){
			
			$.ajax({
				type: "GET",
				url: "/EEIT/watchLaterVideo/" + videoSeqNo,
				timeout: 600000,
				success: function (data) {
					if(data.status == "watchLater"){
						thisButton.addClass('btn-info')
					}else if(data.status == "nonWatchLater"){
					}
				},
				error: function (e) {
					console.log("ERROR : ", e);
//					alert(e);
				}
			});
		}
	})
	
	$('#carouselExampleIndicators').addClass('actice');
	$('.indexVideoBackGround:first').addClass('active');
	
	
	
})