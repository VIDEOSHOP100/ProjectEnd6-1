<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>${watchVideoBean.videoTitle}</title>
<link href="<c:url value='/global/vendor/bootstrap/css/bootstrap.min.css'/> " rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/black-tie/jquery-ui.css"> 
<link href="<c:url value='/global/css/modern-business.css'/> " rel="stylesheet">
<link href="<c:url value='/videoRoomdeco/css/videoRoom.css'/> " rel="stylesheet">
</head>
<body>
	<div class="container"  style="margin-left:50px">
		<%@ include file="/WEB-INF/views/global/fragment/top.jsp" %>
		<input id="account" type="hidden" name = "account" value= "${LoginOK.account }">
		<input type="hidden" class="videoSeqNo" name = "videoSeqNo" value= "${video.videoSeqNo}">
		<h1 class="mt-4 mb-3 videoTitle" title="${video.videoTitle}">${video.videoTitle}
<!-- 			<small>Subheading</small> -->
		</h1>
		<c:if test="${! empty ManagerLoginOK}">
			<button class="btn btn-danger delete-video">封鎖影片</button>
		</c:if>
		<ol class="breadcrumb">
			  <li class="breadcrumb-item">
			    <a href="<c:url value='/' />">首頁</a>
			  </li>
			  <li class="breadcrumb-item active">影片間</li>
		</ol>
		<div class="row">
			<div class="col-md-9">
				<video controlsList="nodownload" muted controlsList="nodownload" class="video" width="1150" height="600" src="${pageContext.request.contextPath}/getVideo/video/${video.videoSeqNo}"
					controls="controls" autoplay poster="${pageContext.request.contextPath}/getImage/video/${video.videoSeqNo}"></video>
				<div class="col-md-12 ">
					<h1 class="lead videoTitleInside" title="${video.videoTitle}"><strong><b>${video.videoTitle}</b></strong></h1>
					<hr>
					<div class="media mb-4">
						<a class="uploaderLink"	href="<c:url value='/profile/${video.account}' />">
							<img class="d-flex mr-3 rounded-circle" width="50px" height="50px"
								src="${pageContext.request.contextPath}/getImage/member/${video.account}"
								alt="">
						</a>
						<div class="media-body videoDetail">
							<h5 class="mt-0 uploaderaccount">
								<a class="uploaderLink"	href="<c:url value='/profile/${video.account}' />">
									<p>${video.account}</p>
								</a>
							</h5>
							<div class="likeUnlikeBlock">
								<input type="hidden" value = "${likeUnlikeVideoStatus}" name="likeUnlikeStatus"/>
								<span id="likeNumber">${video.videoLikes}</span> 
								<c:if test="${empty likeUnlikeVideoStatus}">
									<button type="button" value="" class="likeButtonNone like"></button>
								</c:if>
								<c:if test="${likeUnlikeVideoStatus == 'none'}">
									<button type="button" value="" class="likeButtonNone like"></button>
								</c:if>
								<c:if test="${likeUnlikeVideoStatus == 'like'}">
									<button type="button" value="" class="likeButton like"></button>
								</c:if>
								<c:if test="${likeUnlikeVideoStatus == 'unlike'}">
									<button type="button" value="" class="likeButtonNone like"></button>
								</c:if>
								
								<span id="unlikeNumber">${video.videoUnlikes}</span> 
								<c:if test="${empty likeUnlikeVideoStatus}">
									<button type="button" value="" class="unlikeButtonNone unlike"></button>
								</c:if>
								<c:if test="${likeUnlikeVideoStatus == 'none'}">
									<button type="button" value="" class="unlikeButtonNone unlike"></button>
								</c:if>
								<c:if test="${likeUnlikeVideoStatus == 'like'}">
									<button type="button" value="" class="unlikeButtonNone unlike"></button>
								</c:if>
								<c:if test="${likeUnlikeVideoStatus == 'unlike'}">
									<button type="button" value="" class="unlikeButton unlike"></button>
								</c:if>
								<c:if test="${LoginOK.account != video.account }">
									<button type="button" value="" class="btn reportVideo">
										檢舉
									</button>
								</c:if>
							</div>
							<c:set var="string1" value="${video.videoUploadDate}"/>
							<c:set var="string2" value="${fn:substring(string1, 0, 19)}" />
							<p>上傳日期:${string2}
								<c:if test="${LoginOK.account != video.account }">
									<c:if test = "${!empty subscriptionUploaderStatus}">
										<button name="subscription" type="button" value="" class="btn btn-danger subscriptionButton subscription">
											已訂閱&nbsp;&nbsp;&nbsp;&nbsp;<i class="far fa-bell"></i>
										</button>
									</c:if>
									<c:if test = "${empty subscriptionUploaderStatus}">
										<button name="nonSubscription" type="button" value="" class="btn btn-danger nonSubscriptionButton subscription">
											訂閱
										</button>
									</c:if>
								</c:if>
							</p>
							<p>影片觀看次數:${video.videoViews}</p>
						</div>
					</div>
					<hr>
					<div>
						<p class="videoDescription videoDescriptionHide">影片描述:${video.videoDescription}</p>
						<p class="showDescriptionButton ">展示完整內容</p>
					</div>
					<hr>
					<div class="card my-4">
						<h5 class="card-header">留言:</h5>
						<div class="card-body">
							<form>
								<div class="form-group">
									<textarea class="form-control" rows="3" id="commentArea"></textarea>
								</div>
								<button type="button" class="btn btn-primary" id="commentButton">Submit</button>
							</form>
						</div>
					</div>
					<div id="allComments" class="allCommentsHide">
						<c:forEach var="aCommentBean" items="${commentVideo}" >
							<div class="media mb-4">
								<a class="uploaderLink"	href="<c:url value='/profile/${aCommentBean.account}' />">
									<img class="d-flex mr-3 rounded-circle" src="${pageContext.request.contextPath}/getImage/member/${aCommentBean.account}" alt="" height="50px" width="50px">
								</a>
								<div class="media-body">
									<h5 class="mt-0">
										<a class="uploaderLink"	href="<c:url value='/profile/${aCommentBean.account}' />">
											${aCommentBean.account}
										</a>
										<c:set var="string1" value="${aCommentBean.commentDate}"/>
										<c:set var="string2" value="${fn:substring(string1, 0, 19)}" />
										<span>${string2} 
											<span class="hide">${aCommentBean.commentVideoSeqNo}</span>
										</span>
									</h5>
									<p class="commentArticle commentArticleHide">
										${aCommentBean.commentArticle}
									</p>
									<p class="commentArticleShowButton">顯示完整內容</p>
									<p>
										<button class="btn btn-info replyButton">回復<i class="fas fa-pencil-alt"></i></button>
										<input type="hidden" value = "${aCommentBean.commentVideosLikeUnlikeStatus}" class="commentVideosLikeUnlikeStatus"/>
										<span class="commentLikeNumber">&nbsp${aCommentBean.commentLike}&nbsp</span> 
										<c:if test="${empty aCommentBean.commentVideosLikeUnlikeStatus}">
											<button type="button" value="" class="likeButtonNone commentLike"></button>
										</c:if>
										<c:if test="${aCommentBean.commentVideosLikeUnlikeStatus == 'none'}">
											<button type="button" value="" class="likeButtonNone commentLike"></button>
										</c:if>
										<c:if test="${aCommentBean.commentVideosLikeUnlikeStatus == 'like'}">
											<button type="button" value="" class="likeButton commentLike"></button>
										</c:if>
										<c:if test="${aCommentBean.commentVideosLikeUnlikeStatus == 'unlike'}">
											<button type="button" value="" class="likeButtonNone commentLike"></button>
										</c:if>
										
										<span class="commentUnLikeNumber">&nbsp${aCommentBean.commentUnLike}&nbsp</span> 
										<c:if test="${empty aCommentBean.commentVideosLikeUnlikeStatus}">
											<button type="button" value="" class="unlikeButtonNone commentUnlike"></button>
										</c:if>
										<c:if test="${aCommentBean.commentVideosLikeUnlikeStatus == 'none'}">
											<button type="button" value="" class="unlikeButtonNone commentUnlike"></button>
										</c:if>
										<c:if test="${aCommentBean.commentVideosLikeUnlikeStatus == 'like'}">
											<button type="button" value="" class="unlikeButtonNone commentUnlike"></button>
										</c:if>
										<c:if test="${aCommentBean.commentVideosLikeUnlikeStatus == 'unlike'}">
											<button type="button" value="" class="unlikeButton commentUnlike"></button>
										</c:if>
									
									</p>
										
