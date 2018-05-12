<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
<link href="<c:url value='/uploaderHomePage/css/uploaderHomePage.css'/>" rel="stylesheet">
<title>上傳者首頁</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
    
    <div class="container">

      <h1 class="mt-4 mb-3">上傳者首頁
        <small>Subheading</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Services</li>
      </ol>

      <img class="img-fluid rounded mb-6" src="<c:url value='/uploaderHomePage/images/images.jpg' />" alt="" width="1600px"><!--       http://placehold.it/1200x300 -->

      <div class="row titleBlock">
	      <div class="col-md-2">
	          <a class="btn btn-lg btn-secondary btn-block" href="PersonShopHome">商店首頁</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">商品</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">商品列表</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">影片</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">影片列表</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">商店資料</a>
	      </div>
      </div>
      <div class="row">
      
      	<c:forEach var="aVideoBean" items="${uploaderVideos}">
	      	<div class="col-lg-3 mb-4">
	          <div class="card h-100">
	            <h4 class="card-header">${aVideoBean.videoTitle}</h4>
	            <div class="card-body">
					<a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' /> ">
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
      	
      </div>
        
    </div>
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
    </footer>
    <%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
  </body>

</html>