/**
 * 
 */

$(document).ready(function() {
	
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
					thisButton.parents('.videoBlock').remove();
				}
		
			},
			error: function (e) {
				console.log("ERROR : ", e);
//				alert(e);
			}
		});
	})
	
	checkWatchLater()
	
	
	//目前影片頁數
	var videoPage= 1;
	var loadingFlag = true;
	var lastPage = false;
	//無限加載
	$(window).scroll(function() {  
		if(!lastPage){
			if(loadingFlag){
				if($(window).scrollTop() + $(window).height() == $(document).height()) {
					loadingFlag = false;
					videoPageNo = parseInt(videoPage) * 24
					$('.pageLoading').addClass('pageLoadingDisplay').removeClass('pageLoadingNone')
					updateScrollPage();
					setTimeout(function(){ 
						$.ajax({
							type: "GET",
							cache: false,
					        contentType: false,
					        processData: false,
							enctype: 'multipart/form-data',
							url: "/EEIT/watchLaterVideo/page/" + videoPageNo,
							timeout: 600000,
							success: function (data) {
								$.each(data.videoBeanList,function( key, videoBean){
									var uploadDate= new Date(videoBean.videoUploadDate)
									var MyDateString;
									MyDateString =  uploadDate.getFullYear()
									             + '-' + ('0' + (uploadDate.getMonth()+1)).slice(-2)
									             + '-' + ('0' + uploadDate.getDate()).slice(-2)
									             + " " + ('0'  + uploadDate.getHours()).slice(-2)+':'
									             + ('0'  + uploadDate.getMinutes()).slice(-2)+':'
									             + ('0' + uploadDate.getSeconds()).slice(-2);
									var vb =
										'<div class="col-lg-2 col-sm-6 portfolio-item videoBlock">'+
											'<div class="card h-100 videoBlockInner">'+
												'<a href="/EEIT/videoRoom/'+ videoBean.videoSeqNo +'">'+
													'<img height="130px" width="235px" src="/EEIT/getImage/video/'+ videoBean.videoSeqNo +'">'+
												'</a>'+
												'<div class="card-body">'+
													'<h6 class="card-title videoTitle">'+
														'<a href="/EEIT/videoRoom/'+videoBean.videoSeqNo+'"  title="'+ videoBean.videoTitle +'}"><b>'+ videoBean.videoTitle +'</b></a>'+
													'</h6>'+
													'<a class="uploaderLink" href="/EEIT/uploaderHomePage/'+ videoBean.account +'">'+
														'<p class="videoSmallWords">'+ videoBean.account +'</p>'+
													'</a>'+
													'<p class="card-text videoSmallWords">'+ MyDateString +'</p>'+
													'<p class="videoSmallWords">觀看次數:'+ videoBean.videoViews +'</p>'
										if(data.loginStatus == "OK"){
											vb = vb + 	'<div class="watchLater">'+
															'<input type="hidden" value="'+ videoBean.videoSeqNo +'" />'+
															'<button type="button" class="btn">'+
																'<i class="fas fa-tags"></i>'+
															'</button>'+
														'</div>'+
														'</div>'+
														'</div>'+
													'</div>';
										}else if(data.loginStatus == "NOTOK"){
											vb = vb +	'</div>'+
												'</div>'+
											'</div>';
										}
									var dor = $('.row');
									dor.append(vb);
									$('.pageLoading').addClass('pageLoadingNone').removeClass('pageLoadingDisplay')
									if(data.videoBeanList.length < 24){
										lastPage = true;
										$('.pageLoadingDiv').remove();
						    	    }
								})
								
									
								checkWatchLater()
								videoPage = videoPage + 1;
							}
						});
					}, 3000);
				   
				}
			}
		}
	});
	function updateScrollPage(){
		var element = $('.container')
		var scrollHeight = element.prop("scrollHeight");
		element.scrollTop(scrollHeight,200);
	}
	
	
	function checkWatchLater(){
		$('.watchLater').each(function(){
			var videoSeqNo = $(this).find('input').val();
			var thisButton = $(this).find('button')
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
		})
	}
})