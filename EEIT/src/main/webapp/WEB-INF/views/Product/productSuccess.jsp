<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

     <!-- Bootstrap core CSS -->
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">

  </head>
<body>

	<!-- Navigation -->
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	
	 <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">商品新增成功!
        <small></small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">Home</a>
        </li>
        <li class="breadcrumb-item active">Contact</li>
      </ol>

    
      <!-- Contact Form -->
      <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
      <div class="row">
        <div class="col-lg-8 mb-4">
          <h3>${createOK.account}商品新增成功~</h3>
            <div class="control-group form-group">
              <div class="controls">
                <label>商品流水號 :</label>
                <span>${createOK.productSeqNo}</span>           
              </div>
            </div>
            <div class="control-group form-group">
              <div class="controls">
                <label>商品名稱  :  </label>
                <span>${createOK.proName}</span> 
                <p class="help-block"></p>
              </div>
            </div>
<!--             <div class="control-group form-group"> -->
<!--               <div class="controls"> -->
<!--                 <label>Name/姓名與職稱  :  </label> -->
<%--                 <span>${LoginOK.nickname}</span>  --%>
<!--               </div> -->
<!--             </div> -->

      
<!--             <div class="control-group form-group"> -->
<!--               <div class="controls"> -->
<!--                 <label>email:</label> -->
<%--                 <span>${insertok.email}</span> --%>
<!--               </div> -->
<!--             </div> -->

<!--             <div class="control-group form-group"> -->
<!--               <div class="controls"> -->
<!--                 <label>Title/主旨  :  </label> -->
<%--                 <span>${insertok.memTitle}</span> --%>
<!--               </div> -->
<!--             </div> -->
<!--             <div class="control-group form-group"> -->
<!--               <div class="controls"> -->
<!--                 <label>Messeage/聯絡訊息  :  </label> -->
<%--                 <span>${insertok.memAsk}</span> --%>
<!--               </div> -->
<!--             </div> -->


         
            <div id="success"></div>
            <!-- For success/fail messages -->


        </div>

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

	<br><br>
	<a href="/">回首頁</a>
	
	
	
	<!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
   </footer>


</body>
</html>