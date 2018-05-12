package com.iii._19_.likeUnlikeVideos.model;

import java.util.List;

import com.iii._19_.videoManage.model.VideoBean;

public interface LikeUnlikeVideosService {
	public LikeUnlikeVideosBean getLikeUnlikeVideos(String account, Integer videoSeqNo);
	
	public List<VideoBean> getUserAllLikeVideos(String account);
	
	public int saveLikeUnlikeVideos(LikeUnlikeVideosBean likeUnlikeVideosBean);
	
	public void updateLikeUnlikeVideos(LikeUnlikeVideosBean likeUnlikeVideosBean);
	
	public void deleteLikeUnlikeVideos(LikeUnlikeVideosBean likeUnlikeVideosBean);
	
}
