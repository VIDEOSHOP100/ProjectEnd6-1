$(document).ready(function() {

	var account=$('#checkaccount').val();
	if(account!=""){
	actionCart();
	}
	
	function actionCart(){

	var myUrl = "/EEIT/CartList/getcartcount/"+account;

		$.ajax({
			type: 'get',
            url: myUrl,
            dataType: 'json',
		
        success: function(data, result) {
        
        	$('#counter').empty(); 
     
        	$('#counter').append(data.productcount);    
    									},//success結束
    	error: function() {
			            alert('error');
			        	  }	
		
			  })
	}
	
})
	
	

	
	
	
