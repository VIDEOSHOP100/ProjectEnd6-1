		$(document).ready(function() {
			var $dialog = $('<div></div>').append('請選擇數量')
			.dialog({
			      autoOpen: false,
			      show: {
			        effect: "fold",
			        duration: 300
			      },
			      hide: {
			        effect: "fold",
			        duration: 300
			      },
	  				title: "小提醒",
	  				overlay: { opacity: 1.1, background: "red" },
	  				draggable: false,
	                resizable: false,
			    });
			
			var $dialogCheck = $('<div></div>').append('加入購物車!')
			.dialog({
			      autoOpen: false,
			      show: {
			        effect: "blind",
			        duration: 300
			      },
			      hide: {
			        effect: "fold",
			        duration: 300
			      },
	  				title: "小提醒",
	  				overlay: { opacity: 1.1, background: "red" },
	  				draggable: false,
	                resizable: false,
			    });
		
			var product = $("#productSeqNo").val();
			var account = $("#account").val();
			$('.buy').click(function() {
				var count = $("#productCount").val();				
				if(count==0)					
					$dialog.dialog('open');
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
						
						$dialogCheck.dialog('open');
						
						setTimeout(function(){location.reload(); }, 1200);
						  
					},
					error : function(e) {

						console.log("ERROR : ", e);
						alert(e);
					}
				});
			});//直接購買事件結束
			
			//bob相關商品
			
			
			
			
			
			
			
		})
	