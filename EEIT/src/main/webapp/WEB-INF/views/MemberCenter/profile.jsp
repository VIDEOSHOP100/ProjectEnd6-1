<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${otherside.nickname}的個人頁面</title>
<link href="<c:url value='/MemberCenter/css/profile.css'/>"
	rel="stylesheet" />

<style>
.offshow {
	border: 1px red solid;
}

.profileTop {
	position: absolute;
	width: 100%;
	z-index: 0;
}

.memberPhoto {
	position: absolute;
	top: 170px;
	left: 335px;
	z-index: 2;
	border: 3px white solid;
	outline: 1px gray solid;
}

.procon {
	margin-top: 115px;
}

.adreButton {
	position: absolute;
	top: 140px;
	left: 58px;
}

.nick{ 
	font-size: 300%;
}
.acc{
	
}
</style>

</head>

<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<img src="<c:url value='/MemberCenter/images/cut.png'/>"
		class="profileTop" id="profileTop">
	<input id="account" type="hidden" name="account"
		value="${LoginOK.account}">
	<input id="othersideaccount" type="hidden" name="othersideaccount"
		value="${otherside.account}">
	<img height="240px" width="240px" class="memberPhoto"
		src='${pageContext.request.contextPath}/getImage/member/${otherside.account}'>
	<div class="container procon">

		<div class="row">

			<div class="col-md-2 offset-1 adreButton">

 

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

				<c:if test="${!empty ManagerLoginOK}">

					<button id="banMemberButton" class="">封鎖會員</button>

				</c:if>
			</div>


		<div class="col-md-8">




			<div><p class="nick">${otherside.nickname}</p>	
			<p id="othersideaccount">@${otherside.account}</p></div>	
			
			<div class="row titleBlock">
	      <div class="col-md-2">
	          <a class="btn btn-lg btn-secondary btn-block" href="PersonShopHome">商店首頁</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">商品</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">商品列表</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">影片</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">影片列表</a>
	      </div>
	      <div class="col-md-2">
	        <a class="btn btn-lg btn-secondary btn-block" href="#">商店資料</a>
	      </div>
      </div>
					
			被訂閱數:${otherside.subscription} <br>

			註冊日期:${otherside.registerdate} <br> 最後登入:${otherside.lastlogin}
			<br>
			
			
		</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container	-->


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
				<div class="modal-body">

				<c:if test="${!empty LoginOK}">
					<form:form id="MyMessageBean" method="POST"
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

					<button type="button" class="btn btn-secondary" id="cancel"
						data-dismiss="modal">取消</button>
					<button id="myMessageSubmit" type="button" class="btn btn-warning">送出</button>

				</div>
				</c:if>
			</div>
		</div>
	</div>
	
	

	<script src="<c:url value='/MemberCenter/js/profile.js'/> "></script>
</body>

</html>