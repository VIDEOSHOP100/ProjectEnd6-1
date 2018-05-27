<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Selectmenu - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <style>
    fieldset {
      border: 0;
    }
    label {
      display: block;
      margin: 30px 0 0 0;
    }
    .overflow {
      height: 200px;
    }
     </style>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#speed" ).selectmenu();
 
    $( "#files" ).selectmenu();
 
    $( "#number" )
      .selectmenu()
      .selectmenu( "menuWidget" )
        .addClass( "overflow" );
 
    $( "#salutation" ).selectmenu();
  } );
  </script>
<title>Insert title here</title>
</head>
<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
<body>
<div class="container" style="margin-left:50px">
	<form:form modelAttribute="questionListBean" action="/EEIT/QuestionList/update" method="post">
		修改問題標題:<form:input type="text" path="questionListTitle" />
		修改問題內容:<form:input type="text" path="questionListArticle"/>
		修改管理員:<form:input type="text" path="managerId"/>
		問題類型:<form:input type="text" path="questionListType"/>
      	<form:select  id="topic" path="questionListStatus">
			<form:option value="1">顯示</form:option>
			<form:option value="0">不顯示</form:option>		
		</form:select>



		
      <input type="submit" value="Update"/>
     
	</form:form>

	
</div>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>
</html>