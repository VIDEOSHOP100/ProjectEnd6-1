package com.iii._19_.watchHistory.model;

import java.util.List;

import com.iii._19_.videoManage.model.VideoBean;

public interface WatchHistoryDAO {
	public int saveWatchHistory(WatchHistoryBean watchHistoryBean);

	public List<WatchHistoryBean> getAccountWatchHistory(String account);

	public List<WatchHistoryBean> getAllWatchHistory(String account);

	public List<WatchHistoryBean> getWatchHistory(String account, Integer videoSeqNo);

	public void updateWatchHistory(WatchHistoryBean watchHistoryBean);

	public void deleteWatchHistory(WatchHistoryBean watchHistoryBean);
	
	public WatchHistoryBean getWatchHistoryBySeqNo(Integer watchHistorySeqNo);
	
	public List<WatchHistoryBean> getWatchHistoryByPageNo(String account, Integer pageNo);

}
