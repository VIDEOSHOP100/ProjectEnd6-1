<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>後台管理系統 - 首頁管理</title>

	<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
	<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
  </head>
  <body>
    <%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
    <div class="container">
      <h1 class="mt-4 mb-3">>後台管理系統
        <small>Backstage</small>
      </h1> 
      <div class="row">
        <div class="col-md-11">
        </div>
        <div class="col-md-1">
          <a href="<c:url value='/managerLogout'/>">
            <button class="btn btn-danger float-right">管理員登出</button>
          </a>
        </div>
 
      </div>
      <ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">首頁</a></li>
        <li class="breadcrumb-item active">後台系統</li>
      </ol>

      <div class="row">
        <div class="col-lg-3 mb-4">
          <div class="list-group"> 
            <a class="list-group-item" href="${pageContext.request.contextPath}/backstage/replyMessage">回覆留言</a>
            <a class="list-group-item" href="${pageContext.request.contextPath}/backstage/questionManage">問答集管理</a>
            <a class="list-group-item" href="${pageContext.request.contextPath}/backstage/storeReport">商店客訴</a>
            <a class="list-group-item" href="${pageContext.request.contextPath}/backstage/productReport">商品客訴</a>
            <a class="list-group-item" href="${pageContext.request.contextPath}/backstage/videoReport">影片客訴</a>
            <a class="list-group-item" href="${pageContext.request.contextPath}/backstage/memberReport">會員客訴</a>
            <a class="list-group-item" href="${pageContext.request.contextPath}/backstage/liveStreamReport">直播客訴</a>
            <a class="list-group-item bg-primary text-white" href="${pageContext.request.contextPath}/backstage/homePageManage">首頁管理</a>
            <a class="list-group-item" href="${pageContext.request.contextPath}/backstage/mallManage">商城管理</a>
            <a class="list-group-item" href="${pageContext.request.contextPath}/backstage/websiteReport">報表</a>
    
    
          </div>
        </div>
        <div class="col-lg-9 mb-4">
          <h2>首頁管理</h2>

			
	
        </div>
      </div>

    </div>
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; IIITube 2018</p>
      </div>
    </footer>

  </body>
</html>