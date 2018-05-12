package com.iii._19_.replyCommentVideo.model;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ReplyCommentVideoServiceImpl implements ReplyCommentVideoService {

	@Autowired
	private ReplyCommentVideoDAO replyCommentVideoDAO;
	
	@Override
	public List<ReplyCommentVideoBean> getReplyCommentVideoByComment(Integer commentVideoSeqNo) {
		return replyCommentVideoDAO.getReplyCommentVideoByComment(commentVideoSeqNo);
	}

	@Override
	public List<ReplyCommentVideoBean> getAllReplyCommentVideo() {
		return replyCommentVideoDAO.getAllReplyCommentVideo();
	}

	@Override
	public List<ReplyCommentVideoBean> getReplyCommentVideoByCommentAndAccount(Integer commentVideoSeqNo,
			String account) {
		return replyCommentVideoDAO.getReplyCommentVideoByCommentAndAccount(commentVideoSeqNo, account);
	}

	@Override
	public ReplyCommentVideoBean getReplyCommentVideoBySeqNo(Integer replyCommentVideoSeqNo) {
		return replyCommentVideoDAO.getReplyCommentVideoBySeqNo(replyCommentVideoSeqNo);
	}

	@Override
	public int saveReplyCommentVideo(ReplyCommentVideoBean replyCommentVideoBean) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		replyCommentVideoBean.setReplyCommentDate(now);
		replyCommentVideoBean.setReplyCommentLike(0);
		replyCommentVideoBean.setReplyCommentUnLike(0);
		replyCommentVideoBean.setReplyCommentVideoStatus("1");
		return replyCommentVideoDAO.saveReplyCommentVideo(replyCommentVideoBean);
	}

	@Override
	public void updateReplyCommentVideo(ReplyCommentVideoBean replyCommentVideoBean) {
		replyCommentVideoDAO.updateReplyCommentVideo(replyCommentVideoBean);
	}

	@Override
	public void deleteReplyCommentVideo(ReplyCommentVideoBean replyCommentVideoBean) {
		replyCommentVideoDAO.deleteReplyCommentVideo(replyCommentVideoBean);
	}
	

}
