<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="target" value="${requestScope['javax.servlet.forward.request_uri']}" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache"> 
<meta http-equiv="Expires" content="0"> 
<title>Navigation</title>


  <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer>
    </script>

<!-- <script src="https://www.google.com/recaptcha/api.js"></script> -->
<!--  <script src="https://apis.google.com/js/platform.js" async defer></script> -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 

<!-- Bootstrap core CSS -->
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> "
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
<link href="<c:url value='/global/fragment/css/top.css'/>" rel="stylesheet">

</head>
<body>


	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="<c:url value='/' />">Live Market</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="searchBlock">
				<ul class="navbar-nav ml-auto ">
					<li style="width:500px" class="nav-item dropdown">
						<input type="text" class="form-control searchInput" placeholder="找點什麼...?">
						<div style="width:500px" class="dropdown-menu dropdown-menu-left diplaySearchResult" aria-labelledby="navbarDropdownPortfolio">
							<div class="searchTitleBlock liveStreaSearchDropdown">
								<a class="dropdown-item searchTitle liveStreaSearchTitle">直播</a>
							</div>
							<div class="liveStreaSearchBlock">
							</div>
							<div class="searchTitleBlock productSearchDropdown">
								<a class="dropdown-item searchTitle productSearchTitle">商品</a>
							</div>
							<div class="productSearchBlock">
							</div>
							<div class="searchTitleBlock videoSearchDropdown">
								<a class="dropdown-item searchTitle videoSearchTitle">影片</a>
							</div>
							<div class="videoSearchBlock">
							</div>
							<div class="searchTitleBlock memberSearchDropdown">
								<a class="dropdown-item searchTitle memberSearchTitle">會員</a>
							</div>
							<div class="memberSearchBlock">
							</div>
						</div>
					</li>
					<li class="nav-item">
						<span class="input-group-btn">
							<button class="btn btn-secondary" type="button">Go!</button>
						</span>
					</li>
				</ul>
			</div>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown" >
				<a class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">超級商城</a>
				<div class="dropdown-menu dropdown-menu-right"
						 aria-labelledby="navbarDropdownPortfolio">
				<a class="dropdown-item" href="${pageContext.request.contextPath}/goMarketHomePage">商城首頁</a>
						<c:if test="${!empty LoginOK}">		 
				<a class="dropdown-item" href="${pageContext.request.contextPath}/sale.do">商品上架</a>
				<a class="dropdown-item" href="">我的訂單查詢</a>
				<a class="dropdown-item" href="">追蹤商品查詢</a>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/CartList/getCart/${LoginOK.account}">購物車</a>
						</c:if>
				</div>		
				</li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/LiveStreamHall">直播間</a></li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">影片集錦</a>
					<div class="dropdown-menu dropdown-menu-right"
						 aria-labelledby="navbarDropdownPortfolio">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/videoType">分類影片</a>
						<c:if test="${!empty LoginOK}">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/videoManage">影片管理</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/likeUnlikeVideos">喜歡的影片</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/watchHistory">瀏覽紀錄</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/subscriptionUploader">訂閱上傳者</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/watchLaterVideo">稍後觀看</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/InsertLiveStream">直播管理</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/AuctionEnd">得標管理</a>
						</c:if>
					</div>
				</li>
				<li class="nav-item">

