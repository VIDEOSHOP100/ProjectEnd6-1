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
<link rel="stylesheet" type="text/css" href="<c:url value='/global/css/index2.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/marketIndex/css/animate.min.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/marketIndex/css/default.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/marketIndex/css/normalize.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/marketIndex/css/styles2.css'/>">

<link href="<c:url value='http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css'/>"
	rel="stylesheet">
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
#Footer {
　height: 100px;
　position: relative;
　margin-top: -100px;
}
.cate{

}
</style>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"></script>
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
		<header class="jumbotron my-4" >
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
		<a href="#" class="btn btn-primary btn-lg">熱銷商品</a> </header>

		<!-- Page Features -->

<div class="row cate" style="width:20%;float:left">	
<ul class="list-group">
 <li> <i class="fal fa-cart-plus"></i>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
 <li>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
</ul>

<ul class="list-group">
   <button type="button" class="list-group-item list-group-item-action active" disabled> 全站商品&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  <button type="button" class="list-group-item list-group-item-action" value="1">&nbsp&nbsp&nbsp&nbsp&nbsp<b>3C</b></button>
  <button type="button" class="list-group-item list-group-item-action" value="2">&nbsp&nbsp&nbsp&nbsp&nbsp<b>通訊</b></button>
  <button type="button" class="list-group-item list-group-item-action" value="3" >&nbsp&nbsp&nbsp&nbsp&nbsp<b>數位周邊</b></button>
  <button type="button" class="list-group-item list-group-item-action" value="4" >&nbsp&nbsp&nbsp&nbsp&nbsp<b>生活</b></button>
  <button type="button" class="list-group-item list-group-item-action" value="5">&nbsp&nbsp&nbsp&nbsp&nbsp<b>日用</b></button>
  <button type="button" class="list-group-item list-group-item-action" value="6" >&nbsp&nbsp&nbsp&nbsp&nbsp<b>食品</b></button>
  <button type="button" class="list-group-item list-group-item-action" value="7" >&nbsp&nbsp&nbsp&nbsp&nbsp<b>戶外</b></button>
  <button type="button" class="list-group-item list-group-item-action" value="8" >&nbsp&nbsp&nbsp&nbsp&nbsp<b>時尚</b></button>
  <button type="button" class="list-group-item list-group-item-action" value="9" >&nbsp&nbsp&nbsp&nbsp&nbsp<b>美妝</b></button>
  <button type="button" class="list-group-item list-group-item-action" value="10" >&nbsp&nbsp&nbsp&nbsp&nbsp<b>書店</b></button>
</ul>

</div>
		<div class="row text-center prorow" style="width: 80%; margin: 0 auto; float:right ">
			<c:forEach var="product" items="${productbeans}">
				<div class="col-lg-3 col-md-6 mb-4 productstart">
					<div class="card">
						 <a href="${pageContext.request.contextPath}/searchProductIntro/${product.productSeqNo}"><img class="card-img-top"
							src="${pageContext.request.contextPath}/getImage/Product/${product.productSeqNo}"
							 height="238px" alt=""></a>
						<div class="card-body">
							<h4 class="card-title JQellipsisTitle">${product.proName}</h4>
							<p class="card-text">限時特價  $NT ${product.proPrice }</p>
							<p class="card-text JQellipsis">${product.proDescription }</p>
						</div>
						<div class="card-footer">
							<a href="${pageContext.request.contextPath}/searchProductIntro/${product.productSeqNo}"
								class="btn btn-primary">點我購買~</a>
						</div>
					</div>
				</div>
			</c:forEach>
		

          <!-- Side Widget -->
          <div class="card my-4">
            <h5 class="card-header">Side Widget</h5>
            <div class="card-body">
              You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
            </div>
          </div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	
	
	
<!-- footer -->
	


<!-- 	<a href="sale.do">商品上架</a> -->
<!-- 	<br> -->

		
		
		
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
			<script type="text/javascript"
				src="<c:url value='/global/js/myscroll.js'/>"></script>
	<script src="<c:url value='/marketIndex/js/market.js'/> "></script>	
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
				
			    var len = 10; // 超過50個字以"..."取代
			    $(".JQellipsisTitle").each(function(i){
			        if($(this).text().length>len){
			            $(this).attr("title",$(this).text());
			            var text=$(this).text().substring(0,len-1)+"...";
			            $(this).text(text);
			        }
			    });
			
			
		
		})
		</script>
		<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
	
	<script>
	$(document).ready(function (ev) {
	    var toggle = $('#ss_toggle');
	    var menu = $('#ss_menu');
	    var rot;
	    $('#ss_toggle').on('click', function (ev) {
	        rot = parseInt($(this).data('rot')) - 180;
	        menu.css('transform', 'rotate(' + rot + 'deg)');
	        menu.css('webkitTransform', 'rotate(' + rot + 'deg)');
	        if (rot / 180 % 2 == 0) {
	            toggle.parent().addClass('ss_active');
	            toggle.addClass('close');
	        } else {
	            toggle.parent().removeClass('ss_active');
	            toggle.removeClass('close');
	        }
	        $(this).data('rot', rot);
	    });
	    menu.on('transitionend webkitTransitionEnd oTransitionEnd', function () {
	        if (rot / 180 % 2 == 0) {
	            $('#ss_menu div i').addClass('ss_animate');
	        } else {
	            $('#ss_menu div i').removeClass('ss_animate');
	        }
	    });
	});
	</script>
		
	
</body>
</html>