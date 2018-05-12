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

  </head>

  <body>

    <!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">喜歡的影片
        <small>Subheading</small>
      </h1>
		
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Portfolio 2</li>
      </ol>

      <div class="row">
      	<c:forEach var="aVideoBean" items="${likeVideos}">
        <div class="col-lg-6 portfolio-item">
          <div class="card h-100">
          <a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />">
			<img class="card-img-top" height="400px" width="200px" src='${pageContext.request.contextPath}/getImage/video/${aVideoBean.videoSeqNo}'>
		  </a>
		  
<!--             <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a> -->
            <div class="card-body">
              <h4 class="card-title">
                <a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' />">
             	 ${aVideoBean.videoTitle}
                </a>
              </h4>
              <p class="card-text">${aVideoBean.videoDescription}</p>
		      <input type="hidden" class='videoSeqNo' value="${aVideoBean.videoSeqNo}" />
              <button type="button" value="" class="btn btn-danger deleteBlock">
              	
             	 <i class="fas fa-trash-alt"></i>
              </button>
            </div>	
          </div>
        </div>
        </c:forEach>
        
        
        
        
      </div>
      <!-- /.row -->

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">2</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">3</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>

    </div>
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
    </footer>
    <%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<script src="<c:url value='/likeUnlikeVideos/js/likeUnlikeVideos.js'/> "></script>
<%-- 		<script src="<c:url value='/global/vendor/jquery/jquery.min.js'/> "></script> --%>
<%--     	<script src="<c:url value='/global/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script> --%>

  </body>

</html>