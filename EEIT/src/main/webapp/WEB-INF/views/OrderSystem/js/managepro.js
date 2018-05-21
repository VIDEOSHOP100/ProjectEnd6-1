 $( function() {

 
			    $( "#dialog" ).dialog({
			        autoOpen: false,
			        show: {
			          effect: "fold",
			          duration: 1000
			        },
			        hide: {
			          effect: "fold",
			          duration: 1000
			        }
			      });
			   
			      $(document).on( "click",'.product', function() {
			    	  
			    	  
			    	  
			    	  
			    	  var wWidth = $(window).width();
			          var dWidth = wWidth * 0.8;
			          var wHeight = $(window).height();
			          var dHeight = wHeight * 0.8;
			          var product;
			  	      var link = $(this).parents('tr').find('h5').text();
			          $.ajax({
			        	  type : "GET",
			        	  url : "/EEIT/orderManage/manageOrderProduct/"+link,
			        	  data : 'json',
			        	  success : function(data) {
								console.log("SUCCESS : ", data);
								$.each(data.productlist,function(key, oneproductBean){
								product = '<table id="productTable" class="table table-condensed"><thead>'+
							'<tr><th>訂單商品名稱</th><th>訂單商品數量</th><th>訂單商品單價</th></tr>'+
						'</thead><tbody><tr>'+'<td>'+ oneproductBean.productBean.proName + '</td>'
												+'<td>'+ oneproductBean.productCount + '</td>'
												+'<td>'+ oneproductBean.productPrice + '</td>' +
												'</tr></tbody></table>';
								})
								var $dialog = $('<div></div>').append(product)
						  		.dialog({
						  				autoOpen: false,
						  				 show: {
									          effect: "fold",
									          duration: 1000
									        },
									        hide: {
									          effect: "fold",
									          duration: 1000
									        },
						  				modal: true,
						  				title: "訂單商品明細",
						  				overlay: { opacity: 1.1, background: "red" },
						  				width: dWidth,
						  				
						  				draggable: false,
						                resizable: false
						  			});
						         
						  		 
						          
						  		
						  		
						  		
						  		
						  		$dialog.dialog('open');
						          return false;
						          
						          //刻出一個table.....
						         
							},
							error : function(e) {
								console.log("ERROR : ", e);
								alert(e);
							}
			          
			          })
			  
			  		
			          
			          
			          
			      });
			
 
 
 
 
 
 
 });