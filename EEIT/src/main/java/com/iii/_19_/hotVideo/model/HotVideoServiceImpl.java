package com.iii._19_.hotVideo.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iii._19_.videoManage.model.VideoBean;

@Service
public class HotVideoServiceImpl implements HotVideoService{

	@Autowired
	HotVideoDAO hotVideoDAO;
	
	
	@Override
	public List<VideoBean> getAllHotVideo() {
		return hotVideoDAO.getAllHotVideo();
	}

	
	
}
