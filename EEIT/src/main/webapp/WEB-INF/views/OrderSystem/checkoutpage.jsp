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
	<!-- 訂單資料 --------------------------------------------------------------------------------------->
	<div class="">
		<div class="card">
			<div class="card-header">${getMemberBean.account}的訂單資訊</div>
			<div class="card-body">

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
			</div>
		</div>
	</div>
	</div>


	<!--          訂購人資訊  --------------------------------------------------------- -->

	<div class="container-fluid">
		<section class="container">
		<div class="container-page">
			<div class="col-md-6" id="upform">
				<h3 class="dark-grey">訂購人資訊</h3>

				<div class="form-group col-lg-6">
					<label>訂購人姓名</label> <input type="text" name=""
						class="form-control" id="upName" value="">
				</div>

				<div class="form-group col-lg-6">
					<label>訂購人電話</label> <input type="text" name=""
						class="form-control" id="upTel" value="">
				</div>

				<div class="form-group col-lg-6">
					<label>訂購人 Email</label> <input type="text" name=""
						class="form-control" id="upMail" value="">
				</div>

				<div class="form-group col-lg-3">
					<label>訂購人 地址</label> <br> <span>縣/市</span><select
						class="form-control" id="sel1">
						<option value="">請選擇</option>
						<c:forEach var="itemone" items="${citylist}">
							<option id="op1" value="${itemone}">${itemone}</option>
						</c:forEach>
					</select> <span>區域</span> <select class="form-control" id="sel2">
						<option id="op2" value="">請選擇</option>
					</select>
				</div>
				<div class="form-group col-lg-8">
					<input type="text" name="textaddr" class="form-control" id="upAddr"
						value="">
				</div>

				<!-- 				<div class="col-sm-6"> -->
				<!-- 					<input type="checkbox" class="checkbox" />Send notifications to this email -->
				<!-- 				</div>	 -->

				<!--   收貨人資訊          -----------------------------------------------------------------------------------                       -->
			</div>
			<div class="col-md-6">
				<h3 class="dark-grey">收貨人資訊</h3>


				<div class="col-sm-6">
					<input type="button" class="btn-success down" value="資料同上" />
				</div>


				<div class="form-group col-lg-6">
					<label>收貨人姓名</label> <input type="text" name=""
						class="form-control" id="downName" value="">
				</div>

				<div class="form-group col-lg-6">
					<label>收貨人電話</label> <input type="text" name=""
						class="form-control" id="downTel" value="">
				</div>

				<div class="form-group col-lg-6">
					<label>收貨人 Email</label> <input type="text" name=""
						class="form-control" id="downEmail" value="">
				</div>

				<div class="form-group col-lg-6">
					<label>收貨人 地址</label> <input type="text" name=""
						class="form-control" id="downAddr" value="">
				</div>

				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />是否同意商城條款
				</div>

			</div>

			<div class="col-md-6">
				<h3 class="dark-grey">付款方式</h3>

				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />信用卡付款
				</div>

				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />web ATM
				</div>

				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />超商取貨付款
				</div>

			</div>

			<div class="col-md-6">
				<h3 class="dark-grey">取貨方式</h3>

				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />7-11店到店付款
				</div>

				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />fami店到店付款
				</div>

				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />黑貓宅急便
				</div>

			</div>
			<!-- 			<div class="col-md-6" > -->
			<!-- 				<h3 class="dark-grey">Terms and Conditions</h3> -->
			<!-- 				<p> -->
			<!-- 					By clicking on "Register" you agree to The Company's' Terms and Conditions -->
			<!-- 				</p> -->
			<!-- 				<p> -->
			<!-- 					While rare, prices are subject to change based on exchange rate fluctuations -  -->
			<!-- 					should such a fluctuation happen, we may request an additional payment. You have the option to request a full refund or to pay the new price. (Paragraph 13.5.8) -->
			<!-- 				</p> -->
			<!-- 				<p> -->
			<!-- 					Should there be an error in the description or pricing of a product, we will provide you with a full refund (Paragraph 13.5.6) -->
			<!-- 				</p> -->
			<!-- 				<p> -->
			<!-- 					Acceptance of an order by us is dependent on our suppliers ability to provide the product. (Paragraph 13.5.6) -->
			<!-- 				</p> -->

			<button type="submit" class="btn btn-primary">送出訂單</button>
			<button type="button" class="btn btn-primary">
				<a href="${pageContext.request.contextPath}/gotoseven">送出711訂單</a>
			</button>
			<!-- 			</div> -->
		</div>
		</section>
	</div>


	<script src="<c:url value='/OrderSystem/js/order.js'/> "></script>
</body>

</html>