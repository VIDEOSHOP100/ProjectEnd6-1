<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>
	<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
	<link href="<c:url value='/global/css/modern-business.css'/> " rel="stylesheet">
	<link href="<c:url value='/likeUnlikeVideos/css/likeUnlikeVideos.css'/> " rel="stylesheet">
  </head>

  <body>

    <!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>

    <!-- Page Content -->
    <div class="container"  style="margin-left:50px">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">喜歡的影片
<!--         <small>Subheading</small> -->
      </h1>
		
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
<!--           <a href="index.html">Home</a> -->
        </li>
<!--         <li class="breadcrumb-item active">Portfolio 2</li> -->
      </ol>

      <div class="row" style="margin-left:20px">
      	<c:forEach var="aVideoBean" items="${likeVideos}">
        <div class="col-lg-2 portfolio-item">
          <div class="card h-100"  style="border:none">
          <a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />">
			<img class="card-img-top" height="150px" width="50px" src='${pageContext.request.contextPath}/getImage/video/${aVideoBean.videoSeqNo}'>
		  </a>
		  
<!--             <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a> -->
            <div class="card-body">
              <h4 class="card-title" title="${aVideoBean.videoTitle}">
                <a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />" class="videoTitle">
             	 ${aVideoBean.videoTitle}
                </a>
              </h4>
              <p class="card-text videoDescription" title="${aVideoBean.videoDescription}">${aVideoBean.videoDescription}</p>
		      <input type="hidden" class='videoSeqNo' value="${aVideoBean.videoSeqNo}" />
              <button type="button" value="" class="btn btn-danger deleteBlock">
              	
             	 <i class="fas fa-trash-alt"></i>
              </button>
            </div>	
          </div>
        </div>
        </c:forEach>
        
        
        
        
      </div>
    </div>
    <%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<script src="<c:url value='/likeUnlikeVideos/js/likeUnlikeVideos.js'/> "></script>
<%-- 		<script src="<c:url value='/global/vendor/jquery/jquery.min.js'/> "></script> --%>
<%--     	<script src="<c:url value='/global/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script> --%>

  </body>

</html>