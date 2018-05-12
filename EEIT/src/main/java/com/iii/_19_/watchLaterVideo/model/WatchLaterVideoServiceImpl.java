package com.iii._19_.watchLaterVideo.model;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._19_.videoManage.model.VideoBean;


@Service
public class WatchLaterVideoServiceImpl implements WatchLaterVideoService {
	
	@Autowired
	WatchLaterVideoDAO watchLaterVideoDAO;
	
	@Override
	public int saveWatchLaterVideo(WatchLaterVideoBean watchLaterVideoBean) {
		Timestamp now = new java.sql.Timestamp(System.currentTimeMillis());
		watchLaterVideoBean.setWatchLaterVideoDate(now);
		watchLaterVideoBean.setWatchLaterVideosScore(0);
		watchLaterVideoBean.setWatchLaterVideosStatus("1");
		return watchLaterVideoDAO.saveWatchLaterVideo(watchLaterVideoBean);
	}

	@Override
	public void updateWatchLaterVideo(WatchLaterVideoBean watchLaterVideoBean) {
		watchLaterVideoDAO.updateWatchLaterVideo(watchLaterVideoBean);
	}

	@Override
	public void deleteWatchLaterVideo(WatchLaterVideoBean watchLaterVideoBean) {
		watchLaterVideoDAO.deleteWatchLaterVideo(watchLaterVideoBean);
	}

	@Override
	public WatchLaterVideoBean getWatchLaterVideo(String account, Integer videoSeqNo) {
		return watchLaterVideoDAO.getWatchLaterVideo(account, videoSeqNo);
	}

	@Override
	public List<VideoBean> getWatchLaterVideoByAccount(String account) {
		return watchLaterVideoDAO.getWatchLaterVideoByAccount(account);
	}

	@Override
	public List<WatchLaterVideoBean> getAllWatchLaterVideo() {
		return watchLaterVideoDAO.getAllWatchLaterVideo();
	}

	@Override
	public WatchLaterVideoBean getWatchLaterVideoBySeqNo(Integer watchLaterVideoSeqNo) {
		return watchLaterVideoDAO.getWatchLaterVideoBySeqNo(watchLaterVideoSeqNo);
	}
	

}
