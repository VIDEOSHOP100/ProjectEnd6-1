<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
<link href="<c:url value='/uploaderHomePage/css/uploaderHomePage.css'/>" rel="stylesheet">
<title>上傳者首頁</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
    
    <div class="container" style="margin-left:50px"> 
	    <input id="account" type="hidden" name="account" value="${LoginOK.account}">
		<input id="othersideaccount" type="hidden" name="othersideaccount" value="${otherside.account}">
		<div class="profileButtonBlock">
				<c:if test="${LoginOK.account != otherside.account}">
					<c:if test="${!empty LoginOK}">

						<c:if test="${friendstatus == 1}">
							<button name="nonFriend" type="button" value='1'
								class="btn btn-danger nonfriendButton friend">取消好友</button>
						</c:if>
						<c:if test="${friendstatus == 0}">
							<button name="friend" type="button" value='0'
								class="btn btn-success friendButton friend">加為好友</button>
						</c:if>

						<button id="memberReportButton"
							class="btn btn-warning memberReportButton memberReport"
							type="button" data-toggle="modal" data-target="#popMemberReport">檢舉會員</button>
							
						<button id="sendMessage" class="btn btn-success" 
						type="button" data-toggle="modal" data-target="#popSendMessage">發送訊息</button>


					</c:if>

				</c:if>
				<c:if test="${(!empty ManagerLoginOK) && otherside.ban==false}">
					<button class="btn btn-danger ban" value="0">封鎖會員</button>
				</c:if>
				<c:if test="${(!empty ManagerLoginOK) && otherside.ban==true}">
					<button class="btn btn-success ban" value="1">解除封鎖</button>
				</c:if>
		</div>
      <h1 class="mt-4 mb-3">${uploaderAccount }
      	<input type="hidden" class="uploaderAccountForUploaderHomePage" value="${uploaderAccount }">
      </h1>

      <ol class="breadcrumb">
      	  <li class="breadcrumb-item">
		    <a href="<c:url value='/' />">首頁</a>
		  </li>
		  <li class="breadcrumb-item active">${uploaderAccount }</li>
      </ol>

      <img class="img-fluid rounded mb-6" src="<c:url value='/uploaderHomePage/images/images.jpg' />" alt="" width="1600px"><!--       http://placehold.it/1200x300 -->
<!-- 	  <hr> -->
      <div class="row titleBlock">
	      <div class="col-md-3" style="padding:0px">
	          <a class="btn btn-lg btn-secondary btn-block homePageButton" href="" style="margin-right:0px;margin-left:0px;">商店首頁</a>
	      </div>
	      <div class="col-md-3" style="padding:0px">
	        <a class="btn btn-lg btn-secondary btn-block productPageButton" href="" style="margin-right:0px;margin-left:0px;">商品</a>
	      </div>
<!-- 	      <div class="col-md-2"> -->
<!-- 	        <a class="btn btn-lg btn-secondary btn-block productListButton" href="#">商品列表</a> -->
<!-- 	      </div> -->
	      <div class="col-md-3" style="padding:0px">
	        <a class="btn btn-lg btn-secondary btn-block videoPageButton" href="" style="margin-right:0px;margin-left:0px;">影片</a>
	      </div>
