<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${otherside.nickname}的個人頁面</title>
<link href="<c:url value='/MemberCenter/css/profile.css'/>" rel="stylesheet"/>

<style>

	.offshow{
		border: 1px red solid
	}

</style>

</head>
<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
	<input id="account" type="hidden" name = "account" value= "${LoginOK.account }">
	<input id="othersideaccount" type="hidden" name = "othersideaccount" value= "${otherside.account}">
	<div class="container">

		<div class="row">



		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>		
		<div class="col-sm-1 offshow">
				.col-sm-1
		</div>
 
			
	</div> 

			<div class="col-sm-4 myborder">

				<img height="240px" width="240px"
					src='${pageContext.request.contextPath}/getImage/member/${otherside.account}'>
				<c:if test="${LoginOK.account != otherside.account}">
					<c:if test="${!empty LoginOK}">
		
						<c:if test="${friendstatus == 1}">
							<button name="nonFriend" type="button" value='1'
								class="btn btn-danger nonfriendButton friend">取消好友</button>
						</c:if>
						<c:if test="${friendstatus == 0}">
							<button name="friend" type="button" value='0'
								class="btn btn-success friendButton friend">
								加為好友
							</button>
						</c:if>
					</c:if>
				</c:if>
			</div>

			<div class="col-md-8">




				<p>
					帳號:<span id="othersideaccount">${otherside.account}</span>
				</p>
				暱稱:${otherside.nickname} <br> 被訂閱數:${otherside.subscription} <br>
				註冊日期:${otherside.registerdate} <br> 最後登入:${otherside.lastlogin}
				<br>
			</div>
			<!-- /row -->
		</div>
		<!-- /container	-->
	</div>
	<script src="<c:url value='/MemberCenter/js/profile.js'/> "></script>
</body>
</html>