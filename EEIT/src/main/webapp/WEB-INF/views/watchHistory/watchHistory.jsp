<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>瀏覽紀錄</title>
	<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
	<link href="<c:url value='/global/css/modern-business.css'/> " rel="stylesheet">
	<link href="<c:url value='/watchHistorydeco/css/watchHistory.css'/> " rel="stylesheet">
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
  <div class="container watchHistoryContainer"  style="margin-left:50px">
    <h1 class="mt-4 mb-3"  style="color:#4b367c;font-weight:900">瀏覽紀錄
    </h1>

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
		    <a href="<c:url value='/' />">首頁</a>
		</li>
		<li class="breadcrumb-item active">瀏覽紀錄</li>
    </ol>

    <c:forEach var="aVideoBean" items="${watchHistory}">
	    <div class="row">
	      <div class="col-md-3">
	        <a href="#">
	          <a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />">
				<img style="border: solid 1px red" class="img-fluid rounded mb-3 mb-md-0" width="350px" height="50px" src='${pageContext.request.contextPath}/getImage/video/${aVideoBean.videoSeqNo}'>
			  </a>
	        </a>
	      </div>
	      <div class="col-md-9">
	        <h3 class="videoTitle"><a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />" title="${aVideoBean.videoTitle}">${aVideoBean.videoTitle}</a></h3>
	        <p class="watchHistoryVideoAccount"><a class="uploaderLink" href="<c:url value='/uploaderHomePage/${aVideoBean.account}' />">${aVideoBean.account}</a></p>
	        <p>觀看次數:${aVideoBean.videoViews}</p>
	        <p class="videoDescription" title="${aVideoBean.videoDescription}">${aVideoBean.videoDescription}</p>
	        <input type="hidden" class='videoSeqNo' value="${aVideoBean.videoSeqNo}" />
	        <button type="button" value="" class="btn btn-danger deleteBlock">
           		<i class="fas fa-trash-alt"></i>
            </button>
	      </div>
	    </div>
	    <hr>
	</c:forEach>
	<div class="col-md-12 row pageLoadingDiv">
		<div class="col-md-12 pageLoading pageLoadingNone">
			<img height="100px" class="pageLoadingImage" src="<c:url value='/global/images/loading.gif'/>">
		</div>
	</div>
  </div>
  <%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<script src="<c:url value='/watchHistorydeco/js/watchHistory.js'/> "></script>

</body>

</html>