<!-- 				<li class="nav-item"> -->
<%-- 	            <a class="nav-link" href="${pageContext.request.contextPath}/Contact.do">會員中心</a> --%>
<!-- 	          </li> -->
					
			<!-- 	登入前的導覽列 -->
			<c:if test="${empty ManagerLoginOK}">
				<c:if test="${empty LoginOK}">

					<li class="nav-item">
						<button id="regButton" class="btn btn-info" type="button" data-toggle="modal" data-target="#popregister">註冊</button>
					</li>
					<li>&nbsp;</li>
					<li class="nav-item">
						<button id="loginButton" class="btn btn-success" type="button" data-toggle="modal" data-target="#poplogin">登入</button>
					</li>
				</c:if>
				
				
			</c:if>
				
				<c:if test="${! empty ManagerLoginOK}">
					<li class="nav-item">
						<a href="<c:url value='/managerLogout'/>">
            <button id="" class="btn btn-danger float-right">管理員登出</button>
          </a>
					</li>
				</c:if>
				
			<!-- 	登入後的導覽列 -->
			
				<c:if test="${!empty LoginOK}">
	
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle notificatiolink" href="#" 
							id="navbarDropdownPortfolio" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<span class="notificationNone notification">
								<i class="fas fa-exclamation-circle"></i>通知
							</span>
						</a>
						<div style="width:500px" class="dropdown-menu dropdown-menu-right notification-dropdown-menu" aria-labelledby="navbarDropdownPortfolio">
							 <c:if test="${ empty notificationRecordingBeanList}">
							 	<a class="dropdown-item emptyNotification" href="">沒有通知喔!</a>
							 </c:if>
							 <c:if test="${ !empty notificationRecordingBeanList}">
								<c:forEach var="notificationRecordingBean" items="${notificationRecordingBeanList }" >
									<a class="dropdown-item notificationItemLink" href="${pageContext.request.contextPath}/videoRoom/${notificationRecordingBean.eventPK}">
										<div class="notificationItem">
											<img class="notificationItemImage" height="70px" width="30px"	src='${pageContext.request.contextPath}/getImage/member/${notificationRecordingBean.account}'>
											<div class="notificationItemInner">
												<c:set var="string1" value="${notificationRecordingBean.notificationDate}"/>
												<c:set var="string2" value="${fn:substring(string1, 0, 10)}" />
												<p class="notificationItemAccount">${notificationRecordingBean.account}</p> 
												<p class="notificationItemArticle" title="${notificationRecordingBean.notificationArticle}">${notificationRecordingBean.notificationArticle}</p> 
												<p class="notificationItemTime">${string2} </p> 
											</div>
										</div>
									</a>
									
								</c:forEach> 
							 </c:if>
							
						</div>
					</li>

				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle"	href="#" 
					   id="navbarDropdownBlog" data-toggle="dropdown"
					   aria-haspopup="true" aria-expanded="false"><img height="25px" width="25px"
					src='${pageContext.request.contextPath}/getImage/member/${LoginOK.account}'> ${LoginOK.nickname}</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog"> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/profile/${LoginOK.account}">我的個人頁面</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/MemberCenter/memberUpdate">修改會員資料</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/MemberCenter/myFriendList">我的好友</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/MemberCenter/myMessage">我的訊息</a> 
						<a class="dropdown-item" href="${pageContext.request.contextPath}/QuestionList/Main">常見問題</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/MemberCenter/adviceReport">意見回饋</a>
					</div></li>
			 

					<li class="nav-item"><a href="<c:url value='/logout'/>"><button class="btn btn-danger" type="button" >登出</button></a></li>
				</c:if>

			</ul>
		</div>
	</div>
	</nav>
 
	<!-- 	註冊彈窗開始	 -->
<c:if test="${empty LoginOK}">
		
	<div class="modal fade" id="popregister" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">註冊會員</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					

					<form:form  id="register" method="POST" action="${pageContext.request.contextPath}/register" modelAttribute="MemberBean" class="form-row" enctype="multipart/form-data"> 
			 		
			 			<div class="col-md-6 form-group">
			 				<small><label for="regAcc">帳號</label><span style="color: red">*(必填)</span></small>
			 				<form:input id="regAcc" path="account" type="text" class="form-control input-sm" placeholder="account"/>
			 			</div>
 
			 			<div class="col-md-6 form-group">
			 				<small><label for="regPwd">密碼</label><span style="color: red">*</span></small>
			 				<form:input id="regPwd" path="password" type="password" class="form-control input-sm" placeholder="password"/>
			 			</div>
			 			<div class="col-md-12 form-group">
			 				<small><label for="nickname">暱稱</label><span style="color: red">*</span></small>
			 				<form:input path="nickname" id="nickname" type="text" class="form-control input-sm " placeholder="nickname"/>
			 			</div>
			 		 
			 			<div class="col-md-6 form-group">
			 				<small><label for="firstname">姓氏</label><span style="color: red">*</span></small>
			 				<form:input path="firstname" id="firstname" type="text" class="form-control input-sm" placeholder="first name"/>
						</div>
						<div class="col-md-6 form-group"> 
							<small><label for="lastname">名字</label><span style="color: red">*</span></small>
							 <form:input path="lastname" id="lastname" type="text" class="form-control input-sm " placeholder="last name"/>
			 			</div>
							
						
			 			<div class="col-md-6 form-group">
			 				<small><label for="email">電子信箱</label><span style="color: red">*</span></small>
			 				<form:input path="email" id="email" type="email" class="form-control input-sm " placeholder="email"/>
			 			</div>		
						 		
							<div class="col-md-6 form-group">
							<small><label for="address">地址</label><span style="color: red">*</span></small>
			 				<form:input path="address" id="address" type="text" class="form-control input-sm " placeholder="address"/>
			 			</div>
					
						<div class="form-group col-md-6">
							<small><label for="phone">電話號碼</label><span style="color: red">*</span></small>
			 				<form:input path="phone" id="phone" type="text" class="form-control input-sm " placeholder="phone"/>
			 			</div>
					<div class="form-group col-md-6" >
					
					<small><label for="birthday">生日</label><span style="color: red">*</span></small><form:input path="birthday" id="birthday" type="date" class="form-control input-sm"/>
					</div>
						<div class="form-group col-md-6">
					<small><label for="gender">性別</label><span style="color: red">*</span></small>
			 				<form:select path="gender" id="gender" >
								<form:option value="男性"/>	
								<form:option value="女性"/>	
								<form:option value="不明"/>	
							</form:select>
			 			</div>
			 			<div class="form-group col-md-6">
					<small><label for="photo">照片</label><span style="color: red">*</span></small>
					<form:input path="photo" id="photo" type="file"  accept="image/*"/>
					</div>
				<div class="form-group">
				<div id="rec1"></div>
