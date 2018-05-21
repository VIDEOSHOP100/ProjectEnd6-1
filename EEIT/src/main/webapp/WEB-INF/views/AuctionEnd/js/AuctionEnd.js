
$(document).ready(function() {	
	var account = $('#catch-account').val();
//	alert(account)
//歐付寶付款
	  $('#allPay').click(function () {
		  var account = $('#catch-account').val();
//		  alert(account)
          $.ajax({
              url: '/EEIT/frontEnd/aioCheckOut/aioCheckOutALL/'+account,
              type: 'POST',
              //enctype: "multipart/form-data",
              //contentType : false,
              //processData : false,
              //dataType:"json",
              success: function (responce) {
					$('#responce').html(responce);
              },
              error: function (e) {
                  console.log(e);
              }
          }); 
	  }); 
	  
})