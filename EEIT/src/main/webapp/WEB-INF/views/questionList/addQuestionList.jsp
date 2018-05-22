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
 <div class="container" style="margin-left:50px">
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>	
	<form:form id="myForm" name = "myForm" action = "/EEIT/QuestionList" ENCTYPE="multipart/form-data"  modelAttribute="questionListBean" method="POST">
		<fieldset>
			<hr>
			<label for="questionListTitle">問題標題</label>
			<form:input path="questionListTitle" type="text" name="questionListTitle" id="questionListTitle"/>
			<hr>
			<label for="questionListArticle">問題內容</label>
			<form:input path="questionListArticle" type="text" name="questionListArticle" id="questionListArticle" value="" class="text ui-widget-content ui-corner-all" />
			<hr>
			<label for="managerId">管理員帳號</label>
			<form:input path="managerId" type="text" name="managerId" id="managerId" value="" class="text ui-widget-content ui-corner-all" />
			<input type="submit" value = "送出">
			
		</fieldset>
	</form:form>
</div>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>
</html>