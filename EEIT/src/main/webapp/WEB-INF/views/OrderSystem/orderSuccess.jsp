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
<title>訂單頁面</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link
	href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> "
	rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/> "
	rel="stylesheet">
<link href="<c:url value='/videoManage/css/videoManage.css'/> "
	rel="stylesheet">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<!-- Page Content -->
	<div class="container">

		<!-- Portfolio Item Heading -->
		<h1 class="my-4 account">
			${getMemberBean.account}你好<small></small>
		</h1>

		<!-- Portfolio Item Row -->
		<div class="">
			<div class="card">
				<div class="card-header">客戶消費明細</div>
				<div class="card-body">
					<button id="buttonAdd" type="button" class="btn btn-success">
						<i class="fas fa-cart-plus"></i>
					</button>
					<h6>訂單編號  : ${readyforpay.orderSeqNo}</h6>
					<h6>銷售日期  : ${readyforpay.orderTime}</h6>
					<!-- 每頁不同的內容從這裡開始 -->
					<table id="productTable" class="table table-condensed">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th>商品名稱</th>
								<th>數量</th>
								<th>單價</th>
								<th>總價</th>
								<th></th>
							</tr>
						</thead>


						<tbody class="tbodyOutside">
									
							<c:set var="total" value="0.0" />
							<c:forEach var="xxx" items="${readyforpaypro}">
								<tr class="trkill">
									<td></td>
									<td></td>
									<td></td>
									<td><h5>${xxx.productBean.proName}</h5></td>
									<td>${xxx.productCount }</td>
									<td>NT ${xxx.productPrice}</td>
									<td>NT ${xxx.productTotal}</td>
<%-- 									<c:set var="total" --%>
<%-- 										value="${total + xxx.productCount * xxx.productbean.productPrice}" /> --%>
									<td>
<!-- 										<button id="buttonAdd" type="button" -->
<!-- 											class="btn btn-danger kill"> -->
<!-- 											<i class="far fa-trash-alt"></i> -->
<!-- 										</button> -->
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr class="success">
								<td></td>
								<td></td>
								<td></td>
								<td>訂單總價</td>
								<td></td>
								<td></td>
								<td>NT <fmt:formatNumber value="${readyforpay.orderTotalPrice}" pattern="#,##0" /></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
					<br>
					
						<!-- 每頁不同的內容從這裡開始 -->
					<h4>感謝您的訂購</h4>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script>
	
	

</body>
</html>