<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$(".delete").click(function(){
			var href = $(this).attr("href");
			$("form").attr("action",href).submit();
			return false;
		})
	})
</script>
</head>
<body>
	<form action="" method="POST">
		<input type="hidden" name="_method" value="DELETE" />

	</form>


	<c:forEach items="${videos}" var="videoBean">

		<p>${videoBean.videoSeqNo }</p>
		<a href="${pageContext.request.contextPath }/video/${videoBean.videoSeqNo }" class="delete">delete</a>
		<p>${videoBean.videoTitle }</p>
		<p>${videoBean.userAccount }</p>
		<p>${videoBean.videoDescription }</p>
		<p>${videoBean.videoType }</p>
		<p>${videoBean.videoUplodaerListType }</p>
		<p>${videoBean.videoUploadDate }</p>
		<p>${videoBean.videoLikes }</p>
		<p>${videoBean.videoUnlikes }</p>
		<p>${videoBean.videoViews }</p>
		<p>${videoBean.videoStatus }</p>
		<p>${videoBean.videoFilePath }</p>
		<p>${videoBean.videoImageFilePath }</p>
		<p>${videoBean.videoImageFileName }</p>

	</c:forEach>
</body>
</html>