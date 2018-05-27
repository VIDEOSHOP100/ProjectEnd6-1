<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>後台管理系統</title>

	<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
	<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
	<link href="<c:url value='/backstage/css/backstage.css'/>" rel="stylesheet">
 <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>
  
  </head>
  <body>
    <%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
    <div class="container">
      <h1 class="mt-4 mb-3 font-weight-bold">後台管理系統
        <small>Backstage</small>
      </h1> 
      <div class="row">
        <div class="col-md-11">
        </div>

      </div>
      <ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">首頁</a></li>
        <li class="breadcrumb-item active">後台管理系統</li>
      </ol>

      <div class="row">
        <div class="col-lg-2 mb-4">
          <div class="list-group"> 
            <a class="list-group-item pointer text-primary replyMessage">回覆留言</a>
            <a class="list-group-item pointer text-primary questionManage">問答集管理</a>
            <a class="list-group-item pointer text-primary memberReport">會員客訴</a>
            <a class="list-group-item pointer text-primary productReport">商品客訴</a>
            <a class="list-group-item pointer text-primary liveStreamReport">直播客訴</a>
            <a class="list-group-item pointer text-primary videoReport">影片客訴</a>
            <a class="list-group-item pointer text-primary homePageManage">首頁管理</a>
            <a class="list-group-item pointer text-primary mallManage">商城管理</a>
            <a class="list-group-item pointer text-primary websiteReport">報表</a>
     
    
          </div>
        </div>
        <div class="col-lg-10 mb-4" id="content">
          <h2>後台首頁</h2>
          <p>請從左側列表中選擇功能</p>
        </div>
      </div>

    </div>
<!--  商城管理表單 ------------------------------------------------------------------------------>
 <div id="insert-dialog-form" title="新增商城首頁輪播牆圖片" class="hideForm" style="overflow:hidden">
<!-- 						<p class="validateTips">確認刪除此資料?</p> -->
									<form:form id="hotForm"  modelAttribute="ProductHotBean" enctype="multipart/form-data" method="POST">
										<fieldset>
<!-- 											<input type="hidden" value="DELETE" name="_method"/> -->
						<label for="productName">圖片標題: </label>
					<form:input type="text" path="productName"  id="productName" value="" class="text ui-widget-content ui-corner-all"/>
											<label for="hotFile">圖片檔案: </label>
					<form:input path="hotFile" type="file" id="hotFile" class="text ui-widget-content ui-corner-all"/>
											
											<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
									</fieldset>
						</form:form>
					</div>
<!-- 客服問題集修改	----------------------------------------------------------------------------->
<!-- 	 <div id="FAQ-dialog-form" title="客服問題修改" class="hideForm" style="overflow:hidden"> -->
<!-- 	<!-- 						<p class="validateTips">確認刪除此資料?</p> --> 
<%-- 		<form:form modelAttribute="questionListBean" action="/EEIT/QuestionList/update" method="post"> --%>
<!-- 			<fieldset> -->
<!-- 	  		<label for="productName">修改問題標題:</label> -->
<%-- 	  		<form:input type="text" path="questionListTitle" /> --%>
<!-- 	  		<label for="productName">修改問題內容:</label> -->
<%-- 	  		<form:input type="text" path="questionListArticle"/> --%>
<!-- 	  		<label for="productName">修改管理員:</label> -->
<%-- 	   		<form:input type="text" path="managerId"/> --%>
<!-- 	   		<label for="productName">問題類型:</label> -->
<%-- 	   		<form:input type="text" path="questionListType"/> --%>
<%-- 	   		<form:select  id="topic" path="questionListStatus"> --%>
<%-- 	   			<form:option value="1">顯示</form:option> --%>
<%-- 	    		<form:option value="0">不顯示</form:option>		 --%>
<%-- 	    	</form:select> --%>
<!-- 	   			<input type="submit" value="Update"/> -->
<!-- 	   		</fieldset> -->
<%-- 	   	</form:form> --%>
<!-- 	</div> -->
<!-- 					end ----------------------------------------------------------------------------->
<!-- 	刪除商品表格	-------------------------- -->
					<div id="delete-dialog-form" title="刪除資料" class="hideForm" style="overflow:hidden">
						<p class="validateTips">確認刪除此資料?</p>
									<form:form id="deleteHotForm" modelAttribute="DelHotBean" enctype="multipart/form-data" method="POST">
										<fieldset>
											<form:input path="productHotSeqNo" type="hidden" name="seqNoDelete" id="seqNoDelete"/>
											<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
									</fieldset>
						</form:form>
					</div>
		<script src="<c:url value='/backstage/js/backstage.js'/> "></script>
		<script src="<c:url value='/backstage/js/backstageLive.js'/> "></script>
		<script src="<c:url value='/backstage/js/backstageAdvice.js'/> "></script>
		<script src="<c:url value='/backstage/js/vic.js'/> "></script>
		<script src="<c:url value='/backstage/js/backstageVideo.js'/> "></script>
		<script src="<c:url value='/backstage/js/highcharts.js'/> "></script>
		<script src="<c:url value='/backstage/js/backstageHomePageManage.js'/> "></script>
		<script src="<c:url value='/backstage/js/market.js'/> "></script>
		 <script src="http://code.highcharts.com/highcharts.js"></script>
		 <script src="https://code.highcharts.com/highcharts-3d.js"></script>
		 <script src="https://code.highcharts.com/modules/exporting.js"></script>
		 <script src="https://code.highcharts.com/modules/export-data.js"></script>

 
  </body>
</html>