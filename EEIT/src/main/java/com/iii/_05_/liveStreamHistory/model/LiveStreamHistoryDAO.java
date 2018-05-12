package com.iii._05_.liveStreamHistory.model;

import java.util.List;
import com.iii._05_.liveStreamHistory.model.LiveStreamHistoryBean;



public interface LiveStreamHistoryDAO {
	public int saveLiveStreamHistory(LiveStreamHistoryBean LiveStreamHistoryBean);

	public List<Integer> getAccountLiveStreamHistory(String account);

	public List<LiveStreamHistoryBean> getAllLiveStreamHistory(String account);

	public List<LiveStreamHistoryBean> getLiveStreamHistory(String account, Integer LiveStreamHistorySeqNo);

	public void updateLiveStreamHistory(LiveStreamHistoryBean LiveStreamHistoryBean);

	public void deleteLiveStreamHistory(LiveStreamHistoryBean LiveStreamHistoryBean);
	
	public LiveStreamHistoryBean getLiveStreamHistoryBySeqNo(Integer LiveStreamHistorySeqNo);
}
