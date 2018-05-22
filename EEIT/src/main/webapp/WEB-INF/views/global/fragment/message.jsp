<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/black-tie/jquery-ui.css">  -->
<link href="<c:url value='/global/css/message.css'/> " rel="stylesheet">
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
</head>
<body>
	<c:if test="${!empty LoginOK }">
		<div class="chat-sidebar" style="z-index: 5">
			<p class="chat-sidebar-title">好友</p>
			<hr class="chat-sidebar-line">
			<div class="chat-sidebar-inside chat-sidebar-inside-Friend chat-sidebar-insideHide">
				<input type="hidden" class="accountForMessage" value="${LoginOK.account}">
				<c:forEach var="friendBean" items="${friendBeanList }" >
					<div class="sidebar-name">
						<c:if test="${LoginOK.account == friendBean.friendTo}">
							<button type="button" class="sidebarUserButton sidebarUserButtonNone" name="${fn:toUpperCase(friendBean.friendSend)}" id="${friendBean.friendSend }">
								<img width="40" height="40" src="${pageContext.request.contextPath}/getImage/member/${friendBean.friendSend}"> <span>${friendBean.friendSend }</span><span class="chatIcon"><i class="far fa-comments"></i></span>
							</button>				
						</c:if>
						<c:if test="${LoginOK.account == friendBean.friendSend}">
							<button type="button" class="sidebarUserButton sidebarUserButtonNone" name="${fn:toUpperCase(friendBean.friendTo)}" id="${friendBean.friendTo }">
								<img width="40" height="40" src="${pageContext.request.contextPath}/getImage/member/${friendBean.friendTo}"> <span>${friendBean.friendTo }</span><span class="chatIcon"><i class="far fa-comments"></i></span>
							</button>				
						</c:if>
					</div>
				</c:forEach>
			</div>
			<p class="chat-sidebar-title">訂閱</p>
			<hr class="chat-sidebar-line">
			<div class="chat-sidebar-inside chat-sidebar-inside-subscribe chat-sidebar-insideHide">
				<c:forEach var="subscriptionBean" items="${subscriptionUploader }" >
					<div class="sidebar-name">
						<button type="button" class="sidebarUserButton sidebarUserButtonNone" name="${fn:toUpperCase(friendBean.friendSend)}" id="${friendBean.friendSend }">
							<img width="40" height="40" src="${pageContext.request.contextPath}/getImage/member/${subscriptionBean.account}"> <p>${subscriptionBean.account}</p><p><small class="subtitle">點擊觀看及時串流直播</small></p><span class="subscribeIcon"><i class="fas fa-heart"></i></span>
						</button>				
					</div>
				</c:forEach>
			</div>
			<p class="chat-sidebar-title">購物車</p>
			<hr class="chat-sidebar-line">
			<div class="chat-sidebar-inside chat-sidebar-inside-cart chat-sidebar-insideHide">
				<c:forEach var="product" items="${cartDetailList }">
					<div class="sidebar-name">
						<button type="button" class="sidebarUserButton sidebarUserButtonNone">
							<img width="40" height="40" src="${pageContext.request.contextPath}/getImage/Product/${product.productbean.productSeqNo}"><p class="shoppingCartProductName">${product.productbean.proName}</p><p class="shoppingCartProductDescription"><small class="subtitle">${product.productbean.proDescription}</small></p><span  class="shoppingCartProductNumber">${product.productCount}</span>
						</button>				
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="chatplace"></div>
		<div id="insert-messageImage-form" title="圖片"  class="hideForm">
			<form:form id="insertMessageImageForm" ENCTYPE="multipart/form-data" modelAttribute="messageImageBean" method="POST">
				<fieldset>
					<input type="hidden" id="imageReceiverAccount">
					<form:input path="messageImage" type="file" name="messageImage" id="messageImage" class="text ui-widget-content ui-corner-all"/>
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px"/>
				</fieldset>
			</form:form>
		</div>
		<div id="insert-messageFile-form" title="檔案"  class="hideForm">
			<form:form id="insertMessageFileForm" ENCTYPE="multipart/form-data" modelAttribute="messageFileBean" method="POST">
				<fieldset>
					<input type="hidden" id="fileReceiverAccount">
					<form:input path="messageFile" type="file" name="messageFile" id="messageFile" class="text ui-widget-content ui-corner-all"/>
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px"/>
				</fieldset>
			</form:form>
		</div>
		<div id="insert-messageVideo-form" title="影片"  class="hideForm">
			<form:form id="insertMessageVideoForm" ENCTYPE="multipart/form-data" modelAttribute="messageVideoBean" method="POST">
				<fieldset>
					<input type="hidden" id="videoReceiverAccount">
					<form:input path="messageVideo" type="file" name="messageVideo" id="messageVideo" class="text ui-widget-content ui-corner-all"/>
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px"/>
				</fieldset>
			</form:form>
		</div>
		<div id="dialog" title="視訊">
	 		<div class="video-container">
				<div class="yourVideoDiv">
					<video autoplay class="yourVideo" width="400" height="400">
					</video>
					<input type="hidden" class="whoCall">
					<div class="whoCallDisplay"></div>
					<div class="myVideoDiv">
						<video autoplay class="myVideo" width="100" height="100"></video>
					</div>
				</div>
				<div  class="callDiv">
					<button class="btn btn-success callUser"><img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjI0cHgiIGhlaWdodD0iMjRweCIgdmlld0JveD0iMCAwIDM0OC4wNzcgMzQ4LjA3NyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgMzQ4LjA3NyAzNDguMDc3OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+CjxnPgoJPGc+CgkJPGc+CgkJCTxwYXRoIGQ9Ik0zNDAuMjczLDI3NS4wODNsLTUzLjc1NS01My43NjFjLTEwLjcwNy0xMC42NjQtMjguNDM4LTEwLjM0LTM5LjUxOCwwLjc0NGwtMjcuMDgyLDI3LjA3NiAgICAgYy0xLjcxMS0wLjk0My0zLjQ4Mi0xLjkyOC01LjM0NC0yLjk3M2MtMTcuMTAyLTkuNDc2LTQwLjUwOS0yMi40NjQtNjUuMTQtNDcuMTEzYy0yNC43MDQtMjQuNzAxLTM3LjcwNC00OC4xNDQtNDcuMjA5LTY1LjI1NyAgICAgYy0xLjAwMy0xLjgxMy0xLjk2NC0zLjU2MS0yLjkxMy01LjIyMWwxOC4xNzYtMTguMTQ5bDguOTM2LTguOTQ3YzExLjA5Ny0xMS4xLDExLjQwMy0yOC44MjYsMC43MjEtMzkuNTIxTDczLjM5LDguMTk0ICAgICBDNjIuNzA4LTIuNDg2LDQ0Ljk2OS0yLjE2MiwzMy44NzIsOC45MzhsLTE1LjE1LDE1LjIzN2wwLjQxNCwwLjQxMWMtNS4wOCw2LjQ4Mi05LjMyNSwxMy45NTgtMTIuNDg0LDIyLjAyICAgICBDMy43NCw1NC4yOCwxLjkyNyw2MS42MDMsMS4wOTgsNjguOTQxQy02LDEyNy43ODUsMjAuODksMTgxLjU2NCw5My44NjYsMjU0LjU0MWMxMDAuODc1LDEwMC44NjgsMTgyLjE2Nyw5My4yNDgsMTg1LjY3NCw5Mi44NzYgICAgIGM3LjYzOC0wLjkxMywxNC45NTgtMi43MzgsMjIuMzk3LTUuNjI3YzcuOTkyLTMuMTIyLDE1LjQ2My03LjM2MSwyMS45NDEtMTIuNDNsMC4zMzEsMC4yOTRsMTUuMzQ4LTE1LjAyOSAgICAgQzM1MC42MzEsMzAzLjUyNywzNTAuOTUsMjg1Ljc5NSwzNDAuMjczLDI3NS4wODN6IiBmaWxsPSIjRkZGRkZGIi8+CgkJPC9nPgoJPC9nPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=" /></button>
					<button class="btn btn-danger disconnectUser"><img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgd2lkdGg9IjI0cHgiIGhlaWdodD0iMjRweCIgdmlld0JveD0iMCAwIDUzMy4zMzMgNTMzLjMzMyIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTMzLjMzMyA1MzMuMzMzOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+CjxnPgoJPHBhdGggZD0iTTUyOS44ODQsMjgzLjMzYzQuMTY4LDI4Ljg5Nyw2Ljg4Miw2OC40MzQtNi4wNzUsODMuNTY2Yy0yMS40MjksMjUuMDIyLTE1Ny4xNDMsMjUuMDIyLTE1Ny4xNDMtMjUuMDIxICAgYzAtMjUuMjA3LDIyLjMyMS00MS43MzYsMC44OTMtNjYuNzYxYy0yMS4wOC0yNC42MTQtNTguODY5LTI1LjAxNC0xMDAuODkzLTI1LjAyMWMtNDIuMDI0LDAuMDA2LTc5LjgxNCwwLjQwNi0xMDAuODkzLDI1LjAyMSAgIGMtMjEuNDI4LDI1LjAyNCwwLjg5Myw0MS41NTMsMC44OTMsNjYuNzZjMCw1MC4wNDUtMTM1LjcxNCw1MC4wNDUtMTU3LjE0MywyNS4wMjJjLTEyLjk1Ny0xNS4xMzMtMTAuMjQ0LTU0LjY2OC02LjA3NC04My41NjYgICBjMy4yMDgtMTkuMjkyLDExLjMxNC00MC4xMDIsMzcuMjY1LTY2LjY2NGMwLTAuMDAxLDAuMDAxLTAuMDAxLDAuMDAxLTAuMDAyYzM4LjkyNi0zNi4zMjMsOTcuODM2LTY2LjAwOCwyMjMuODY4LTY2LjY0OVYxNTAgICBjMC43LDAsMS4zODgsMC4wMDUsMi4wODMsMC4wMDdjMC42OTctMC4wMDIsMS4zODMtMC4wMDcsMi4wODMtMC4wMDd2MC4wMTVjMTI2LjAzMSwwLjY0MSwxODQuOTQxLDMwLjMyNiwyMjMuODY3LDY2LjY1ICAgYzAuMDAxLDAuMDAxLDAuMDAxLDAuMDAyLDAuMDAxLDAuMDAyQzUxOC41NjgsMjQzLjIyNyw1MjYuNjc1LDI2NC4wMzksNTI5Ljg4NCwyODMuMzN6IiBmaWxsPSIjRkZGRkZGIi8+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" /></button>
				</div>
	  		</div>
		</div>
	</c:if>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.3/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	<script src="<c:url value='/global/js/message.js'/> "></script>
	<script src="<c:url value='/global/js/videoChat.js'/> "></script>
</body>
</html>