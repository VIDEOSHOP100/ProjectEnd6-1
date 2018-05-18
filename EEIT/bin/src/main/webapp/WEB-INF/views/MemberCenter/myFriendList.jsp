<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>我的好友列表</title>
<style>
.pic{
border-top-left-radius: calc(0.25rem - 1px);
border-top-right-radius: calc(0.25rem - 1px);
height:240px;
width:240px;

}


            .myfooter {
                height: 100px;
                width: 100%;
                position: absolute;
                bottom: 0;
            }

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>


	<div class="container">
		<h1 class="mt-4 mb-3">我的好友</h1>
		<div class="row">
			
			<c:forEach var="friend" items="${myFriendList}"> 
       		<c:if test="${friend.friendStatus !=0}">
        <div class="col-lg-3 mb-3"> 
          <div class="card h-100 text-center">
            <c:if test="${LoginOK.account == friend.friendSend}">
            <a href="${pageContext.request.contextPath}/profile/${friend.friendTo}"><img class="pic" src="${pageContext.request.contextPath}/getImage/member/${friend.friendTo}" alt=""></a> 
            </c:if>
	        <c:if test="${LoginOK.account == friend.friendTo}">  
            <a href="${pageContext.request.contextPath}/profile/${friend.friendSend}"><img class="pic" src="${pageContext.request.contextPath}/getImage/member/${friend.friendSend}" alt=""></a>
            </c:if>
            <div class="card-body">
             <c:if test="${LoginOK.account == friend.friendSend}">
              <a href="${pageContext.request.contextPath}/profile/${friend.friendTo}"><h4 class="card-title">${friend.friendTo}</h4></a>
              </c:if>
               <c:if test="${LoginOK.account == friend.friendTo}">
              <a href="${pageContext.request.contextPath}/profile/${friend.friendSend}"><h4 class="card-title">${friend.friendSend}</h4></a>
              </c:if>
              <h6 class="card-subtitle mb-2 text-muted"></h6>
              <p class="card-text"></p>
              <p class="card-text"></p>
            </div>

          </div>
        </div>
        </c:if>
 </c:forEach>
			
		</div>
	</div>

 <%@ include file="/WEB-INF/views/global/fragment/footer.jsp"%>
</body>
</html>