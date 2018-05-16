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
	border: 1px black solid;
	
}
.profileTop{
	position:absolute;
	width:100%;
	z-index:1;
}
.memberPhoto{
	position:absolute;
    top:170px;
    left:335px;
	z-index:2;
	border:3px white solid;
	outline:1px gray solid;
}

</style>

</head>

<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<img src="<c:url value='/MemberCenter/images/cut.png'/>" class="profileTop" id = "profileTop">
	<input id="account" type="hidden" name="account"
		value="${LoginOK.account}">
	<input id="othersideaccount" type="hidden" name="othersideaccount"
		value="${otherside.account}">
	<div class="container">

		<div class="row">



		</div>


			<img height="240px" width="240px" class="memberPhoto"
				src='${pageContext.request.contextPath}/getImage/member/${otherside.account}'>
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
					

				</c:if>
				
			</c:if>
			
			<c:if test="${!empty ManagerLoginOK}">
			
			<button id="banMemberButton" class="">
				
			</button>
			
			</c:if>
			

		<div class="col-md-8">




			<p>
				帳號: <span id="othersideaccount">${otherside.account}</span>
			</p>
			暱稱:${otherside.nickname} <br> 被訂閱數:${otherside.subscription} <br>
			註冊日期:${otherside.registerdate} <br> 最後登入:${otherside.lastlogin}
			<br>
		</div>
		<!-- /row -->
	</div>
	<!-- /container	-->

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
				<div class="modal-body">


					<form:form id="memberReport" method="POST"
 						action="${pageContext.request.contextPath}/memberReport" 
						modelAttribute="MemberReportBean" class="" 
						enctype="multipart/form-data"> 



						<div class="form-group">
							<form:input path="reportTitle" type="text"
								class="form-control input-sm" id="reportTitle" placeholder="檢舉標題" /> 						</div>

						<div class="form-group">
							<form:textarea path="reportContent" type="text"
							class="form-control input-sm" id="reportContent" placeholder="檢舉內容" /> 
						</div>
<!-- 						<div class="form-group"> -->
<!-- 							附加照片 -->
<%-- 							<form:input path="reportPhoto" type="file" accept="image/*" /> --%>
<!-- 						</div> -->
					</div>
						<div class="modal-footer">
							
							<button type="button" class="btn btn-secondary" id ="cancel"
							
							data-dismiss="modal">取消</button>
							<button id="reportSubmit" type="button" class="btn btn-warning">確認檢舉</button>
							
							</form:form>
						</div>
			</div>
		</div>
	</div>

	<script src="<c:url value='/MemberCenter/js/profile.js'/> "></script>
</body>

</html>