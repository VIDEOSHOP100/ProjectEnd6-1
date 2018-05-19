		$(document).ready(function() {
			
			var product = $("#productSeqNo").val();
			var account = $("#account").val();
			$('.buy').click(function() {
				var count = $("#productCount").val();				
				if(count==0)					
					alert("請選擇數量");
				else
				$.ajax({

					type : 'POST',
					url : "/EEIT/searchProductIntro/buy/" + product,
					data : {
						account : account,
						product : product,
						count : count
					},
					timeout : 600000,
					success : function(data,result) {
						alert("已加入購物車");
						location.reload();  
					},
					error : function(e) {

						console.log("ERROR : ", e);
						alert(e);
					}
				});
				
				
			});
		})
	