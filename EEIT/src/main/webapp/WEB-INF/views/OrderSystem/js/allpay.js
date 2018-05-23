
$(document).ready(function() {	
	var seqno = $('#thisOrder').val();
//	alert(account)
//歐付寶付款
	  $('#allpay').click(function () {
		  var account = $('#catch-account').val();
//		  alert(account)
          $.ajax({
              url: '/EEIT/allpay/checkout/'+seqno,
              type: 'POST',
             
              success: function (response) {
					$('#response').html(response);
              },
              error: function (e) {
                  console.log(e);
              }
          }); 
	  }); 
	  
})