<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>managerLoginPage</title>
</head>
<body>
  <%@ include file="/WEB-INF/views/global/fragment/top.jsp"%>
<div class="container">
  <h1 class="mt-4 md-3">管理員登入
    <small>Manager Login</small>
</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}">首頁</a></li>
		<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/backstage">後台系統</a></li>
		<li class="breadcrumb-item active">管理員登入</li>
</ol>

    <div class="row">

      <div class="col-md-4"></div>
      <div class="col-md-4">
          <div class="wrapper">
              <form:form id="manager" method="POST" action="${pageContext.request.contextPath}/managerLogin" modelAttribute="ManagerBean" class="wrapper">
                  <form:input class="form-control input-sm" id="ManaAcc" type="text" path="managerId" placeholder="managerId" />
                  <br>
                  <form:input class="form-control input-sm" id="ManaPwd" type="password" path="managerPwd" placeholder="managerPwd" />
                  <br>
                      
                  <p>${ManaError.error}</p>

                  <div class="float-right">
                      <input type="submit" class="btn btn-primary " value="管理員登入"/>
                  </div>
              </form:form>
          </div>




      </div>


    </div>



  </div>
</div>


</body>
</html>