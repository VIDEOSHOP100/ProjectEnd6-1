<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>問題新增表格</title>

</head>
<body>
<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>	

	<a href = "${pageContext.request.contextPath}/QuestionList/addQuestionList">新增問題</a>
	<br>
	<a href = "${pageContext.request.contextPath}/QuestionList/deleteQusetionList">刪除問題</a>
	<br>
	<a href = "${pageContext.request.contextPath}/QuestionList/insertQuestionList">修改問題</a>
	<br>
	<a href = "${pageContext.request.contextPath}/QuestionList/updateQuestionList">上傳問題</a>

</body>
</html>
