package com.iii._19_.watchLaterVideo.model;

import java.util.List;

import com.iii._19_.videoManage.model.VideoBean;

public interface WatchLaterVideoService {
	public int saveWatchLaterVideo(WatchLaterVideoBean watchLaterVideoBean);
	
	public void updateWatchLaterVideo(WatchLaterVideoBean watchLaterVideoBean);
	
	public void deleteWatchLaterVideo(WatchLaterVideoBean watchLaterVideoBean);
	
	public WatchLaterVideoBean getWatchLaterVideo(String account, Integer videoSeqNo);
	
	public List<VideoBean> getWatchLaterVideoByAccount(String account);
	
	public List<WatchLaterVideoBean> getAllWatchLaterVideo();
	
	public WatchLaterVideoBean getWatchLaterVideoBySeqNo(Integer watchLaterVideoSeqNo);
	
	public List<VideoBean> getWatchLaterVideoByPageNo(Integer pageNo, String account);
}
