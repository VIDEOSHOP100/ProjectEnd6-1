<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增問題集</title>
</head>
<body>
	<form:form method="POST" action="insertQuesList" modelAttribute="QuesListBean" enctype="multipart/form-data">
		<table>
			<tr>
				<td>問題主題:</td>
				<td><form:input type="text" path="queTitle" value=""/></td>
			</tr>
			<tr>
				<td>問題內容:</td>
				<td><form:input type="text" path="queReply" value=""/></td>
			</tr>
		</table>
	</form:form>		
</body>
</html>