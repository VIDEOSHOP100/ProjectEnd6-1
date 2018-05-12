package com.iii._19_.videoManage.model;

import java.util.List;

public interface VideoManageDAO {
	public List<VideoBean> getAllVideo();
	
	public List<VideoBean> getAllVideoByAccount(String account);

	public int saveVideo(VideoBean vb);
	
	public VideoBean getVideo(Integer videoSeqNo);
	
	public void updateVideo(VideoBean vb);

	public void deleteVideo(VideoBean vb);
}
