/**
 * 
 */

$(document).ready(function() {	
	
	$('.deleteBlock').click(function(){
		var thisDeleteButton = $(this) 
		var videoSeqNo = thisDeleteButton.parents('.col-md-5').find('input').val();
		$.ajax({
			type: "POST",
			url: "/EEIT/watchHistory",
			data: {_method : "PUT", videoSeqNo : videoSeqNo, watchHistoryStatus : '0'},
			timeout: 600000,
			success: function (data) {
				var parentElement = thisDeleteButton.parents('.row')
				parentElement.find('.col-md-7').remove();
				parentElement.find('.col-md-5').remove();
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		});
	})
	
	
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
					videoPageNo = parseInt(videoPage) * 8
					$('.pageLoading').addClass('pageLoadingDisplay').removeClass('pageLoadingNone')
					updateScrollPage();
					setTimeout(function(){ 
						$.ajax({
							type: "GET",
							cache: false,
					        contentType: false,
					        processData: false,
							enctype: 'multipart/form-data',
							url: "/EEIT/watchHistory/page/" + videoPageNo,
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
										'<div class="row">'+
									     ' <div class="col-md-3">'+
									        '<a href="#">'+
									          '<a href="/EEIT/videoRoom/'+videoBean.videoSeqNo+'">'+
												'<img style="border: solid 1px red" class="img-fluid rounded mb-3 mb-md-0" width="350px" height="50px" src="/EEIT/getImage/video/'+videoBean.videoSeqNo+'">'+
											  '</a>'+
									        '</a>'+
									      '</div>'+
									      '<div class="col-md-9">'+
									        '<h3 class="videoTitle"><a href="/EEIT/videoRoom/'+videoBean.videoSeqNo+' />" title="'+videoBean.videoTitle+'">'+videoBean.videoTitle+'</a></h3>'+
									        '<p class="watchHistoryVideoAccount"><a class="uploaderLink" href="/EEIT/uploaderHomePage/'+ videoBean.account +'/>">'+ videoBean.account +'</a></p>'+
									        '<p>觀看次數:'+videoBean.videoViews+'</p>'+
									        '<p class="videoDescription" title="'+ videoBean.videoDescription +'">'+videoBean.videoDescription+'</p>'+
									        '<input type="hidden" class="videoSeqNo" value="'+ videoBean.videoSeqNo +'" '+
									        '<button type="button" value="" class="btn btn-danger deleteBlock">'+
								           		'<i class="fas fa-trash-alt"></i>'+
								            '</button>'+
									      '</div>'+
									    '</div>'+
									    '<hr>';
									var dor = $('.watchHistoryContainer');
									$('.pageLoading').addClass('pageLoadingNone').removeClass('pageLoadingDisplay')
									dor.append(vb);
									if(data.videoBeanList.length < 8){
										lastPage = true;
										$('.pageLoadingDiv').remove();
						    	    }
								})
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

})