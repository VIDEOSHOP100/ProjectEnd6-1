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
	  
    <title>會員問題</title>
	<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
	<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
	<link href="<c:url value='/global/css/index.css'/>" rel="stylesheet">
	
<!--     <meta charset="utf-8"> -->
<!--   <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!--   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  <link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
  <link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
  <link href="<c:url value='/backstage/css/backstage.css'/>" rel="stylesheet">
	
  </head>

  <body>
	  <%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
      <div class="container" style="margin-left:50px">
       <h1 class="mt-4 mb-3">常見問題</h1>
     <ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">首頁</a></li>
        <li class="breadcrumb-item active">常見問題</li>
      </ol>
  
   <div class="row">
        <div class="col-lg-2 mb-4">
          <div class="list-group"> 
            <a class="list-group-item pointer text-primary replyMessage" href ="${pageContext.request.contextPath}/QuestionList/1" >帳號問題</a>
            <a class="list-group-item pointer text-primary questionManage" href ="${pageContext.request.contextPath}/QuestionList/2" >密碼與登入</a>
            <a class="list-group-item pointer text-primary memberReport" href ="${pageContext.request.contextPath}/QuestionList/3" >運送與寄送商品</a>
            <a class="list-group-item pointer text-primary productReport" href ="${pageContext.request.contextPath}/QuestionList/4" >商品交易</a>
            <a class="list-group-item pointer text-primary liveStreamReport" href ="${pageContext.request.contextPath}/QuestionList/5" >直播拍賣</a>
            <a class="list-group-item pointer text-primary videoReport" href ="${pageContext.request.contextPath}/QuestionList/6" >影片上傳</a>

     
    
          </div>
        </div>
        <div class="col-lg-10 mb-4" id="content">
          <h1>LiveMarket</h1>
          <h3>客戶服務中心</h3>
          
		<div id="accordion">
			<c:forEach items = "${QuestionList}" var="questionListBean">
				<h3>${questionListBean.questionListTitle }</h3>
					<div>
						<p>
							${questionListBean.questionListArticle }
						</p>
					</div>
			</c:forEach>
		</div>
        </div>
      </div>
	
   


	</div>


<!--     <footer class="py-5 bg-dark"> -->
<!--       <div class="container"> -->
<!--         <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p> -->
<!--       </div> -->
<!--     </footer> -->
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  <script>
	  	  $( function() {
		    $( "#accordion").accordion();
		  } );

	  </script>
	  <%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
  </body>
</html>