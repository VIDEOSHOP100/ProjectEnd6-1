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
<title>Insert title here</title>
<link
	href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> "
	rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/> "
	rel="stylesheet">

</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<!-- Portfolio Item Row -->
<body>

	<!-- Portfolio Item Row -->


	<!--          訂購人資訊  --------------------------------------------------------- -->
	<br>
	<br>
	<div class="container-fluid">
		<section class="container">
		<div class="container-page">
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
							<label>訂購人手機</label>
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
					<div class="col-sm-6">
						<form:checkbox path="" class="checkbox" value="1" />
						是否同意商城<a href="license">條款</a>
					</div>

				</div>

				<div class="col-md-6">
					<h3 class="dark-grey">付款方式</h3>
					<div class="form-group row">
						<div class="col-sm-6">
							<form:radiobutton name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="1" />
							WebATM
						</div>

						<div class="col-sm-6">
							<form:radiobutton name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="2" />
							信用卡付款
						</div>

						<div class="col-sm-6">
							<form:radiobutton name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="3" />
							ATM轉帳
						</div>

						<div class="col-sm-6">
							<form:radiobutton name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="4" />
							線上支付(paypal)
						</div>

						<div class="col-sm-6">
							<form:radiobutton name="pay" class="checkbox"
								path="proPayTypeSeqNo" value="5" />
							超商取貨付款
						</div>
					</div>

				</div>

				<div class="col-md-6">
					<h3 class="dark-grey">取貨方式</h3>
					<div class="form-group row">
						<div class="col-sm-6">
							<form:radiobutton name="ship" class="checkbox"
								path="proTransportSeqNo" value="1" />
							包裹郵寄
						</div>

						<div class="col-sm-6">
							<form:radiobutton name="ship" class="checkbox"
								path="proTransportSeqNo" value="2" />
							7-11店到店付款
						</div>

						<div class="col-sm-6">
							<form:radiobutton name="ship" class="checkbox"
								path="proTransportSeqNo" value="3" />
							Fami店到店付款
						</div>

						<div class="col-sm-6">
							<form:radiobutton name="ship" class="checkbox"
								path="proTransportSeqNo" value="4" />
							黑貓宅急便
						</div>
					</div>
				</div>

				<button type="submit" class="btn btn-primary" id="confirmorder">送出訂單</button>
			</form:form>
			<br>
			<br>
			<button type="button" class="btn btn-primary">
				<a href="${pageContext.request.contextPath}/gotoseven">送出711訂單</a>
			</button>
			<!-- 			</div> -->
		</div>
		</section>
	</div>
		<input type="hidden" id="selectacc" name="selectacc" value="${getMemberBean.account}"/> 



	<script src="<c:url value='/OrderSystem/js/order.js'/> "></script>
</body>

</html>