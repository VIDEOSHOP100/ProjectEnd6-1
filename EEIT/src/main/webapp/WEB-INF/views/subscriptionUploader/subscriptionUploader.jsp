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

  <title>Modern Business - Start Bootstrap Template</title>

  <link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
  <link href="<c:url value='/global/css/modern-business.css'/> " rel="stylesheet">
  <link href="<c:url value='/subscriptionUploaderdeco/css/subscriptionUploader.css'/> " rel="stylesheet">
</head>
<body>
  <%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
  <div class="container"  style="margin-left:50px">
    <h1 class="mt-4 mb-3"  style="color:#4b367c;font-weight:900">訂閱上傳者
<!--       <small>Subheading</small> -->
    </h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
<!--         <a href="index.html">Home</a> -->
      </li>
<!--       <li class="breadcrumb-item active">Portfolio Item</li> -->
    </ol>
    <div class="row">

      <div class="col-md-9">
		<c:forEach var="aSubBean" items="${subscriptionUploader}">
          <div class="media mb-4">
<!--             <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt=""> -->
			<a href="<c:url value='/uploaderHomePage/${aSubBean.account}' />">
				<img height="100px" width="100px"	src='${pageContext.request.contextPath}/getImage/member/${aSubBean.account}'>
			</a>
            <div class="media-body">
              <a href="<c:url value='/uploaderHomePage/${aSubBean.account}' />">
              	<h5 class="mt-0">${aSubBean.account}</h5>
              </a>
              <button type="button" value="" class="btn btn-danger deleteBlock">
				已訂閱&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-bell"></i>
			  </button>
              <p>訂閱數:${aSubBean.subscription}</p>
            </div>
          </div>
		</c:forEach>
          <!-- Comment with nested comments -->
          
      </div>
    <div class="col-md-12 row pageLoadingDiv">
		<div class="col-md-12 pageLoading pageLoadingNone">
			<img height="100px" class="pageLoadingImage" src="<c:url value='/global/images/loading.gif'/>">
		</div>
	</div>
      

    </div>
    <!-- /.row -->


    <!-- Related Projects Row -->
    <!-- <h3 class="my-4">Related Projects</h3>

      <div class="row">

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
          <a href="#">
            <img class="img-fluid" src="http://placehold.it/500x300" alt="">
          </a>
        </div>

      </div> -->
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
<!-- 	<footer class="py-5 bg-dark"> -->
<!-- 	  <div class="container"> -->
<!-- 	    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p> -->
<!-- 	  </div> -->
<!-- 	</footer> -->
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<script src="<c:url value='/subscriptionUploaderdeco/js/subscriptionUploader.js'/> "></script>
</body>

</html>