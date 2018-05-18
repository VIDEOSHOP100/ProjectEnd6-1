<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet">
<link href="<c:url value='/LiveStreamRoom/css/LiveStreamRoom.css'/>" rel="stylesheet">
<style>
.sellproduct{
	font-family: 'Josefin Sans', sans-serif;
}
.reasontitle{
	
font-weight: bolder;

}
/* .card-bodycontroller{  */
/*  	width: 100%;  */
/* 	height: 407px;   */
/* 	background-color: white;  */
/*  	overflow: auto;  */
/*  	list-style: none;  */
/*  	margin: 0;  */
/* /* 	padding: 0; */ */
/*   -webkit-box-flex: 1; */
/*   -ms-flex: 1 1 auto; */
/*   flex: 100 100 auto; */
/*   padding: 0.7em 2em 0.7em 1em; */
  
/* } */
/* .hidden{ */
/*   display:none; */
/*   } */
  
/* .chatrow{ */
/* 	float: right; */
/* 	background: #0084ff; */
/* 	color: #fff; */
/* /* 	margin-left: 100px; */ */
/* 	padding: 10px; */
/* 	margin-bottom: 2px; */
	
/* 	/*              height: auto; */ */
/* } */
/* .chatBlock{ */
/* 	display: block; */
/* 	overflow: auto; */
/* } */
</style>
</head>
<body>
<p class="uploadaccount hidden">${sb.account}</p> 
<%-- <p>${LiveStream.liveStreamSeqNo}</p> --%>

<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
 <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
       
      <h1 class="mt-4 mb-3">
      ${sb.account}
  
        <small>的直播間</small>
        <small>開始時間:${sb.liveStart}</small>
        <c:if test="${!empty LoginOK.account}">
        <button id="memberReportButton"
							class="btn btn-outline-info memberReportButton memberReport"
							type="button" data-toggle="modal" data-target="#popMemberReport">檢舉${sb.account}</button>
				</c:if>			
							
<%-- 		<small>結束時間:${sb.liveEnd}</small> --%> 

      </h1>
   <p class="hidden">${sb.liveStreamSeqNo}</p>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="<c:url value='/' />">首頁</a>
        </li>
        <li class="breadcrumb-item active">${sb.account}</li>
      </ol>

      <!-- Intro Content -->
      <div class="row">
        <div class="col-lg-6">
        		  
<!--         <iframe width="750" height="450" src="https://www.youtube.com/embed/Rwon5jM2-44?list=RDRwon5jM2-44" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> -->
<iframe width="750" height="450" src="https://www.youtube.com/embed/${sb.liveStreamPath}?autoplay=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen ></iframe> 
                <h2>${sb.streamName}</h2>
        </div>
        <div class="col-lg-6">
          	<div class="chat-sidebara">
				<div class="sidebar-namea">
			<div class="card mb-4">

            <h5 class="card-header">Stream Chat</h5>
            <div class="card-bodycontroller">
            	
            	
              </div>
                <div class="input-group">
                <input id="catch-account" type="hidden" name = "account" value= "${LoginOK.account}">
                <input type="text" class="form-control chat-message" placeholder="傳送訊息">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">聊天</button>
                </span>
            </div>
          </div>
								
				
				</div>
        </div>

      </div>
      <!-- /.row -->

      <!-- Team Members -->
<c:if test="${LoginOK.account == sb.account}">
<!--       <h2>拍賣物品</h2>
<!-- <div class="col-md-1 addBidDiv"> --> 
<div class="col-lg-1">
					<button class="btn btn-outline-info addBidButton col-md-auto" data-toggle="modal" data-target="#addAuctionForm"><i class="fas fa-dollar-sign"></i>&nbsp;&nbsp;拍賣物品</button>
</div>
<!-- 					</div> -->
						</c:if>
							  <c:if test="${LoginOK.account == sb.account}">		
<!-- 			<div class="col-lg-1"> -->
			<button type="button" value="${sb.liveStreamSeqNo}" class="btn btn-outline-info addBidButton deleteBlock col-md-auto"><i class="fas fa-ban"></i>&nbsp;&nbsp;關閉直播</button>
<!--             </div>  --> 
			</c:if>	
								  <c:if test="${LoginOK.account == sb.account}">		
<!-- 			<div class="col-lg-1"> -->
			<button type="button" class="btn btn-outline-info addBidButton deleteAuction col-md-auto"><i class="fas fa-ban"></i>&nbsp;&nbsp;關閉拍賣</button>
<!--             </div>  --> 
			</c:if>	
							
<!--       <h2>叫價</h2><div class="col-md-2 addBidDiv"> -->
<div class="col-lg-1">
					<button class="btn btn-outline-info addBidButton loginCheck col-md-auto" data-toggle="modal" data-target="#addBidForm"><i class="fas fa-bullhorn"></i>&nbsp;&nbsp;現場喊價</button>
