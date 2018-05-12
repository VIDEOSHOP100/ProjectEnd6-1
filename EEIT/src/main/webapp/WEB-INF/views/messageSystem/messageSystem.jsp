<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<p>請輸入房間號:<input type="text" class="roomNumber"></p>
		<p><input type="button" class="connectButton" value="連線"></p>
		<p>請輸入:<input type="text" class="message"></p>
		<p><input type="button" class="clickButton" value="請輸入"></p>
	</div>
	

	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.3/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="<c:url value='/messageSystem/js/messageSystem.js'/>"></script>
</body>
</html>