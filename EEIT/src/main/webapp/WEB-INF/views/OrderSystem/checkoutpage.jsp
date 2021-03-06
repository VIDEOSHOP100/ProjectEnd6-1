<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>輸入訂單</title>


</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<!-- Portfolio Item Row -->
<div class="container" style="margin-left:50px">
	<!-- Portfolio Item Row -->
	<!--          訂購人資訊  --------------------------------------------------------- -->
	<h1 class="my-4 account">
			${getMemberBean.account}你好<small></small>
		</h1>
	<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">首頁</a></li>
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/goMarketHomePage">超級商城</a></li>
			<li class="breadcrumb-item active">訂單編輯</li>
		</ol>
	<br>
	<div class="container-fluid">
		<section class="container">
		<button class="btn btn-warning Demo">Demo</button>
		<div class="container-page  offset-2">
			<form:form class="form-group" id="orderForm" action="confirmOrder"
				name="orderForm" modelAttribute="orderBean">
				<div class="col-md-6" id="upform">
					<h3 class="dark-grey">訂購人資訊</h3>
					<div class="form-group row">
						<div class="form-group col-lg-6">
							<label>訂購人姓名</label>
							<form:input type="text" path="ordererName" name="upName"
								class="form-control" id="upName" value="${param.ordererName}" />
						</div>

						<div class="form-group col-lg-6">
							 <label  for="upTel">訂購人手機</label>
							<form:input type="text" path="ordererTel" name="upTel"
								class="form-control" id="upTel" value="${param.ordererTel}" />
						</div>

					</div>
					<div class="form-group row">
						<div class="form-group col-lg-6">
							<label>訂購人電話</label>
							<form:input type="text" path="ordererHomeTel" name="upHomeTel"
								class="form-control" id="upHomeTel" value="${param.ordererTel2}" />
						</div>
						<div class="form-group col-lg-6">
							<label>訂購人 Email</label>
							<form:input type="text" path="ordererEmail" name=""
								class="form-control" id="upMail" value="${param.ordererEmail}" />
						</div>
					</div>
					<div class="form-group row">
						<div class="form-group col-lg-3">
							<span>縣/市</span>
							<form:select class="form-control" id="sel1" path="">
								<form:option value="">請選擇</form:option>
								<c:forEach var="itemone" items="${citylist}">
									<form:option id="op1" value="${itemone}">${itemone}</form:option>
								</c:forEach>
							</form:select>
							<span>區域</span>
							<form:select path="" class="form-control" id="sel2">
								<form:option id="op2" value="">請選擇</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group row">
						<div class="form-group col-lg-8">
							<label>訂購人 地址</label>
							<form:input type="text" name="textaddr" class="form-control"
								id="upAddr" path="ordererAddr" value="" />
						</div>
					</div>

					<!-- 				<div class="col-sm-6"> -->
					<!-- 					<input type="checkbox" class="checkbox" />Send notifications to this email -->
					<!-- 				</div>	 -->

					<!--   收貨人資訊          -----------------------------------------------------------------------------------                       -->
				</div>
				<div class="col-md-6">
					<h3 class="dark-grey">收貨人資訊</h3>


					<div class="col-sm-6">
						<form:input type="button" class="btn-success down" path=""
							value="資料同上" />
					</div>

					<div class="form-group row">
						<div class="form-group col-lg-6">
							<label>收貨人姓名</label>
							<form:input type="text" name="" class="form-control"
								id="downName" path="recipientName"
								value="${param.recipientName}" />
						</div>

						<div class="form-group col-lg-6">
							<label>收貨人手機</label>
							<form:input type="text" name="" class="form-control" id="downTel"
								path="recipientTel" value="${param.recipientTel}" />
						</div>
					</div>

					<div class="form-group row">
						<div class="form-group col-lg-6">
							<label>收貨人電話</label>
							<form:input type="text" name="" class="form-control"
								id="downHomeTel" path="recipientHomeTel"
								value="${param.recipientHomeTel}" />
						</div>
						<div class="form-group col-lg-6">
							<label>收貨人 Email</label>
							<form:input type="text" name="" class="form-control"
								id="downEmail" path="recipientEmail"
								value="${param.recipientEmail}" />
						</div>
					</div>
					<div class="form-group row">
						<div class="form-group col-lg-6">
							<label>收貨人 地址</label>
							<form:input type="text" name="" class="form-control"
								id="downAddr" path="recipientAddr"
								value="${param.recipientAddr}" />
						</div>
					</div>
<!-- 					<div class="col-sm-6"> -->
<%-- 						<form:checkbox path="" class="checkbox" value="1" /> --%>
<!-- 						是否同意商城<a href="license">條款</a> -->
<!-- 					</div> -->

				</div>

				<div class="col-md-6">
					<h3 class="dark-grey">付款方式</h3>
					<div class="form-group row">
						<div class="col-sm-6">
							<form:radiobutton id="paywebatm" name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="1" />
							<label for="paywebatm">WebATM</label>
						</div>

						<div class="col-sm-6">
							<form:radiobutton id="paycredit" name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="2" />
							<label for="paycredit">信用卡付款</label>
						</div>

						<div class="col-sm-6">
							<form:radiobutton id="payatm" name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="3" />
							<label for="payatm">ATM轉帳</label>
						</div>

						<div class="col-sm-6">
							<form:radiobutton id="payonline" name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="4" />
						<label for="payonline">線上支付(paypal)</label>
						</div>

						<div class="col-sm-6">
							<form:radiobutton id="payinshop" name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="5" />
							<label for="payinshop">超商取貨付款</label>
						</div>
					</div>

				</div>

				<div class="col-md-6">
					<h3 class="dark-grey">取貨方式</h3>
					<div class="form-group row">
						<div class="col-sm-6">
							<form:radiobutton id="Transportpost" name="ship" class="checkbox"
								path="proTransportSeqNo" value="1" />
						<label for="Transportpost">包裹郵寄</label>
						</div>

						<div class="col-sm-6">
							<form:radiobutton id="Transportseven" name="ship" class="checkbox"
								path="proTransportSeqNo" value="2" />
							<label for="Transportseven">7-11店到店付款</label>
						</div>

						<div class="col-sm-6">
							<form:radiobutton id="TransportFami" name="ship" class="checkbox"
								path="proTransportSeqNo" value="3" />
							<label for="TransportFami">Fami店到店付款</label>
						</div>

						<div class="col-sm-6">
							<form:radiobutton id="Transportblack" name="ship" class="checkbox"
								path="proTransportSeqNo" value="4" />
							<label for="Transportblack">黑貓宅急便</label>
						</div>
					</div>
				</div>
				<button type="submit" class="btn btn-primary" id="confirmorder">送出訂單</button>
			</form:form>
			
			<br>
			<br>
			
			<!-- 			</div> -->
		</div>
		</section>
	</div>
	</div>
		<input type="hidden" id="selectacc" name="selectacc" value="${getMemberBean.account}"/> 
		
	
	<script src="<c:url value='/OrderSystem/js/orderaddr.js'/> "></script>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>

</html>