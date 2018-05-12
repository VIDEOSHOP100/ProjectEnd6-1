<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD  HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<title>更新會員資料</title>

<!-- Bootstrap core CSS -->
<link
	href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> "
	rel="stylesheet">

<!-- Custom styles for this template -->

</head>

<body>

	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">更新會員資料</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}">Home</a></li>
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}/MemberCenter">會員中心</a></li>
			<li class="breadcrumb-item active">更新會員資料</li>
		</ol>

		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row">
			<div class="col-lg-8 mb-4">
				<form:form action="memberUpdate" modelAttribute="updateMemberBean"
					enctype="multipart/form-data" method="post">
					<div class="control-group form-group">
						<div class="controls">
							<label>account</label>
							<p>${LoginOK.account}</p>
						</div>
					</div>
						<div class="control-group form-group">
						<div class="controls">
							<label>password<span style="color: red">*</span></label>
							<form:input type="password" class="form-control" id="password"
								path="password" />
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>nick name<span style="color: red">*</span></label>
							<form:input type="text" class="form-control" id="nickname"
								path="nickname" value="${LoginOK.nickname}" />
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>first name<span style="color: red">*</span></label>
							<form:input type="text" class="form-control" id="firstname"
								path="firstname" value="${LoginOK.firstname}" />
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>last name<span style="color: red">*</span></label>
							<form:input type="text" class="form-control" id="lastname"
								path="lastname" value="${LoginOK.lastname}" />
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>email<span style="color: red">*</span></label>
							<form:input type="text" class="form-control" id="email"
								path="email" value="${LoginOK.email}" />
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>address<span style="color: red">*</span></label>
							<form:input type="text" class="form-control" id="address"
								path="address" value="${LoginOK.address}" />
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>phone<span style="color: red">*</span></label>
							<form:input type="text" class="form-control" id="phone"
								path="phone" value="${LoginOK.phone}" />
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>照片:</label>
							<form:input type="file" class="form-control" id="photo"
								path="photo" accept="image/*" />
						</div>
					</div>

					<input type="submit" class="btn btn-primary" id="sendMessageButton"
						value="修改資料" />
				</form:form>
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<!-- Footer -->
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; IIITube
			2018</p>
	</div>
	</footer>

	<!-- Contact form JavaScript -->

</body>

</html>