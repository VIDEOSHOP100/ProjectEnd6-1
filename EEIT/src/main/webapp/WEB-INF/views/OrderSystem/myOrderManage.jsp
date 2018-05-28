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
<title>訂單管理頁面</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<style>

#dialog {
	width: 1000px;
	height: 200px;
}

</style>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<!-- Page Content -->
  <div class="container" style="margin-left:50px">

		<!-- Portfolio Item Heading -->
		<h1 class="my-4 account">
			${getMemberBean.account}你好<small></small>
		</h1>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">首頁</a></li>
			<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/goMarketHomePage">超級商城</a></li>
			<li class="breadcrumb-item active">訂單管理</li>
		</ol>
		<!-- Portfolio Item Row -->
		<div class="">
			<div class="card">
				<div class="card-header">我的訂單管理</div>
				<div class="card-body">
			
			
					<!-- 每頁不同的內容從這裡開始 -->
					<table id="" class="table table-condensed">
						<thead>
							<tr>
								<th></th>
								<th>訂單商品清單</th>
								<th>訂單編號</th>
								<th>訂單付款方式</th>
								<th>訂單金額</th>
								<th>訂單日期</th>
								<th>訂單狀態</th>
								<th>訂單補印</th>
							</tr>
						</thead>


						<tbody class="tbodyOutside">

							<c:set var="total" value="0.0" />
							<c:forEach var="xxx" items="${orderlists}">
								<tr class="trkill">
									<td></td>
									<td><i class="far fa-caret-square-down fa-2x product"></i></td>									
									<td><h5>${xxx.orderSeqNo}</h5></td>
									<td class="puthere">${xxx.howToPay}</td>
									<td>NT${xxx.orderTotalPrice}</td>
									<td>${xxx.orderDateTime}</td>
									<td>${xxx.transorderStatus}
									<c:if test="${xxx.orderStatus == 1}">
									<i class="fab fa-amazon-pay allpay"></i>
									</c:if>
								
									
									</td>
									<td><a href="${pageContext.request.contextPath}/getPdfFile/pdf/${xxx.orderSeqNo}"><i class="fas fa-cloud-download-alt"></i></a></td>
								
								</tr>
							</c:forEach>
						
						</tbody>
						<tfoot>
							<tr class="success">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
					<br>
					<div id="response"></div>
<!-- 					toggler --------------------------------------------------------------->
		<div id="dialog" title="訂單明細">
		<table>
			<tr>
								<th>訂單商品清單</th>
								<th>訂單編號</th>
								<th>訂單付款方式</th>
								<th>訂單金額</th>
								<th>訂單日期</th>
								<th>訂單狀態</th>
								<th></th>
	</tr>
		</table>

</div>
<!-- 					toggler --------------------------------------------------------------->
					<!-- 每頁不同的內容從這裡開始 -->
					<%-- 					<h4>感謝您的訂購</h4><h2><a href="${pageContext.request.contextPath}/getPdfFile/pdf/${readyforpay.orderSeqNo}">訂單列印</a></h2> --%>
				</div>
			</div>
		</div>

		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="<c:url value='/OrderSystem/js/orderaddr.js'/> "></script>
		<script src="<c:url value='/OrderSystem/js/managepro.js'/> "></script>
		<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>
</html>