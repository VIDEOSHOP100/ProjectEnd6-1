<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>商品上架</title>

</head>

<body>

	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
  <div class="container" style="margin-left:50px">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			Live Market 平台 <small></small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="/EEIT">首頁</a></li>
			<li class="breadcrumb-item active">商品上架</li>
		</ol>

		<!-- Image Header -->
		<div class="col-lg-8 mb-4 offset-2">
		<img class="img-fluid rounded mb-4" src="${pageContext.request.contextPath}/getImageTest/product06"
			alt="">
		</div>
		<!-- Contact Form -->
		<!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
		<div class="row" >
			<div class="col-lg-8 mb-4 offset-2">
				<h3>商品上架 *為必填</h3>
				<form:form class="form-group" action="addProduct"
					modelAttribute="productSaleBean" enctype="multipart/form-data"
					method="post">
					<!-- 					----------------------------------------------- -->
					<div class="form-group row">
						<div class="form-group col-lg-6">
							<label>商品名稱: <span style="color: red">*</span></label>
							<form:input type="text" class="form-control" id="proName"
								path="proName" />${param.proName }
							<p class="help-block">${errors.errorIDEmpty}</p>
						</div>

						<div class="form-group col-lg-6">
							<label>商品價格: <span style="color: red">*</span></label>
							<form:input type="text" class="form-control" id="proPrice"
								path="proPrice" />${param.proPrice}
						</div>
					</div>
					<!-- ----------------------------------------------- -->
					<div class="form-group row">
						<div class="form-group col-lg-6">

							<label>數量: <span style="color: red">*</span></label>
							<form:input type="text" class="form-control" id="proPcs"
								path="proPcs" />
							<div class="help-block">${errors.errPicture}</div>


						</div>
						<!-- 						<div class="form-group col-lg-6"> -->

						<!-- 							<label>商品品牌: <span style="color: red">*</span></label> -->
						<%-- 							<form:input type="text" class="form-control" id="proBrand" --%>
						<%-- 								path="proBrand" />${param.proBrand} --%>
						<%-- 							<p class="help-block">${errors.errorIDEmpty}</p> --%>
						<!-- 						</div> -->
						<div class="form-group col-lg-6">
							<label>商品新舊程度: <span style="color: red">*</span></label>
							<form:select class="form-control" id="proStatus" path="proStatus">
								<form:option value="1">全新</form:option>
								<form:option value="2">九成新</form:option>
								<form:option value="3">二手</form:option>
							</form:select>
						</div>
					</div>
					<!------------------------------------------------- -->
<!-- 					<div class="form-group row"> -->
					
<!-- 						<div class="form-group col-lg-6"> -->
<!-- 							<label>商品新舊程度: <span style="color: red">*</span></label> -->
<%-- 							<form:select class="form-control" id="proStatus" path="proStatus"> --%>
<%-- 								<form:option value="1">全新</form:option> --%>
<%-- 								<form:option value="2">九成新</form:option> --%>
<%-- 								<form:option value="3">二手</form:option> --%>
<%-- 							</form:select> --%>
<!-- 						</div> -->
<!-- 					</div> -->
					<!------------------------------------------------- -->
					<div class="control-group form-group">
						<div class="controls">
							<label>商品分類: <span style="color: red">*</span></label>
							<form:select class="form-control" id="proCategorySeqNo"
								path="proCategorySeqNo">
								<form:option value="1">3C</form:option>
								<form:option value="2">通訊</form:option>
								<form:option value="3">數位周邊</form:option>
								<form:option value="4">生活</form:option>
								<form:option value="5">日用</form:option>
								<form:option value="6">食品</form:option>
								<form:option value="7">戶外</form:option>
								<form:option value="8">時尚</form:option>
								<form:option value="9">美妝</form:option>
								<form:option value="10">書店</form:option>
							</form:select>
						</div>
					</div>
					<!-- ----------------------------------------------- -->


					<div class="control-group form-group">
						<div class="controls">
							<label>商品付款方式: <span style="color: red">*</span></label>
							<form:select class="form-control" id="proPayTypeSeqNo"
								path="proPayTypeSeqNo">
								<form:option value="1">WebATM</form:option>
								<form:option value="2">信用卡付款</form:option>
								<form:option value="3">ATM轉帳</form:option>
								<form:option value="4">線上支付(歐付寶)</form:option>
								<form:option value="5">貨到付款</form:option>
							</form:select>
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>商品照片: <span style="color: red">*</span></label>
							<form:input type="file" class="form-control" id="picFile"
								path="picFile" />
							<div class="help-block">${errors.errPicture}</div>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>商品運送方式: <span style="color: red">*</span></label>
							<form:select class="form-control" id="proTransSeqNo"
								path="proTransSeqNo">
								<form:option value="1">包裹郵寄</form:option>
								<form:option value="2">7-11店到店</form:option>
								<form:option value="3">Fami店到店</form:option>
								<form:option value="4">黑貓宅配</form:option>
								<form:option value="5">面交</form:option>
							</form:select>
						</div>
					</div>
					<!-- 					<div class="control-group form-group"> -->
					<!-- 						<div class="controls"> -->
					<!-- 							<label>商品體積: <span style="color: red">*</span>(單位 m ex:0.2m x  0.3m  x  0.3m )</label> -->
					<%-- 							<form:input type="text" class="form-control" id="proVolume" --%>
					<%-- 								path="proVolume"/> --%>
					<%-- 							<div class="help-block">${errors.errPicture}</div> --%>
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="control-group form-group"> -->
					<!-- 						<div class="controls"> -->
					<!-- 							<label>商品重量: <span style="color: red">*</span>   (單位kg)</label> -->
					<%-- 							<form:input type="text" class="form-control" id="proWeight" --%>
					<%-- 								path="proWeight"/> --%>
					<%-- 							<div class="help-block">${errors.errPicture}</div> --%>
					<!-- 						</div> -->
					<!-- 					</div> -->
					<div class="control-group form-group">
						<div class="controls">
							<label>商品介紹: <span style="color: red">*</span></label>
							<form:textarea class="form-control" rows="5" path="proDescription" />${param.proDescription}
							<p class="help-block"></p>
						</div>
					</div>

					<div class="control-group form-group">
						<div class="controls">
							<label>購買廣告 增加曝光率:</label>
							<form:select class="form-control" id="proAdverSeqNo"
								path="proAdverSeqNo">
								<form:option value="0">無廣告(0元)</form:option>
								<form:option value="1">鑽石廣告(30天 188元)</form:option>
								<form:option value="2">白金廣告(15天 100元)</form:option>
								<form:option value="3">黃金廣告(7天 60元)</form:option>
								<form:option value="4">銀牌廣告(3天 30元)</form:option>
								<form:option value="5">銅牌廣告(1天 20元)</form:option>
							</form:select>
						</div>
					</div>
					<form:input type="hidden" class="form-control" id="account"
						path="account" value="${LoginOK.account}" />
					<!-- For success/fail messages -->
					
					<input type="submit" class="btn btn-primary" id="sendMessageButton"
						value="submit" />
						
				    
					</form:form>
			</div>

		</div>

	</div>



</body>
<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</html>
