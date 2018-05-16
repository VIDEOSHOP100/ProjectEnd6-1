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
	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  
    <title>Modern Business - Start Bootstrap Template</title>
	<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
	<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
	<link href="<c:url value='/global/css/index.css'/>" rel="stylesheet">

  </head>

  <body>

    <div class="container">
	  <%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
      <h1 class="mt-4 mb-3">客服
        <small>常見問題集</small>
      </h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="/EEIT">Home</a>
		</li>
		<li class="breadcrumb-item active">客服中心</li>
	</ol>

		<div id="accordion">
			<c:forEach items = "${allQuestionList }" var="questionListBean">
				<h3>${questionListBean.questionListTitle }</h3>
				<div>
					<p>
						${questionListBean.questionListArticle }
					</p>
				</div>
			</c:forEach>
		</div>
	</div>	

    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
    </footer>
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  <script>
	  	  $( function() {
		    $( "#accordion" ).accordion();
		  } );
	  </script>
  </body>
</html>