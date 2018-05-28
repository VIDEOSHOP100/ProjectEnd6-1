<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>意見回饋</title>
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
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<div class="container" style="margin-left:50px">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			聯絡我們 <small></small>
		</h1>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}">首頁</a></li>
			<li class="breadcrumb-item active">聯絡我們</li>
		</ol>
		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row">
			<div class="col-lg-12 mb-4">
				<h3>讓我們知道您的意見~</h3>
				<form:form class="form-row" action="adviceReport"
					modelAttribute="AdviceReportBean" method="post">
					<div class="control-group form-group col-md-6 offset-3">
						<label>項目:</label>
						<!--                 <input type="text" class="form-control" id="topic"  name="topic" > -->
						<form:select class="form-control" id="topic" path="adviceType">
							<form:option value="直播">直播</form:option>
							<form:option value="商城">商城</form:option>
							<form:option value="競標">拍賣</form:option>
							<form:option value="影音">影音</form:option>
						</form:select>
					</div>

					<div class="control-group form-group col-md-6 offset-3">
						<label>Title/標題<span style="color: red">*</span></label>
						<form:input type="text" class="form-control" id="adviceTitle"
							path="adviceTitle" />
					</div>
					<div class="control-group form-group col-md-6 offset-3">
						<label>Messeage/意見內容<span style="color: red">*</span></label>
						<form:textarea class="form-control" path="adviceContent" row="50"
							cols="10" />
					</div>
			</div>
		</div>
		<div class="row">
					 
					<div class="control-group form-group col-md-6 offset-3 ">
						<input type="submit" class="btn btn-primary btn-lg btn-block"
							id="sendMessageButton" value="送出" />
					</div> 
		</div>
				</form:form>

	</div>
		<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<!-- /.row -->
</body>
</html>