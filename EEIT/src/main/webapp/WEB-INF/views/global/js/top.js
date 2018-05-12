$(document).ready(
		function() {

			$('#regAcc').blur(
					function() {

						var inputAccount = $('#regAcc').val();

						$.ajax({
							url : "/EEIT/checkAccountDuplicate",
							type : "POST",
							data : {
								account : inputAccount
							},
							success : function(result) {

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

                    })
                    
			$('.loginCheck').click(function(event) {
				
				var login = $('#navbarDropdownBlog').text();

				if(login == ""){
					alert('請登入');
                    $(this).attr("href" , "")
                    $('#loginButton').trigger("click");
                    return false;
				}else{
                }
                
			})

		})
