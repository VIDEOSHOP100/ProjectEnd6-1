package com.iii._19_.replyCommentVideoLikeUnlike.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._19_.commentVideosLikeUnlike.model.CommentVideosLikeUnlikeBean;


@Service
public class ReplyCommentVideoLikeUnlikeServiceImpl implements ReplyCommentVideoLikeUnlikeService {

	@Autowired
	ReplyCommentVideoLikeUnlikeDAO replyCommentVideoLikeUnlikeDAO;
	
	@Override
	public List<ReplyCommentVideoLikeUnlikeBean> getReplyCommentVideoLikeUnlikeByReplyComment(
			Integer replyCommentVideoSeqNo) {
		return replyCommentVideoLikeUnlikeDAO.getReplyCommentVideoLikeUnlikeByReplyComment(replyCommentVideoSeqNo);
	}

	@Override
	public List<ReplyCommentVideoLikeUnlikeBean> getAllReplyCommentVideoLikeUnlike() {
		// TODO Auto-generated method stub
		return replyCommentVideoLikeUnlikeDAO.getAllReplyCommentVideoLikeUnlike();
	}

	@Override
	public ReplyCommentVideoLikeUnlikeBean getReplyCommentVideoLikeUnlikeByReplyCommentAndAccount(
			Integer replyCommentVideoSeqNo, String account) {
		return replyCommentVideoLikeUnlikeDAO.getReplyCommentVideoLikeUnlikeByReplyCommentAndAccount(replyCommentVideoSeqNo, account);
	}

	@Override
	public ReplyCommentVideoLikeUnlikeBean getReplyCommentVideosLikeUnlikeBySeqNo(
			Integer replyCommentVideoLikeUnlikeSeqNo) {
		return replyCommentVideoLikeUnlikeDAO.getReplyCommentVideosLikeUnlikeBySeqNo(replyCommentVideoLikeUnlikeSeqNo);
	}

	@Override
	public int saveReplyCommentVideoLikeUnlike(ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean) {
		return replyCommentVideoLikeUnlikeDAO.saveReplyCommentVideoLikeUnlike(replyCommentVideoLikeUnlikeBean);
	}

	@Override
	public void updateReplyCommentVideoLikeUnlike(ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean) {
		replyCommentVideoLikeUnlikeDAO.updateReplyCommentVideoLikeUnlike(replyCommentVideoLikeUnlikeBean);
	}

	@Override
	public void deleteReplyCommentVideoLikeUnlike(ReplyCommentVideoLikeUnlikeBean replyCommentVideoLikeUnlikeBean) {
		replyCommentVideoLikeUnlikeDAO.deleteReplyCommentVideoLikeUnlike(replyCommentVideoLikeUnlikeBean);
	}
	

}
