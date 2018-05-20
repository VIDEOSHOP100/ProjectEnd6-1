/**
 * 
 */

$(document).ready(function() {
	$(document).on('keyup','.searchInput',function(){
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
	$(document).on('blur','.searchInput',function(){
//		sleep(1000);
		if(document.hasFocus()){
			alert("zzzzzzzzz");
			return "";
		}
		
		var t=setTimeout(function(){
			$('.diplaySearchResult').removeClass('show')
		},150)
	})
	$(document).on('click','.liveStreaSearchTitle',function(event){
		event.preventDefault();
		$('.productSearchDropdown').remove()
		$('.videoSearchDropdown').remove()
		$('.memberSearchDropdown').remove()
		
		
		$('.productSearchBlock').remove()
		$('.memberSearchBlock').remove()
		$('.videoSearchBlock').remove()
	})
	$(document).on('click','.productSearchTitle',function(event){
		event.preventDefault();
		$('.memberSearchDropdown').remove()
		$('.videoSearchDropdown').remove()
		$('.liveStreaSearchDropdown').remove()
		
		$('.liveStreaSearchBlock').remove()
		$('.videoSearchBlock').remove()
		$('.memberSearchBlock').remove()
	})
	$(document).on('click','.videoSearchTitle',function(event){
		event.preventDefault();
		$('.liveStreaSearchDropdown').remove()
		$('.memberSearchDropdown').remove()
		$('.productSearchDropdown').remove()
		
		$('.liveStreaSearchBlock').remove()
		$('.memberSearchBlock').remove()
		$('.productSearchBlock').remove()
	})
	$(document).on('click','.memberSearchTitle',function(event){
		event.preventDefault();
		$('.liveStreaSearchDropdown').remove()
		$('.productSearchDropdown').remove()
		$('.videoSearchDropdown').remove()
		
		$('.liveStreaSearchBlock').remove()
		$('.productSearchBlock').remove()
		$('.videoSearchBlock').remove()
	})
})