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
	<form:form action="/EEIT/QuestionList" method="post">
	  <input type="hidden" name="_method" value="PUT"/>
		修改問題編號:<input type="text" name="questionListSeqNo" >
		questionListTitle:<input type="text" name="questionListTitle" >
		questionListArticle:<input type="text" name="questionListArticle">
<!-- 		questionListStatus:<input type="text" name="questionListStatus"> -->
		managerId:<input type="text" name="managerId">
		questionListType:<input type="text" name="questionListType">
		
      <input type="submit" value="Update"/>
     
	</form:form>
	<div class="demo">
 
	<form action="#">
	<fieldset>
    <label for="speed">是否顯示問題</label>
    <select name="speed" id="speed">
      <option>顯示</option>
      <option>不顯示</option>
<!--       <option selected="selected">Medium</option> -->
    
    </select>
      </fieldset>
 
</form>
 
</div>
	
</div>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>
</html>