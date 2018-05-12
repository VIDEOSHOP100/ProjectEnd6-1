package com.iii._05_.liveStreamHistory.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._05_.liveStreamHistory.model.LiveStreamHistoryBean;

@Service
public class LiveStreamHistoryServiceImpl implements LiveStreamHistoryService {

	
	@Autowired
	LiveStreamHistoryDAO liveStreamHistoryDAO;

	@Override
	public int saveLiveStreamHistory(LiveStreamHistoryBean LiveStreamHistoryBean) {
		return liveStreamHistoryDAO.saveLiveStreamHistory(LiveStreamHistoryBean);
	}

	@Override
	public List<LiveStreamHistoryBean> getAccountLiveStreamHistory(String account) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LiveStreamHistoryBean> getAllLiveStreamHistory(String account) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LiveStreamHistoryBean> getLiveStreamHistory(String account, Integer LiveStreamHistorySeqNo) {
	
		return liveStreamHistoryDAO.getLiveStreamHistory(account, LiveStreamHistorySeqNo);
	}

	@Override
	public void updateLiveStreamHistory(LiveStreamHistoryBean LiveStreamHistoryBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLiveStreamHistory(LiveStreamHistoryBean LiveStreamHistoryBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LiveStreamHistoryBean getLiveStreamHistoryBySeqNo(Integer LiveStreamHistorySeqNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
