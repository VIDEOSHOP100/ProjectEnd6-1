package com.iii._19_.commentVideos.model;

import java.util.List;

public interface CommentVideosService {
	public List<CommentVideosBean> getCommentVideosByVideo(Integer videoSeqNo);
	
	public List<CommentVideosBean> getAllCommentVideos();
	
	public List<CommentVideosBean> getCommentVideosByVideoAndAccount(Integer videoSeqNo, String account);
	
	public CommentVideosBean getCommentVideosBySeqNo(Integer videoSeqNo);
	
	public int saveCommentVideos(CommentVideosBean commentVideosBean);
	
	public void updateCommentVideos(CommentVideosBean commentVideosBean);
	
	public void deleteCommentsVideos(CommentVideosBean commentVideosBeans);
}
