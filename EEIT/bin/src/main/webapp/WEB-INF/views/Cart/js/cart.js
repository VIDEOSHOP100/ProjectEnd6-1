$(document).ready(function() {
					// delete------------------------------------------------------------------------------------------
					var selectedDeletedSeqNo;
					var selectedtbodyOutside;
					$('.kill').click(
							function() {
								selectedDeletedSeqNo = $(this).parents('tr')
										.find('.divOne').text();
								selectedtbodyOutside = $(this).parents('tr');
								$('#productNameDel').empty();
								$('#productNameDel').text(
										$.trim($(this).parents('tr').find(
												'.divTwo').text()))
								$('#seqNoDelete').val(
										$.trim($(this).parents('tr').find(
												'.divThree').text()))
												
								// $(this).parents('tr').remove
							})

					$(function() {
						var dialog, form,

						// From
						// http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
						emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/, name = $("#name"), email = $("#email"), password = $("#password"), allFields = $(
								[]).add(name).add(email).add(password), tips = $(".validateTips");

						function updateTips(t) {
							tips.text(t).addClass("ui-state-highlight");
							setTimeout(function() {
								tips.removeClass("ui-state-highlight", 1500);
							}, 500);
						}

						function checkLength(o, n, min, max) {
							if (o.val().length > max || o.val().length < min) {
								o.addClass("ui-state-error");
								updateTips("Length of " + n
										+ " must be between " + min + " and "
										+ max + ".");
								return false;
							} else {
								return true;
							}
						}

						function checkRegexp(o, regexp, n) {
							if (!(regexp.test(o.val()))) {
								o.addClass("ui-state-error");
								updateTips(n);
								return false;
							} else {
								return true;
							}
						}

						function addUser() {
							var valid = true;
							allFields.removeClass("ui-state-error");

							valid = valid
									&& checkLength(name, "username", 3, 16);
							valid = valid && checkLength(email, "email", 6, 80);
							valid = valid
									&& checkLength(password, "password", 5, 16);

							valid = valid
									&& checkRegexp(
											name,
											/^[a-z]([0-9a-z_\s])+$/i,
											"Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter.");
							valid = valid
									&& checkRegexp(email, emailRegex,
											"eg. ui@jquery.com");
							valid = valid
									&& checkRegexp(password,
											/^([0-9a-zA-Z])+$/,
											"Password field only allow : a-z 0-9");

							if (valid) {
								$("#users tbody").append(
										"<tr>" + "<td>" + name.val() + "</td>"
												+ "<td>" + email.val()
												+ "</td>" + "<td>"
												+ password.val() + "</td>"
												+ "</tr>");
								dialog.dialog("close");
							}
							return valid;
						}

						function deleteproduct() {
							var form = $('#deleteForm')[0];
							var data = new FormData(form);
							
							$.ajax({
								type : "POST",
								cache : false,
								contentType : false,
								processData : false,
								enctype : 'multipart/form-data',
								url : "/EEIT/CartList/put",
								data : data,
								timeout : 600000,
								success : function(data) {
									console.log("SUCCESS : ", data);
									location.reload();
									selectedtbodyOutside.remove();
							
									dialog.dialog("close");
									
								},
								error : function(e) {
									console.log("ERROR : ", e);
									alert(e);
									dialog.dialog("close");
								}

							});

						}

						dialog = $("#delete-dialog-form").dialog({
							autoOpen : false,
							height : 400,
							width : 350,
							modal : true,
							buttons : {
								"確定從購物車刪除" : deleteproduct,
								Cancel : function() {
									dialog.dialog("close");
								}
							},
							close : function() {
								form[0].reset();
								allFields.removeClass("ui-state-error");
							}
						});

						form = dialog.find("form").on("submit",
								function(event) {
									event.preventDefault();
									addUser();
								});

						$(".kill").button().on("click", function() {
							dialog.dialog("open");
						});
					});

				})