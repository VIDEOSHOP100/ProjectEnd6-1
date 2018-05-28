<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回報完成</title>
<style type="text/css">
.myfooter {
	height: 100px;
	width: 100%;
	position: absolute;
	bottom: 0;
}
</style>
</head>
<body>
        <%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
        
      <div class="container" style="margin-left:50px">
        	<h1 class="mt-4 mb-3">回報完成</h1>
	        <ol class="breadcrumb">
				<li class="breadcrumb-item"><a
					href="${pageContext.request.contextPath}">首頁</a></li>
				<li class="breadcrumb-item active">回報完成</li>
			</ol>
        	<div class="row">
        	
        		<div class="col-md-4 offset-4">
        		
        			<p>您的意見已送出，謝謝您的回報。</p>
        			
        		</div>	
        	
        	
        	</div>
        	       	
        	
        </div>
        	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
</body>
</html>