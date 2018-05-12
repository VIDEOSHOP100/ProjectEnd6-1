package com.iii._19_.watchHistory.model;

import java.util.List;

public interface WatchHistoryDAO {
	public int saveWatchHistory(WatchHistoryBean watchHistoryBean);

	public List<Integer> getAccountWatchHistory(String account);

	public List<WatchHistoryBean> getAllWatchHistory(String account);

	public List<WatchHistoryBean> getWatchHistory(String account, Integer videoSeqNo);

	public void updateWatchHistory(WatchHistoryBean watchHistoryBean);

	public void deleteWatchHistory(WatchHistoryBean watchHistoryBean);
	
	public WatchHistoryBean getWatchHistoryBySeqNo(Integer watchHistorySeqNo);

}
