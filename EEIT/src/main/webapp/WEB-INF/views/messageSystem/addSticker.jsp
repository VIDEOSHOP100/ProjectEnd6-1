<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form  ENCTYPE="multipart/form-data" action="/EEIT/Sticker" modelAttribute="stickerBean" method="POST">
		<fieldset>
			<label for="stickerName">貼圖名稱</label>
			<form:input type="text" path="stickerName" name="stickerName" id="stickerName"/>
			<label for="stickerImage">貼圖檔案</label>
			<form:input path="stickerImage" type="file" name="stickerImage" id="stickerImage"/>
			<input type="submit">
		</fieldset>
	</form:form>

</body>
</html>