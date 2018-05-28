<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://www.google.com/recaptcha/api.js"></script>
<title>登入</title>
<style>
.myfooter {
	height: 100px;
	width: 100%;
	position: absolute;
	bottom: 0;
}
</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<div class="container" style="margin-left: 50px">
		<h1 class="mt-4 md-3">登入系統</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}">首頁</a></li>
			<li class="breadcrumb-item active">忘記密碼</li>
		</ol>
		<br> <br> <br> <br> <br>

		<div class="row">

			<div class="col-md-6 offset-3">

				<div class="wrapper">
					<form:form id="loginPageForm" method="POST"
						action="${pageContext.request.contextPath}/login"
						modelAttribute="MemberBean" class="wrapper">
						<form:input class="form-control input-sm" id="logPAcc" type="text"
							path="account" placeholder="account" />
						<br>
						<form:input class="form-control input-sm" id="logPPwd"
							type="password" path="password" placeholder="password" />
						<br>
						<a
							href="${pageContext.request.contextPath}/MemberCenter/forgotPassword">
							<button type="button" class="btn btn-primary">忘記密碼?</button>
						</a>
						<p>${ErrorMessageKey.error}</p>

						<div class="float-right">
							<input type="submit" class="btn btn-primary " value="登入" />

						</div>
					</form:form>
				</div>

			</div>
		</div>

	</div>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp"%>
</body>

</html>