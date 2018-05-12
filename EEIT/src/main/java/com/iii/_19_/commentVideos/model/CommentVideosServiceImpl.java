package com.iii._19_.commentVideos.model;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CommentVideosServiceImpl implements CommentVideosService {
	
	@Autowired
	CommentVideosDAO commentVideosDAO;
	
	@Override
	public List<CommentVideosBean> getCommentVideosByVideo(Integer videoSeqNo) {
		return commentVideosDAO.getCommentVideosByVideo(videoSeqNo);
	}

	@Override
	public List<CommentVideosBean> getAllCommentVideos() {
		return commentVideosDAO.getAllCommentVideos();
	}

	@Override
	public List<CommentVideosBean> getCommentVideosByVideoAndAccount(Integer videoSeqNo, String account) {
		return commentVideosDAO.getCommentVideosByVideoAndAccount(videoSeqNo, account);
	}

	@Override
	public CommentVideosBean getCommentVideosBySeqNo(Integer commentVideoSeqNo) {
		return commentVideosDAO.getCommentVideosBySeqNo(commentVideoSeqNo);
	}

	@Override
	public int saveCommentVideos(CommentVideosBean commentVideosBean) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		commentVideosBean.setCommentDate(now);
		commentVideosBean.setCommentLike(0);
		commentVideosBean.setCommentUnLike(0);
		commentVideosBean.setCommentVideoStatus("1");
		return commentVideosDAO.saveCommentVideos(commentVideosBean);
	}

	@Override
	public void updateCommentVideos(CommentVideosBean commentVideosBean) {
		commentVideosDAO.updateCommentVideos(commentVideosBean);
	}

	@Override
	public void deleteCommentsVideos(CommentVideosBean commentVideosBeans) {
		commentVideosDAO.deleteCommentsVideos(commentVideosBeans);
	}
	

}
