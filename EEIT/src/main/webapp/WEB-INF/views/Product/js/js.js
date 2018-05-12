$(document).ready( function(){
	var product = $("#productSeqNo").val();
	var count = $("#productCount").val();
	var account = $("#account").val();
	console.log(product);
	console.log(count);
	console.log(account);
	$('.buy').click(function(){
		$.ajax({
				type:'POST',
				url:"CartList/buy/"+product,
				data: {account : myaccount, product : mychoose, count : count},
				timeout: 600000,
				
				success: function (data) {
					alert("success");
				},
				error: function (e) {
					console.log("ERROR : ", e);
					alert(e);
				} 
		})
	})
})