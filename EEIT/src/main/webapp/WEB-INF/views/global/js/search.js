/**
 * 
 */

$(document).ready(function() {
    $(document).on('keydown','.searchInput',function(e){
//    	alert('aaaaa')
//    	e.preventDefault()
        if(e.keyCode == 13)
        {
//        	alert($('.searchInput').val())
			$('.searchForm').attr("action", "/EEIT/search/all/" + $('.searchInput').val())
			$('.searchForm').submit();
    	    return false;
        }
        
    });
	$(document).on('keyup focus','.searchInput',function(){
		var inputValue = $.trim($('.searchInput').val());
//		alert(inputValue);
		if(inputValue != ""){
			$.ajax({
				type: "GET",
				cache: false,
		        contentType: false,
		        processData: false,
				url: "/EEIT/search/" + inputValue,
				timeout: 600000,
				success: function (data) {
					console.log(data.videoBeanList)
					console.log(data.productSaleBeanList)
					console.log(data.inputLiveStreamTimeBeanList)
					console.log(data.memberBeanList)
					$('.videoSearchBlock').empty()
					$('.productSearchBlock').empty()
					$('.liveStreaSearchBlock').empty()
					$('.memberSearchBlock').empty()
					$.each(data.videoBeanList, function (idx,data) {
						$('.videoSearchBlock').append($('<a class="dropdown-item" href="/EEIT/videoRoom/'+ data.videoSeqNo +'">'+ data.videoTitle +'</a>'))
					})
					$.each(data.productSaleBeanList, function (idx,data) {
						$('.productSearchBlock').append($('<a class="dropdown-item" href="/EEIT/searchProductIntro/'+ data.productSeqNo +'">'+ data.proName +'</a>'))
					})
					$.each(data.inputLiveStreamTimeBeanList, function (idx,data) {
						$('.liveStreaSearchBlock').append($('<a class="dropdown-item" href="/EEIT/LiveStream/'+ data.liveStreamSeqNo +'">'+ data.streamName +'</a>'))
					})
					$.each(data.memberBeanList, function (idx,data) {
						$('.memberSearchBlock').append($('<a class="dropdown-item" href="/EEIT/profile/'+ data.account +'">'+ data.account +'</a>'))
					})
					$('.diplaySearchResult').addClass('show')
					
				}
			});
		}
		
	})
//	var searchBlock
//	$(document).on('click','.liveStreamSearchTitle',function(){
//		searchBlock = true;
//	})
	var flag = true;
	$(document).on('click','.searchTitleBlock, .searchTitle, .searchInput',function(){
//		alert('bbb')
		flag = false;
	})
	$(document).on('click','body, body * ',function(){    
//		alert('gggggggg')
		setTimeout(function(){
			if(flag){
				$('.diplaySearchResult').removeClass('show')
				
			}
		},10)
		setTimeout(function(){
			flag = true;
		},20)
		
	});
	var searchTitleBlockflag;
	$(document).on('click','.searchTitleBlock',function(event){
		setTimeout(function(){
			if(searchTitleBlockflag){
				$('.diplaySearchResult').empty()
				var originalSearchfragment = $(
					'<div class="searchTitleBlock liveStreaSearchDropdown">'+
						'<a class="dropdown-item searchTitle liveStreamSearchTitle">直播<i class="fas fa-angle-double-right moreSearchIcon"></i></a>'+
					'</div>'+
					'<div class="liveStreaSearchBlock">'+
					'</div>'+
					'<div class="searchTitleBlock productSearchDropdown">'+
						'<a class="dropdown-item searchTitle productSearchTitle">商品<i class="fas fa-angle-double-right moreSearchIcon"></i></a>'+
					'</div>'+
					'<div class="productSearchBlock">'+
					'</div>'+
					'<div class="searchTitleBlock videoSearchDropdown">'+
						'<a class="dropdown-item searchTitle videoSearchTitle">影片<i class="fas fa-angle-double-right moreSearchIcon"></i></a>'+
					'</div>'+
					'<div class="videoSearchBlock">'+
					'</div>'+
					'<div class="searchTitleBlock memberSearchDropdown">'+
						'<a class="dropdown-item searchTitle memberSearchTitle">會員<i class="fas fa-angle-double-right moreSearchIcon"></i></a>'+
					'</div>'+
					'<div class="memberSearchBlock">'+
					'</div>');
				$('.diplaySearchResult').append(originalSearchfragment);
				var inputValue = $.trim($('.searchInput').val());
				if(inputValue != ""){
					$.ajax({
						type: "GET",
						cache: false,
				        contentType: false,
				        processData: false,
						url: "/EEIT/search/" + inputValue,
						timeout: 600000,
						success: function (data) {
//							console.log(data.videoBeanList)
//							console.log(data.productSaleBeanList)
//							console.log(data.inputLiveStreamTimeBeanList)
//							console.log(data.memberBeanList)
//							$('.videoSearchBlock').empty()
//							$('.productSearchBlock').empty()
//							$('.liveStreaSearchBlock').empty()
//							$('.memberSearchBlock').empty()
							$.each(data.videoBeanList, function (idx,data) {
								$('.videoSearchBlock').append($('<a class="dropdown-item" href="/EEIT/videoRoom/'+ data.videoSeqNo +'">'+ data.videoTitle +'</a>'))
							})
							$.each(data.productSaleBeanList, function (idx,data) {
								$('.productSearchBlock').append($('<a class="dropdown-item" href="/EEIT/searchProductIntro/'+ data.productSeqNo +'">'+ data.proName +'</a>'))
							})
							$.each(data.inputLiveStreamTimeBeanList, function (idx,data) {
								$('.liveStreaSearchBlock').append($('<a class="dropdown-item" href="/EEIT/LiveStream/'+ data.liveStreamSeqNo +'">'+ data.streamName +'</a>'))
							})
							$.each(data.memberBeanList, function (idx,data) {
								$('.memberSearchBlock').append($('<a class="dropdown-item" href="/EEIT/profile/'+ data.account +'">'+ data.account +'</a>'))
							})
							$('.diplaySearchResult').addClass('show')
						}
					});
				}
			}
			searchTitleBlockflag = true;
		})
			
	})
	
	$(document).on('click','.liveStreamSearchTitle',function(event){
		if($('.searchTitleBlock').length > 1){
			searchTitleBlockflag = false;
			event.preventDefault();
			$('.productSearchDropdown').remove()
			$('.videoSearchDropdown').remove()
			$('.memberSearchDropdown').remove()
			
			$('.productSearchBlock').remove()
			$('.memberSearchBlock').remove()
			$('.videoSearchBlock').remove()
			$('.liveStreaSearchBlock').empty()
			
			$('.moreSearchIcon').remove();
			$(this).append('<i class="fas fa-angle-double-left"></i>')
			var inputValue = $.trim($('.searchInput').val());
			$.ajax({
				type: "GET",
				cache: false,
		        contentType: false,
		        processData: false,
				url: "/EEIT/search/type/liveStream/" + inputValue,
				timeout: 600000,
				success: function (data) {
					$.each(data.topFiftyResult, function (idx,data) {
						$('.liveStreaSearchBlock').append($('<a class="dropdown-item" href="/EEIT/LiveStream/'+ data.liveStreamSeqNo +'">'+ data.streamName +'</a>'))
					})
				}
			});
		}
	})
	$(document).on('click','.productSearchTitle',function(event){
		if($('.searchTitleBlock').length > 1){
			searchTitleBlockflag = false;
			event.preventDefault();
			$('.videoSearchDropdown').remove()
			$('.memberSearchDropdown').remove()
			$('.liveStreaSearchDropdown').remove()
			
			$('.productSearchBlock').empty()
			$('.memberSearchBlock').remove()
			$('.videoSearchBlock').remove()
			$('.liveStreaSearchBlock').remove()
			
			$('.moreSearchIcon').remove();
			$(this).append('<i class="fas fa-angle-double-left"></i>')
			var inputValue = $.trim($('.searchInput').val());
			$.ajax({
				type: "GET",
				cache: false,
		        contentType: false,
		        processData: false,
				url: "/EEIT/search/type/productSale/" + inputValue,
				timeout: 600000,
				success: function (data) {
					$.each(data.topFiftyResult, function (idx,data) {
						$('.productSearchBlock').append($('<a class="dropdown-item" href="/EEIT/searchProductIntro/'+ data.productSeqNo +'">'+ data.proName +'</a>'))
					})
				}
			});
		}
	})
	$(document).on('click','.videoSearchTitle',function(event){
		if($('.searchTitleBlock').length > 1){
			searchTitleBlockflag = false;
			event.preventDefault();
			$('.productSearchDropdown').remove()
			$('.memberSearchDropdown').remove()
			$('.liveStreaSearchDropdown').remove()
			
			$('.productSearchBlock').remove()
			$('.memberSearchBlock').remove()
			$('.videoSearchBlock').empty()
			$('.liveStreaSearchBlock').remove()
			
			$('.moreSearchIcon').remove();
			$(this).append('<i class="fas fa-angle-double-left"></i>')
			var inputValue = $.trim($('.searchInput').val());
			$.ajax({
				type: "GET",
				cache: false,
		        contentType: false,
		        processData: false,
				url: "/EEIT/search/type/video/" + inputValue,
				timeout: 600000,
				success: function (data) {
					$.each(data.topFiftyResult, function (idx,data) {
						$('.videoSearchBlock').append($('<a class="dropdown-item" href="/EEIT/videoRoom/'+ data.videoSeqNo +'">'+ data.videoTitle +'</a>'))
					})
				}
			});
		}
	})
	$(document).on('click','.memberSearchTitle',function(event){
		if($('.searchTitleBlock').length > 1){
			searchTitleBlockflag = false;
			event.preventDefault();
			$('.productSearchDropdown').remove()
			$('.videoSearchDropdown').remove()
			$('.liveStreaSearchDropdown').remove()
			
			$('.productSearchBlock').remove()
			$('.memberSearchBlock').empty()
			$('.videoSearchBlock').remove()
			$('.liveStreaSearchBlock').remove()
			
			$('.moreSearchIcon').remove();
			$(this).append('<i class="fas fa-angle-double-left"></i>')
			var inputValue = $.trim($('.searchInput').val());
			$.ajax({
				type: "GET",
				cache: false,
		        contentType: false,
		        processData: false,
				url: "/EEIT/search/type/member/" + inputValue,
				timeout: 600000,
				success: function (data) {
					$.each(data.topFiftyResult, function (idx,data) {
						$('.memberSearchBlock').append($('<a class="dropdown-item" href="/EEIT/profile/'+ data.account +'">'+ data.account +'</a>'))
					})
				}
			});
		}
	})
	
	
})