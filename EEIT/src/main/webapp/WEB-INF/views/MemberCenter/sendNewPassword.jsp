<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘記密碼</title>
<style type="text/css">
.newPassBox{

border:1px #DDDDDD solid

}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>

	<div class="container" style="margin-left:50px">
 
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">忘記密碼</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}">首頁</a></li>
			<li class="breadcrumb-item active">忘記密碼</li>
		</ol>

		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row">
			<div class="col-md-6 offset-3 newPassBox mt-5 pt-3">
			<div style="font-size:10em; color:#E63F00" class="text-center">
		<i class="fas fa-unlock-alt"></i>
		</div>
		<hr>
			<p class="text-center">${message}</p>
			<a href="<c:url value='/' />"><button  class="btn btn-primary btn-block">回到首頁</button></a>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>
</html>