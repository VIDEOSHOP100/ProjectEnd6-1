<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*, java.util.*, java.text.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>購物車頁面</title>

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
				<div class="card-header">${getMemberBean.account}的購物清單</div>
				<div class="card-body">
					<button id="buttonAdd" type="button" class="btn btn-success">
						<i class="fas fa-cart-plus"></i>
					</button>
					<!-- 每頁不同的內容從這裡開始 -->
					<table id="productTable" class="table table-condensed">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th>&nbsp;&nbsp;商品圖</th>
								<th>商品名稱</th>
								<th>數量</th>
								<th>單價</th>
								<th>總價</th>
								<th></th>
							</tr>
						</thead>


						<tbody class="tbodyOutside">

							<c:set var="total" value="0.0" />
							<c:forEach var="xxx" items="${cartlist}">
								<tr class="trkill">
									<td style="visibility: hidden" class="divThree">${xxx.proCartListSeqNo}</td>
									<td style="visibility: hidden" class="divOne">${xxx.productbean.productSeqNo}</td>
									<td><img width="150px" height="120px"
										src="${pageContext.request.contextPath}/getImage/Product/${xxx.productbean.productSeqNo}"
										alt=""></td>
									<td><h5 class="divTwo">${xxx.productbean.proName}</h5></td>
									<td>${xxx.productCount }</td>
									<td>NT ${xxx.productbean.proPrice }</td>
									<td>NT ${xxx.productCount * xxx.productbean.proPrice}</td>
									<c:set var="total"
										value="${total + xxx.productCount * xxx.productbean.proPrice}" />
									<td>
										<button id="buttonAdd" type="button"
											class="btn btn-danger kill">
											<i class="far fa-trash-alt"></i>
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr class="success">
								<td></td>
								<td></td>
								<td>總價</td>
								<td></td>
								<td></td>
								<td></td>
								<td>NT <fmt:formatNumber value="${total}" pattern="#,##0" /></td>
								<td></td>
							</tr>
						</tfoot>
					</table>
					<br>
					<a href="${pageContext.request.contextPath}/goMarketHomePage">繼續購買</a>
					<br>
					<a href="${pageContext.request.contextPath}/order.do">馬上結帳</a>
					<!-- 	刪除影片表格	-------------------------- -->
					<div id="delete-dialog-form" title="刪除資料">
						<p class="validateTips">確認刪除此資料?</p>
									<form:form id="deleteForm" name = "deleteForm" modelAttribute="updateCartListBean">
										<fieldset>
<!-- 											<input type="hidden" value="DELETE" name="_method"/> -->
											<form:input path="proCartListSeqNo" type="hidden" name="seqNoDelete" id="seqNoDelete"/>
											<form:input path="productStatus" type="hidden" name="productStatus" id="productStatusDelete" value = "2"/>
						
											<p>商品名稱:<span id="productNameDel"></span></p>
											<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
									</fieldset>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script>
	
	<script src="<c:url value='/Cart/js/cart.js'/> "></script>

</body>
</html>