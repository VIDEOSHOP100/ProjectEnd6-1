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
		<div class="chat-sidebar">
			<input type="hidden" class="accountForMessage" value="${LoginOK.account}">
			<c:forEach var="friendBean" items="${friendBeanList }" >
				<div class="sidebar-name">
					<c:if test="${LoginOK.account == friendBean.friendTo}">
						<button type="button" class="sidebarUserButton sidebarUserButtonNone" name="${fn:toUpperCase(friendBean.friendSend)}" id="${friendBean.friendSend }">
							<img width="30" height="30" src="${pageContext.request.contextPath}/getImage/member/${friendBean.friendSend}"> <span>${friendBean.friendSend }</span>
						</button>				
					</c:if>
					<c:if test="${LoginOK.account == friendBean.friendSend}">
						<button type="button" class="sidebarUserButton sidebarUserButtonNone" name="${fn:toUpperCase(friendBean.friendTo)}" id="${friendBean.friendTo }">
							<img width="30" height="30" src="${pageContext.request.contextPath}/getImage/member/${friendBean.friendTo}"> <span>${friendBean.friendTo }</span>
						</button>				
					</c:if>
				</div>
			</c:forEach>
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
	</c:if>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.0.3/sockjs.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	<script src="<c:url value='/global/js/message.js'/> "></script>
</body>
</html>