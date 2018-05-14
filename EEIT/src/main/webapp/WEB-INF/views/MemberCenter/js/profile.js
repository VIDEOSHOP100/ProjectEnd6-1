$(document).ready(function(){
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
					$('.friend').attr("value",0);

					$('.friend').addClass('btn-success').removeClass('btn-danger');
					
					$('.friend').text('加為好友')
				},
				error: function (e) {
					console.log("ERROR : ", e);
					alert(e);
				} 
			});
		}else if(friendStatus == 0){
			$.ajax({
				type: "POST",
				url: "/EEIT/addfriend",
				data: {account : myaccount, othersideaccount : othersideaccount, friendStatus : 1},
				timeout: 600000,
				success: function (data) {
					$('.friend').attr("value",1);
					$('.friend').addClass('btn-danger').removeClass('btn-success');
					$('.friend').text('取消好友')
				},
				error: function (e) {
					console.log("ERROR : ", e);
					alert(e);
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
			data:{accountTo:othersideaccount , reportTitle:reportTitle , reportContent,reportContent},
			timeout: 600000,
			success:function(){
				$('#memberReportButton').attr("disabled","disabled").text("已檢舉");
				
			},
			error: function (e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		})
		
	})
	
	
	
	
})
