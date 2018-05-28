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

	<div class="container" style="margin-left:50px">

		<h1 class="mt-4 md-3">我的訊息</h1>
	<ol class="breadcrumb">
			<li class="breadcrumb-item"><a
				href="${pageContext.request.contextPath}">首頁</a></li>
			<li class="breadcrumb-item active">我的訊息</li>
		</ol>
		<div class="row">
		
				<div class="col-md-8 offset-2">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>來信者</th>
							<th>主旨</th>
							<th>時間</th>
							<th>狀態</th>
						</tr>
						
					</thead>
					<tbody>
			<c:forEach var="myMessage" items="${MyMessageList}">
					<tr>
						<td>${myMessage.myMessageFrom}</td>
						<td class="myMessageSeqNo" value="${myMessage.myMessageSeqNo}">${myMessage.myMessageTitle}</td>
						<td>${myMessage.myMessageTime}</td>
						<td class="myMessageStatus">${myMessage.myMessageStatus}</td>
					</tr>
			</c:forEach>

					</tbody>
				</table>
 
		</div>

	</div>




</div>


<div id="dialog-message" title="信件標題">
	<p id="myMessageFrom">來信者: </p>
	<hr>
	<p id="myMessageContent">內文</p>	
</div>


<script type="text/javascript">

$('#dialog-message').dialog({
    autoOpen: false,
    show: {
        effect: "fold",
        duration: 500
      },
      hide: {
        effect: "fold",
        duration: 500
      }
});




$(document).on("click", ".myMessageSeqNo", function() {
	var currentMessage =  $(this);
	var myMessageSeqNo = currentMessage.attr('value');
	
// 	alert('myMessageSeqNo : ' + myMessageSeqNo)
	
	$.ajax({

		type : "GET",
		url : "/EEIT/getMyMessage/" + myMessageSeqNo,
 
		success : function(data) {
 
// 			alert(currentMessage.parent('tr').children('.myMessageStatus').text());
			currentMessage.parent('tr').children('.myMessageStatus').text('read');
			
			var mail = data.myMessage;
			$('#dialog-message').dialog({
				height: 500,
				width: 400,
				modal : true,
				title : mail.myMessageTitle,
				buttons: {
			        Ok: function() {
			          $( this ).dialog( "close" );
			        }
			      }
				
				
			})
			 $( "#dialog-message" ).dialog( "open" );

			$('#myMessageFrom').text('來信者:' +mail.myMessageFrom);
			$('#myMessageContent').text(mail.myMessageContent);

		},
		error : function(e) {
			console.log("ERROR : ", e);
			alert(e);
		}

	})

});

</script>
<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>