<!-- 					<div class="g-recaptcha" data-sitekey="6LeoQVkUAAAAAFMUIP7AwlaMPIxl-BXGMsx9xaOF"></div> -->
				</div>
				</div>
				<div class="modal-footer">
				<p>${registerErrorMap.Duplicate} ${registerErrorMap.SQL}</p>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">取消</button>
					<input type="submit" class="btn btn-primary" value="註冊"/>
				</div>
					</form:form>
			</div>
		</div>
	</div>
	 
	<!-- 	註冊彈窗結束	 -->



	<!--	登入彈窗開始	 -->

	<div class="modal fade" id="poplogin" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">登入系統</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form:form id="loginForm"  method="POST" action="${pageContext.request.contextPath}/login" modelAttribute="MemberBean" class = "form-row" >
					<div class="form-group col-md-6">
						<small><label for="logAcc">帳號</label></small>
						<form:input class = "form-control input-sm" id="logAcc" type="text" path="account" placeholder="account"/><br>
					</div>
					<div class="form-group col-md-6" >
						<small><label for="logPwd">密碼</label></small>
						<form:input class ="form-control input-sm" id="logPwd" type="password" path="password" placeholder="password"/><br>
					</div>			
					<div class="form-group col-md-12" >	
						<div id="rec2"></div> 
<!-- 						<div class="g-recaptcha" data-sitekey="6LeoQVkUAAAAAFMUIP7AwlaMPIxl-BXGMsx9xaOF"></div> -->
					</div>
					<div class="form-group col-md-6" >
						<a href="${pageContext.request.contextPath}/MemberCenter/forgotPassword"><button  type="button" id="#regButton" class="btn btn-primary">忘記密碼?</button></a>
					</div>
				</div>
				<div class="modal-footer">
					<p id="loginErrMsg">${ErrorMessageKey.error}</p>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
					<button type="button" id="modalLoginButton" class="btn btn-primary">登入</button>
					
						</form:form>
				</div>
			</div>
		</div>
	</div>
</c:if>
	<!--	登入彈窗結束 	--> 

	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value='/global/vendor/jquery/jquery.min.js'/> "></script>
	<script src="<c:url value='/global/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="<c:url value='/global/js/search.js'/> "></script>
	<script src="<c:url value='/global/js/top.js'/> "></script>

	<script>
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
	
	
		function onloadCallback(){
	      
      	if(($('#rec1').val()!= null) || $('#manaLogout').text()!=null ){
        // Renders the HTML element with id 'example1' as a reCAPTCHA widget.
        // The id of the reCAPTCHA widget is assigned to 'widgetId1'.
        widgetId1 = grecaptcha.render(document.getElementById('rec1'), {
          'sitekey' : '6LeoQVkUAAAAAFMUIP7AwlaMPIxl-BXGMsx9xaOF'

        	  
        });
        widgetId2 = grecaptcha.render(document.getElementById('rec2'), {
          'sitekey' : '6LeoQVkUAAAAAFMUIP7AwlaMPIxl-BXGMsx9xaOF'
        });
	
	
      	}
      	
	}
	</script>

	
	<%@ include file="/WEB-INF/views/Cart/carticonLeft.jsp"%>
</body>

</html>