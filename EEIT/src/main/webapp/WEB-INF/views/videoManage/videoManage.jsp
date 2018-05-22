<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>

<head>
<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	  <meta name="description" content="">
	  <meta name="author" content="">
	
	  <title>管理影片</title>
<!-- 	  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/black-tie/jquery-ui.css">  -->
<!-- 	  <link rel="stylesheet" href="/resources/demos/style.css"> -->
	  <link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
	  <link href="<c:url value='/global/css/modern-business.css'/> " rel="stylesheet">
	  <link href="<c:url value='/videoManage/css/videoManage.css'/> " rel="stylesheet">
</head>

<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
		<div class="container">
		
			<div class="row">
				<div class="col-md-10">
					<h1 class="mt-4 mb-3">影片管理
<!-- 						<small>Subheading</small> -->
					</h1>
					
				</div>
				
				
				<div class="col-md-2 addVideoButtonDiv">
					<button class="btn btn-danger addVideoButton " id = "insert-video"><i class="fas fa-plus"></i>&nbsp;&nbsp;&nbsp;新增影片</button>
				</div>
			</div>
			<ol class="breadcrumb">
<!-- 				<li class="breadcrumb-item"> -->
<!-- 					<a href="index.html">Home</a> -->
<!-- 				</li> -->
<!-- 				<li class="breadcrumb-item active">Portfolio 1</li> -->
			</ol>
			<div class="row divOutsideRow">
				<c:forEach var="videoBean" items="${videos}">
					<div class="col-md-12 row divOutside" style="padding:0px">
						<div class="col-md-10" style="padding:0px">
							<div class="media mb-4">
								<a	href="<c:url value='/videoRoom/${videoBean.videoSeqNo}' />">
									<img class="d-flex mr-3 picVideo" height="200px" width="400px"	src='${pageContext.request.contextPath}/getImage/video/${videoBean.videoSeqNo}'>
								</a>
								
								<div class="media-body videoDatas">
									<a href="<c:url value='/videoRoom/${videoBean.videoSeqNo}' />" class="videoTitleLink">
										<h5 class="mt-0 videoTitle" title="${videoBean.videoTitle}">${videoBean.videoTitle}</h5>
									</a>
									<p class="seqNo">${videoBean.videoSeqNo}</p>
									<p>觀看次數: ${videoBean.videoViews}</p>
									<c:set var="string1" value="${videoBean.videoUploadDate}"/>
									<c:set var="string2" value="${fn:substring(string1, 0, 19)}" />
									<p>影片上傳日期時間: ${string2 }</p>
									<p class="videoTypeOutSide">影片種類:</p>
									<p class="videoType">${videoBean.videoType}</p>
									
									<p>影片喜歡數: ${videoBean.videoLikes}</p>
									<p>影片不喜歡數: ${videoBean.videoUnlikes}</p>
									<p>影片播放清單類別: ${videoBean.videoUplodaerListType}</p>
									
									<p class="videoDescriptionOutSide">影片描述:</p>
									<p class="videoDescription" title="${videoBean.videoDescription}">${videoBean.videoDescription}</p>
								</div>
							</div>
						</div>
						<div class="col-md-2">
							<button class="btn btn-info create-user"><i class="fas fa-edit"></i></button>
							<button class="btn btn-danger delete-video"><i class="fas fa-trash-alt"></i></button>
						</div>
					</div>
				</c:forEach>
				
			</div>
			<div class="col-md-12 row divOutside pageLoadingDiv">
				<div class="col-md-12 pageLoading pageLoadingNone">
					<img height="100px" class="pageLoadingImage" src="<c:url value='/global/images/loading.gif'/>">
				</div>
			</div>
<!-- 			<hr> -->
<!-- 			<div class="col-md-12"> -->
<!-- 				<ul class="pagination justify-content-center"> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#" aria-label="Previous"> -->
<!-- 							<span aria-hidden="true">&laquo;</span> -->
<!-- 							<span class="sr-only">Previous</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">1</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">2</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#">3</a> -->
<!-- 					</li> -->
<!-- 					<li class="page-item"> -->
<!-- 						<a class="page-link" href="#" aria-label="Next"> -->
<!-- 							<span aria-hidden="true">&raquo;</span> -->
<!-- 							<span class="sr-only">Next</span> -->
<!-- 						</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			<div class="pageLoadingImage"> -->
<%-- 				<img src="<c:url value='/global/images/loading.gif'/>"> --%>
<!-- 			</div> -->
		</div>
		
		
		
		
		
		
