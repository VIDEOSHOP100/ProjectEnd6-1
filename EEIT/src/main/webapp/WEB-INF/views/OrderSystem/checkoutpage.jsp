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
<div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-6">
				<h3 class="dark-grey">Registration</h3>
				
				<div class="form-group col-lg-12">
					<label>Username</label>
					<input type="" name="" class="form-control" id="" value="">
				</div>
				
				<div class="form-group col-lg-6">
					<label>Password</label>
					<input type="password" name="" class="form-control" id="" value="">
				</div>
				
				<div class="form-group col-lg-6">
					<label>Repeat Password</label>
					<input type="password" name="" class="form-control" id="" value="">
				</div>
								
				<div class="form-group col-lg-6">
					<label>Email Address</label>
					<input type="" name="" class="form-control" id="" value="">
				</div>
				
				<div class="form-group col-lg-6">
					<label>Repeat Email Address</label>
					<input type="" name="" class="form-control" id="" value="">
				</div>			
				
				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />Sigh up for our newsletter
				</div>

				<div class="col-sm-6">
					<input type="checkbox" class="checkbox" />Send notifications to this email
				</div>				
			
			</div>
		
			<div class="col-md-6">
				<h3 class="dark-grey">Terms and Conditions</h3>
				<p>
					By clicking on "Register" you agree to The Company's' Terms and Conditions
				</p>
				<p>
					While rare, prices are subject to change based on exchange rate fluctuations - 
					should such a fluctuation happen, we may request an additional payment. You have the option to request a full refund or to pay the new price. (Paragraph 13.5.8)
				</p>
				<p>
					Should there be an error in the description or pricing of a product, we will provide you with a full refund (Paragraph 13.5.6)
				</p>
				<p>
					Acceptance of an order by us is dependent on our suppliers ability to provide the product. (Paragraph 13.5.6)
				</p>
				
				<button type="submit" class="btn btn-primary">Register</button>
			</div>
		</div>
	</section>
</div>
    <div class="container-fluid">
		<div class="container">
			<div class="formBox">
				<form>
						<div class="row">
							<div class="col-sm-12">
								<h1>訂購人    資料</h1>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<div class="inputBox ">
									<div class="inputText">訂購人姓名</div>
									<input type="text" name="" class="input">
								</div>
							</div>

							<div class="col-sm-6">
								<div class="inputBox">
									<div class="inputText">訂購人手機</div>
									<input type="text" name="" class="input">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<div class="inputBox">
									<div class="inputText">Email</div>
									<input type="text" name="" class="input">
								</div>
							</div>

							<div class="col-sm-6">
								<div class="inputBox">
									<div class="inputText">地址</div>
									<input type="text" name="" class="input">
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-12">
								<div class="inputBox">
									<div class="inputText">Email</div>
									<textarea class="input"></textarea>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-12">
								<input type="submit" name="" class="button" value="Send Message">
							</div>
						</div>
				</form>
			</div>
		</div>
	<div class="">
		<div class="">
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
					<%-- 							<c:forEach var="xxx" items="${cartlist}"> --%>
					<tr class="trkill">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<%-- 									<td style="visibility: hidden" class="divThree">${xxx.proCartListSeqNo}</td> --%>
						<%-- 									<td style="visibility: hidden" class="divOne">${xxx.productbean.productSeqNo}</td> --%>
						<!-- 									<td><img width="150px" height="120px" -->
						<%-- 										src="${pageContext.request.contextPath}/getImage/Product/${xxx.productbean.productSeqNo}" --%>
						<!-- 										alt=""></td> -->
						<%-- 									<td><h5 class="divTwo">${xxx.productbean.proName}</h5></td> --%>
						<%-- 									<td>${xxx.productCount }</td> --%>
						<%-- 									<td>NT ${xxx.productbean.proPrice }</td> --%>
						<%-- 									<td>NT ${xxx.productCount * xxx.productbean.proPrice}</td> --%>
						<%-- 									<c:set var="total" --%>
						<%-- 										value="${total + xxx.productCount * xxx.productbean.proPrice}" /> --%>
						<td>
							<button id="buttonAdd" type="button" class="btn btn-danger kill">
								<i class="far fa-trash-alt"></i>
							</button>
						</td>
					</tr>
					<%-- 							</c:forEach> --%>
				</tbody>
				<tfoot>
					<tr class="success">
						<td></td>
						<td></td>
						<td>總價</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<%-- 						<td>NT <fmt:formatNumber value="${total}" pattern="#,##0" /></td> --%>
						<td></td>
					</tr>
				</tfoot>
			</table>

			<!-- 訂購人表單 -->
			<div class=fillinBox>
				<table class="table">
					<thead ><div class="pull-right">
						<div class="bg-success" >訂購人資料</div>
							</div>
					</thead>

					<tbody>
						<tr class="info">
						<div class="pull-right">
							<th class="pull-right">姓名:</th>
							</div>
							<td><input type="text" name="name"></td>
							<th></th>
							<td>Email:<input type="text" name="name"
								class="form-control"></td>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</tbody>
					<!-- 				<tbody class="tbodyOutside"> -->
					<!-- 					<tr class="trkill"> -->
					<!-- 						<td></td> -->
					<!-- 						<td>收件人:</td> -->
					<!-- 						<td>xxx</td> -->
					<!-- 						<td>電話</td> -->
					<!-- 						<td>ooo</td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 					</tr> -->
					<!-- 					<tr class="trkill"> -->
					<!-- 						<td></td> -->
					<!-- 						<td>地址:</td> -->
					<!-- 						<td>xxxxxxoooooo</td> -->
					<!-- 						<td>郵遞區號</td> -->
					<!-- 						<td>oooxxxxxxxxx</td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 					</tr> -->

					<!-- 				</tbody> -->
					<!-- 				<tfoot> -->
					<!-- 					<tr class="success"> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 						<td></td> -->
					<!-- 					</tr> -->
					<!-- 				</tfoot> -->
					</table>

			</div>
			<!-- 收件人表單 -->
			<div class="container">
				<h2>Striped Rows</h2>
				<p>The .table-striped class adds zebra-stripes to a table:</p>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Firstname</th>
							<th>Lastname</th>
							<th>Email</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>John</td>
							<td>Doe</td>
							<td>john@example.com</td>
						</tr>
						<tr>
							<td>Mary</td>
							<td>Moe</td>
							<td>mary@example.com</td>
						</tr>
						<tr>
							<td>July</td>
							<td>Dooley</td>
							<td>july@example.com</td>
						</tr>
					</tbody>
				</table>
			</div>



		</div>
	</div>
	
	    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script type="text/javascript">
        $(".input").focus(function() {
            $(this).parent().addClass("focus");
        })
    </script>
</body>
</html>