<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增常見問題</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<div class="container" style="margin-left: 50px">
		<!-- Page Content -->
		<div class="container">

			<!-- Page Heading/Breadcrumbs -->
			<h1 class="mt-4 mb-3">
				新增常見問題 <small></small>
			</h1>
			
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}">首頁</a></li>
			<li class="breadcrumb-item active">新增常見問題</li>
		</ol>

			<div class="row">
				<div class="col-lg-12 mb-4">
				
					<form:form id="myForm" class = "form-row" name="myForm" 
					action="/EEIT/QuestionList" modelAttribute="questionListBean" method="POST">
<!-- 						<div class="control-group form-group"> -->
<!-- 							<div class="controls"> -->
									<div class="control-group form-group col-md-6 offset-3">
										<label for="questionListTitle">問題標題</label>
										<form:input path="questionListTitle" type="text"
											name="questionListTitle" id="questionListTitle" class="form-control" />
									</div>
									<div class="control-group form-group col-md-6 offset-3">
										<label for="questionListArticle">問題內容</label>
										<form:input border="1" width="400px"
											path="questionListArticle" type="text"
											name="questionListArticle" id="questionListArticle" value=""
											class="form-control" />
									</div>
									<div class="control-group form-group col-md-6 offset-3">
										<label for="managerId">管理員帳號</label>
										<form:input path="managerId" type="text" name="managerId"
											id="managerId" value=""
											class="form-control" />
									</div>
									<div class="control-group form-group col-md-6 offset-3">
										<label for="questionListType">問題類型</label>
										<form:select id="TypeList" path="questionListType" class="form-control">
											<form:option value="1">帳號問題</form:option>
											<form:option value="2">密碼與登入</form:option>
											<form:option value="3">建立帳號或刪除帳號</form:option>
											<form:option value="4">商品交易</form:option>
											<form:option value="5">直播拍賣</form:option>
											<form:option value="6">影片上傳</form:option>
										</form:select>
									</div>
<!-- 							</div> -->
<!-- 						</div> -->
								
					
				</div>
			</div>
			<div class="row">
									<div class="control-group form-group col-md-6 offset-3 ">
										<input class="btn btn-primary btn-lg btn-block" type="submit" value="送出">
									</div>
								</div>
				</form:form>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp"%>
</body>
</html>