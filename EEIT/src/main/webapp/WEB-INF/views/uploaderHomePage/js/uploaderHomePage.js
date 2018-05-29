/**
 * 
 */


$(document).ready(function() {	
	var uploaderAccount = $('.uploaderAccountForUploaderHomePage').val();
	$(document).on('click','.homePageButton',function(event){
		event.preventDefault();
		$('.showResultBlock').empty()
		$.ajax({
			type: "GET",
			cache: false,
	        contentType: false,
	        processData: false,
			url: "/EEIT/uploaderHomePage/" + uploaderAccount + "/type/homePage",
			timeout: 600000,
			success: function (datareturn) {
				var cellProduct = '<div class="col-lg-12">'+
									'<h1>熱門商品</h1>'+
								  '</div>';
				console.log("+++++++++++++++++++++++++" + datareturn.pageResultProduct);
				$.each(datareturn.pageResultProduct, function (idx,data) {
					cellProduct = cellProduct +
							'<div class="col-lg-2 mb-4">'+
					          '<div class="card h-100">'+
					            '<div class="card-body">'+
									'<a href="/EEIT/searchProductIntro/'+ data.productSeqNo +'">'+
										'<img height="130px" width="200px" src="/EEIT/getImage/Product/'+ data.productSeqNo +'">'+
									'</a>'+
									'<p class="card-text">'+
						              '<a  class="IdentityLink"  href="/EEIT/searchProductIntro/'+ data.productSeqNo +'">'+
						              data.proName+
						              '</a>'+
					              	'</p>'+
					              '<div class="card-text IdentityDescription" style="overflow:hidden">'+ data.proDescription +'</div>'+
					            '</div>'+
					            '<div class="card-footer">'+
					              '<a href="/EEIT/searchProductIntro/'+ data.productSeqNo +'"><input type="button" class="btn btn-primary" value="購買"></a>'+
					            '</div>'+
					          '</div>'+
				       		'</div>'
				})
				
				var cellLiveStream = '<div class="col-lg-12">'+
									'<h1>正在直播</h1>'+
								  '</div>';
				$.each(datareturn.pageResultLiveStream, function (idx,data) {
					cellLiveStream = cellLiveStream + 
							'<div class="col-lg-2 mb-4">'+
					          '<div class="card h-100">'+
					            '<div class="card-body">'+
									'<a href="/EEIT/LiveStream/'+data.liveStreamSeqNo+'">'+
										'<img height="130px" width="200px" src="/EEIT/getImage/LiveCoverPath/'+ data.liveStreamSeqNo +'">'+
									'</a>'+
					              '<a  class="IdentityLink"  href="/EEIT/LiveStream/'+ data.liveStreamSeqNo +'">'+
					              	'<div class="card-text">'+ data.streamName +'</div>'+
					              '</a>'+
					            '</div>'+
					          '</div>'+
				       		'</div>'
				})
				
				var cellVideo = '<div class="col-lg-12">'+
									'<h1>熱門影片</h1>'+
								  '</div>';
				$.each(datareturn.pageResultVideo, function (idx,data) {
					cellVideo = cellVideo + 
							'<div class="col-lg-2 mb-4">'+
					          '<div class="card h-100">'+
					            '<div class="card-body">'+
									'<a href="/EEIT/videoRoom/'+ data.videoSeqNo +'">'+
										'<img height="130px" width="200px" src="/EEIT/getImage/video/'+ data.videoSeqNo +'">'+
									'</a>'+
									'<div class="card-text">'+
						              '<a class="IdentityLink" href="/EEIT/videoRoom/'+ data.videoSeqNo +'">'+
						              data.videoTitle+
						              '</a>'+
						             '</div>'+
					              '<p class="card-text IdentityDescription" style="overflow:hidden">'+ data.videoDescription +'</p>'+
					            '</div>'+
					          '</div>'+
				       		'</div>'
				})
//				console.log(cellProduct);
//				console.log(cellLiveStream);
//				console.log(cellVideo);
				$('.showResultBlock').append($(cellProduct))
				$('.showResultBlock').append($(cellLiveStream))
				$('.showResultBlock').append($(cellVideo))
			}
		});
	})
	$(document).on('click','.productPageButton',function(event){
		event.preventDefault();
		$('.showResultBlock').empty()
		$.ajax({
			type: "GET",
			cache: false,
	        contentType: false,
	        processData: false,
			url: "/EEIT/uploaderHomePage/" + uploaderAccount + "/type/product",
			timeout: 600000,
			success: function (datareturn) {
				$.each(datareturn.pageResult, function (idx,data) {
					var pageResultBlock = $('<div class="col-lg-2 mb-4">'+
									          '<div class="card h-100">'+
									            '<div class="card-body">'+
													'<a href="/EEIT/searchProductIntro/'+ data.productSeqNo +'">'+
														'<img height="130px" width="200px" src="/EEIT/getImage/Product/'+ data.productSeqNo +'">'+
													'</a>'+
									              '<a href="/EEIT/searchProductIntro/'+ data.productSeqNo +'">'+
									              '<p class="card-text">'+ data.proName +'</p>'+
									              '</a>'+
									              '<p class="card-text">'+ data.proDescription +'</p>'+
									            '</div>'+
									            '<div class="card-footer">'+
									            '<a href="/EEIT/searchProductIntro/'+ data.productSeqNo +'"><input type="button" class="btn btn-primary" value="購買"></a>'+
									            '</div>'+
									          '</div>'+
								       		'</div>')
					$('.showResultBlock').append(pageResultBlock)
				})
			}
		});
	})
	$(document).on('click','.videoPageButton',function(event){
		event.preventDefault();
		$('.showResultBlock').empty()
		$.ajax({
			type: "GET",
			cache: false,
	        contentType: false,
	        processData: false,
			url: "/EEIT/uploaderHomePage/" + uploaderAccount + "/type/video",
			timeout: 600000,
			success: function (datareturn) {
				$.each(datareturn.pageResult, function (idx,data) {
					var pageResultBlock = $(
									'<div class="col-lg-2 mb-4">'+
							          '<div class="card h-100">'+
							            '<div class="card-body">'+
											'<a href="/EEIT/videoRoom/'+ data.videoSeqNo +'">'+
												'<img height="130px" width="200px" src="/EEIT/getImage/video/'+ data.videoSeqNo +'">'+
											'</a>'+
							              '<a href="/EEIT/videoRoom/78 "><p class="card-text">'+ data.videoTitle +'</p></a>'+
							              '<p class="card-text">'+ data.videoDescription +'</p>'+
							            '</div>'+
							          '</div>'+
						       		'</div>')
					$('.showResultBlock').append(pageResultBlock)
				})
			}
		});
	})
	$(document).on('click','.storePageButton',function(event){
		event.preventDefault();
		$('.showResultBlock').empty()
		var account = uploaderAccount;
	$.ajax({
    		
    		type:"GET",
    		url:"/EEIT/CustomizedGet/"+account,
    		
    		success:function(datareturn){
    			$.each(datareturn.pageResult, function (idx,data) {
    			var pageResultBlock = $(
//    					'<div class="row editform hidden col-lg-4 mb-4 offset-4">'+
//    					'<div class="" id="" tabindex="-1"role="dialog" aria-labelledby="exampleModalCenterTitle"aria-hidden="true">'+
//    						'<div class="modal-dialog modal-dialog-centered" role="document">'+
//    							'<div class="modal-content">'+
//    								'<div class="modal-header">'+
//    									'<h5 class="modal-title" id="exampleModalLongTitle">直播介紹控制列</h5>'+
//    									'<button type="button" class="close" data-dismiss="modal"aria-label="Close">'+
//    										'<span aria-hidden="true">&times;</span>'+
//    									'</button>'+
//    								'</div>'+
//    								'<div class="modal-body">'+
//
//
//    									'<form id="CustomizedControl" method="POST"action="${pageContext.request.contextPath}/CustomizedControl"modelAttribute="CustomizedBean" class=""enctype="multipart/form-data">'+
//    										'<p class="reasontitle modal-title">介面標題</p>'+
//    										'<div class="form-group">'+
//    											'<input path="customizedTitle" type="text"class="form-control input-sm" id="customizedTitle"placeholder="請輸入標題" />'+
//    										'</div>'+
//    										'<p class="reasontitle modal-title">新增影像</p>'+
//    										'<input path="photo" type="file" name="customizedPic" id="customizedPic" class="text ui-widget-content ui-corner-all"/>'+
//    									'<input type="submit" tabindex="-1" style="position:absolute; top:-1000px"/>'+
//    								
//    				  						'<br><br>'+
//    							'<p class="reasontitle modal-title">描述</p>'+
//    										'<div class="form-group">'+
//    											'<textarea path="customizedDesc" type="text"class="form-control input-sm" id="customizedDesc"placeholder="描述內容" />'+
//    										'</div>'+
//    									'<button type="button" class="btn btn-outline-info" id="cancel"data-dismiss="modal">取消</button>'+
//    											'<input type="submit" class="btn btn-primary" id="customizedSubmit" value="確定"/>'+
//    									'</form>'+
//    								'</div>'+
//    							'</div>'+
//    						'</div>'+
//    					'</div>'+
//    					'</div>'+
    					 '<div class="row onsaleitems">'+
    				      '<div class="col-lg-12 text-center">'+
    				        '<h2 class="sellproduct testclass">賣家介紹</h2>'+
    				        '</div>'+
    				        '<div class="row text-center" id="sexmove" style="width: 1200px; margin: 0 auto;">'+
    								'<div class="col-lg-3 col-md-6 mb-4" id="id_'+data.sortNum+'">'+
    									'<div class="card">'+
    									'<h4 class="card-title JQellipsisTitle">'+data.customizedTitle+'</h4>'+
    										'<img class="card-img-top"src="EEIT/getImage/customizedPic/'+data.customizedSeqNo+'"width="500px" height="238px" alt="">'+
    										'<div class="card-body ccc">'+
    											
    											'<p class="card-text">'+data.customizedDesc+'</p>'+
    										'</div>'+
    							
    									'</div>'+
    								'</div>'+
    							
    						'</div>'
    			
    				) 
      				$('.showResultBlock').append(pageResultBlock)
    			})
    		},
    		error: function (xhr, ajaxOptions, thrownError) {
        
                alert(thrownError);
            
        },
   
    		
    	})
  	
    
    
    
    $(document).on("click",'#replyMemberReportButton',function(){
    	
    	
    	var customizedTitle = $('#customizedTitle').val();
    	var customizedDesc = $('#customizedDesc').val();
    	
    	$.ajax({
    		
    		type:"POST",
    		url:"/EEIT/CustomizedControl",
    		data:{ _method : "PUT" ,customizedTitle:customizedTitle ,customizedDesc:customizedDesc},
    		
    		success:function(){
    		
    			alert('完成!');
    		
    		},
    		
    		error:function(e){
    			alert(e);
    		}
    		
    	})
    	
    })
    
		
		
	})
	
	var myaccount = $('#account').val();
	var othersideaccount = $('#othersideaccount').val();
	
	$('.friend').click(function(){
		var friendStatus = $('.friend').attr("value");
		if(friendStatus == 1){
			$.ajax({
				type: "POST",
				url: "/EEIT/addfriend",
				data: {_method : "PUT", account : myaccount, othersideaccount : othersideaccount, friendStatus : 0},
				timeout: 600000,
				success: function (data) {
					$('.friend').attr("value",0).addClass('btn-success').removeClass('btn-danger').text('加為好友');

				},
				error: function (e) {
					console.log("ERROR : ", e);
//					alert(e);
				} 
			});
		}else if(friendStatus == 0){
			$.ajax({
				type: "POST",
				url: "/EEIT/addfriend",
				data: {account : myaccount, othersideaccount : othersideaccount, friendStatus : 1},
				timeout: 600000,
				success: function (data) {
					$('.friend').attr("value",1).addClass('btn-danger').removeClass('btn-success').text('取消好友');
				},
				error: function (e) {
					console.log("ERROR : ", e);
//					alert(e);
				}
			});
		}
	})
	
	
	$('#reportSubmit').click(function(){
		
		var reportTitle = $('#reportTitle').val();
		var reportContent = $('#reportContent').val();

		$.ajax({
			type:"POST",
			url:"/EEIT/memberReport",
			data:{accountTo:othersideaccount , reportTitle:reportTitle , reportContent:reportContent},
			timeout: 600000,
			success:function(){
				$('#memberReportButton').attr("disabled","disabled").text("已檢舉");
				$('#cancel').trigger("click");
				
			},
			error: function (e) {
				console.log("ERROR : ", e);
//				alert(e);
			}
		})
		
	})
	
	
	$('#myMessageSubmit').click(function(){
	
		var myMessageTitle = $('#myMessageTitle').val();
		var myMessageContent = $('#myMessageContent').val();

		$.ajax({
			url:"/EEIT/sendMessage",
			type:"POST",
			data:{ myMessageTo:othersideaccount,myMessageTitle:myMessageTitle,myMessageContent:myMessageContent},
			success:function(){
//				alert('訊息已傳送!');
				$('#cancel2').trigger("click");
			},
			error: function (e) {
				console.log("ERROR : ", e);
//				alert(e);
			}
		})
		
		
		
	})
	
	
	$('.ban').click(function(){
		var banStatus = $('.ban').attr("value");
		if(banStatus == 1){
			$.ajax({
				type: "POST",
				url: "/EEIT/banMember",
				data: {_method : "PUT", account:othersideaccount, banStatus:0},
				timeout: 600000,
				success: function (data) {
					$('.ban').attr("value",0).addClass('btn-danger').removeClass('btn-success').text('封鎖會員');
				},
				error: function (e) {
					console.log("ERROR : ", e);
//					alert(e);
				} 
			}); 
		}else if(banStatus == 0){
			$.ajax({
				type: "POST",
				url: "/EEIT/banMember",
				data: {_method : "PUT", account:othersideaccount, banStatus:1},
				timeout: 600000,
				success: function (data) {
					$('.ban').attr("value",1).addClass('btn-success').removeClass('btn-danger').text('解除封鎖');
				},
				error: function (e) {
					console.log("ERROR : ", e);
//					alert(e);
				} 
			});
		}
	})
	
	
	
	
	
	
})