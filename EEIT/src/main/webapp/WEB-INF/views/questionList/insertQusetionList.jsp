<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="/EEIT/QuestionList" method="POST" modelAttribute="questionListBean">
		questionListSeqNo:<form:input path="questionListSeqNo"></form:input><br/>
		questionListTitle:<form:input path="questionListTitle"></form:input><br/>
		questionListArticle:<form:input path="questionListArticle"></form:input><br/>
		questionListStatus:<form:input path="questionListStatus"></form:input><br/>
		<input type="submit" value="Submit" />
	</form:form>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>
</html>