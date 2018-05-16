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
<!-- <link -->
<%-- 	href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " --%>
<!-- 	rel="stylesheet"> -->
<%-- <link href="<c:url value='/global/css/modern-business.css'/>" --%>
<!-- 	rel="stylesheet"> -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/global/css/index2.css'/>">

<style type="text/css">
#MyBlog {
	position: fixed; /*固定在網頁上不隨卷軸移動，若要隨卷軸移動用absolute*/
	top: 40%; /*設置垂直位置*/
	right: +1900px; /*設置水平位置，依所放的內容多寡需要自行手動調整*/
	background: #ffffff; /*背景顏色*/
	padding: 10px 20px;
	border-radius: 10px; /*圓角*/
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
}
button {
    background-color: white;
    border: none;
    color: none;

}
</style>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.12/js/all.js"></script>

</head>
<body>
	
	<input type="hidden" id=checkaccount value="${LoginOK.account}"/>
	<div id="MyBlog" class="fa-4x">
		<span> 
		<a href="${pageContext.request.contextPath}/CartList/getCart/${LoginOK.account}">
		<button type="button"  id="cartbutton"><i class="fas fa-cart-plus "></i></button></a>
		 <span class="fa-layers-counter" id="counter" style="background:Tomato">0</span>
		</span>
	</div>


<script src="<c:url value='/Cart/js/carticon.js'/> "></script>
</body>
</html>