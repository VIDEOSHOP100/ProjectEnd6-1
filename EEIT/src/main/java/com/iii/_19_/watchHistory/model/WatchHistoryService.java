package com.iii._19_.watchHistory.model;

import java.util.List;

import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoType.model.VideoTypeBean;

public interface WatchHistoryService {
	public int saveWatchHistory(WatchHistoryBean watchHistoryBean) ;
	
	public List<VideoBean> getAccountWatchHistory(String account);
	
	public List<WatchHistoryBean> getAllWatchHistory(String account);
	
	public List<WatchHistoryBean> getWatchHistory(String account, Integer videoSeqNo);
	
	public void updateWatchHistory(WatchHistoryBean watchHistoryBean);
	
	public void deleteWatchHistory(WatchHistoryBean watchHistoryBean);
	
	public WatchHistoryBean getWatchHistoryBySeqNo(Integer watchHistorySeqNo);
	
	public List<VideoBean> getWatchHistoryByPageNo(String account, Integer pageNo);
}
