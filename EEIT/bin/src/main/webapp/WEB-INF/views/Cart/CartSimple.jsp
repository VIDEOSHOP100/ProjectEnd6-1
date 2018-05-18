<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>賣家商品上架</h3>
	<form:form method="POST" action="insertProduct" modelAttribute="productBean" enctype="multipart/form-data">
		<table>
			<tr>
			<td>訂單編號:</td>
			<td><form:input type="text" path="orderSeqNo" value=""/></td>
			</tr>
			<tr>
			<td>商品標號:</td>
			<td><form:input type="text" path="productSeqNo" value=""/></td>
			</tr>
			<tr>
			<td>結帳時間 :</td>
			<td><form:input type="text" path="orderDate" value=""/></td>
			</tr>
			<tr>
			<td>購物時間:</td>
			<td><form:input type="text" path="shoppingDate" value=""/></td>
			</tr>
			<tr>
			<td>商品狀態:</td>
			<td><form:input type="text" path="cartStatus" value=""/></td>
			</tr>
			</table>
		</form:form>

</body>
</html>