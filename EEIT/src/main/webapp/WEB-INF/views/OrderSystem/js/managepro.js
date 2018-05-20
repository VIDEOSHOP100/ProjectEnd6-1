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
			   
			      $( ".product" ).on( "click", function() {
			    	  var wWidth = $(window).width();
			          var dWidth = wWidth * 0.8;
			          var wHeight = $(window).height();
			          var dHeight = wHeight * 0.8;
			  	    var link = $(this).parents('tr').find('h5').text();
			  		var $dialog = $('<div></div>').append('<p>'+link+'</p>')
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
			  				height: dHeight,
			  				draggable: false,
			                resizable: false
			  			});
			          $dialog.dialog('open');
			          return false;
			          
			          //刻出一個table.....
			          
			          
			      });
			
 
 
 
 
 
 
 });