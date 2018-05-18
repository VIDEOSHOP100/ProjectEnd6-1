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
	<form:form action="${pageContext.request.contextPath }/video" method="POST" modelAttribute="video">
		<input type="hidden" name="_method" value="PUT"/>
		videoSeqNo:<form:input path="videoSeqNo"/>
		videoTitle:<form:input path="videoTitle"/>
		userAccount:<form:input path="userAccount"/>
		videoDescription:<form:input path="videoDescription"/>
		videoType:<form:input path="videoType"/>
		videoUplodaerListType:<form:input path="videoUplodaerListType"/>
<%-- 		videoUploadDate:<form:input path="videoUploadDate"/><br/> --%>
		videoLikes:<form:input path="videoLikes"/>
		videoUnlikes:<form:input path="videoUnlikes"/>
		videoViews:<form:input path="videoViews"/>
		videoStatus:<form:input path="videoStatus"/>
		videoFilePath:<form:input path="videoFilePath"/>
		VideoFileName:<form:input path="VideoFileName"/>
		videoImageFilePath:<form:input path="videoImageFilePath"/>
		videoImageFileName:<form:input path="videoImageFileName"/>
		<input type="submit" value="Submit" />
	</form:form>
</body>
</html>