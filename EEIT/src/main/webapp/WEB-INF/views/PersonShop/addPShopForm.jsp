<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增商店頁面</title>
   <!-- Bootstrap core CSS -->
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
</head>
<body>
		<h4>如果要賣東西的話  ，  就要新增商店首頁喔</h4>

	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			新增個人商店~ <small></small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="">Home</a></li>
			<li class="breadcrumb-item active">Contact</li>
		</ol>

		<div class="row">
			<div class="col-lg-8 mb-4">
				<h3>${LoginOK.nickname}您好~~，選擇你的商店風格</h3>
				<form:form action="addPersonShop" modelAttribute="PersonShopBean" enctype="multipart/form-data" method="post">
					<form:input type="hidden" class="form-control" id="account" path="account" value="${LoginOK.account}"/>
					<div class="control-group form-group">
						<div class="controls">
							<label>ShopName/商店名稱:<span style="color: red">*</span></label>
							<!--                 <input type="text" class="form-control" id="topic"  name="topic" > -->
							<form:input type="text" class="form-control" id="PersonShopName" path="PersonShopName"
								value="${param.PersonShopName}"/>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>ShopCover/商店封面照片:</label> <form:input type="file" class="form-control"
								id="PersonShopFile" path="PersonShopFile"/>
							<div class="help-block"></div>
						</div>
					</div>
				
					<div class="control-group form-group">
						<div class="controls">
							<label>Introduction/商店簡介<span style="color: red">*</span></label>
							<form:textarea class="form-control" path="PersonShopDescription"/>${param.PersonShopDescription}
							<p class="help-block"></p>
						</div>
					</div>

				
			
					<!--<div id="success"></div> -->
					<!-- For success/fail messages -->
					<input type="submit" class="btn btn-primary" id="sendMessageButton"
						 value="submit" />
				</form:form>
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<!-- Footer -->
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2018</p>
	</div>
	</footer>
	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value='/global/vendor/jquery/jquery.min.js'/> "></script>
	<script
		src="<c:url value='/global/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script>

	<!-- Contact form JavaScript -->
	<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<script src="<c:url value='/global/js/jqBootstrapValidation.js'/> "></script>
	<!--     <script src="js/contact_me.js"></script> -->


</body>
</html>