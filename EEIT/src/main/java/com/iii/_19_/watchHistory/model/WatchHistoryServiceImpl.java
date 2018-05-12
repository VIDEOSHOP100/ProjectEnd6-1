package com.iii._19_.watchHistory.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._19_.videoManage.model.VideoBean;
import com.iii._19_.videoManage.model.VideoManageDAO;
import com.iii._19_.videoType.model.VideoTypeBean;

@Service
public class WatchHistoryServiceImpl implements WatchHistoryService {
	
	@Autowired
	WatchHistoryDAO watchHistoryDAO;

	@Autowired
	VideoManageDAO videoManageDAO;
	
	@Override
	public int saveWatchHistory(WatchHistoryBean watchHistoryBean) {
		return watchHistoryDAO.saveWatchHistory(watchHistoryBean);
	}

	@Override
	public List<VideoBean> getAccountWatchHistory(String account) {
		List<Integer> watchHistoryBeanList = watchHistoryDAO.getAccountWatchHistory(account);
		List<VideoBean> videoBeanList = new ArrayList<VideoBean>();
		for(Integer videoSeqNo : watchHistoryBeanList) {
			VideoBean vb = videoManageDAO.getVideo(videoSeqNo);
			videoBeanList.add(vb);
		}
		return videoBeanList;
	}

	@Override
	public List<WatchHistoryBean> getAllWatchHistory(String account) {
		return watchHistoryDAO.getAllWatchHistory(account);
	}

	@Override
	public List<WatchHistoryBean> getWatchHistory(String account, Integer videoSeqNo) {
		return watchHistoryDAO.getWatchHistory(account, videoSeqNo);
	}

	@Override
	public void updateWatchHistory(WatchHistoryBean watchHistoryBean) {
		watchHistoryDAO.updateWatchHistory(watchHistoryBean);
	}

	@Override
	public void deleteWatchHistory(WatchHistoryBean watchHistoryBean) {
		watchHistoryDAO.deleteWatchHistory(watchHistoryBean);
	}

	@Override
	public WatchHistoryBean getWatchHistoryBySeqNo(Integer watchHistorySeqNo) {
		return watchHistoryDAO.getWatchHistoryBySeqNo(watchHistorySeqNo);
	}
}