<!-- 										回復 -->
									<div class="media mb-4">
									<p class="showReplyButton">顯示回復</p>
									</div>
									<c:forEach var="aReplyCommentVideoBean" items="${aCommentBean.replyCommentVideoBeanList}">
										<div class="media mb-4 replyBlock">
											<a class="uploaderLink"	href="<c:url value='/profile/${aCommentBean.account}' />">
												<img class="d-flex mr-3 rounded-circle" height="50px" width="50px" src="/EEIT/getImage/member/${aReplyCommentVideoBean.account}">
											</a>
											<div class="media-body">
												<h5 class="mt-0">
													<a class="uploaderLink"	href="<c:url value='/profile/${aCommentBean.account}' />">
														${aReplyCommentVideoBean.account}
													</a>
													<c:set var="string1" value="${aReplyCommentVideoBean.replyCommentDate}"/>
													<c:set var="string2" value="${fn:substring(string1, 0, 19)}" />
													<span>${string2}
														<span class="hide">${aReplyCommentVideoBean.replyCommentVideoSeqNo}</span>
													</span>
													
												</h5>
												<p class="commentArticle commentArticleHide">
													${aReplyCommentVideoBean.replyCommentArticle}
												</p>
												<p class="commentArticleShowButton">顯示完整內容</p>
												<p>
													<span>
														<input type="hidden" value = "${aReplyCommentVideoBean.replyCommentVideosLikeUnlikeStatus}" class="replyCommentVideosLikeUnlikeStatus"/>
														<span class="replyCommentLikeNumber">&nbsp${aReplyCommentVideoBean.replyCommentLike}&nbsp</span> 
														<c:if test="${empty aReplyCommentVideoBean.replyCommentVideosLikeUnlikeStatus}">
															<button type="button" value="" class="likeButtonNone replyCommentLike"></button>
														</c:if>
														<c:if test="${aReplyCommentVideoBean.replyCommentVideosLikeUnlikeStatus == 'none'}">
															<button type="button" value="" class="likeButtonNone replyCommentLike"></button>
														</c:if>
														<c:if test="${aReplyCommentVideoBean.replyCommentVideosLikeUnlikeStatus == 'like'}">
															<button type="button" value="" class="likeButton replyCommentLike"></button>
														</c:if>
														<c:if test="${aReplyCommentVideoBean.replyCommentVideosLikeUnlikeStatus == 'unlike'}">
															<button type="button" value="" class="likeButtonNone replyCommentLike"></button>
														</c:if>
														
														<span class="replyCommentUnLikeNumber">&nbsp${aReplyCommentVideoBean.replyCommentUnLike}&nbsp</span> 
														<c:if test="${empty aReplyCommentVideoBean.replyCommentVideosLikeUnlikeStatus}">
															<button type="button" value="" class="unlikeButtonNone replyCommentUnlike"></button>
														</c:if>
														<c:if test="${aReplyCommentVideoBean.replyCommentVideosLikeUnlikeStatus == 'none'}">
															<button type="button" value="" class="unlikeButtonNone replyCommentUnlike"></button>
														</c:if>
														<c:if test="${aReplyCommentVideoBean.replyCommentVideosLikeUnlikeStatus == 'like'}">
															<button type="button" value="" class="unlikeButtonNone replyCommentUnlike"></button>
														</c:if>
														<c:if test="${aReplyCommentVideoBean.replyCommentVideosLikeUnlikeStatus == 'unlike'}">
															<button type="button" value="" class="unlikeButton replyCommentUnlike"></button>
														</c:if>
													</span>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="showAllCommentButton">
						<p>顯示所有留言</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="introducedVideo">
					<h1>推薦影片</h1>
					<c:forEach var="uploaderVideos" items="${uploaderVideo}">
						<div class="media mt-4 videoBlock">
							<a href="<c:url value='/videoRoom/${uploaderVideos.videoSeqNo}' />">
								<img class="d-flex mr-3" height="80px" width="170px" src='${pageContext.request.contextPath}/getImage/video/${uploaderVideos.videoSeqNo}'>
							</a>
							<div class="media-body">
								<div class="advicedVideoTitle">
									<h6 class="mt-0">
										<a href="<c:url value='/videoRoom/${uploaderVideos.videoSeqNo}' />">
											<p>${uploaderVideos.videoTitle}</p>
										</a>
									</h6>
								</div>
								<p class="advicedVideoUploaderAccount videoSmallWords">
									<a class="uploaderLink"
										href="<c:url value='/profile/${uploaderVideos.account}' />">${uploaderVideos.account}</a>
								</p>
								<p class="videoSmallWords">觀看次數:${uploaderVideos.videoViews}</p>
							</div>
						</div>
					</c:forEach>
				</div>
				<div>
					<p class="introducedVideoShowButton">顯示更多推薦影片</p>
				</div>
			</div>
		</div>
	</div>
	<div id="reportDialog" title="檢舉影片">
		<form:form id="videoReport"  name = "videoReport" ENCTYPE="multipart/form-data" modelAttribute="videoReportBean" method="POST">
			<p class="validateTips">請輸入檢舉內容</p>
			<fieldset>
				<p><form:input type="hidden" path="videoSeqNo" value="${video.videoSeqNo }" class="text ui-widget-content ui-corner-all"/></p>
				<p><label for="videoReportArticle">檢舉內容</label></p>
				<p><form:input type="text" path="videoReportArticle" class="text ui-widget-content ui-corner-all"/></p>
				<p><label>檢舉種類</label></p>
				<p><form:radiobutton path="videoReportType"  value="色情"  />色情</p>
				<p><form:radiobutton path="videoReportType"  value="暴力"  />暴力</p>
				<p><form:radiobutton path="videoReportType"  value="其他"  />其他</p>
				<p><input type="submit" tabindex="-1" style="position:absolute; top:-1000px" /></p>
			</fieldset>
		</form:form>
	</div>
	<div id="delete-dialog-form" title="刪除資料" class="hideForm">
		<p class="validateTips">確認封鎖此影片?</p>
		<p>影片名稱:<span id="videoTitleDelete"></span></p>
		<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
	</div>
	<div id="reportSuccess">
	  <p>
	    <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
	   	投訴已經送出
	  </p>
	</div>
<!-- 	<footer class="py-5 bg-dark"> -->
<!-- 		<div class="container"> -->
<!-- 			<p class="m-0 text-center text-white"> -->
<!-- 				Copyright &copy; Your Website 2018 -->
<!-- 			</p> -->
<!-- 		</div> -->
<!-- 	</footer> -->
	<%@ include file="/WEB-INF/views/global/fragment/message.jsp" %>
	<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script> 
	<script src="<c:url value='/videoRoomdeco/js/videoRoom.js'/> "></script>
</body>

</html>