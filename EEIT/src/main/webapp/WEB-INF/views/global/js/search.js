/**
 * 
 */

$(document).ready(function() {
	$(document).on('keyup','.searchInput',function(){
		var inputValue = $('.searchInput').val();
		alert(inputValue);
		$.ajax({
			type: "GET",
			cache: false,
	        contentType: false,
	        processData: false,
			url: "/EEIT/search/" + inputValue,
			timeout: 600000,
			success: function (data) {
				alert('OK');
				console.log(data.videoBeanList)
				console.log(data.productSaleBeanList)
				console.log(data.inputLiveStreamTimeBeanList)
				console.log(data.memberBeanList)
				$.each(data.videoBeanList, function (idx,data) {
					$('.videoSearchDropdown').after($('<a class="dropdown-item" href="">'+ data.videoTitle +'</a>'))
				})
				$.each(data.productSaleBeanList, function (idx,data) {
					$('.productSearchDropdown').after($('<a class="dropdown-item" href="">'+ data.proName +'</a>'))
				})
				$.each(data.inputLiveStreamTimeBeanList, function (idx,data) {
					$('.liveStreaSearchmDropdown').after($('<a class="dropdown-item" href="">'+ data.streamName +'</a>'))
				})
				$.each(data.memberBeanList, function (idx,data) {
					$('.memberSearchDropdown').after($('<a class="dropdown-item" href="">'+ data.account +'</a>'))
				})
				$('.diplaySearchResult').addClass('show')
			}
		});
	})
})