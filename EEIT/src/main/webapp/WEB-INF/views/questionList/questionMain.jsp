<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Button - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <script>
  $( function() { 
   $( ".widget input[type=submit], .widget a, .widget button" ).button(); 
    $( "button, input, a" ).click( function( event ) { 
       event.preventDefault(); 
    } ); 
  } ); 
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>	
<div class="widget">
	<a href = "${pageContext.request.contextPath}/QuestionList/addQuestionList">新增問題</a>
	<br>
	<a href = "${pageContext.request.contextPath}/QuestionList/deleteQusetionList">刪除問題</a>
	<br>
	<a href = "${pageContext.request.contextPath}/QuestionList/insertQuestionList">修改問題</a>
	<br>
	<a href = "${pageContext.request.contextPath}/QuestionList/updateQuestionList">上傳問題</a>
</div>
</body>
</html>
