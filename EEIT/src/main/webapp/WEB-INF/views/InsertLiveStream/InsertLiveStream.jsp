<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/InsertLiveStream/css/bootstrap-datetimepicker.css'/> " rel="stylesheet">
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
<link href="<c:url value='/global/css/modern-business.css'/>" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet">
<link href="<c:url value='/InsertLiveStream/css/InsertLiveStream.css'/> " rel="stylesheet">
<style>
.testclass{
font-family: 'Poiret One', cursive;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>




    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
<%--         <c:forEach var="AllProductListBean" items="${AllProductList}"> --%>
<%--        ${AllProductListBean.proBrand} --%>
<%--        </c:forEach>  --%>
      <h1 class="mt-4 mb-3 testclass">｜WelcomeBack Streamer｜${accountStream.account}｜
        <small class="testclass">
       			   
        </small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
        
          <a href="<c:url value='/' />">Home</a>
        </li>
        <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/InsertLiveStream">直播管理</a></li>
      </ol>

      <div class="row">

        <!-- Post Content Column -->
        <div class="col-lg-8">

          <!-- Preview Image -->
<!--           <img class="img-fluid rounded" src="http://placehold.it/900x300" alt=""> --> 

<iframe width="1035" height="450" src="https://www.youtube.com/embed/${accountStream.liveStreamPath}?autoplay=1" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen ></iframe> 
    
          <hr>

          <!-- Date/Time -->
          <p>Live Stream Posted on ：${accountStream.liveStart}　目前觀看人次：${accountStream.liveStreamView}</p>

          <hr>

          

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4">

          <!-- 還想不到要幹啥先隱藏 -->
<!--           <div class="card mb-4"> -->
<!--             <h5 class="card-header">Search</h5> -->
<!--             <div class="card-body"> -->
<!--               <div class="input-group"> -->
<!--                 <input type="text" class="form-control" placeholder="Search for..."> -->
<!--                 <span class="input-group-btn"> -->
<!--                   <button class="btn btn-secondary" type="button">Go!</button> -->
<!--                 </span> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->

          <!-- Categories Widget -->
          <div class="card my-4">
            <h5 class="card-header">功能列</h5>
            <div class="card-body">
              <div class="row">
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <!--    <h2>新增直播</h2><div class="col-md-2 addBidDiv"> -->
					<button class="btn btn-outline-info addBidButton " data-toggle="modal" data-target="#addLiveStreamForm"><i class="fas fa-plus"></i>&nbsp;&nbsp;新增直播</button>
<!-- 					</div> -->
					

                    </li>
                    <li>
                  
                    </li>
                    <li>
                      <a href="#"></a>
                    </li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                  <!--       <h2>拍賣物品</h2><div class="col-md-2 addBidDiv"> -->
					<button class="btn btn-outline-info addBidButton " data-toggle="modal" data-target="#addAuctionForm"><i class="fas fa-dollar-sign"></i>&nbsp;&nbsp;拍賣物品</button>
<!-- 					</div> -->
                    <li>
                      <a href="#"></a>
                    </li>
                    <li>
                      <a href="#"></a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>

          <!-- Side Widget -->
          <div class="card my-4">
            <h5 class="card-header">Side Widget</h5>
            <div class="card-body">
              You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
            </div>
          </div>

        </div>

      </div>
      <!-- /.row -->

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
					aucBegin<form:input id="aucBegin" path="aucBegin" type="text" class="form-control input-sm" placeholder="2018-05-06 17:00"/><br>
					aucEnd<form:input id="aucEnd" path="aucEnd" type="text" class="form-control input-sm" placeholder="2018-05-06 18:00"/><br>
<%-- 					productSeqNo<form:input id="productSeqNo" path="productSeqNo" type="text" class="form-control input-sm"/><br> --%>
						
			 				<form:select path="productSeqNo">
								  <form:options items="${AllProductList}" />
							</form:select>
					proPrice<form:input id="proPrice" path="proPrice" type="text" class="form-control input-sm"/><br>
				</div>
				

				<div class="modal-footer">
<%-- 				<p>${registerErrorMap.Duplicate} ${registerErrorMap.SQL}</p> --%>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">取消</button>
					<input type="submit" class="btn btn-primary" id="sub" value="註冊"/>
				</div>
					</form:form>
					
			</div>
		</div>
	</div>
<!--// 拍賣表格 -->
<!-- 直播表格 -->
<div class="modal fade" id="addLiveStreamForm" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">新增直播</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
<%-- 					${AllLiveStream.liveStreamSeqNo} --%>
					<form:form  id="InsertLiveStream" method="POST" action="${pageContext.request.contextPath}/InsertLiveStream" modelAttribute="InputLiveStreamTimeBean" class = "form-horizontal" enctype="multipart/form-data" >
					<form:input id="liveStreamSeqNo" value="${sb.liveStreamSeqNo}" path="liveStreamSeqNo" type="hidden" />
<%-- 					LiveStart<form:input id="LiveStart" path="LiveStart" type="text" class="form-control input-sm" placeholder="2018-05-06 17:00:00"/><br> --%>
<%-- 					LiveEnd<form:input id="LiveEnd" path="LiveEnd" type="text" class="form-control input-sm" placeholder="2018-05-06 18:00:00"/><br> --%>
					streamName<form:input id="streamName" path="streamName" type="text" class="form-control input-sm"/><br>
					liveStreamPath<form:input id="liveStreamPath" path="liveStreamPath" type="text" class="form-control input-sm"/><br>
				 	photo<form:input path="photo" type="file"  accept="image/*"/><br>
				</div>
				

				<div class="modal-footer">
<%-- 				<p>${registerErrorMap.Duplicate} ${registerErrorMap.SQL}</p> --%>
					<button type="button" class="btn btn-secondary"	data-dismiss="modal">取消</button>
					<input type="submit" class="btn btn-primary" value="新增"/>
				</div>
					</form:form>
					
			</div>
		</div>
	</div>
<!--// 直播表格 -->

     <!-- Sart Modal -->
        <div class="modal fade" id="endLiveStream" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header justify-content-center">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            <i class="now-ui-icons ui-1_simple-remove"></i>
                        </button>
                        <h4 class="title title-up">請選擇欲新增商品的直播</h4>
                    </div>
                    <div class="modal-body">
<!--                         <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. -->
<!--                         </p> -->


<%-- 			  <c:forEach var="aaccountLiveStreamBean" items="${accountStream}"> --%>
<!-- 	    <div class="row"> -->
<!-- 	      <div class="col-md-7"> -->
<!-- 	        <a href="#"> -->
<%-- 	          <a href="<c:url value='/LiveStream/${aaccountLiveStreamBean.liveStreamSeqNo}' />"> --%>
<%-- 				<img style="border: solid 1px red" class="img-fluid rounded mb-3 mb-md-0" width="300px" height="100px" src='${pageContext.request.contextPath}/getImage/LiveCoverPath/${aaccountLiveStreamBean.liveStreamSeqNo}'> --%>
<!-- 			  </a> -->
<!-- 	        </a> -->
<!-- 	      </div> -->
<!-- 	      <div class="col-md-5"> -->
<%-- 	        <h3><a href="<c:url value='/LiveStream/${aaccountLiveStreamBean.liveStreamSeqNo}' />">${aaccountLiveStreamBean.streamName}</a></h3> --%>
<!-- 	        <p><a class="uploaderLink" -->
<%-- 							href="<c:url value='/uploaderHomePage/${aaccountLiveStreamBean.account}' />">${aaccountLiveStreamBean.account}</a></p> --%>
<%-- 	        <p>觀看次數:${aaccountLiveStreamBean.liveStreamView}</p> --%>
<%-- <%-- 	        <p class="videoDescription">${aVideoBean.videoDescription}</p> --%> --%>
<!-- 			<button type="button" value="" class="btn btn-danger deleteBlock"> -->
<!--            		<i class="fas fa-trash-alt"></i> -->
<!--             </button> -->

<!-- 	      </div> -->
<!-- 	    </div> -->
<!-- 	    <hr> -->
<%-- 			</c:forEach> --%>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default">Nice Button</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--  End Modal -->
        <%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>


        	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<script src="<c:url value='/InsertLiveStream/js/InsertLiveStream.js'/>"></script>
<script src="<c:url value='/InsertLiveStream/js/bootstrap-datetimepicker.js'/>"></script>

	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2018</p>
	</div>
	</footer>
</body>

</html>