package com.iii._19_.replyCommentVideoLikeUnlike.model;

import java.util.List;

import com.iii._19_.commentVideosLikeUnlike.model.CommentVideosLikeUnlikeBean;

public interface ReplyCommentVideoLikeUnlikeService {
	public List<ReplyCommentVideoLikeUnlikeBean> getReplyCommentVideoLikeUnlikeByReplyComment(Integer replyCommentVideoSeqNo);

	public List<ReplyCommentVideoLikeUnlikeBean> getAllReplyCommentVideoLikeUnlike();

	public ReplyCommentVideoLikeUnlikeBean getReplyCommentVideoLikeUnlikeByReplyCommentAndAccount(Integer replyCommentVideoSeqNo,
			String account);

	public ReplyCommentVideoLikeUnlikeBean getReplyCommentVideosLikeUnlikeBySeqNo(Integer replyCommentVideoLikeUnlikeSeqNo);

	public int saveReplyCommentVideoLikeUnlike(ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean);

	public void updateReplyCommentVideoLikeUnlike(ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean);

	public void deleteReplyCommentVideoLikeUnlike(ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean);
}
