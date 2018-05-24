$(document).ready(function() {
	
	
	$('#regAcc').blur(
		function() {
			var inputAccount = $('#regAcc').val();
			if((inputAccount).trim()!=0){
				$.ajax({
				url : "/EEIT/checkAccountDuplicate",
				type : "POST",
				data : {account : inputAccount},
				success : function(result) {
					
					if (result.result == true) {
						$('#regAcc').grumble(
							{
								text:'帳號重複',
								angle :270,
								distance:100,
								hideAfter: 1000,
							}
						)
					}
					
					else {
					$('#regAcc').grumble(
						{
							text:"帳號可用",
							angle :270,
							distance:100,
							hideAfter: 1000,
							type: 'alt-',
						}
					)
					}
				},
				error : function(e) {
					console.log("ERROR : ", e);
					alert(e);
				}
				})
			};
		})

		
		$('.loginCheck').click(loginCheck);
		
			function loginCheck() {

			var login = $('#navbarDropdownBlog').text();

			if (login == "") {
				alert('請登入');
				$(this).attr("href", "")
				$('#loginButton').trigger("click");
				return false;
			}

		}
			 
//---------------------------------前端登入驗證---------------------------------------
	$(document).on("keyup","#logPwd", function(e){
		
		 if(e.keyCode == 13){
			 console.log(e.keyCode);
			 checkAccPwd();
		 }
	
	})
	

		      
 	{
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
	      
	
function checkAccPwd(){
		
		var logAcc = $('#logAcc').val();
		var logPwd = $('#logPwd').val();
		var botCheckResp = $('#g-recaptcha-response-1').val();

		$.ajax({
			
			type:"POST",
			url:"/EEIT/checkBotAccPwd",
			data:{ botCheckResp:botCheckResp , logAcc:logAcc , logPwd:logPwd},
			success:function(result){
				var checkResult = result.loginCheck;
				var botResult = result.botCheck;
				
				if(checkResult == true && botResult == true){
					$('#loginForm').submit();
				}else if(checkResult == false && botResult == true){
					grecaptcha.reset(widgetId2);
					$('#loginErrMsg').html(
						'<div class="p-2 mb-2 bg-warning text-dark rounded">帳號或密碼錯誤!</div>');
				}else if(botResult == false){
					grecaptcha.reset(widgetId2);
					$('#loginErrMsg').html(
					'<div class="p-2 mb-2 bg-warning text-dark rounded">機器人驗證失敗!</div>');
				}
			},
			error : function(e) {
				console.log("ERROR : ", e);
				alert(e);
			}
			
		})
}	
	
	$('#modalLoginButton').click(checkAccPwd);

	 $('#AllinOneButton').click(function(){
	    	
   	  $('#regAcc').val('jerry');
   	  $('#regPwd').val('12345678');
   	  $('#nickname').val('傑瑞');
   	  $('#firstname').val('張');
   	  $('#lastname').val('傑瑞');
   	  $('#email').val('strike5931@gmail.com');
   	  $('#address').val('台北市大安區復興南路一段390號');
   	  $('#phone').val('0954873548');
   	  $('#birthday').val('1994-06-01');
   	  
     })


 	$('#ban-message').dialog({
 	    autoOpen: false,
 	    show: {
 	        effect: "fold",
 	        duration: 500
 	      },
 	      hide: {
 	        effect: "fold",
 	        duration: 500
 	      }
 	});
		
	 if ($('#ban-message').length){
		 $('#ban-message').dialog({
				height: 300,
				width: 300,
				modal : true,
		 })
		 
		$.ajax({
		
			type:"GET",
			url:"/EEIT/logout",
			
			success:function(){
				$( "#ban-message" ).dialog( "open" );
				
			},
			error : function(e) {
				console.log("ERROR : ", e);
				alert(e);
			}
		
			
			
		})
		
		var dialogClose = $('button.ui-button-icon-only');
		
		 $(document).on('click',dialogClose,function(){
			 location.href="/EEIT/";
		 })
			 
	
		 
		
		
	}

	
})