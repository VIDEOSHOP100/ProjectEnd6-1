package com.iii.HomePage.model;

import java.util.List;

import com.iii._19_.videoManage.model.VideoBean;

public interface HomePageDAO {
	public List<VideoBean> getHotVideos();

	public List<VideoBean> getNewVideos();

	public List<List<VideoBean>> getSortedVideos();
}
