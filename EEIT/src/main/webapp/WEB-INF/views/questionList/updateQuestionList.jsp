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

<!-- 	private Integer questionListSeqNo; -->
<!-- 	private String questionListTitle; -->
<!-- 	private String questionListArticle; -->
<!-- 	private String questionListStatus; -->
<!-- 	private Timestamp questionListUploadDate; -->
<!-- 	private String managerId; -->
<!-- 	private Integer questionListType; -->
	
	<form:form action="/EEIT/QuestionList" method="post">
	<input type="hidden" name="_method" value="PUT"/>
		questionListSeqNo:<input type="text" name="questionListSeqNo" >
		questionListTitle:<input type="text" name="questionListTitle" >
		questionListArticle:<input type="text" name="questionListArticle">
		questionListStatus-id<input type="text" name="questionListStatus">
		managerId:<input type="text" name="managerId">
		questionListType:<input type="text" name="questionListType">
	<input type="submit" value="Update"/>
	</form:form>
</body>
</html>