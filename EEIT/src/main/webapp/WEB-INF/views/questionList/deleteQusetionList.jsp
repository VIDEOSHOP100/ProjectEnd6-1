<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>刪除客服列表</title>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
 <div class="container" style="margin-left:50px">
	  <%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
	<form:form action="/EEIT/QuestionList" method="post">
	<input type="hidden" name="_method" value="PUT"/>
		
		uestionListSeqNo:<input type="text" name="questionListSeqNo" >
		questionListStatus:<input type="text" name="questionListStatus">
	
	<input type="submit" value="Update"/>
	</form:form>
<%-- 	<form:form action="/EEIT/QuestionList/1019" method="POST"> --%>
<!-- 		<input type="hidden" name="_method" value="DELETE" /> -->
<!-- 		<input type="submit" value="確定刪除"/> -->
<%-- 	</form:form> --%>
</div>
<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>
</html>