<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
<link href="<c:url value='/uploaderHomePage/css/uploaderHomePage.css'/>" rel="stylesheet">
<title>商品查詢</title>
</head>
<body>
	<h3>商品查詢</h3>

      	<c:forEach var="aVideoBean" items="${uploaderVideos}">
	      	<div class="col-lg-3 mb-4">
	          <div class="card h-100">
	            <h4 class="card-header">${aVideoBean.videoTitle}</h4>
	            <div class="card-body">
					<a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />">
						<img height="130px" width="235px" src='${pageContext.request.contextPath}/getImage/video/${aVideoBean.videoSeqNo}'>
					</a>
	              <p class="card-text">${aVideoBean.videoDescription}</p>
	            </div>
	            <div class="card-footer">
	              <a href="#" class="btn btn-primary">Learn More</a>
	            </div>
	          </div>
       		</div>
      	</c:forEach>
	
	
</body>
</html>