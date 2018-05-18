<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>首頁</title>
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
<link href="<c:url value='/global/css/index.css'/>" rel="stylesheet">
<style> 
.videoTitle {
	width: 100%;
	height: 40px;
	overflow: hidden;
	/*  		border : solid 1px red;  */
}

.videoBlock {
	line-height: 0px;
	margin: 0px -10px;
	/* 		width: 50px; */
	/*  		border : solid 1px red ;  */
}

.videoBlockInner {
	/* 		border: blue solid 1px; */
	/* 		font-size: 7px; */
	/* 		text-align:left; */
	
}

.videoBlock a {
	color: black;
}

.videoBlock a:hover {
	color: black;
	text-decoration: none;
}

.videoSmallWords {
	font-size: 7px;
}
</style>
</head>

<body>

<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
	<input value="${LoginOK.account}" class="account" type="hidden">
	
	<div style="margin:'0px auto';" >
		<c:if test="${empty LoginOK}">

					<li class="nav-item">
						<button class="btn btn-info" type="button" data-toggle="modal" data-target="#popregister">註冊</button>
					</li>
					<li>&nbsp;</li>
					<li class="nav-item">
						<button class="btn btn-success" type="button" data-toggle="modal" data-target="#poplogin">登入</button>
					</li>
		</c:if>
	</div>	
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2018</p>
	</div>
	</footer>
	
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	
	
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	
	<script src="<c:url value='/global/js/index.js'/> "></script>

</body>

</html>