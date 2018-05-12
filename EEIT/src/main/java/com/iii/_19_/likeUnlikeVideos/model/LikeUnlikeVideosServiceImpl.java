package com.iii._19_.likeUnlikeVideos.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._19_.videoManage.model.VideoBean;

@Service
public class LikeUnlikeVideosServiceImpl implements LikeUnlikeVideosService {

	@Autowired
	private LikeUnlikeVideosDAO likeUnlikeVideosDAO;
	
	@Override
	public LikeUnlikeVideosBean getLikeUnlikeVideos(String account, Integer videoSeqNo) {
		return likeUnlikeVideosDAO.getLikeUnlikeVideos(account, videoSeqNo);
	}

	@Override
	public List<VideoBean> getUserAllLikeVideos(String account) {
		return likeUnlikeVideosDAO.getUserAllLikeVideos(account);
	}

	@Override
	public int saveLikeUnlikeVideos(LikeUnlikeVideosBean likeUnlikeVideosBean) {
		return likeUnlikeVideosDAO.saveLikeUnlikeVideos(likeUnlikeVideosBean);
	}

	@Override
	public void updateLikeUnlikeVideos(LikeUnlikeVideosBean likeUnlikeVideosBean) {
		likeUnlikeVideosDAO.updateLikeUnlikeVideos(likeUnlikeVideosBean);
	}

	@Override
	public void deleteLikeUnlikeVideos(LikeUnlikeVideosBean likeUnlikeVideosBean) {
		likeUnlikeVideosDAO.deleteLikeUnlikeVideos(likeUnlikeVideosBean);
	}
	

}
