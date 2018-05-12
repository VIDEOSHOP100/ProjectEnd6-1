package com.iii.HomePage.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._19_.videoManage.model.VideoBean;
@Service
public class HomePageServiceImpl implements HomePageService{

	@Autowired
	HomePageDAO homePageDAO;
	
	
	@Override
	public List<VideoBean> getHotVideos() {
		return homePageDAO.getHotVideos();
	}

	@Override
	public List<VideoBean> getNewVideos() {
		return homePageDAO.getNewVideos();
	}

	@Override
	public List<List<VideoBean>> getSortedVideos() {
		return homePageDAO.getSortedVideos();
	}

}