</div> 
<!-- 					</div>	 -->
<c:if test="${!empty AllProductLista}">
<form:form id="Bid" method="POST" action="Bid/${productSeqNo}" modelAttribute="BidBean" class = "form-horizontal" enctype="multipart/form-data">

<form:select path="productSeqNo">
								
								  <form:options id="productSeqNo" class="productSeqNo" items="${AllProductLista}" />
								  
							</form:select>
							<form:select class="hidden" path="auctionSeqNo">
								  <form:options id="auctionSeqNo" class="auctionSeqNo" items="${AllProductLista}" />
								  
							</form:select>
</form:form> 
</c:if>
<div class="input-Bid">
<input type="text" class="form-control Bid-message" placeholder="請輸入價格">
</div> 
	
			 </div>
	
      <div class="row">
		<div class="col-lg-12 "> 
<c:forEach var="AllProducta" items="${AllProduct}"> 

        <div class="col-lg-4 mb-4 proitemcontroller offset-4">
          <div class="card h-100 text-center">
            <img class="card-img-top img750" src="${pageContext.request.contextPath}/getImage/Product/${AllProducta.auctionPic}" alt=""> 
            <div class="card-body">
              <h4 class="card-title">品名：${AllProducta.proName}</h4>
              <h6 class="card-subtitle mb-2 text-muted"></h6>
              <p class="card-text">${AllProducta.proDescription}</p>
              <p class="card-text">價錢：${AllProducta.proPrice}</p>
            </div>
            <div class="card-footer">
              <a href="#">name@example.com</a>
            </div>
          </div>
        </div>
      
        
 </c:forEach>
   </div>
<!--         <div class="col-lg-4 mb-4"> -->
<!--           <div class="card h-100 text-center"> -->
<!--             <img class="card-img-top" src="http://placehold.it/750x450" alt=""> -->
<!--             <div class="card-body"> -->
<!--               <h4 class="card-title"></h4> -->
<!--               <h6 class="card-subtitle mb-2 text-muted">Position</h6> -->
<!--               <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p> -->
<!--             </div> -->
<!--             <div class="card-footer"> -->
<!--               <a href="#">name@example.com</a> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->

      </div>
      <!-- /.row -->

      <!-- Our Customers -->
    
      <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="sellproduct">賣家其他熱門商品</h2>
        </div>
<%--         <c:forEach var="AllProduct0" items="${AllProduct0}">  --%>
<!--         <div class="col-lg-2 col-sm-4 mb-4"> -->
<%--           <img class="img-fluid" src="${pageContext.request.contextPath}/getImage/Product/${AllProduct0.picSeqNo}" alt=""> --%>
<%--          <h4 class="card-title">品名：${AllProduct0.proName}</h4> --%>
<!--         </div> -->
<%--          </c:forEach> --%>
        <div class="row text-center" style="width: 1200px; margin: 0 auto;">
			<c:forEach var="product" items="${AllProduct0}">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card">
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/getImage/Product/${product.productSeqNo}"
							width="500px" height="238px" alt="">
						<div class="card-body">
							<h4 class="card-title JQellipsisTitle">${product.proName}</h4>
							<p class="card-text">限時特價  $NT ${product.proPrice }</p>
							<p class="card-text JQellipsis" id="JQellipsis">${product.proDescription}</p>
						</div>
						<div class="card-footer">
							<a
								href="${pageContext.request.contextPath}/searchProductIntro/${product.productSeqNo}"
								class="btn btn-primary">點我購買</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
<!--         <div class="col-lg-2 col-sm-4 mb-4"> -->
<!--           <img class="img-fluid" src="http://placehold.it/500x300" alt=""> -->
<!--         </div> -->
<!--         <div class="col-lg-2 col-sm-4 mb-4"> -->
<!--           <img class="img-fluid" src="http://placehold.it/500x300" alt=""> -->
<!--         </div> -->
<!--         <div class="col-lg-2 col-sm-4 mb-4"> -->
<!--           <img class="img-fluid" src="http://placehold.it/500x300" alt=""> -->
<!--         </div> -->
<!--         <div class="col-lg-2 col-sm-4 mb-4"> -->
<!--           <img class="img-fluid" src="http://placehold.it/500x300" alt=""> -->
<!--         </div> -->
      </div>
      <!-- /.row -->

   
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>
    




	
<!-- 拍賣表格 -->
<div class="modal fade" id="addAuctionForm" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">新增拍賣</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<form:form  id="Auction" method="POST" action="${pageContext.request.contextPath}/Auction" modelAttribute="AuctionItemSelectBean" class = "form-horizontal" enctype="multipart/form-data" >
					<form:input class="seqNo" id="liveStreamSeqNo" value="${sb.liveStreamSeqNo}" path="liveStreamSeqNo" type="hidden" />
					aucBegin<form:input id="aucBegin" path="aucBegin" type="text" class="form-control input-sm" placeholder="2018-05-06 17:00:00"/><br>
					aucEnd<form:input id="aucEnd" path="aucEnd" type="text" class="form-control input-sm" placeholder="2018-05-06 18:00:00"/><br>
					productSeqNo<form:input id="productSeqNo" path="productSeqNo" type="text" class="form-control input-sm"/><br>
					proPrice<form:input id="proPrice" path="proPrice" type="text" class="form-control input-sm"/><br>
				</div>
				

				<div class="modal-footer">
