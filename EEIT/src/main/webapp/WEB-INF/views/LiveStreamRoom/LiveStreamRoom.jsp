<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<link href="<c:url value='/LiveStreamRoom/css/bootstrap-switch.css'/>" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
<link href="<c:url value='/InsertLiveStream/css/bootstrap-datetimepicker.css'/> " rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Courgette" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
<link href="<c:url value='/LiveStreamRoom/css/LiveStreamRoom.css'/>" rel="stylesheet">

<style>
.testclass{
font-family: 'Noto Sans', sans-serif;
}


.sellproduct{
	font-family: 'Josefin Sans', sans-serif;
}
/* html,body{ */
/* overflow: hidden; */
/* margin:0; */
/* padding:0; */

/* } */
.reasontitle{

font-weight: bolder;

}
#dm{
width: 100%;
/* height:90vh; */
background: ##E8F1F5;
}
#dm span{
width:auto;
height: 3rem;
font-size: 2rem;
line-height: 2rem;
position: absolute;
white-space: nowrap;
}
#idDom{
width:100%;
height:10vh;
background: #666;
position: absolute;
bottom: 0;
display:flex;
align-items: center;
justify-content: center;
}
</style>
</head>
<body>
<p class="uploadaccount hidden">${sb.account}</p> 
<%-- <p>${LiveStream.liveStreamSeqNo}</p> --%>

<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
 <!-- Page Content -->
    <div class="container" style="margin-left:50px">

      <!-- Page Heading/Breadcrumbs -->
       
      <h1 class="mt-4 mb-3 testclass">
      ${sb.account}
        <small>的直播間</small>
        <c:set var="string1" value="${sb.liveStart}"/>
		<c:set var="string2" value="${fn:substring(string1, 0, 19)}" />
        <small class="suptitle">開始時間:${string2}</small>
        
        
        <c:if test="${!empty LoginOK.account}">
        <button id="memberReportButton"
							class="btn btn-outline-info memberReportButton memberReport"
							type="button" data-toggle="modal" data-target="#popMemberReport">檢舉${sb.account}</button>
				</c:if>			
							
<%-- 		<small>結束時間:${sb.liveEnd}</small> --%> 

      </h1>

      <p id="showView"class="hidden">${sb.liveStreamView}</p>
   <p class="hidden">${sb.liveStreamSeqNo}</p>
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="<c:url value='/' />">首頁</a>
        </li>
        <li class="breadcrumb-item active"><a href="<c:url value='/LiveStream/${sb.liveStreamSeqNo}'  />">${sb.account}</a></li>
      </ol>

      <!-- Intro Content -->
      <div class="row">
        <div class="col-lg-6" id="dm">
        		  
<!--         <iframe width="750" height="450" src="https://www.youtube.com/embed/Rwon5jM2-44?list=RDRwon5jM2-44" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe> -->
<iframe  width="750" height="450" src="https://www.youtube.com/embed/${sb.liveStreamPath}?&autoplay=1&mute=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen ></iframe> 
                <h3 id="showViewAfter" class="TitleName">${sb.streamName}</h3>
        </div>
        <div class="col-lg-6 draggable">
          	<div class="chat-sidebara">
				<div class="sidebar-namea">
			<div class="card mb-4">

            <h5 class="card-header">Stream Chat</h5>
            <div class="card-bodycontroller">
            	
            	
              </div>
                <div class="input-group">
                <input id="catch-account" type="hidden" name = "account" value= "${LoginOK.account}">
                <input type="text" class="form-control chat-message loginCheck" placeholder="傳送訊息">
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
			 <br><br>
			 <c:if test="${LoginOK.account == sb.account}">
			 
	<input type="checkbox" id="#myCheckBox" name="my-checkbox"  checked>  <small>&nbsp;&nbsp;編輯自訂頁面</small>
	</c:if>
	
	
	
	<!-- 開始設定表單 --> 
	<div class="row editform hidden col-lg-4 mb-4 offset-4">
	<div class="" id="" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">${sb.account}的直播介紹控制列</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<form:form id="CustomizedControl" method="POST"
						action="${pageContext.request.contextPath}/CustomizedControl"
						modelAttribute="CustomizedBean" class=""
						enctype="multipart/form-data">


						<p class="reasontitle modal-title">介面標題</p>
						<div class="form-group">
							<form:input path="customizedTitle" type="text"
								class="form-control input-sm" id="customizedTitle"
								placeholder="請輸入標題" />
						</div>
						<p class="reasontitle modal-title">新增影像</p>
<!-- 						<input type="file" id="file"/> -->
						<form:input path="photo" type="file" name="customizedPic" id="customizedPic" class="text ui-widget-content ui-corner-all"/>
					<input type="submit" tabindex="-1" style="position:absolute; top:-1000px"/>
				
  						<br><br>
			<p class="reasontitle modal-title">描述</p>
						<div class="form-group">
							<form:textarea path="customizedDesc" type="text"
								class="form-control input-sm" id="customizedDesc"
								placeholder="描述內容" />
						</div>
						<!-- 						<div class="form-group"> -->
						<!-- 							附加照片 -->
						<%-- 							<form:input path="reportPhoto" type="file" accept="image/*" /> --%>
						<!-- 						</div> -->
				
				

					<button type="button" class="btn btn-outline-info" id="cancel"
						data-dismiss="modal">取消</button>
							<input type="submit" class="btn btn-primary" id="customizedSubmit" value="確定"/>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- 設定表單結束 -->
      <div class="row onsaleitems">
		<div class="col-lg-12 "> 
		 <div class="col-lg-12 text-center">
		 <c:if test="${!empty AllProduct}">
        <h2 class="sellproduct testclass">賣家現正拍賣商品</h2>
        </c:if>
        </div>
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
<!--               <a href="#">name@example.com</a> -->
            </div>
          </div>
        </div>
      
        
 </c:forEach>
   </div>
      </div>
      <!-- /.row -->

      <!-- Our Customers -->
    
      <div class="row onsaleitems">
      <div class="col-lg-12 text-center">
        <h2 class="sellproduct testclass">賣家其他熱門商品</h2>
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
						<div class="card-body ccc">
							<h4 class="card-title JQellipsisTitle">${product.proName}</h4>
							<p class="card-text">限時特價  $NT ${product.proPrice }</p>
