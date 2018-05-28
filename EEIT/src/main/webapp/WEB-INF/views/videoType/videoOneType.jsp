<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="<c:url value='/videoType/css/videoOneType.css'/>" rel="stylesheet">

<style> 

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
	<div class="container"  style="margin-left:50px">
		<h1 class="mt-4 mb-3 videoTypeTitle" style="margin-left:20px;color:#4b367c;font-weight:900">${videoType}
		</h1>
			
		<ol class="breadcrumb">
		    <li class="breadcrumb-item">
			    <a href="<c:url value='/' />">首頁</a>
			</li>
			<li class="breadcrumb-item active">${videoType}類別</li>
		</ol>
		<div class="row" style="margin-left:20px">
			<c:forEach var="aVideoBean" items="${sortedVideos}">
				<div class="col-lg-2 col-sm-6 portfolio-item videoBlock">
					<div class="card h-100 videoBlockInner" style="border:none">
						<a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />">
							<img height="130px" width="235px" src='${pageContext.request.contextPath}/getImage/video/${aVideoBean.videoSeqNo}'>
						</a>
						<div class="card-body">
							<h6 class="card-title videoTitle">
								<a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />"  title="${aVideoBean.videoTitle}"><b>${aVideoBean.videoTitle}</b></a>
							</h6>
							<a class="uploaderLink"
								href="<c:url value='/profile/${aVideoBean.account}' />">
								<p class="videoSmallWords">${aVideoBean.account}</p>
							</a>
							<c:set var="string1" value="${aVideoBean.videoUploadDate}"/>
							<c:set var="string2" value="${fn:substring(string1, 0, 19)}" />
							<p class="card-text videoSmallWords">${string2}</p>
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
			<div class="col-md-12 row pageLoadingDiv">
				<div class="col-md-12 pageLoading pageLoadingNone">
					<img height="100px" class="pageLoadingImage" src="<c:url value='/global/images/loading.gif'/>">
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<script src="<c:url value='/videoType/js/videoType.js'/> "></script>
	<script src="<c:url value='/videoType/js/videoOneType.js'/> "></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</body>
</html>