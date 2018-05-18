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
<style type="text/css">
.myfooter {
	height: 100px;
	width: 100%;
	position: absolute;
	bottom: 0;
}
</style>
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
					class="form-row" enctype="multipart/form-data" method="post">
					<div class="form-group col-md-6">
						<div class="controls">
							<label>帳號</label>
							<p>${LoginOK.account}</p>
						</div>
					</div>
					<div class="form-group col-md-6">
						<div class="controls">
							<small><label>密碼<span style="color: red">*</span></label></small>
							<form:input type="password" class="form-control" id="password"
								path="password" />
						</div>
					</div>
					<div class="form-group col-md-12">
						<div class="controls">
							<small><label>暱稱<span style="color: red">*</span></label></small>
							<form:input type="text" class="form-control" id="nickname"
								path="nickname" value="${LoginOK.nickname}" />
						</div>
					</div>

					<div class="form-group col-md-6">
						<div class="controls">
							<small><label>姓氏<span style="color: red">*</span></label></small>
							<form:input type="text" class="form-control" id="firstname"
								path="firstname" value="${LoginOK.firstname}" />
						</div>
					</div>

					<div class="form-group col-md-6">
						<div class="controls">
							<small><label>名字<span style="color: red">*</span></label></small>
							<form:input type="text" class="form-control" id="lastname"
								path="lastname" value="${LoginOK.lastname}" />
						</div>
					</div>

					<div class="form-group col-md-6">
						<div class="controls">
							<small><label>電子郵件<span style="color: red">*</span></label></small>
							<form:input type="text" class="form-control" id="email"
								path="email" value="${LoginOK.email}" />
						</div>
					</div>

					<div class="form-group col-md-6">
						<div class="controls">
							<small><label>地址<span style="color: red">*</span></label></small>
							<form:input type="text" class="form-control" id="address"
								path="address" value="${LoginOK.address}" />
						</div>
					</div>

					<div class="form-group col-md-6">
						<div class="controls">
							<small><label>電話<span style="color: red">*</span></label></small>
							<form:input type="text" class="form-control" id="phone"
								path="phone" value="${LoginOK.phone}" />
						</div>
					</div>

					<div class="form-group col-md-6">
						<div class="controls">
							<small><label>照片:</label></small>
							<form:input type="file" class="form-control" id="photo"
								path="photo" accept="image/*" />
						</div>
					</div>

					<input type="submit" class="btn btn-primary" id="sendMessageButton"
						value="修改資料" />
				</form:form>
			</div>

			<div class="col-lg-4 mb-4">
				<div class="row">
					<div class="col-lg-3"></div>
					<div class="col-lg-4">
						<img height="240px" width="240px" class="memberPhoto"
							src='${pageContext.request.contextPath}/getImage/member/${LoginOK.account}'>
					</div>
				</div>
			</div> 

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<!-- Footer -->

	<%@ include file="/WEB-INF/views/global/fragment/footer.jsp"%>

	<!-- Contact form JavaScript -->

</body>

</html>