<%-- 							<p class="card-text JQellipsis" id="JQellipsis">${product.proDescription}</p> --%>
						</div>
						<div class="card-footer">
							<a
								href="${pageContext.request.contextPath}/searchProductIntro/${product.productSeqNo}"
								class="btn btn-primary">點我看更多...</a>
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
      
     <!-- 網格測試 -->  
         <div class="row onsaleitems">
      <div class="col-lg-12 text-center">
        <h2 class="sellproduct testclass">賣家介紹</h2>
        </div>
<%--         <c:forEach var="AllProduct0" items="${AllProduct0}">  --%>
<!--         <div class="col-lg-2 col-sm-4 mb-4"> -->
<%--           <img class="img-fluid" src="${pageContext.request.contextPath}/getImage/Product/${AllProduct0.picSeqNo}" alt=""> --%>
<%--          <h4 class="card-title">品名：${AllProduct0.proName}</h4> --%>
<!--         </div> -->
<%--          </c:forEach> --%>
        <div class="row text-center" id="sexmove" style="width: 1200px; margin: 0 auto;">
			<c:forEach var="CustomizedLista" items="${CustomizedList}">
				<div class="col-lg-3 col-md-6 mb-4" id="id_${CustomizedLista.sortNum}">
					<div class="card">
					<h4 class="card-title JQellipsisTitle">${CustomizedLista.customizedTitle}</h4>
						<img class="card-img-top"
							src="${pageContext.request.contextPath}/getImage/customizedPic/${CustomizedLista.customizedSeqNo}"
							width="500px" height="238px" alt="">
						<div class="card-body ccc">
							
							<p class="card-text">${CustomizedLista.customizedDesc}</p>
<%-- 							<p class="card-text JQellipsis" id="JQellipsis">${product.proDescription}</p> --%>
						</div>
					
<!-- 							<a -->
<%-- 								href="${pageContext.request.contextPath}/searchProductIntro/${product.productSeqNo}" --%>
<!-- 								class="btn btn-primary">點我購買</a> -->
						
					</div>
				</div>
			</c:forEach>
		</div>
<!-- 		<button>Ready</button> -->
      <!-- /.網格測試-->
      
      
      
      
   
    <!-- /.container -->
</div>

      <!-- /.container -->

    




	
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

<%--${pageContext.request.contextPath}/Auction --%>
					<form:form  id="Auction" method="POST" action="${pageContext.request.contextPath}/Auction" modelAttribute="AuctionItemSelectBean" class = "form-horizontal" enctype="multipart/form-data" >
					<form:input id="liveStreamSeqNo" value="${sb.liveStreamSeqNo}" path="liveStreamSeqNo" type="hidden" />
					<form:input class="seqNo" id="liveStreamSeqNo" value="${sb.liveStreamSeqNo}" path="liveStreamSeqNo" type="hidden" />
					<p class="reasontitle modal-title">拍賣開始時間：</p><form:input id="aucBegin" path="aucBegin" type="text" class="form-control input-sm" placeholder="2018-05-06 17:00"/><br>
					<p class="reasontitle modal-title">拍賣結束時間：</p><form:input id="aucEnd" path="aucEnd" type="text" class="form-control input-sm" placeholder="2018-05-06 18:00"/><br>
<%-- 					productSeqNo<form:input id="productSeqNo" path="productSeqNo" type="text" class="form-control input-sm"/><br> --%>
						<p class="reasontitle modal-title">請選擇欲拍賣商品：</p>
			 				<form:select path="productSeqNo">
								  <form:options items="${productNameMapnoonsale}" />
							</form:select><br><br>
					<p class="reasontitle modal-title">請輸入起標價格：</p><form:input id="proPrice" path="proPrice" type="text" class="form-control input-sm"/><br>
				</div>
				

				<div class="modal-footer">
<%-- 				<p>${registerErrorMap.Duplicate} ${registerErrorMap.SQL}</p> --%>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">取消</button>
					<input type="submit" class="btn btn-primary" id="sub" value="確定"/>
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

					<button type="button" class="btn btn-outline-info" id="cancelreport"
						data-dismiss="modal">取消</button>
					<button id="reportSubmit" type="button" class="btn btn-outline-info">確認檢舉</button>

					</form:form>
				</div>
			</div>
		</div>
	</div>

<!-- 檢舉結束 -->



<!-- 測試 log-->
<div class="relative2">
<p class="hahaha">拍賣物品productSeqNo已賣給account</p>
</div>
 
<!-- 測試log -->














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
	   <script src="https://code.responsivevoice.org/responsivevoice.js"></script>
	<script src="<c:url value='/LiveStreamRoom/js/LiveStreamRoom.js'/> "></script>
	<script src="<c:url value='/LiveStreamRoom/js/bootstrap-switch.js'/> "></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
		<script src="<c:url value='/LiveStreamRoom/js/jquery.balloon.js'/> "></script>
		<script src="<c:url value='/InsertLiveStream/js/bootstrap-datetimepicker.js'/>"></script>
</body>
</html>