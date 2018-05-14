<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>
	<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
	<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
	<link href="<c:url value='/global/css/index.css'/>" rel="stylesheet">

  </head>

  <body>

    <div class="container">
	  <%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
      <h1 class="mt-4 mb-3">FAQ
        <small>Subheading</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">FAQ</li>
      </ol>

      <div class="mb-4" id="accordion" role="tablist" aria-multiselectable="true">
	        <c:forEach items = "${allQuestionList }" var="questionListBean">
	        <div class="card">
	          <div class="card-header" role="tab" id="headingOne">
	            <h5 class="mb-0">
	              <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">${questionListBean.questionListTitle }</a>
	            </h5>
	          </div>
	
	          <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne">
	            <div class="card-body">
	              ${questionListBean.questionListArticle }
	            </div>
	          </div>
	        </div>
        	</c:forEach>
		</div>	
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
    </footer>


  </body>
</html>