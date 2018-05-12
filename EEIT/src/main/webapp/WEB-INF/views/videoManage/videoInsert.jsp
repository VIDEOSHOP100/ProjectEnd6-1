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
	<form:form action="video" method="POST" modelAttribute="video">
		videoSeqNo:<form:input path="videoSeqNo"></form:input><br/>
		videoTitle:<form:input path="videoTitle"></form:input><br/>
		userAccount:<form:input path="userAccount"></form:input><br/>
		videoDescription:<form:input path="videoDescription"></form:input><br/>
		videoType:<form:input path="videoType"></form:input><br/>
		videoUplodaerListType:<form:input path="videoUplodaerListType"></form:input><br/>
<%-- 		videoUploadDate:<form:input path="videoUploadDate"></form:input><br/> --%>
		videoLikes:<form:input path="videoLikes"></form:input><br/>
		videoUnlikes:<form:input path="videoUnlikes"></form:input><br/>
		videoViews:<form:input path="videoViews"></form:input><br/>
		videoStatus:<form:input path="videoStatus"></form:input><br/>
		videoFilePath:<form:input path="videoFilePath"></form:input><br/>
		VideoFileName:<form:input path="VideoFileName"></form:input><br/>
		videoImageFilePath:<form:input path="videoImageFilePath"></form:input><br/>
		videoImageFileName:<form:input path="videoImageFileName"></form:input><br/>
		<input type="submit" value="Submit" />
	</form:form>
</body>
</html>