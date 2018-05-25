<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link
	href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> "
	rel="stylesheet"> 
<link href="<c:url value='/global/css/modern-business.css'/>"
	rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>

<%-- 	    <c:forEach var="aLiveStreamBean" items="${AllLiveStream}"> --%>
<!-- 	    <div class="row"> -->
<!-- 	      <div class="col-md-7"> -->
<!-- 	        <a href="#"> -->
<%-- 	          <a href="<c:url value='/LiveStream/${aLiveStreamBean.liveStreamSeqNo}' />"> --%>
<%-- 				<img style="border: solid 1px red" class="img-fluid rounded mb-3 mb-md-0" width="300px" height="100px" src='${pageContext.request.contextPath}/getImage/LiveCoverPath/${aLiveStreamBean.liveStreamSeqNo}'> --%>
<!-- 			  </a> -->
<!-- 	        </a> -->
<!-- 	      </div> -->
<!-- 	      <div class="col-md-5"> -->
<%-- 	        <h3><a href="<c:url value='/LiveStream/${aLiveStreamBean.liveStreamSeqNo}' />">${aLiveStreamBean.streamName}</a></h3> --%>
<!-- 	        <p><a class="uploaderLink" -->
<%-- 							href="<c:url value='/uploaderHomePage/${aLiveStreamBean.account}' />">${aLiveStreamBean.account}</a></p> --%>
<%-- 	        <p>觀看次數:${aLiveStreamBean.liveStreamView}</p> --%>

<!-- 	      </div> -->
<!-- 	    </div> -->
<!-- 	    <hr> -->
<%-- 	</c:forEach> --%>

   <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">直播大廳
        <small></small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active"><a href="gettestboot">直播大廳</a></li>
      </ol>

      <div class="row">
      <c:forEach var="aLiveStreamBean" items="${AllLiveStream}">
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="<c:url value='/LiveStream/${aLiveStreamBean.liveStreamSeqNo}' />">
            <img  class="card-img-top" width="300px" height="300px" src='${pageContext.request.contextPath}/getImage/LiveCoverPath/${aLiveStreamBean.liveStreamSeqNo}'>
            </a>
            <div class="card-body">
              <h4 class="card-title">
               <a href="<c:url value='/LiveStream/${aLiveStreamBean.liveStreamSeqNo}' />">${aLiveStreamBean.streamName}</a>
              </h4>
              <p>UP主:<a class="uploaderLink"href="<c:url value='/uploaderHomePage/${aLiveStreamBean.account}' />">${aLiveStreamBean.account}</a></p>
           <p>觀看次數:${aLiveStreamBean.liveStreamView}</p>
            </div>
          </div>
          
        </div>
          </c:forEach>
         </div>
        
        

      <!-- Pagination -->
<!--       <ul class="pagination justify-content-center"> -->
<!--         <li class="page-item"> -->
<!--           <a class="page-link" href="#" aria-label="Previous"> -->
<!--             <span aria-hidden="true">&laquo;</span> -->
<!--             <span class="sr-only">Previous</span> -->
<!--           </a> -->
<!--         </li> -->
<!--         <li class="page-item"> -->
<!--           <a class="page-link" href="#">1</a> -->
<!--         </li> -->
<!--         <li class="page-item"> -->
<!--           <a class="page-link" href="#">2</a> -->
<!--         </li> -->
<!--         <li class="page-item"> -->
<!--           <a class="page-link" href="#">3</a> -->
<!--         </li> -->
<!--         <li class="page-item"> -->
<!--           <a class="page-link" href="#" aria-label="Next"> -->
<!--             <span aria-hidden="true">&raquo;</span> -->
<!--             <span class="sr-only">Next</span> -->
<!--           </a> -->
<!--         </li> -->
<!--       </ul> -->

    </div>
    <!-- /.container -->
    

	
<!-- 	<footer class="py-5 bg-dark"> -->
<!-- 	<div class="container"> -->
<!-- 		<p class="m-0 text-center text-white">Copyright &copy; Your -->
<!-- 			Website 2018</p> -->
<!-- 	</div> -->
<!-- 	</footer> -->
	
	
</body>
</html>