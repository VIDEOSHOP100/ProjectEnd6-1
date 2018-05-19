<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>首頁</title>
<link
	href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> "
	rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/global/css/index2.css'/>">

<style type="text/css">
/*基础样式 此部分样式为插件展示页的一些样式，使用插件时不会理会，引入上方的link即可*/
body {
	background-color: #1B1B1B;
	text-align: center;
	color: #fff;
	font-family: 微软雅黑;
}

* {
	margin: 0;
	padding: 0;
}

img {
	vertical-align: top;
}

.clearfix::after {
	content: "";
	display: table;
	clear: both;
}

ul li {
	list-style: none;
}

.banner {
	display: inline-block;
}

.desc {
	text-align: center;
}

.desc pre {
	color: #fff;
	display: inline-block;
	text-align: left;
	font: 14px 微软雅黑;
}

.tips {
	padding-bottom: 50px;
	width: 40%;
	margin: 0 auto;
}

.tips li {
	margin-top: 10px;
	padding: 5px;
	border: 1px solid #eee;
	box-shadow: 0 0 6px 3px #ddd;
}

#ctrl {
	text-align: left;
}

#ctrl2 {
	text-align: right;
}


</style>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<!-- 功能選單 Start -->
	<div class="col-sm-2">
		<a class="btn btn-sm btn-secondary btn-block" href="goPersonHomePage">商店首頁</a>
	</div>



	<!-- Page Content -->
	<div class="container">

		<!-- Jumbotron Header -->
		<header class="jumbotron my-4">
		<div class="banner" id="banner3">
			<div class="move" id="move2">
				<ul>
					<li><img src="${pageContext.request.contextPath}/getImageTest/product01" alt="" width="1500"
						height="500px"></li>
					<li><img src="${pageContext.request.contextPath}/getImageTest/product02" alt="" width="1500"
						height="500px"></li>
					<li><img src="${pageContext.request.contextPath}/getImageTest/product03" alt="" width="1500"
						height="500px"></li>
					<li><img src="${pageContext.request.contextPath}/getImageTest/product04" alt="" width="1500"
						height="500px"></li>
					<li><img src="${pageContext.request.contextPath}/getImageTest/product05" alt="" width="1500"
						height="500px"></li>
				</ul>
			</div>
			<div class="ctrl" id="ctrl2"></div>
		</div>
		<a href="#" class="btn btn-primary btn-lg">Call to action!</a> </header>

		<!-- Page Features -->

	

		<div class="row text-center" style="width: 1200px; margin: 0 auto;">
			<c:forEach var="product" items="${productbeans}">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card">
						 <a href="${pageContext.request.contextPath}/searchProductIntro/${product.productSeqNo}"><img class="card-img-top"
							src="${pageContext.request.contextPath}/getImage/Product/${product.productSeqNo}"
							width="500px" height="238px" alt=""></a>
						<div class="card-body">
							<h4 class="card-title JQellipsisTitle">${product.proName}</h4>
							<p class="card-text">限時特價  $NT ${product.proPrice }</p>
							<p class="card-text JQellipsis" id="JQellipsis">${product.proDescription }</p>
						</div>
						<div class="card-footer">
							<a
								href="${pageContext.request.contextPath}/searchProductIntro/${product.productSeqNo}"
								class="btn btn-primary">點我購買~</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->




	<a href="sale.do">商品上架</a>
	<br>
	

	<a href="goPersonHomePage">登入之後的商店首頁</a>
	<br>
	

	<c:if test="${empty LoginOK}">
		<li class="nav-item">
			<button class="btn btn-success" type="button" data-toggle="modal"
				data-target="#poplogin">
				我要賣東西</a>
			</button>
		</li>
		<li>&nbsp;</li>
	</c:if>
	<c:if test="${not empty LoginOK}">
		<li class="nav-item">
			<button class="btn btn-info" type="button" data-toggle="modal">
				<a href="Pshop.do">我要賣東西</a>
			</button>
		</li>
		<li>&nbsp;</li>
	</c:if>


	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2018</p>
		s

		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script type="text/javascript"
			src="<c:url value='/global/js/myscroll.js'/>"></script>
		<script type="text/javascript">
		$(function() {
				// 调用
				$('#banner1').myscroll({
					picEl : $('#move'), //图片父级，不传默认为banner内第1个div
					ctrlEl : $('#ctrl'), //控制条父级，包括小圆点和左右箭头，不传默认为banner内第2个div
					libs : true, //是否创建底部小圆点，true || false,不传默认true
					arrows : true, //是否创建左右箭头，true || false,不传默认true
					autoPlay : true, //是否自动播放，true || false,不传默认true
					time : 1000, //自动播放间隔时间，true || false,不传默认2000
					speed : 400, //图片切换速度，不传默认400
					effect : 'left' //轮播的改变方式 top||left||fade，不传默认left
				});
				$('#banner2').myscroll({
					effect : 'top'
				});
				$('#banner3').myscroll({
					time : 1500,
					effect : 'fade'
				});
				
				
				var len = 15; // 超過50個字以"..."取代
			    $(".JQellipsis").each(function(i){
			        if($(this).text().length>len){
			            $(this).attr("title",$(this).text());
			            var text=$(this).text().substring(0,len-1)+"...";
			            $(this).text(text);
			        }
			    });
				
			    var len = 25; // 超過50個字以"..."取代
			    $(".JQellipsisTitle").each(function(i){
			        if($(this).text().length>len){
			            $(this).attr("title",$(this).text());
			            var text=$(this).text().substring(0,len-1)+"...";
			            $(this).text(text);
			        }
			    });
			
			
		
		})
		</script>
	
</body>
</html>