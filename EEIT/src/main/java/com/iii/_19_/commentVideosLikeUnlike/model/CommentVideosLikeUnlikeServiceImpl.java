package com.iii._19_.commentVideosLikeUnlike.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CommentVideosLikeUnlikeServiceImpl implements CommentVideosLikeUnlikeService {
	
	@Autowired
	private CommentVideosLikeUnlikeDAO commentVideosLikeUnlikeDAO;
	
	@Override
	public List<CommentVideosLikeUnlikeBean> getCommentVideosLikeUnlikeByComment(Integer commentVideosSeqNo) {
		return commentVideosLikeUnlikeDAO.getCommentVideosLikeUnlikeByComment(commentVideosSeqNo);
	}

	@Override
	public List<CommentVideosLikeUnlikeBean> getAllCommentVideosLikeUnlike() {
		return commentVideosLikeUnlikeDAO.getAllCommentVideosLikeUnlike();
	}

	@Override
	public CommentVideosLikeUnlikeBean getCommentVideosLikeUnlikeByCommentAndAccount(Integer commentVideosSeqNo,
			String account) {
		return commentVideosLikeUnlikeDAO.getCommentVideosLikeUnlikeByCommentAndAccount(commentVideosSeqNo, account);
	}

	@Override
	public CommentVideosLikeUnlikeBean getCommentVideosLikeUnlikeBySeqNo(Integer commentLikeUnlikeSeqNo) {
		return commentVideosLikeUnlikeDAO.getCommentVideosLikeUnlikeBySeqNo(commentLikeUnlikeSeqNo);
	}

	@Override
	public int saveCommentVideosLikeUnlike(CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean) {
		return commentVideosLikeUnlikeDAO.saveCommentVideosLikeUnlike(commentVideosLikeUnlikeBean);
	}

	@Override
	public void updateCommentVideosLikeUnlike(CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean) {
		commentVideosLikeUnlikeDAO.updateCommentVideosLikeUnlike(commentVideosLikeUnlikeBean);
	}

	@Override
	public void deleteCommentVideosLikeUnlike(CommentVideosLikeUnlikeBean commentVideosLikeUnlikeBean) {
		commentVideosLikeUnlikeDAO.deleteCommentVideosLikeUnlike(commentVideosLikeUnlikeBean);
	}
	

}
