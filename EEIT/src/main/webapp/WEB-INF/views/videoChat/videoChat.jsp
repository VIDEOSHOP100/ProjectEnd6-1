<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>視訊間</title>
</head>
<body>
	<div>
		<div class="showUserName"></div>
<!-- 		<input class="userName" type="text"/> -->
<!-- 		<button class="checkUserName">請輸入名字</button> -->
		<div>
		myVideo<video autoplay class="myVideo"></video>
		</div>
		<div>
		yourVideo<video autoplay class="yourVideo"></video>
		</div>		
		<button class="connect" >接通</button>
		<button class="disconnect">掛斷</button>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.3/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script  src="<c:url value='/videoChat/js/videoChat.js'/> "></script>
</body>
</html>