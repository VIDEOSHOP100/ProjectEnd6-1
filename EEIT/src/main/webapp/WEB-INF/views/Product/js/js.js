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
			
			var $dialogCheck = $('<div></div>').append('庫存數量不足!請重新選擇')
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
						
						if (data.successMessage == 1){
						
						$('.cartbar').remove;
						//.ajax
						$.ajax({
							type : 'GET',
							url : "/EEIT/CartList/getCartDetailList",
							dataType : 'json',
							success : 
							function(data,result) {
												var product;
												var docFrag = $(document.createDocumentFragment());
													$.each(data.cartDetailList,function(key, oneproductBean){
														product = '<div class="sidebar-name cart">'+
														'<button type="button" class="sidebarUserButton sidebarUserButtonNone">'+
														'<img width="40" height="40" src="/EEIT/getImage/Product/'+oneproductBean.productSeqNo+'">'+
														'<p class="shoppingCartProductName">'+oneproductBean.productbean.proName+'</p><p class="shoppingCartProductDescription"><small class="subtitle">'+
														oneproductBean.productbean.proDescription+'</small></p><span  class="shoppingCartProductNumber">'+
														oneproductBean.productCount+'</span></button></div>';
														docFrag.append(product);	
													})
														$('.cartoutside').html(docFrag) ;
							},	
							error : function(e) {

								console.log("ERROR : ", e);
							
							}
						})}
						else if(data.errorMessage == 2){
							$dialogCheck.dialog('open');						
						}
							
					},
					error : function(e) {

						console.log("ERROR : ", e);
						alert(e);
					}
				});
			});//直接購買事件結束
			
			//bob相關商品
			
			
			
			
			
			
			
		})
	