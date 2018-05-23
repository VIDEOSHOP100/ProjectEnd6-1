<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*, java.util.*, java.text.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品頁面</title>

<link
	href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> "
	rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>"
	rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>

	<!-- Page Content -->
  <div class="container" style="margin-left:50px">

		<!-- Portfolio Item Heading -->
		<h1 class="my-4">
			${productSaleBean.proName } <small></small>
		</h1>

				<input type="hidden" name="productSeqNo" id="productSeqNo"
					value="${productSaleBean.productSeqNo}"> 
		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8">
				<img class="img-fluid" width="750px" height="500px"
					src="${pageContext.request.contextPath}/getImage/Product/${productSaleBean.productSeqNo}"
					alt="">
			</div>

			<div class="col-md-4">
				<h3 class="my-3">${productSaleBean.proName }</h3>
				<h3 class="my-3">商品介紹</h3>
				<p>${productSaleBean.proDescription }</p>
			
				
				 <br> <br>
				<h6>庫存數量:${productSaleBean.proPcs}</h6>	
				<br>
				<h4>限時特價:${productSaleBean.proPrice}</h4>	
				<br>
					<span>選擇數量:<select id="productCount" name="productCount">
						<option value="0">請選擇</option>
				
						<c:forEach var="loop" begin="1" end="${productSaleBean.proPcs}" step="1">
                            <option value="${loop}">${loop}</option><br>
                        </c:forEach>
				</select></span>
				
				<hr>
				<input type="hidden" name="account" id="account"
					value="${getLoginMemberBean.account}" /> 
				<input type="button" class="btn btn-primary buy"  value="直接購買">
			</div>


		</div>
		<!-- /.row -->

		<!-- Related Projects Row -->
		<h3 class="my-4"><a href="${pageContext.request.contextPath}/profile/${productSaleBean.account}">${productSaleBean.account}</a>商店中的其他商品</h3>

		<div class="row" style="height:400px; overflow-x:scroll;">
		<c:forEach var="relationproduct" items="${relationProduct}">
			<div class="col-md-3 col-sm-6 mb-4">
			<h4 class="card-title JQellipsisTitle">${relationproduct.proName}</h4>
				<a href="${pageContext.request.contextPath}/searchProductIntro/${relationproduct.productSeqNo}"> <img class="img-fluid"
				width="250px"  src="${pageContext.request.contextPath}/getImage/Product/${relationproduct.productSeqNo}" alt="">
				</a>
			</div>
		</c:forEach>
		

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2018</p>
	</div>
	</footer>
	<!-- /.container -->
	<script src="<c:url value='/Product/js/js.js'/>"></script>
	<script type="text/javascript">
	 var len = 20; // 超過50個字以"..."取代
	    $(".JQellipsisTitle").each(function(i){
	        if($(this).text().length>len){
	            $(this).attr("title",$(this).text());
	            var text=$(this).text().substring(0,len-1)+"";
	            $(this).text(text);
	        }
	    });
	</script>
<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>
</html>