<%-- 				<p>${registerErrorMap.Duplicate} ${registerErrorMap.SQL}</p> --%>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">取消</button>
					<input type="submit" class="btn btn-primary" value="註冊"/>
				</div>
					</form:form>
					
			</div>
		</div>
	</div>
<!--// 拍賣表格 -->

<!-- 檢舉開始 -->
	<div class="modal fade" id="popMemberReport" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">檢舉${sb.account}</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<form:form id="LiveStreamReport" method="POST"
						action="${pageContext.request.contextPath}/LiveStreamReport"
						modelAttribute="liveStreamReportBean" class=""
						enctype="multipart/form-data">



						<div class="form-group">
							<form:input path="reportTitle" type="text"
								class="form-control input-sm" id="reportTitle"
								placeholder="檢舉標題" />
						</div>
						<p class="reasontitle modal-title">檢舉原因(必填)</p>
						
					 <form:select path="reportType" id="reportType">

    <form:option value="1">使用暴力或恐嚇傷害他人</form:option>
    <form:option value="2">騷擾</form:option>
    <form:option value="3">仇恨行為</form:option>
    <form:option value="4">色情或性暗示內容</form:option>
    <form:option value="5">其他違反服務條款的行為</form:option>
    <form:option value="6">粗鄙的使用者名稱</form:option>
    <form:option value="7">極端暴力、血腥或淫褻的內容</form:option>

  						</form:select> 
  						<br><br>
			<p class="reasontitle modal-title">描述(必填)</p>
						<div class="form-group">
							<form:textarea path="reportContent" type="text"
								class="form-control input-sm" id="reportContent"
								placeholder="檢舉內容" />
						</div>
						<!-- 						<div class="form-group"> -->
						<!-- 							附加照片 -->
						<%-- 							<form:input path="reportPhoto" type="file" accept="image/*" /> --%>
						<!-- 						</div> -->
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-outline-info" id="cancel"
						data-dismiss="modal">取消</button>
					<button id="reportSubmit" type="button" class="btn btn-outline-info">確認檢舉</button>

					</form:form>
				</div>
			</div>
		</div>
	</div>

<!-- 檢舉結束 -->



<!-- 測試 VOICE-->

  
<!-- 測試VOICE -->














<!-- 叫價表格 -->
<!-- <div class="modal fade" id="addBidForm" tabindex="-1" role="dialog" -->
<!-- 		aria-labelledby="exampleModalCenterTitle" aria-hidden="true"> -->
<!-- 		<div class="modal-dialog modal-dialog-centered" role="document"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<h5 class="modal-title" id="exampleModalLongTitle">叫價</h5> -->
<!-- 					<button type="button" class="close" data-dismiss="modal" -->
<!-- 						aria-label="Close"> -->
<!-- 						<span aria-hidden="true">&times;</span> -->
<!-- 					</button> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
					

<%-- 					<form:form  id="Bid" method="POST" action="Bid/${productSeqNo}" modelAttribute="BidBean" class = "form-horizontal" enctype="multipart/form-data" >  --%>
					
<%-- 					bidTime<form:input id="regAcc" path="bidTime" type="text" class="form-control input-sm"/><br>  --%>
<%-- 					輸入價格<form:input id="bidPrice" path="bidPrice" type="text" class="form-control input-sm"/><br> --%>
<%-- 							<form:select class="productSeqNo" path="productSeqNo"> --%>
<%-- 								  <form:options items="${AllProductList}" /> --%>
<%-- 							</form:select> --%>
<!-- 				</div> -->
				

<!-- 				<div class="modal-footer"> -->
<%-- 				<p>${registerErrorMap.Duplicate} ${registerErrorMap.SQL}</p> --%>
<!-- 					<button type="button" class="btn btn-secondary"	data-dismiss="modal">取消</button> -->
<!-- 					<input type="submit" class="btn btn-primary" value="註冊"/> -->
<!-- 				</div> -->
<%-- 					</form:form> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!--// 叫價表格 -->
<%-- 	<script src="<c:url value='/global/vendor/jquery/jquery.min.js'/> "></script> --%>
<%-- 	<script src="<c:url value='/global/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script> --%>
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	   <script src="http://code.responsivevoice.org/responsivevoice.js"></script>
	<script src="<c:url value='/LiveStreamRoom/js/LiveStreamRoom.js'/> "></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</body>
</html>