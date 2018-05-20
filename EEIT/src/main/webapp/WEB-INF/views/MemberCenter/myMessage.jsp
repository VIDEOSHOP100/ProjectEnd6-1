<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的訊息</title>
<style type="text/css">
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

		<h2 class="mt-4 md-3">我的訊息</h2>

		<div class="row">
		
				<div class="col-md-8 offset-2">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>來信者</th>
							<th>主旨-內文</th>
							<th>時間</th>
						</tr>
						
					</thead>
					<tbody>
			<c:forEach var="myMessage" items="${MyMessageList}">
					<tr>
						<td>${myMessage.myMessageFrom}</td>
						<td>${myMessage.myMessageTitle} <small>${myMessage.myMessageContent}</small></td>
						<td>${myMessage.myMessageTime}</td>
					</tr>
			</c:forEach>

					</tbody>
				</table>
 
		</div>

	</div>




</div>



	<%@ include file="/WEB-INF/views/global/fragment/footer.jsp"%>
</body>
</html>