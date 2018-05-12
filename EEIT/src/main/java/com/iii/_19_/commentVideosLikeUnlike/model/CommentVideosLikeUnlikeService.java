package com.iii._19_.commentVideosLikeUnlike.model;

import java.util.List;

public interface CommentVideosLikeUnlikeService {
	public List<CommentVideosLikeUnlikeBean> getCommentVideosLikeUnlikeByComment(Integer commentVideosSeqNo);

	public List<CommentVideosLikeUnlikeBean> getAllCommentVideosLikeUnlike();

	public CommentVideosLikeUnlikeBean getCommentVideosLikeUnlikeByCommentAndAccount(Integer commentVideosSeqNo,
			String account);

	public CommentVideosLikeUnlikeBean getCommentVideosLikeUnlikeBySeqNo(Integer commentLikeUnlikeSeqNo);

	public int saveCommentVideosLikeUnlike(CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean);

	public void updateCommentVideosLikeUnlike(CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean);

	public void deleteCommentVideosLikeUnlike(CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean);
}
