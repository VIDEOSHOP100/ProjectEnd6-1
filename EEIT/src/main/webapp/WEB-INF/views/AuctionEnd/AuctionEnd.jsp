<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/AuctionEnd/css/AuctionEnd.css'/>" rel="stylesheet">
</head>
<body>
<div class="container">
<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
<input id="catch-account" type="hidden" name = "account" value= "${LoginOK.account}">
      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">得標管理
      
<!--         <small>Subheading</small> -->
      </h1>
       <button id="allPay" name="payment" value="allPay" class="btn btn-outline-info">歐付寶</button>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">得標管理</li>
      </ol>
 <c:if test="${empty AllAuctionList}">
 <div class="col-lg-12 text-center">
  <h2 class="sellproduct">您目前沒有得標的物品哦</h2>
  </div>
 </c:if> 
      <!-- Blog Post -->
       <c:if test="${!empty AllAuctionList}">
       
      <c:forEach var="AllAuctionLista" items="${AllAuctionList}">
      <div class="card mb-4">
        <div class="card-body">
          <div class="row">
            <div class="col-lg-6">
              <a href="#">
                <img class="img-fluid rounded" src="${pageContext.request.contextPath}/getImage/Product/${AllAuctionLista.picSeqNo}" alt="">
              </a>
            </div>
            <div class="col-lg-6">
<!--設置時間+切割 -->
              <h2 class="card-title">${AllAuctionLista.proName}</h2>
        <c:set var="string1" value="${AllAuctionLista.proTime}"/>
		<c:set var="string2" value="${fn:substring(string1, 0, 19)}" />
              <p class="card-text">得標時間：${string2}</p>
<!--               <a href="#" class="btn btn-primary">Read More &rarr;</a> -->
            </div>
          </div>
        </div>
        <div class="card-footer text-muted">
          Posted on January 1, 2017 by
          <a href="#">Start Bootstrap</a>
        </div>
      </div>
</c:forEach>
   

      <!-- Pagination -->
      <ul class="pagination justify-content-center mb-4">
        <li class="page-item">
          <a class="page-link" href="#">&larr; Older</a>
        </li>
        <li class="page-item disabled">
          <a class="page-link" href="#">Newer &rarr;</a>
        </li>
      </ul>
</c:if> 
    </div>


  <div id="responce">
    </div>
  <!-- /.container -->
  <script src="<c:url value='/AuctionEnd/js/AuctionEnd.js'/> "></script>
</body>
</html>