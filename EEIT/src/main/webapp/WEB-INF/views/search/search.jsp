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
	  <link href="<c:url value='/search/css/search.css'/> " rel="stylesheet">
</head>

<body>
	<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
		<div class="container"  style="margin-left:50px">
			<div class="row searchResultBlock">
				<div class="col-lg-3 col-md-4  divOutside" style="padding:0px">
					<div class="divInsideTitle">直播</div>
					<c:forEach var="searchBean" items="${inputLiveStreamTimeBeanList }">
						<div class="divInsideDescription">
							<div class="divInsideDescriptionImage"><a href="${pageContext.request.contextPath}/LiveStream/${searchBean.liveStreamSeqNo}"><img width="200px" height="120px" src="${pageContext.request.contextPath}/getImage/LiveCoverPath/${searchBean.liveStreamSeqNo}"></a></div>
							<div class="divInsideDescriptionTitle"><p><a href="${pageContext.request.contextPath}/LiveStream/${searchBean.liveStreamSeqNo}">${searchBean.streamName }</a></p></div>
							<div class="divInsideDescriptionAccount"><p><a href="${pageContext.request.contextPath}/profile/${searchBean.account}">${searchBean.account }</a></p></div>
<%-- 							<div class="divInsideDescriptionDetail"><p>${searchBean.videoDescription }</p></div> --%>
						</div>
					</c:forEach>
				</div>
				<div class="col-lg-3 col-md-4  divOutside" style="padding:0px">
					<div class="divInsideTitle">商品</div>
					<c:forEach var="searchBean" items="${productSaleBeanList }">
						<div class="divInsideDescription">
							<div class="divInsideDescriptionImage"><a href="${pageContext.request.contextPath}/searchProductIntro/${searchBean.productSeqNo}"><img width="200px" height="120px" src="${pageContext.request.contextPath}/getImage/Product/${searchBean.productSeqNo}"></a></div>
							<div class="divInsideDescriptionTitle"><p><a href="${pageContext.request.contextPath}/searchProductIntro/${searchBean.productSeqNo}">${searchBean.proName }</a></p></div>
							<div class="divInsideDescriptionAccount"><p><a href="${pageContext.request.contextPath}/profile/${searchBean.account}">${searchBean.account }</a></p></div>
							<div class="divInsideDescriptionDetail"><p>${searchBean.proDescription }</p></div>
						</div>
					</c:forEach>
				</div>
				<div class="col-lg-3 col-md-4  divOutside" style="padding:0px">
					<div class="divInsideTitle">影片</div>
					<c:forEach var="searchBean" items="${videoBeanList }">
						<div class="divInsideDescription">
							<div class="divInsideDescriptionImage"><a href="${pageContext.request.contextPath}/videoRoom/${searchBean.videoSeqNo}"><img width="200px" height="120px" src="${pageContext.request.contextPath}/getImage/video/${searchBean.videoSeqNo}"></a></div>
							<div class="divInsideDescriptionTitle"><p><a href="${pageContext.request.contextPath}/videoRoom/${searchBean.videoSeqNo}">${searchBean.videoTitle }</a></p></div>
							<div class="divInsideDescriptionAccount"><p><a href="${pageContext.request.contextPath}/profile/${searchBean.account}">${searchBean.account }</a></p></div>
							<div class="divInsideDescriptionDetail"><p>${searchBean.videoDescription }</p></div>
						</div>
					</c:forEach>
				</div>
				<div class="col-lg-3 col-md-4  divOutside" style="padding:0px">
					<div class="divInsideTitle">會員</div>
					<c:forEach var="searchBean" items="${memberBeanList }">
						<div class="divInsideDescription">
							<div class="divInsideDescriptionImage"><a href="${pageContext.request.contextPath}/profile/${searchBean.account}"><img width="200px" height="120px" src="${pageContext.request.contextPath}/getImage/member/${searchBean.account}"></a></div>
<!-- 							<div class="divInsideDescriptionTitle"><p>Title</p></div> -->
							<div class="divInsideDescriptionAccount"><p><a href="${pageContext.request.contextPath}/profile/${searchBean.account}">${searchBean.account }</a></p></div>
<!-- 							<div class="divInsideDescriptionDetail"><p>Detail</p></div> -->
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		
		
		
		
		
		<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
		<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="http://malsup.github.com/jquery.form.js"></script> 
		<script src="<c:url value='/search/js/search.js'/> "></script>
</body>
</html>