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
			<td>產品圖片(封面) :</td>
			    <td><form:input type="file" path="proPic"/>
			    </td>
			</tr>
			<tr>
			<td>產品名稱:</td>
			<td><form:input type="text" path="proName" value="String"/></td>
			</tr>
			<tr>
			<td>產品價格 : (NT)</td>
			<td><form:input type="text" path="price" value="INT"/></td>
			</tr>
			<tr>
			<td>產品裁積</td>
			<td><form:input type="text" path="volume" value="X*X*X"/></td>
			</tr>
			<tr>
			<td>產品折扣 :</td>
			<td><form:input type="text" path="prodiscount" value="double"/></td>
			</tr>
			<tr>
			<td>產品重量 :</td>
			<td><form:input type="text" path="weight" value="double"/></td>
			</tr>
			<tr>
			<td>數量:</td>
			<td><form:input type="text" path="prostock" value="double"/></td>
			</tr>
			<tr>
			<td>品牌 :</td>
			<td><form:input type="text" path="brandSeqNo" value="1~2"/></td>
			</tr>
			<tr>
			<td>產品敘述 1:</td>
			<td><form:textarea type="text" path="proSpeicNo1" value="String"/></td>
			</tr>
			<tr>
			<td>產品敘述 2:</td>
			<td><form:textarea type="text" path="proSpeicNo2" value="String"/></td>
			</tr>
			<tr>
			<td>能配合的運送方式</td>
			<td><form:textarea type="text" path="transport" value="String"/></td>
			</tr>
			<tr>
			<td align="right">
				<input type="submit" value="submit"/>
				
			</td>		
			</tr>



			</table>
		</form:form>

</body>
</html>