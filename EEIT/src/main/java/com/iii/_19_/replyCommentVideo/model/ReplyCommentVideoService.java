package com.iii._19_.replyCommentVideo.model;

import java.util.List;

public interface ReplyCommentVideoService {
	public List<ReplyCommentVideoBean> getReplyCommentVideoByComment(Integer commentVideoSeqNo);
	
	public List<ReplyCommentVideoBean> getAllReplyCommentVideo();
	
	public List<ReplyCommentVideoBean> getReplyCommentVideoByCommentAndAccount(Integer commentVideoSeqNo, String account);
	
	public ReplyCommentVideoBean getReplyCommentVideoBySeqNo(Integer replyCommentVideoSeqNo);
	
	public int saveReplyCommentVideo(ReplyCommentVideoBean replyCommentVideoBean);
	
	public void updateReplyCommentVideo(ReplyCommentVideoBean replyCommentVideoBean);
	
	public void deleteReplyCommentVideo(ReplyCommentVideoBean replyCommentVideoBean);
	
	
}
