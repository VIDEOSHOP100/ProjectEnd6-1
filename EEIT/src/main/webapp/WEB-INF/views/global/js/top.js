$(document).ready(function() {
	$('#regAcc').blur(
		function() {
			var inputAccount = $('#regAcc').val();
			if((inputAccount).trim()==0){
				$.ajax({
				url : "/EEIT/checkAccountDuplicate",
				type : "POST",
				data : {account : inputAccount},
				success : function(result) {
					$('#regAcc').popover('show');
					if (result.result == true) {
						$('#accountCheck').text("帳號重複")
							.removeClass("alert alert-success")
							.addClass("alert alert-danger");
					} else {
					$('#accountCheck').text("帳號可用")
						.removeClass("alert alert-danger")
						.addClass("alert alert-success");
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
	
	
	
			
			
	$('#modalLoginButton').click(checkAccPwd);
			
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
				if(checkResult == true){
					$('#loginForm').submit();
				}else{
					$('#loginErrMsg').html(
						'<div class="p-2 mb-2 bg-warning text-dark rounded">帳號或密碼錯誤!</div>');
				}
			},
			error : function(e) {
				console.log("ERROR : ", e);
				alert(e);
			}
			
		})
		
	
	}
//	---------------------------------機器人驗證按鈕---------------------------------
	
		
	
	
	
	
	
	
	
})