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

      <h1 class="mt-4 mb-3">${uploaderAccount }
      	<input type="hidden" class="uploaderAccountForUploaderHomePage" value="${uploaderAccount }">
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Services</li>
      </ol>

      <img class="img-fluid rounded mb-6" src="<c:url value='/uploaderHomePage/images/images.jpg' />" alt="" width="1600px"><!--       http://placehold.it/1200x300 -->
<!-- 	  <hr> -->
      <div class="row titleBlock">
	      <div class="col-md-3" style="padding:0px">
	          <a class="btn btn-lg btn-secondary btn-block homePageButton" href="" style="margin-right:0px;margin-left:0px;">商店首頁</a>
	      </div>
	      <div class="col-md-3" style="padding:0px">
	        <a class="btn btn-lg btn-secondary btn-block productPageButton" href="" style="margin-right:0px;margin-left:0px;">商品</a>
	      </div>
<!-- 	      <div class="col-md-2"> -->
<!-- 	        <a class="btn btn-lg btn-secondary btn-block productListButton" href="#">商品列表</a> -->
<!-- 	      </div> -->
	      <div class="col-md-3" style="padding:0px">
	        <a class="btn btn-lg btn-secondary btn-block videoPageButton" href="" style="margin-right:0px;margin-left:0px;">影片</a>
	      </div>
<!-- 	      <div class="col-md-2"> -->
<!-- 	        <a class="btn btn-lg btn-secondary btn-block videoListPageButton" href="#">影片列表</a> -->
<!-- 	      </div> -->
	      <div class="col-md-3" style="padding:0px">
	        <a class="btn btn-lg btn-secondary btn-block storePageButton" href="" style="margin-right:0px;margin-left:0px;">商店資料</a>
	      </div>
      </div>
      
      <hr class="resultHr">
      <div class="row showResultBlock">
	      <div class="col-lg-12">
	      	<h1>熱門商品</h1>
	      </div>
	      	<c:forEach var="aVideoBean" items="${productSaleBeanList}">
		      	<div class="col-lg-2 mb-4">
		          <div class="card h-100">
		            <div class="card-body">
						<a href="<c:url value='/searchProductIntro/${aVideoBean.productSeqNo}' /> ">
							<img height="130px" width="200px" src='${pageContext.request.contextPath}/getImage/Product/${aVideoBean.productSeqNo}'>
						</a>
						<p class="card-text">
			              <a  class="IdentityLink"  href="<c:url value='/searchProductIntro/${aVideoBean.productSeqNo}' /> ">
			              	${aVideoBean.proName}
			              </a>
		              	</p>
		              <div class="card-text IdentityDescription" style="overflow:hidden">${aVideoBean.proDescription}</div>
		            </div>
		            <div class="card-footer">
		              <a href="<c:url value='/searchProductIntro/${aVideoBean.productSeqNo}' /> "><input type="button" class="btn btn-primary" value="購買"></a>
		            </div>
		          </div>
	       		</div>
	      	</c:forEach>
	      <div class="col-lg-12">
	      	<h1>正在直播</h1>
	      </div>
	      	<c:forEach var="aVideoBean" items="${inputLiveStreamTimeBeanList}">
		      	<div class="col-lg-2 mb-4">
		          <div class="card h-100">
		            <div class="card-body">
						<a href="<c:url value='/LiveStream/${aVideoBean.liveStreamSeqNo}' /> ">
							<img height="130px" width="200px" src='${pageContext.request.contextPath}/getImage/LiveCoverPath/${aVideoBean.liveStreamSeqNo}'>
						</a>
		              <a  class="IdentityLink"  href="<c:url value='/LiveStream/${aVideoBean.liveStreamSeqNo}' /> ">
		              	<div class="card-text">${aVideoBean.streamName}</div>
		              </a>
	<%-- 	              <p class="card-text">${aVideoBean.videoDescription}</p> --%>
		            </div>
	<!-- 	            <div class="card-footer"> -->
	<!-- 	              <a href="#" class="btn btn-primary">購買</a> -->
	<!-- 	            </div> -->
		          </div>
	       		</div>
	      	</c:forEach>
	      <div class="col-lg-12">
	      	<h1>熱門影片</h1>
	      </div>
	      	<c:forEach var="aVideoBean" items="${videoBeanList}">
		      	<div class="col-lg-2 mb-4">
		          <div class="card h-100">
		            <div class="card-body">
						<a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' /> ">
							<img height="130px" width="200px" src='${pageContext.request.contextPath}/getImage/video/${aVideoBean.videoSeqNo}'>
						</a>
						<div class="card-text">
			              <a class="IdentityLink" href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' /> ">
			              ${aVideoBean.videoTitle}
			              </a>
			             </div>
		              <p class="card-text IdentityDescription" style="overflow:hidden">${aVideoBean.videoDescription}</p>
		            </div>
	<!-- 	            <div class="card-footer"> -->
	<!-- 	              <a href="#" class="btn btn-primary">購買</a> -->
	<!-- 	            </div> -->
		          </div>
	       		</div>
	      	</c:forEach>
      </div>
    <%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
  	<script src="<c:url value='/uploaderHomePage/js/uploaderHomePage.js'/> "></script>
  </body>

</html>