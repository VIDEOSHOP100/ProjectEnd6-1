$( function() {
	var senderAccount = $('.accountForMessage').val()
	var selectedVideo;
	var updateVideo;
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
						url: "/EEIT/videoManage/page/" + videoPageNo,
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
								var vb = $('<div class="col-md-12 row divOutside">'+
										'<div class="col-md-10">'+
											'<div class="media mb-4">'+
												'<a	href="/EEIT/videoRoom/'+videoBean.videoSeqNo +'">'+
													'<img class="d-flex mr-3 picVideo" height="200px" width="400px"	src="getImage/video/' + videoBean.videoSeqNo + '">'+
												'</a>'+
												'<div class="media-body videoDatas">'+
													'<a href="/EEIT/videoRoom/'+videoBean.videoSeqNo+'" class="videoTitleLink" title="'+videoBean.videoTitle+'">'+
														'<h5 class="mt-0 videoTitle">'+videoBean.videoTitle+'</h5>'+
													'</a>'+
													'<p class="seqNo">'+videoBean.videoSeqNo+'</p>'+
													'<p>觀看次數: '+videoBean.videoViews+'</p>'+
													'<p>影片上傳日期時間: '+MyDateString+'</p>'+
													'<p class="videoTypeOutSide">影片種類: </p>'+
													'<p class="videoType">'+videoBean.videoType+'</p>'+
													
													'<p>影片喜歡數: '+videoBean.videoLikes+'</p>'+
													'<p>影片不喜歡數: '+videoBean.videoUnlikes+'</p>'+
													'<p>影片播放清單類別: '+videoBean.videoUplodaerListType+'</p>'+
													
													'<p class="videoDescriptionOutSide">影片描述:</p>'+
													'<p class="videoDescription" title="'+ videoBean.videoDescription +'">'+videoBean.videoDescription+'</p>'+
												'</div>'+
											'</div>'+
										'</div>'+
										'<div class="col-md-2">'+
											'<button class="btn btn-info create-user"><i class="fas fa-edit"></i></button>'+
											'<button class="btn btn-danger delete-video"><i class="fas fa-trash-alt"></i></button>'+
										'</div>'+
									'</div>')
								var dor = $('.divOutsideRow');
								dor.append(vb);
							})
							
							
							videoPage = videoPage + 1
							$('.pageLoading').addClass('pageLoadingNone').removeClass('pageLoadingDisplay')
							if(data.videoBeanList.length < 8){
								lastPage = true;
								$('.pageLoadingDiv').remove();
	//									$('.pageLoading').append($('<p>沒有資料囉</p>'))
	//									$('.pageLoading').addClass('pageLoadingDisplay').removeClass('pageLoadingNone')
				    	    }
						}
					});
		    	  
		    	   loadingFlag = true;
		       }, 3000);
		       
		    }
			}
		}
	});
	
	

	
	//隱藏表單初始顯示
    setTimeout(function() {
        $("#dialog-form").removeClass('hideForm')
        $("#insert-dialog-form").removeClass('hideForm')
        $("#delete-dialog-form").removeClass('hideForm')
     }, 2000);
    
    
	$(document).on('click','button:nth-child(1)',function(){
		selectedVideo = $(this);
		$( '#videoTitle' ).empty();
		$( '#videoDescription' ).empty();
		$( '#seqNo' ).empty();
		$( '#videoTitle' ).val($.trim($(this).parents('.divOutside').find('.videoDatas').find('h5').text()))
		$( '#videoDescription' ).val($.trim($(this).parents('.divOutside').find('.videoDatas').find('.videoDescription').text()))
		$( '#seqNo' ).val($.trim($(this).parents('.divOutside').find('.videoDatas').find('.seqNo').text()))
		var thisType = $.trim($(this).parents('.divOutside').find('.videoDatas').find('.videoType').text())
		$('#myForm option').each(function(){
			if($(this).text()== thisType){
				$(this).parents('select').val($(this).val())
			}
		})
	})
	var dialog, form,
	tips = $( ".validateTips" );
	function updateTips( t ) {
		tips.text( t ).addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		}, 500 );
	}
	
	function getFormData($form){
	    var unindexed_array = $form.serializeArray();
	    var indexed_array = {};

	    $.map(unindexed_array, function(n, i){
	        indexed_array[n['name']] = n['value'];
	    });

	    return indexed_array;
	}
	
	function objectifyForm(formArray) {//serialize data function

	  var returnArray = {};
	  for (var i = 0; i < formArray.length; i++){
	    returnArray[formArray[i]['name']] = formArray[i]['value'];
	  }
	  return returnArray;
	}
	
	$body = $("body");
	
	
	function addUser() {
		$body.addClass("loading");
		var form = $('#myForm')[0];
		var data = new FormData(form);
		
		console.log(data)
		console.log(data);
		$.ajax({
			type: "POST",
			cache: false,
	        contentType: false,
	        processData: false,
			enctype: 'multipart/form-data',
			url: "/EEIT/videoManage/put",
			data : data,
			timeout: 600000,
			success: function (data) {
				console.log("SUCCESS : ", data);
				var videoBean = data.vb;
//				selectedVideo.parents('.divOutside').find('.videoDatas').find('h5').text($('#videoTitle').val());
//				selectedVideo.parents('.divOutside').find('.videoDatas').find('.videoDescription').text($('#videoDescription').val());
//				selectedVideo.parents('.divOutside').find('.videoDatas').find('.videoType').text($('input[name=videoType]:checked').val());
//				var pic = selectedVideo.parents('.divOutside').find('.picVideo').attr("src") + "&timestamp=" + new Date().getTime();
//				selectedVideo.parents('.divOutside').find('.picVideo').removeAttr("src").attr("src",pic);
				updateVideo.parents('.divOutside').find('.mt-0').text(videoBean.videoTitle);
				updateVideo.parents('.divOutside').find('.videoType').text(videoBean.videoType);
				updateVideo.parents('.divOutside').find('.videoDescription').text(videoBean.videoDescription);
				var d = new Date();
				updateVideo.parents('.divOutside').find('img').attr("src", "/EEIT/getImage/video/" + videoBean.videoSeqNo + "?"+d.getTime());
				dialog.dialog( "close" );
				console.log(selectedVideo)
				$body.removeClass("loading");
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
				dialog.dialog( "close" );
			}
		});
	}
	
	dialog = $( "#dialog-form" ).dialog({
		autoOpen: false,
		height: 600,
		width: 600,
		modal: true,
		buttons: {
			"確認更新": addUser,
			"取消": function() {
				dialog.dialog( "close" );
			}
		},
		close: function() {
			form[ 0 ].reset();
		}
	});
	form = dialog.find( "form" ).on( "submit", function( event ) {
		event.preventDefault();
		addUser();
	});
	$(document).on( "click",".create-user", function() {
		dialog.dialog( "open" );
		updateVideo = $(this)
	});
	dialoginsert = $( "#insert-dialog-form" ).dialog({
		autoOpen: false,
		draggable: false,
		show:"slide",
		height: 820,
		width: 600,
		modal: true,
		buttons: {
			"確認新增": insertvideo,
			"取消": function() {
				dialoginsert.dialog( "close" );
			}
		},
		close: function() {
			form[ 0 ].reset();
		}
	});
	function dataURItoBlob(dataURI) {
	    // convert base64/URLEncoded data component to raw binary data held in a string
	    var byteString;
	    if (dataURI.split(',')[0].indexOf('base64') >= 0)
	        byteString = atob(dataURI.split(',')[1]);
	    else
	        byteString = unescape(dataURI.split(',')[1]);
	    // separate out the mime component
	    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

	    // write the bytes of the string to a typed array
	    var ia = new Uint8Array(byteString.length);
	    for (var i = 0; i < byteString.length; i++) {
	        ia[i] = byteString.charCodeAt(i);
	    }
	    return new Blob([ia], {type:mimeString});
	}
	function insertvideo() {
		var form = $('#insertForm')[0];
		var data = new FormData(form);
		var imgbuffer = document.getElementById("myCanvas").toDataURL("image/jpeg", 1.0);
		var blob = dataURItoBlob(imgbuffer);
		data.append("videoImage",blob,"videoImage.jpeg")
		$body.addClass("loading");
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "/EEIT/videoManage",
			data: data,
			timeout: 600000,
			cache: false,
	        contentType: false,
	        processData: false,
			success: function (data) {
				var videoBean = data.videoBean;
				var uploadDate= new Date(videoBean.videoUploadDate)
				var MyDateString;
				MyDateString =  uploadDate.getFullYear()
				             + '-' + ('0' + (uploadDate.getMonth()+1)).slice(-2)
				             + '-' + ('0' + uploadDate.getDate()).slice(-2)
				             + " " + ('0'  + uploadDate.getHours()).slice(-2)+':'
				             + ('0'  + uploadDate.getMinutes()).slice(-2)+':'
				             + ('0' + uploadDate.getSeconds()).slice(-2);
				var vb = $('<div class="col-md-12 row divOutside" style="padding:0px">'+
						'<div class="col-md-10" style="padding:0px">'+
							'<div class="media mb-4">'+
								'<a	href="/EEIT/videoRoom/'+videoBean.videoSeqNo +'">'+
									'<img class="d-flex mr-3 picVideo" height="200px" width="400px"	src="getImage/video/' + videoBean.videoSeqNo + '">'+
								'</a>'+
								'<div class="media-body videoDatas">'+
									'<a href="/EEIT/videoRoom/'+videoBean.videoSeqNo+'" class="videoTitleLink" title="'+videoBean.videoTitle+'">'+
										'<h5 class="mt-0 videoTitle">'+videoBean.videoTitle+'</h5>'+
									'</a>'+
									'<p class="seqNo">'+videoBean.videoSeqNo+'</p>'+
									'<p>觀看次數: '+videoBean.videoViews+'</p>'+
									'<p>影片上傳日期時間: '+MyDateString+'</p>'+
									'<p class="videoTypeOutSide">影片種類: </p>'+
									'<p class="videoType">'+videoBean.videoType+'</p>'+
									
									'<p>影片喜歡數: '+videoBean.videoLikes+'</p>'+
									'<p>影片不喜歡數: '+videoBean.videoUnlikes+'</p>'+
//									'<p>影片播放清單類別: '+videoBean.videoUplodaerListType+'</p>'+
									
									'<p class="videoDescriptionOutSide">影片描述:</p>'+
									'<p class="videoDescription" title="'+ videoBean.videoDescription +'">'+videoBean.videoDescription+'</p>'+
								'</div>'+
							'</div>'+
						'</div>'+
						'<div class="col-md-2">'+
							'<button class="btn btn-info create-user"><i class="fas fa-edit"></i></button>'+
							'<button class="btn btn-danger delete-video"><i class="fas fa-trash-alt"></i></button>'+
						'</div>'+
					'</div>')
				
				var dor = $('.divOutsideRow');
				dor.prepend(vb);
				$('#videoFileInsert').val("");
				$('#videoTitleInsert').val("");
				$('#videoDescriptionInsert').val("");
				$('#videoDescriptionInsert').val("");
				$('#videoPreview').attr("src","");
				$('.updateRadio').each(function(){
					$(this).val("");
				})
				$('#myCanvas').remove();
				$body.removeClass("loading");
				stompClient.send("/app/notificationSystem/" + $.trim(senderAccount), {}, JSON.stringify({ 'notificationArticle':"發布新影片:" + videoBean.videoTitle , 'account':senderAccount, 'notificationType' : 'videoRoom', 'eventPK' : videoBean.videoSeqNo}));
				dialoginsert.dialog( "close" );
				$("#insertForm #videoType").val("")
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
				dialog.dialog( "close" );
			}
		});
	}
			
	$(document).on( "click","#insert-video", function() {
		dialoginsert.dialog( "open" );
		if($('#myCanvas').length){
			$('#insertForm > fieldset').append($('<canvas id="myCanvas"></canvas>'))
		}
	});
	
    $("#videoFileInsert").change(function(){
        var objUrl = getObjectURL(this.files[0]) ;
        console.log("objUrl = "+objUrl) ;
        if (objUrl) {
            $("#videoPreview").attr("src", objUrl) ;
        }
        var v = document.getElementById("videoPreview");
        var c = document.getElementById("myCanvas");
        var ctx = c.getContext("2d");
        var i;
        i = window.setInterval(function() {ctx.drawImage(v,0,0,300,150)},20)
        v.addEventListener("play", function() {
        		i = window.setInterval(function() {
        				ctx.drawImage(v,0,0,300,150)
        				
        			},20);
        	}, false);
        v.addEventListener("pause", function() {window.clearInterval(i);}, false);
        v.addEventListener("ended", function() {clearInterval(i);}, false); 
    }) ;

    //建立一个可存取到该file的url
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) { // basic
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }

	//delete------------------------------------------------------------------------------------------
	var selectedDeletedSeqNo;
	var selectedDivOutside;
	$(document).on('click','button:nth-child(2)',function(){
//		alert('aaaa')
		$( '#videoTitleDelete' ).empty();
		$( '#videoTitleDelete' ).text($.trim($(this).parents('.divOutside').find('.videoDatas').find('h5').text()))
		$( '#seqNoDelete' ).empty();
		$( '#seqNoDelete' ).val($.trim($(this).parents('.divOutside').find('.videoDatas').find('.seqNo').text()))
		selectedDeletedSeqNo = $('#seqNoDelete').val();
		selectedDivOutside = $(this).parents('.divOutside');
	})
	dialogdelete = $("#delete-dialog-form").dialog({
		autoOpen: false,
		height: 600,
		width: 600,
		modal: true,
		buttons: {
			"確認刪除": deletevideo,
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
		var data = new FormData(form);
		var seqNoDeleteEnd = selectedDeletedSeqNo;
		$.ajax({
			type: "POST",
			enctype: 'multipart/form-data',
			url: "/EEIT/videoManage/put",
			data: data,
			timeout: 600000,
			cache: false,
	        contentType: false,
	        processData: false,
			success: function (data) {
				selectedDivOutside.remove();
				dialogdelete.dialog( "close" );
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
				dialog.dialog( "close" );
			}
		});
	}
	function updateScrollPage(){
		var element = $('.container')
		var scrollHeight = element.prop("scrollHeight");
		element.scrollTop(scrollHeight,200);

	}
});