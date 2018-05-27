<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
<title>註冊成功</title>
<style type="text/css">

.regsucbox{

border:1px #DDDDDD solid

}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>

	<div class="container">
		<h2 class="mt-4 md-3">註冊完成</h2>
		
		<div class="row">
			<div class="col-md-6 offset-3 regsucbox mt-5 pb-3">  
				<div style="font-size:10em; color:#77FF00" class="text-center">
					<i class="fas fa-check-circle"></i>
				</div>
				<hr>
				<p class="text-center">恭喜您註冊成功!<br>現在登入就可以開始使用本網站的各種服務了!</p>
				<a href="<c:url value='/' />"><button  class="btn btn-primary btn-block">回到首頁</button></a>
			</div>
		</div>
	</div>
</body>
</html>