<!-- 	變更影片表格	-------------------------- -->
		<div id="dialog-form" title="影片資料變更" class="hideForm">
			<p class="validateTips">請輸入欲變更資料</p>
			<form:form id="myForm" name = "myForm" ENCTYPE="multipart/form-data"  modelAttribute="updateVideoBean" method="POST">
			<fieldset>
				<input type="hidden" value="PUT" name="_method"/>
				<form:input path="videoSeqNo" type="hidden" name="seqNo" id="seqNo"/>
				<label for="videoTitle">影片標題</label>
				<form:input path="videoTitle" type="text" name="videoTitle" id="videoTitle" value="" class="text ui-widget-content ui-corner-all" />
				<label for="videoDescription">影片描述</label>
				<form:input path="videoDescription" type="text" name="videoDescription" id="videoDescription" value="" class="text ui-widget-content ui-corner-all" />
				<label>影片種類</label>
				<form:select path="videoType">
	                <form:option value="" label="--請選擇"/>
	                <form:options items="${videoTypeMap}" />
            	</form:select>
				<form:input path="videoImage" type="file" name="videoImage" id="videoImage" class="text ui-widget-content ui-corner-all" />
				<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
			</fieldset>
			</form:form>
		</div>
<!-- 	新增影片表格	-------------------------- -->
		<div id="insert-dialog-form" title="新增影片資料" class="hideForm">
			<p class="validateTips">請輸入欲新增影片資料</p>
			<form:form id="insertForm" name = "insertForm" ENCTYPE="multipart/form-data" modelAttribute="insertVideoBean" method="POST">
				<fieldset>
					<label for="videoTitleInsert">影片標題</label>
					<form:input type="text" path="videoTitle" name="videoTitleInsert" id="videoTitleInsert" value="" class="text ui-widget-content ui-corner-all"/>
					<label for="videoDescriptionInsert">影片描述</label>
					<form:input type="text" path="videoDescription" name="videoDescriptionInsert" id="videoDescriptionInsert" value="" class="text ui-widget-content ui-corner-all"/>
					<label for="song">影片種類</label>
					<p>
						<form:select path="videoType">
			                <form:option value="" label="--請選擇"/>
			                <form:options items="${videoTypeMap}" />
	            		</form:select>
					</p>
					<label for="videofileInsert">影片檔案</label>
					<form:input path="videoFile" type="file" name="videoFileInsert" id="videoFileInsert" class="text ui-widget-content ui-corner-all"/>
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px"/>
					<video  height="300px" width="500px" src="" id="videoPreview" controls="controls"></video>
					<p>影片封面截圖:</p>
					<canvas id=myCanvas></canvas>
				</fieldset>
			</form:form>
		</div>
<!-- 	刪除影片表格	-------------------------- -->
		<div id="delete-dialog-form" title="刪除資料" class="hideForm">
			<p class="validateTips">確認刪除此資料?</p>
			<form:form id="deleteForm" name = "deleteForm" modelAttribute="insertVideoBean">
				<fieldset>
<!-- 					<input type="hidden" value="DELETE" name="_method"/> -->
					<form:input path="videoSeqNo" type="hidden" name="seqNoDelete" id="seqNoDelete"/>
					<form:input path="videoStatus" type="hidden" name="videoStatus" id="videoStatusDelete" value = "0"/>
					
					<p>影片名稱:<span id="videoTitleDelete"></span></p>
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
				</fieldset>
			</form:form>
		</div>
<!-- 		<footer class="py-5 bg-dark"> -->
<!-- 			<div class="container"> -->
<!-- 				<p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p> -->
<!-- 			</div> -->
<!-- 		</footer> -->
		
		<div class="modal"><!-- Place at bottom of page --></div>
		<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
		<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="http://malsup.github.com/jquery.form.js"></script> 
		<script src="<c:url value='/videoManage/js/videoManage.js'/> "></script>
</body>
</html>