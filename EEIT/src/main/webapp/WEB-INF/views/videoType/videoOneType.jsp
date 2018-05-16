<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>${videoType }類影片</title>
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
<link href="<c:url value='/videoType/css/videoType.css'/>" rel="stylesheet">

<style> 

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
	<div class="container">
		<h1 class="mt-4 mb-3">${videoType }
		</h1>
			
		<ol class="breadcrumb">
		  <li class="breadcrumb-item">
		  </li>
		</ol>
		<div class="row">
			<c:forEach var="aVideoBean" items="${sortedVideos}">
				<div class="col-lg-2 col-sm-6 portfolio-item videoBlock">
					<div class="card h-100 videoBlockInner">
						<a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />">
							<img height="130px" width="235px" src='${pageContext.request.contextPath}/getImage/video/${aVideoBean.videoSeqNo}'>
						</a>
						<div class="card-body">
							<h6 class="card-title videoTitle">
								<a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />"  title="${aVideoBean.videoTitle}"><b>${aVideoBean.videoTitle}</b></a>
							</h6>
							<a class="uploaderLink"
								href="<c:url value='/uploaderHomePage/${aVideoBean.account}' />">
								<p class="videoSmallWords">${aVideoBean.account}</p>
							</a>
							<p class="card-text videoSmallWords">${aVideoBean.videoUploadDate}</p>
							<p class="videoSmallWords">觀看次數:${aVideoBean.videoViews}</p>
							<c:if test="${!empty LoginOK}">
								<div class="watchLater">
									<input type="hidden" value="${aVideoBean.videoSeqNo}" />
									<button type="button" class="btn">
										<i class="fas fa-tags"></i>
									</button>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<script src="<c:url value='/videoType/js/videoType.js'/> "></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</body>
</html>