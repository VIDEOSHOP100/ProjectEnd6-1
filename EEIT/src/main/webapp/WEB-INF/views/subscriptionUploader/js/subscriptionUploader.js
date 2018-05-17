/**
 * 
 */

$(document).ready(function() {	
	
	$('.deleteBlock').click(function(){
		var thisDeleteButton = $(this) 
		var uploaderAccount = thisDeleteButton.parents('.media-body').find('.mt-0').text();
		$.ajax({
			type: "POST",
			url: "/EEIT/subscriptionUploader",
			data: {_method : "PUT", uploaderAccount : uploaderAccount, subscriptionUploaderStatus : 'nonSubscription'},
			timeout: 600000,
			success: function (data) {
				thisDeleteButton.parents('.media').remove()
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
					videoPageNo = parseInt(videoPage) * 10
					$('.pageLoading').addClass('pageLoadingDisplay').removeClass('pageLoadingNone')
					updateScrollPage();
					setTimeout(function(){ 
						$.ajax({
							type: "GET",
							cache: false,
					        contentType: false,
					        processData: false,
							enctype: 'multipart/form-data',
							url: "/EEIT/subscriptionUploader/page/" + videoPageNo,
							timeout: 600000,
							success: function (data) {
								$.each(data.memberBeanList,function( key, memberBean){
									var registerdate= new Date(memberBean.registerdate)
									var MyDateString;
									MyDateString =  registerdate.getFullYear()
									             + '-' + ('0' + (registerdate.getMonth()+1)).slice(-2)
									             + '-' + ('0' + registerdate.getDate()).slice(-2)
									             + " " + ('0'  + registerdate.getHours()).slice(-2)+':'
									             + ('0'  + registerdate.getMinutes()).slice(-2)+':'
									             + ('0' + registerdate.getSeconds()).slice(-2);
									var vb = 
										'<div class="media mb-4">'+
									'<a href="/EEIT/uploaderHomePage/'+ memberBean.account +'">'+
										'<img height="100px" width="100px"	src="/EEIT/getImage/member/'+ memberBean.account +'">'
									'</a>'+
						            '<div class="media-body">'+
						              '<a href="/EEIT/uploaderHomePage/'+memberBean.account+'">'+
						              	'<h5 class="mt-0">'+ memberBean.account +'</h5>'+
						              '</a>'+
						              '<button type="button" value="" class="btn btn-danger deleteBlock">'+
										'已訂閱&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-bell"></i>'+
									  '</button>'+
						              '<p>訂閱數:'+ memberBean.subscription +'</p>'+
						            '</div>'+
						          '</div>';
										
									var dor = $('.col-md-9');
									$('.pageLoading').addClass('pageLoadingNone').removeClass('pageLoadingDisplay')
									dor.append(vb);
									if(data.videoBeanList.length < 10){
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