<!-- 	      <div class="col-md-2"> -->
<!-- 	        <a class="btn btn-lg btn-secondary btn-block videoListPageButton" href="#">影片列表</a> -->
<!-- 	      </div> -->
	      <div class="col-md-3" style="padding:0px">
	        <a class="btn btn-lg btn-secondary btn-block storePageButton" href="" style="margin-right:0px;margin-left:0px;">商店資料</a>
	      </div>
      </div>
      
      <hr class="resultHr">
      <div class="row showResultBlock">
	      <div class="col-lg-12">
	      	<h1>熱門商品</h1>
	      </div>
	      	<c:forEach var="aVideoBean" items="${productSaleBeanList}">
		      	<div class="col-lg-2 mb-4">
		          <div class="card h-100">
		            <div class="card-body">
						<a href="<c:url value='/searchProductIntro/${aVideoBean.productSeqNo}' /> ">
							<img height="130px" width="200px" src='${pageContext.request.contextPath}/getImage/Product/${aVideoBean.productSeqNo}'>
						</a>
						<p class="card-text">
			              <a  class="IdentityLink"  href="<c:url value='/searchProductIntro/${aVideoBean.productSeqNo}' /> ">
			              	${aVideoBean.proName}
			              </a>
		              	</p>
		              <div class="card-text IdentityDescription" style="overflow:hidden">${aVideoBean.proDescription}</div>
		            </div>
		            <div class="card-footer">
		              <a href="<c:url value='/searchProductIntro/${aVideoBean.productSeqNo}' /> "><input type="button" class="btn btn-primary" value="購買"></a>
		            </div>
		          </div>
	       		</div>
	      	</c:forEach>
	      <div class="col-lg-12">
	      	<h1>正在直播</h1>
	      </div>
	      	<c:forEach var="aVideoBean" items="${inputLiveStreamTimeBeanList}">
		      	<div class="col-lg-2 mb-4">
		          <div class="card h-100">
		            <div class="card-body">
						<a href="<c:url value='/LiveStream/${aVideoBean.liveStreamSeqNo}' /> ">
							<img height="130px" width="200px" src='${pageContext.request.contextPath}/getImage/LiveCoverPath/${aVideoBean.liveStreamSeqNo}'>
						</a>
		              <a  class="IdentityLink"  href="<c:url value='/LiveStream/${aVideoBean.liveStreamSeqNo}' /> ">
		              	<div class="card-text">${aVideoBean.streamName}</div>
		              </a>
	<%-- 	              <p class="card-text">${aVideoBean.videoDescription}</p> --%>
		            </div>
	<!-- 	            <div class="card-footer"> -->
	<!-- 	              <a href="#" class="btn btn-primary">購買</a> -->
	<!-- 	            </div> -->
		          </div>
	       		</div>
	      	</c:forEach>
	      <div class="col-lg-12">
	      	<h1>熱門影片</h1>
	      </div>
	      	<c:forEach var="aVideoBean" items="${videoBeanList}">
		      	<div class="col-lg-2 mb-4">
		          <div class="card h-100">
		            <div class="card-body">
						<a href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' /> ">
							<img height="130px" width="200px" src='${pageContext.request.contextPath}/getImage/video/${aVideoBean.videoSeqNo}'>
						</a>
						<div class="card-text">
			              <a class="IdentityLink" href="<c:url value='/videoRoom/${aVideoBean.videoSeqNo}' /> ">
			              ${aVideoBean.videoTitle}
			              </a>
			             </div>
		              <p class="card-text IdentityDescription" style="overflow:hidden">${aVideoBean.videoDescription}</p>
		            </div>
	<!-- 	            <div class="card-footer"> -->
	<!-- 	              <a href="#" class="btn btn-primary">購買</a> -->
	<!-- 	            </div> -->
		          </div>
	       		</div>
	      	</c:forEach>
      </div>
      </div>
    <%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
  	<script src="<c:url value='/uploaderHomePage/js/uploaderHomePage.js'/> "></script>
  	
  	
<!-------------------------------------檢舉會員------------------------------------->



	<div class="modal fade" id="popMemberReport" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">檢舉會員</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<c:if test="${!empty LoginOK}">
				<div class="modal-body">

					<form:form id="memberReport" method="POST"
						action="${pageContext.request.contextPath}/memberReport"
						modelAttribute="MemberReportBean" class=""
						enctype="multipart/form-data">



						<div class="form-group">
							<form:input path="reportTitle" type="text"
								class="form-control input-sm" id="reportTitle"
								placeholder="檢舉標題" />
						</div>

						<div class="form-group">
							<form:textarea path="reportContent" type="text"
								class="form-control input-sm" id="reportContent"
								placeholder="檢舉內容" />
						</div>
<!-- 						<div class="form-group"> -->
<!-- 							附加照片 -->
<%-- 							<form:input path="reportPhoto" type="file" accept="image/*" /> --%>
<!-- 						</div> -->
					</form:form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-secondary" id="cancel"
						data-dismiss="modal">取消</button>
					<button id="reportSubmit" type="button" class="btn btn-warning">確認檢舉</button>

				</div>
				</c:if>
			</div>
		</div>
	</div>
	
	
	
	
	
	
<!-------------------------------------發送訊息 ------------------------------------->
	
	
	
	
	
	
		<div class="modal fade" id="popSendMessage" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">發送信件</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<c:if test="${!empty LoginOK}">
				<div class="modal-body">

					<form:form id="MyMessageForm" method="POST"
						action="${pageContext.request.contextPath}/sendMyMessage"
						modelAttribute="MyMessageBean" class=""
						enctype="multipart/form-data">



						<div class="form-group">
							<form:input path="myMessageTitle" type="text"
								class="form-control input-sm" id="myMessageTitle"
								placeholder="信件標題" />
						</div>

						<div class="form-group">
							<form:textarea path="myMessageContent" type="text"
								class="form-control input-sm" id="myMessageContent"
								placeholder="信件內容" />
						</div>
<!-- 						<div class="form-group"> -->
<!-- 							附加照片 -->
<%-- 							<form:input path="reportPhoto" type="file" accept="image/*" /> --%>
<!-- 						</div> -->
					</form:form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-secondary" id="cancel2"
						data-dismiss="modal">取消</button>
					<button id="myMessageSubmit" type="button" class="btn btn-warning">送出</button>
				</div>
				</c:if>
			</div>
		</div>
	</div>
  </body>
</html>